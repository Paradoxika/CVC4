/*********************                                                        */
/*! \file cdqueue.h
 ** \verbatim
 ** Original author: bobot
 ** Major contributors: none
 ** Minor contributors (to current version): none
 ** This file is part of the CVC4 prototype.
 ** Copyright (c) 2009, 2010, 2011  The Analysis of Computer Systems Group (ACSys)
 ** Courant Institute of Mathematical Sciences
 ** New York University
 ** See the file COPYING in the top-level source directory for licensing
 ** information.\endverbatim
 **
 ** \brief Context-dependent queue class
 **
 ** Context-dependent First-In-First-Out queue class.
 ** The implementation is based on a CDList with one additional size_t
 ** for tracking the next element to dequeue from the list and additional
 ** size_t.
 ** It can discard element which are enqueued and dequeued at the same context
 ** level.
 ** The implementation is try to stay simple.
 **/


#include "cvc4_private.h"

#ifndef __CVC4__CONTEXT__CDQUEUE2_H
#define __CVC4__CONTEXT__CDQUEUE2_H

#include "context/context.h"
#include "context/cdlist.h"

namespace CVC4 {
namespace context {

/** We don't define a template with Allocator for the first implementation */
template <class T>
class CDQueue2 : public CDList<T> {
protected:

  /** Points to the next element in the current context to dequeue. */
  size_t d_iter;

  /** Points to the size at the last save. */
  size_t d_lastsave;

  /**
   * Private copy constructor used only by save().
   */
  CDQueue2(const CDQueue2<T>& l):
    CDList<T>(l),
    d_iter(l.d_iter),
    d_lastsave(l.d_lastsave) {}

  /** Implementation of mandatory ContextObj method save:
   *  We assume that the base class do the job inside their copy constructor.
   */
  ContextObj* save(ContextMemoryManager* pCMM) {
    ContextObj* data = new(pCMM) CDQueue2<T>(*this);
    // We save the d_size in d_lastsave and we should never destruct below this
    // indices before the corresponding restore.
    d_lastsave = CDList<T>::d_size;
    Debug("cdqueue2") << "save " << this
                    << " at level " << this->getContext()->getLevel()
                    << " size at " << this->d_size
                    << " iter at " << this->d_iter
                    << " lastsave at " << this->d_lastsave
                    << " sizeAlloc at " << this->d_sizeAlloc
                    << " d_list is " << this->d_list
                    << " data:" << data << std::endl;
    return data;
  }

  /**
   * Implementation of mandatory ContextObj method restore: simply
   * restores the previous size, iter and lastsave indices. Note that
   * the list pointer and the allocated size are not changed.
   */
  void restore(ContextObj* data) {
    CDQueue2<T>* qdata = ((CDQueue2<T>*)data);
    d_iter = qdata->d_iter;
    d_lastsave = qdata->d_lastsave;
    CDList<T>::restore(data);
  }



public:

  /** Creates a new CDQueue associated with the current context. */
  CDQueue2(Context* context)
    : CDList<T>(context),
      d_iter(0),
      d_lastsave(0)
  {}

  /** Returns true if the queue is empty in the current context. */
  bool empty() const{
    return d_iter >= CDList<T>::d_size;
  }

  bool size() const{
    return d_iter - CDList<T>::d_size;
  }

  /** Enqueues an element in the current context. */
  void push(const T& data){
    CDList<T>::push_back(data);
  }

  /** Delete next element. The destructor of this object will be
      called eventually but not necessarily during the call of this
      function.
   */
  void pop(){
    Assert(!empty(), "Attempting to pop from an empty queue.");
    CDList<T>::makeCurrent();
    d_iter = d_iter + 1;
    if (d_iter == CDList<T>::d_size && d_lastsave != CDList<T>::d_size) {
      // Some elements have been enqueued and dequeued in the same
      // context and now the queue is empty we can destruct them.
      CDList<T>::removeLastUntil(d_lastsave);
      d_iter = CDList<T>::d_size = d_lastsave;
    }
  }

  /** Returns a reference to the next element on the queue. */
  const T& front(){
    Assert(!empty(), "No front in an empty queue.");
    return CDList<T>::d_list[d_iter];
  }

  /**
   * Returns the most recent item added to the list.
   */
  const T& back() const {
    Assert(!empty(), "CDQueue2::back() called on empty list");
    return CDList<T>::d_list[CDList<T>::d_size - 1];
  }

};/* class CDQueue<> */

}/* CVC4::context namespace */
}/* CVC4 namespace */

#endif /* __CVC4__CONTEXT__CDQUEUE_H */