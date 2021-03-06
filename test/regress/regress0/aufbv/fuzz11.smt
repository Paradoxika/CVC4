(benchmark fuzzsmt
:logic QF_AUFBV
:status sat
:extrafuns ((v0 BitVec[11]))
:extrafuns ((v1 BitVec[2]))
:extrafuns ((v2 BitVec[9]))
:extrafuns ((a3 Array[9:10]))
:extrafuns ((a4 Array[9:14]))
:extrafuns ((a5 Array[13:4]))
:formula
(let (?e6 bv28452[16])
(let (?e7 (bvnand ?e6 (zero_extend[7] v2)))
(let (?e8 (bvurem (sign_extend[7] v1) v2))
(let (?e9 (ite (bvult (zero_extend[7] v2) ?e7) bv1[1] bv0[1]))
(let (?e10 (bvmul (sign_extend[14] v1) ?e6))
(let (?e11 (bvcomp v0 (sign_extend[2] v2)))
(let (?e12 (select a3 (extract[8:0] v0)))
(let (?e13 (select a4 (extract[9:1] ?e12)))
(let (?e14 (select a3 (extract[11:3] ?e10)))
(let (?e15 (select a4 (extract[8:0] ?e12)))
(let (?e16 (bvmul v0 v0))
(let (?e17 (ite (bvsge ?e14 (zero_extend[8] v1)) bv1[1] bv0[1]))
(let (?e18 (bvsmod (zero_extend[6] ?e14) ?e10))
(let (?e19 (repeat[1] ?e15))
(let (?e20 (bvurem (sign_extend[12] v1) ?e19))
(let (?e21 (bvnand (sign_extend[6] ?e12) ?e7))
(let (?e22 (ite (bvslt (sign_extend[2] ?e20) ?e18) bv1[1] bv0[1]))
(let (?e23 (ite (bvult (sign_extend[9] ?e11) ?e12) bv1[1] bv0[1]))
(let (?e24 (ite (bvuge (zero_extend[1] ?e9) v1) bv1[1] bv0[1]))
(let (?e25 (ite (distinct ?e6 (sign_extend[2] ?e15)) bv1[1] bv0[1]))
(let (?e26 (ite (bvult ?e13 (zero_extend[3] v0)) bv1[1] bv0[1]))
(let (?e27 (bvand ?e8 (zero_extend[8] ?e9)))
(let (?e28 (bvxor (sign_extend[2] v2) v0))
(flet ($e29 (bvuge (zero_extend[2] ?e19) ?e10))
(flet ($e30 (bvult ?e10 (sign_extend[2] ?e20)))
(flet ($e31 (bvuge ?e23 ?e24))
(flet ($e32 (bvule (sign_extend[15] ?e23) ?e6))
(flet ($e33 (bvsge (zero_extend[6] ?e12) ?e10))
(flet ($e34 (bvule ?e9 ?e9))
(flet ($e35 (bvugt ?e15 (sign_extend[13] ?e23)))
(flet ($e36 (bvsge ?e8 (zero_extend[8] ?e17)))
(flet ($e37 (bvule ?e20 (zero_extend[3] v0)))
(flet ($e38 (bvsle ?e15 (zero_extend[5] ?e8)))
(flet ($e39 (bvuge ?e17 ?e11))
(flet ($e40 (bvuge ?e26 ?e26))
(flet ($e41 (bvslt (sign_extend[10] ?e23) v0))
(flet ($e42 (bvule (sign_extend[2] ?e13) ?e7))
(flet ($e43 (bvugt ?e25 ?e26))
(flet ($e44 (= (sign_extend[12] v1) ?e15))
(flet ($e45 (distinct (zero_extend[13] ?e26) ?e13))
(flet ($e46 (bvsge ?e26 ?e24))
(flet ($e47 (bvsgt ?e7 ?e18))
(flet ($e48 (bvugt (zero_extend[3] v0) ?e19))
(flet ($e49 (bvslt ?e18 (zero_extend[15] ?e17)))
(flet ($e50 (bvuge ?e14 (sign_extend[9] ?e25)))
(flet ($e51 (distinct (sign_extend[15] ?e23) ?e6))
(flet ($e52 (= ?e8 (sign_extend[8] ?e25)))
(flet ($e53 (bvule ?e14 ?e12))
(flet ($e54 (bvsle (sign_extend[8] ?e25) ?e8))
(flet ($e55 (bvuge (sign_extend[14] v1) ?e6))
(flet ($e56 (= (zero_extend[2] ?e13) ?e7))
(flet ($e57 (bvult ?e20 (sign_extend[3] ?e28)))
(flet ($e58 (= (sign_extend[1] ?e22) v1))
(flet ($e59 (bvslt ?e6 (sign_extend[15] ?e23)))
(flet ($e60 (bvuge ?e22 ?e17))
(flet ($e61 (bvsle (sign_extend[2] v2) v0))
(flet ($e62 (bvsge (sign_extend[13] ?e11) ?e13))
(flet ($e63 (bvugt (sign_extend[15] ?e11) ?e7))
(flet ($e64 (distinct ?e27 (zero_extend[8] ?e17)))
(flet ($e65 (bvult (zero_extend[1] ?e9) v1))
(flet ($e66 (bvslt ?e26 ?e22))
(flet ($e67 (= ?e12 (sign_extend[9] ?e25)))
(flet ($e68 (bvugt (sign_extend[3] ?e16) ?e13))
(flet ($e69 (bvsgt (sign_extend[8] ?e9) ?e27))
(flet ($e70 (bvsgt (zero_extend[15] ?e11) ?e21))
(flet ($e71 (iff $e36 $e60))
(flet ($e72 (iff $e59 $e35))
(flet ($e73 (and $e70 $e66))
(flet ($e74 (or $e69 $e57))
(flet ($e75 (if_then_else $e62 $e64 $e47))
(flet ($e76 (if_then_else $e56 $e52 $e73))
(flet ($e77 (and $e58 $e49))
(flet ($e78 (xor $e72 $e30))
(flet ($e79 (not $e54))
(flet ($e80 (iff $e45 $e34))
(flet ($e81 (iff $e38 $e37))
(flet ($e82 (or $e40 $e74))
(flet ($e83 (not $e42))
(flet ($e84 (and $e29 $e77))
(flet ($e85 (if_then_else $e41 $e76 $e48))
(flet ($e86 (iff $e53 $e44))
(flet ($e87 (if_then_else $e82 $e46 $e50))
(flet ($e88 (or $e78 $e79))
(flet ($e89 (and $e87 $e88))
(flet ($e90 (not $e51))
(flet ($e91 (xor $e65 $e84))
(flet ($e92 (or $e75 $e31))
(flet ($e93 (not $e68))
(flet ($e94 (or $e67 $e67))
(flet ($e95 (or $e85 $e89))
(flet ($e96 (if_then_else $e61 $e32 $e83))
(flet ($e97 (or $e71 $e71))
(flet ($e98 (not $e94))
(flet ($e99 (if_then_else $e97 $e33 $e98))
(flet ($e100 (implies $e43 $e43))
(flet ($e101 (implies $e91 $e100))
(flet ($e102 (and $e101 $e90))
(flet ($e103 (or $e39 $e95))
(flet ($e104 (if_then_else $e86 $e99 $e80))
(flet ($e105 (iff $e102 $e96))
(flet ($e106 (or $e63 $e63))
(flet ($e107 (iff $e103 $e103))
(flet ($e108 (implies $e93 $e55))
(flet ($e109 (implies $e105 $e81))
(flet ($e110 (if_then_else $e104 $e104 $e109))
(flet ($e111 (and $e107 $e110))
(flet ($e112 (if_then_else $e108 $e106 $e106))
(flet ($e113 (or $e92 $e92))
(flet ($e114 (not $e113))
(flet ($e115 (iff $e114 $e114))
(flet ($e116 (iff $e115 $e111))
(flet ($e117 (and $e112 $e112))
(flet ($e118 (not $e116))
(flet ($e119 (implies $e117 $e118))
(flet ($e120 (and $e119 (not (= v2 bv0[9]))))
(flet ($e121 (and $e120 (not (= ?e19 bv0[14]))))
(flet ($e122 (and $e121 (not (= ?e10 bv0[16]))))
(flet ($e123 (and $e122 (not (= ?e10 (bvnot bv0[16])))))
$e123
)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

