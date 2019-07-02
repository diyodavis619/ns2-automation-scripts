if {$argc != 4} {
       puts "\nNeed parameters to run in format: ns filename.tcl rp pksz int spd"
       exit 0;
}
#===================================
#     Simulation parameters setup
#===================================
set val(chan)   Channel/WirelessChannel    ;# channel type
set val(prop)   Propagation/TwoRayGround   ;# radio-propagation model
set val(netif)  Phy/WirelessPhy            ;# network interface type
set val(mac)    Mac/802_11                 ;# MAC type
if { [lindex $argv 0] == "DSR" } {
set val(ifq)    CMUPriQueue
} else {
set val(ifq)    Queue/DropTail/PriQueue
}                                          ;# interface queue type
set val(ll)     LL                         ;# link layer type
set val(ant)    Antenna/OmniAntenna        ;# antenna model
set val(ifqlen) 50                         ;# max packet in ifq
set val(nn)     200           ;# number of mobilenodes
set val(rp)     [lindex $argv 0]           ;# routing protocol
set val(x)      1500                       ;# X dimension of topography
set val(y)      1500                       ;# Y dimension of topography
set val(stop)   60.0                       ;# time of simulation end

#===================================
#        Initialization        
#===================================
#Create a ns simulator
set ns [new Simulator]

#Setup topography object
set topo       [new Topography]
$topo load_flatgrid $val(x) $val(y)
create-god $val(nn)

#Open the NS trace file
set tracefile [open out.tr w]
$ns trace-all $tracefile

#Open the NAM trace file
#set namfile [open out.nam w]
#$ns namtrace-all $namfile
#$ns namtrace-all-wireless $namfile $val(x) $val(y)
set chan [new $val(chan)]                  ;#Create wireless channel

#===================================
#     Mobile node parameter setup
#===================================
$ns node-config -adhocRouting $val(rp) \
                -llType $val(ll) \
                -macType $val(mac) \
                -ifqType $val(ifq) \
                -ifqLen $val(ifqlen) \
                -antType $val(ant) \
                -propType $val(prop) \
                -phyType $val(netif) \
                -channel $chan \
                -topoInstance $topo \
                -agentTrace ON \
                -routerTrace ON \
                -macTrace ON \
                -movementTrace ON

#===================================
#        Nodes Definition        
#===================================
#???0?Node
set node_(0) [$ns node]
$node_(0) set X_ 1135
$node_(0) set Y_ 641
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 110
$node_(1) set Y_ 1401
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 712
$node_(2) set Y_ 1343
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 1000
$node_(3) set Y_ 175
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 1457
$node_(4) set Y_ 466
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 1003
$node_(5) set Y_ 1393
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 148
$node_(6) set Y_ 1475
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 216
$node_(7) set Y_ 1412
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1037
$node_(8) set Y_ 35
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 214
$node_(9) set Y_ 1257
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 1139
$node_(10) set Y_ 225
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 430
$node_(11) set Y_ 46
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 956
$node_(12) set Y_ 987
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 929
$node_(13) set Y_ 1153
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 375
$node_(14) set Y_ 286
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 620
$node_(15) set Y_ 1146
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 673
$node_(16) set Y_ 597
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 1351
$node_(17) set Y_ 708
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 197
$node_(18) set Y_ 923
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 44
$node_(19) set Y_ 1189
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 250
$node_(20) set Y_ 876
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 471
$node_(21) set Y_ 422
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1040
$node_(22) set Y_ 486
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 23
$node_(23) set Y_ 1312
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 251
$node_(24) set Y_ 1119
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 826
$node_(25) set Y_ 162
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 206
$node_(26) set Y_ 1062
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 1439
$node_(27) set Y_ 1085
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 32
$node_(28) set Y_ 414
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 1126
$node_(29) set Y_ 619
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 213
$node_(30) set Y_ 536
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 914
$node_(31) set Y_ 150
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 896
$node_(32) set Y_ 55
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 33
$node_(33) set Y_ 1465
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 636
$node_(34) set Y_ 933
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 987
$node_(35) set Y_ 1106
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 604
$node_(36) set Y_ 682
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 1383
$node_(37) set Y_ 598
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 912
$node_(38) set Y_ 1460
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 923
$node_(39) set Y_ 1082
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 878
$node_(40) set Y_ 554
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 35
$node_(41) set Y_ 480
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 923
$node_(42) set Y_ 783
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 85
$node_(43) set Y_ 1469
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 1476
$node_(44) set Y_ 71
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 130
$node_(45) set Y_ 442
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 194
$node_(46) set Y_ 843
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 805
$node_(47) set Y_ 1175
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 256
$node_(48) set Y_ 667
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 1148
$node_(49) set Y_ 842
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 50
$node_(50) set Y_ 985
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 1238
$node_(51) set Y_ 1022
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 1110
$node_(52) set Y_ 35
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 1332
$node_(53) set Y_ 1132
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 1207
$node_(54) set Y_ 973
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 37
$node_(55) set Y_ 842
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 64
$node_(56) set Y_ 918
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 832
$node_(58) set Y_ 383
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 564
$node_(59) set Y_ 1132
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 257
$node_(60) set Y_ 240
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 128
$node_(61) set Y_ 82
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 1285
$node_(62) set Y_ 1300
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 890
$node_(63) set Y_ 841
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 337
$node_(64) set Y_ 1089
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 626
$node_(65) set Y_ 384
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 874
$node_(66) set Y_ 1275
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 1282
$node_(67) set Y_ 1482
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 345
$node_(68) set Y_ 338
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 651
$node_(69) set Y_ 1100
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(70) [$ns node]
$node_(70) set X_ 840
$node_(70) set Y_ 690
$ns initial_node_pos $node_(70) 20

#???70?Node
set node_(71) [$ns node]
$node_(71) set X_ 37
$node_(71) set Y_ 691
$ns initial_node_pos $node_(71) 20

#???71?Node
set node_(72) [$ns node]
$node_(72) set X_ 92
$node_(72) set Y_ 1332
$ns initial_node_pos $node_(72) 20

#???72?Node
set node_(73) [$ns node]
$node_(73) set X_ 42
$node_(73) set Y_ 542
$ns initial_node_pos $node_(73) 20

#???73?Node
set node_(74) [$ns node]
$node_(74) set X_ 630
$node_(74) set Y_ 672
$ns initial_node_pos $node_(74) 20

#???74?Node
set node_(75) [$ns node]
$node_(75) set X_ 404
$node_(75) set Y_ 927
$ns initial_node_pos $node_(75) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 44
$node_(76) set Y_ 1144
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 1032
$node_(77) set Y_ 980
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 993
$node_(78) set Y_ 861
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(80) [$ns node]
$node_(80) set X_ 1184
$node_(80) set Y_ 925
$ns initial_node_pos $node_(80) 20

#???79?Node
set node_(81) [$ns node]
$node_(81) set X_ 508
$node_(81) set Y_ 288
$ns initial_node_pos $node_(81) 20

#???80?Node
set node_(82) [$ns node]
$node_(82) set X_ 568
$node_(82) set Y_ 675
$ns initial_node_pos $node_(82) 20

#???81?Node
set node_(83) [$ns node]
$node_(83) set X_ 1204
$node_(83) set Y_ 765
$ns initial_node_pos $node_(83) 20

#???82?Node
set node_(84) [$ns node]
$node_(84) set X_ 71
$node_(84) set Y_ 164
$ns initial_node_pos $node_(84) 20

#???83?Node
set node_(85) [$ns node]
$node_(85) set X_ 1455
$node_(85) set Y_ 501
$ns initial_node_pos $node_(85) 20

#???84?Node
set node_(86) [$ns node]
$node_(86) set X_ 42
$node_(86) set Y_ 1085
$ns initial_node_pos $node_(86) 20

#???85?Node
set node_(87) [$ns node]
$node_(87) set X_ 50
$node_(87) set Y_ 1025
$ns initial_node_pos $node_(87) 20

#???86?Node
set node_(88) [$ns node]
$node_(88) set X_ 1047
$node_(88) set Y_ 1095
$ns initial_node_pos $node_(88) 20

#???87?Node
set node_(90) [$ns node]
$node_(90) set X_ 300
$node_(90) set Y_ 1417
$ns initial_node_pos $node_(90) 20

#???88?Node
set node_(91) [$ns node]
$node_(91) set X_ 633
$node_(91) set Y_ 1095
$ns initial_node_pos $node_(91) 20

#???89?Node
set node_(92) [$ns node]
$node_(92) set X_ 1391
$node_(92) set Y_ 35
$ns initial_node_pos $node_(92) 20

#???90?Node
set node_(94) [$ns node]
$node_(94) set X_ 778
$node_(94) set Y_ 83
$ns initial_node_pos $node_(94) 20

#???91?Node
set node_(95) [$ns node]
$node_(95) set X_ 913
$node_(95) set Y_ 468
$ns initial_node_pos $node_(95) 20

#???92?Node
set node_(96) [$ns node]
$node_(96) set X_ 1217
$node_(96) set Y_ 248
$ns initial_node_pos $node_(96) 20

#???93?Node
set node_(97) [$ns node]
$node_(97) set X_ 808
$node_(97) set Y_ 1466
$ns initial_node_pos $node_(97) 20

#???94?Node
set node_(98) [$ns node]
$node_(98) set X_ 375
$node_(98) set Y_ 46
$ns initial_node_pos $node_(98) 20

#???95?Node
set node_(99) [$ns node]
$node_(99) set X_ 287
$node_(99) set Y_ 176
$ns initial_node_pos $node_(99) 20

#???96?Node
set node_(100) [$ns node]
$node_(100) set X_ 568
$node_(100) set Y_ 932
$ns initial_node_pos $node_(100) 20

#???97?Node
set node_(101) [$ns node]
$node_(101) set X_ 685
$node_(101) set Y_ 918
$ns initial_node_pos $node_(101) 20

#???98?Node
set node_(102) [$ns node]
$node_(102) set X_ 1271
$node_(102) set Y_ 635
$ns initial_node_pos $node_(102) 20

#???99?Node
set node_(103) [$ns node]
$node_(103) set X_ 1167
$node_(103) set Y_ 1446
$ns initial_node_pos $node_(103) 20

#???100?Node
set node_(104) [$ns node]
$node_(104) set X_ 586
$node_(104) set Y_ 1138
$ns initial_node_pos $node_(104) 20

#???101?Node
set node_(105) [$ns node]
$node_(105) set X_ 962
$node_(105) set Y_ 950
$ns initial_node_pos $node_(105) 20

#???102?Node
set node_(106) [$ns node]
$node_(106) set X_ 606
$node_(106) set Y_ 890
$ns initial_node_pos $node_(106) 20

#???103?Node
set node_(107) [$ns node]
$node_(107) set X_ 837
$node_(107) set Y_ 1170
$ns initial_node_pos $node_(107) 20

#???104?Node
set node_(108) [$ns node]
$node_(108) set X_ 533
$node_(108) set Y_ 126
$ns initial_node_pos $node_(108) 20

#???105?Node
set node_(109) [$ns node]
$node_(109) set X_ 1430
$node_(109) set Y_ 1478
$ns initial_node_pos $node_(109) 20

#???106?Node
set node_(110) [$ns node]
$node_(110) set X_ 736
$node_(110) set Y_ 225
$ns initial_node_pos $node_(110) 20

#???107?Node
set node_(111) [$ns node]
$node_(111) set X_ 752
$node_(111) set Y_ 1244
$ns initial_node_pos $node_(111) 20

#???108?Node
set node_(112) [$ns node]
$node_(112) set X_ 293
$node_(112) set Y_ 536
$ns initial_node_pos $node_(112) 20

#???109?Node
set node_(113) [$ns node]
$node_(113) set X_ 299
$node_(113) set Y_ 267
$ns initial_node_pos $node_(113) 20

#???110?Node
set node_(114) [$ns node]
$node_(114) set X_ 376
$node_(114) set Y_ 558
$ns initial_node_pos $node_(114) 20

#???111?Node
set node_(116) [$ns node]
$node_(116) set X_ 652
$node_(116) set Y_ 983
$ns initial_node_pos $node_(116) 20

#???112?Node
set node_(117) [$ns node]
$node_(117) set X_ 1346
$node_(117) set Y_ 382
$ns initial_node_pos $node_(117) 20

#???113?Node
set node_(118) [$ns node]
$node_(118) set X_ 50
$node_(118) set Y_ 98
$ns initial_node_pos $node_(118) 20

#???114?Node
set node_(119) [$ns node]
$node_(119) set X_ 224
$node_(119) set Y_ 779
$ns initial_node_pos $node_(119) 20

#???115?Node
set node_(120) [$ns node]
$node_(120) set X_ 185
$node_(120) set Y_ 1341
$ns initial_node_pos $node_(120) 20

#???116?Node
set node_(121) [$ns node]
$node_(121) set X_ 1191
$node_(121) set Y_ 699
$ns initial_node_pos $node_(121) 20

#???117?Node
set node_(122) [$ns node]
$node_(122) set X_ 1475
$node_(122) set Y_ 157
$ns initial_node_pos $node_(122) 20

#???118?Node
set node_(123) [$ns node]
$node_(123) set X_ 160
$node_(123) set Y_ 1194
$ns initial_node_pos $node_(123) 20

#???119?Node
set node_(124) [$ns node]
$node_(124) set X_ 669
$node_(124) set Y_ 480
$ns initial_node_pos $node_(124) 20

#???120?Node
set node_(125) [$ns node]
$node_(125) set X_ 911
$node_(125) set Y_ 384
$ns initial_node_pos $node_(125) 20

#???121?Node
set node_(126) [$ns node]
$node_(126) set X_ 1053
$node_(126) set Y_ 1473
$ns initial_node_pos $node_(126) 20

#???122?Node
set node_(127) [$ns node]
$node_(127) set X_ 1069
$node_(127) set Y_ 549
$ns initial_node_pos $node_(127) 20

#???123?Node
set node_(128) [$ns node]
$node_(128) set X_ 30
$node_(128) set Y_ 276
$ns initial_node_pos $node_(128) 20

#???124?Node
set node_(130) [$ns node]
$node_(130) set X_ 273
$node_(130) set Y_ 42
$ns initial_node_pos $node_(130) 20

#???125?Node
set node_(131) [$ns node]
$node_(131) set X_ 936
$node_(131) set Y_ 971
$ns initial_node_pos $node_(131) 20

#???126?Node
set node_(132) [$ns node]
$node_(132) set X_ 1453
$node_(132) set Y_ 421
$ns initial_node_pos $node_(132) 20

#???127?Node
set node_(133) [$ns node]
$node_(133) set X_ 545
$node_(133) set Y_ 787
$ns initial_node_pos $node_(133) 20

#???128?Node
set node_(134) [$ns node]
$node_(134) set X_ 1075
$node_(134) set Y_ 592
$ns initial_node_pos $node_(134) 20

#???129?Node
set node_(135) [$ns node]
$node_(135) set X_ 250
$node_(135) set Y_ 924
$ns initial_node_pos $node_(135) 20

#???130?Node
set node_(136) [$ns node]
$node_(136) set X_ 959
$node_(136) set Y_ 946
$ns initial_node_pos $node_(136) 20

#???131?Node
set node_(137) [$ns node]
$node_(137) set X_ 514
$node_(137) set Y_ 82
$ns initial_node_pos $node_(137) 20

#???132?Node
set node_(138) [$ns node]
$node_(138) set X_ 308
$node_(138) set Y_ 812
$ns initial_node_pos $node_(138) 20

#???133?Node
set node_(139) [$ns node]
$node_(139) set X_ 507
$node_(139) set Y_ 1485
$ns initial_node_pos $node_(139) 20

#???134?Node
set node_(140) [$ns node]
$node_(140) set X_ 1248
$node_(140) set Y_ 725
$ns initial_node_pos $node_(140) 20

#???135?Node
set node_(141) [$ns node]
$node_(141) set X_ 948
$node_(141) set Y_ 941
$ns initial_node_pos $node_(141) 20

#???136?Node
set node_(142) [$ns node]
$node_(142) set X_ 457
$node_(142) set Y_ 448
$ns initial_node_pos $node_(142) 20

#???137?Node
set node_(143) [$ns node]
$node_(143) set X_ 283
$node_(143) set Y_ 183
$ns initial_node_pos $node_(143) 20

#???138?Node
set node_(144) [$ns node]
$node_(144) set X_ 469
$node_(144) set Y_ 1138
$ns initial_node_pos $node_(144) 20

#???139?Node
set node_(145) [$ns node]
$node_(145) set X_ 573
$node_(145) set Y_ 1014
$ns initial_node_pos $node_(145) 20

#???140?Node
set node_(146) [$ns node]
$node_(146) set X_ 274
$node_(146) set Y_ 326
$ns initial_node_pos $node_(146) 20

#???141?Node
set node_(147) [$ns node]
$node_(147) set X_ 1137
$node_(147) set Y_ 539
$ns initial_node_pos $node_(147) 20

#???142?Node
set node_(148) [$ns node]
$node_(148) set X_ 412
$node_(148) set Y_ 1064
$ns initial_node_pos $node_(148) 20

#???143?Node
set node_(149) [$ns node]
$node_(149) set X_ 257
$node_(149) set Y_ 646
$ns initial_node_pos $node_(149) 20

#???144?Node
set node_(150) [$ns node]
$node_(150) set X_ 539
$node_(150) set Y_ 205
$ns initial_node_pos $node_(150) 20

#???145?Node
set node_(151) [$ns node]
$node_(151) set X_ 225
$node_(151) set Y_ 1164
$ns initial_node_pos $node_(151) 20

#???146?Node
set node_(152) [$ns node]
$node_(152) set X_ 1166
$node_(152) set Y_ 1198
$ns initial_node_pos $node_(152) 20

#???147?Node
set node_(153) [$ns node]
$node_(153) set X_ 278
$node_(153) set Y_ 429
$ns initial_node_pos $node_(153) 20

#???148?Node
set node_(154) [$ns node]
$node_(154) set X_ 1003
$node_(154) set Y_ 524
$ns initial_node_pos $node_(154) 20

#???149?Node
set node_(155) [$ns node]
$node_(155) set X_ 1441
$node_(155) set Y_ 971
$ns initial_node_pos $node_(155) 20

#???150?Node
set node_(156) [$ns node]
$node_(156) set X_ 1316
$node_(156) set Y_ 137
$ns initial_node_pos $node_(156) 20

#???151?Node
set node_(158) [$ns node]
$node_(158) set X_ 785
$node_(158) set Y_ 260
$ns initial_node_pos $node_(158) 20

#???152?Node
set node_(159) [$ns node]
$node_(159) set X_ 39
$node_(159) set Y_ 773
$ns initial_node_pos $node_(159) 20

#???153?Node
set node_(160) [$ns node]
$node_(160) set X_ 360
$node_(160) set Y_ 246
$ns initial_node_pos $node_(160) 20

#???154?Node
set node_(161) [$ns node]
$node_(161) set X_ 362
$node_(161) set Y_ 1469
$ns initial_node_pos $node_(161) 20

#???155?Node
set node_(162) [$ns node]
$node_(162) set X_ 658
$node_(162) set Y_ 1475
$ns initial_node_pos $node_(162) 20

#???156?Node
set node_(163) [$ns node]
$node_(163) set X_ 620
$node_(163) set Y_ 1215
$ns initial_node_pos $node_(163) 20

#???157?Node
set node_(164) [$ns node]
$node_(164) set X_ 1244
$node_(164) set Y_ 260
$ns initial_node_pos $node_(164) 20

#???158?Node
set node_(165) [$ns node]
$node_(165) set X_ 28
$node_(165) set Y_ 350
$ns initial_node_pos $node_(165) 20

#???159?Node
set node_(166) [$ns node]
$node_(166) set X_ 482
$node_(166) set Y_ 1389
$ns initial_node_pos $node_(166) 20

#???160?Node
set node_(167) [$ns node]
$node_(167) set X_ 758
$node_(167) set Y_ 264
$ns initial_node_pos $node_(167) 20

#???161?Node
set node_(168) [$ns node]
$node_(168) set X_ 1457
$node_(168) set Y_ 889
$ns initial_node_pos $node_(168) 20

#???162?Node
set node_(169) [$ns node]
$node_(169) set X_ 646
$node_(169) set Y_ 580
$ns initial_node_pos $node_(169) 20

#???163?Node
set node_(170) [$ns node]
$node_(170) set X_ 463
$node_(170) set Y_ 364
$ns initial_node_pos $node_(170) 20

#???164?Node
set node_(171) [$ns node]
$node_(171) set X_ 784
$node_(171) set Y_ 736
$ns initial_node_pos $node_(171) 20

#???165?Node
set node_(172) [$ns node]
$node_(172) set X_ 360
$node_(172) set Y_ 1351
$ns initial_node_pos $node_(172) 20

#???166?Node
set node_(173) [$ns node]
$node_(173) set X_ 838
$node_(173) set Y_ 1338
$ns initial_node_pos $node_(173) 20

#???167?Node
set node_(174) [$ns node]
$node_(174) set X_ 183
$node_(174) set Y_ 964
$ns initial_node_pos $node_(174) 20

#???168?Node
set node_(175) [$ns node]
$node_(175) set X_ 970
$node_(175) set Y_ 1267
$ns initial_node_pos $node_(175) 20

#???169?Node
set node_(176) [$ns node]
$node_(176) set X_ 67
$node_(176) set Y_ 178
$ns initial_node_pos $node_(176) 20

#???170?Node
set node_(177) [$ns node]
$node_(177) set X_ 375
$node_(177) set Y_ 402
$ns initial_node_pos $node_(177) 20

#???171?Node
set node_(179) [$ns node]
$node_(179) set X_ 767
$node_(179) set Y_ 39
$ns initial_node_pos $node_(179) 20

#???172?Node
set node_(180) [$ns node]
$node_(180) set X_ 331
$node_(180) set Y_ 641
$ns initial_node_pos $node_(180) 20

#???173?Node
set node_(181) [$ns node]
$node_(181) set X_ 669
$node_(181) set Y_ 144
$ns initial_node_pos $node_(181) 20

#???174?Node
set node_(182) [$ns node]
$node_(182) set X_ 1405
$node_(182) set Y_ 733
$ns initial_node_pos $node_(182) 20

#???175?Node
set node_(183) [$ns node]
$node_(183) set X_ 704
$node_(183) set Y_ 940
$ns initial_node_pos $node_(183) 20

#???176?Node
set node_(184) [$ns node]
$node_(184) set X_ 48
$node_(184) set Y_ 1405
$ns initial_node_pos $node_(184) 20

#???177?Node
set node_(185) [$ns node]
$node_(185) set X_ 285
$node_(185) set Y_ 814
$ns initial_node_pos $node_(185) 20

#???178?Node
set node_(186) [$ns node]
$node_(186) set X_ 264
$node_(186) set Y_ 760
$ns initial_node_pos $node_(186) 20

#???179?Node
set node_(187) [$ns node]
$node_(187) set X_ 41
$node_(187) set Y_ 605
$ns initial_node_pos $node_(187) 20

#???180?Node
set node_(188) [$ns node]
$node_(188) set X_ 594
$node_(188) set Y_ 42
$ns initial_node_pos $node_(188) 20

#???181?Node
set node_(189) [$ns node]
$node_(189) set X_ 612
$node_(189) set Y_ 772
$ns initial_node_pos $node_(189) 20

#???182?Node
set node_(190) [$ns node]
$node_(190) set X_ 757
$node_(190) set Y_ 797
$ns initial_node_pos $node_(190) 20

#???183?Node
set node_(191) [$ns node]
$node_(191) set X_ 1092
$node_(191) set Y_ 625
$ns initial_node_pos $node_(191) 20

#???184?Node
set node_(192) [$ns node]
$node_(192) set X_ 166
$node_(192) set Y_ 951
$ns initial_node_pos $node_(192) 20

#???185?Node
set node_(193) [$ns node]
$node_(193) set X_ 530
$node_(193) set Y_ 1158
$ns initial_node_pos $node_(193) 20

#???186?Node
set node_(194) [$ns node]
$node_(194) set X_ 1201
$node_(194) set Y_ 39
$ns initial_node_pos $node_(194) 20

#???187?Node
set node_(195) [$ns node]
$node_(195) set X_ 151
$node_(195) set Y_ 1041
$ns initial_node_pos $node_(195) 20

#???188?Node
set node_(196) [$ns node]
$node_(196) set X_ 1323
$node_(196) set Y_ 519
$ns initial_node_pos $node_(196) 20

#???189?Node
set node_(197) [$ns node]
$node_(197) set X_ 268
$node_(197) set Y_ 480
$ns initial_node_pos $node_(197) 20

#???190?Node
set node_(198) [$ns node]
$node_(198) set X_ 989
$node_(198) set Y_ 375
$ns initial_node_pos $node_(198) 20

#???191?Node
set node_(199) [$ns node]
$node_(199) set X_ 439
$node_(199) set Y_ 860
$ns initial_node_pos $node_(199) 20

#???192?Node
set node_(200) [$ns node]
$node_(200) set X_ 1357
$node_(200) set Y_ 1019
$ns initial_node_pos $node_(200) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(2) setdest 453.0 1039.0 $tz " 
$ns at 10.0 " $node_(3) setdest 1126.0 1166.0 $tz " 
$ns at 10.0 " $node_(4) setdest 658.0 532.0 $tz " 
$ns at 10.0 " $node_(6) setdest 703.0 1400.0 $tz " 
$ns at 10.0 " $node_(7) setdest 980.0 1328.0 $tz " 
$ns at 10.0 " $node_(8) setdest 700.0 691.0 $tz " 
$ns at 10.0 " $node_(9) setdest 1114.0 764.0 $tz " 
$ns at 10.0 " $node_(10) setdest 871.0 1396.0 $tz " 
$ns at 10.0 " $node_(11) setdest 378.0 1180.0 $tz " 
$ns at 10.0 " $node_(17) setdest 789.0 466.0 $tz " 
$ns at 10.0 " $node_(19) setdest 550.0 1323.0 $tz " 
$ns at 10.0 " $node_(23) setdest 1117.0 1144.0 $tz " 
$ns at 10.0 " $node_(24) setdest 176.0 341.0 $tz " 
$ns at 10.0 " $node_(25) setdest 1128.0 360.0 $tz " 
$ns at 10.0 " $node_(28) setdest 1048.0 908.0 $tz " 
$ns at 10.0 " $node_(31) setdest 1276.0 830.0 $tz " 
$ns at 10.0 " $node_(32) setdest 1012.0 851.0 $tz " 
$ns at 10.0 " $node_(33) setdest 233.0 1303.0 $tz " 
$ns at 10.0 " $node_(37) setdest 1048.0 580.0 $tz " 
$ns at 10.0 " $node_(38) setdest 471.0 126.0 $tz " 
$ns at 10.0 " $node_(39) setdest 200.0 289.0 $tz " 
$ns at 10.0 " $node_(41) setdest 191.0 180.0 $tz " 
$ns at 10.0 " $node_(42) setdest 576.0 207.0 $tz " 
$ns at 10.0 " $node_(44) setdest 780.0 696.0 $tz " 
$ns at 10.0 " $node_(45) setdest 1228.0 96.0 $tz " 
$ns at 10.0 " $node_(49) setdest 641.0 1407.0 $tz " 
$ns at 10.0 " $node_(50) setdest 144.0 608.0 $tz " 
$ns at 10.0 " $node_(52) setdest 892.0 762.0 $tz " 
$ns at 10.0 " $node_(53) setdest 505.0 630.0 $tz " 
$ns at 10.0 " $node_(55) setdest 326.0 723.0 $tz " 
$ns at 10.0 " $node_(56) setdest 358.0 875.0 $tz " 
$ns at 10.0 " $node_(61) setdest 1314.0 1071.0 $tz " 
$ns at 10.0 " $node_(62) setdest 448.0 1392.0 $tz " 
$ns at 10.0 " $node_(64) setdest 1232.0 1394.0 $tz " 
$ns at 10.0 " $node_(66) setdest 1269.0 871.0 $tz " 
$ns at 10.0 " $node_(67) setdest 1175.0 1258.0 $tz " 
$ns at 10.0 " $node_(71) setdest 451.0 1271.0 $tz " 
$ns at 10.0 " $node_(72) setdest 119.0 198.0 $tz " 
$ns at 10.0 " $node_(73) setdest 605.0 576.0 $tz " 
$ns at 10.0 " $node_(76) setdest 441.0 921.0 $tz " 
$ns at 10.0 " $node_(84) setdest 307.0 1337.0 $tz " 
$ns at 10.0 " $node_(85) setdest 1194.0 237.0 $tz " 
$ns at 10.0 " $node_(86) setdest 525.0 1258.0 $tz " 
$ns at 10.0 " $node_(87) setdest 135.0 473.0 $tz " 
$ns at 10.0 " $node_(88) setdest 923.0 112.0 $tz " 
$ns at 10.0 " $node_(92) setdest 851.0 303.0 $tz " 
$ns at 10.0 " $node_(94) setdest 551.0 164.0 $tz " 
$ns at 10.0 " $node_(96) setdest 871.0 667.0 $tz " 
$ns at 10.0 " $node_(97) setdest 375.0 28.0 $tz " 
$ns at 10.0 " $node_(98) setdest 685.0 885.0 $tz " 
$ns at 10.0 " $node_(99) setdest 782.0 1407.0 $tz " 
$ns at 10.0 " $node_(100) setdest 1108.0 250.0 $tz " 
$ns at 10.0 " $node_(102) setdest 675.0 158.0 $tz " 
$ns at 10.0 " $node_(103) setdest 382.0 408.0 $tz " 
$ns at 10.0 " $node_(105) setdest 358.0 189.0 $tz " 
$ns at 10.0 " $node_(108) setdest 437.0 696.0 $tz " 
$ns at 10.0 " $node_(111) setdest 1157.0 1250.0 $tz " 
$ns at 10.0 " $node_(117) setdest 892.0 210.0 $tz " 
$ns at 10.0 " $node_(118) setdest 1185.0 478.0 $tz " 
$ns at 10.0 " $node_(122) setdest 396.0 553.0 $tz " 
$ns at 10.0 " $node_(123) setdest 539.0 1408.0 $tz " 
$ns at 10.0 " $node_(126) setdest 1133.0 817.0 $tz " 
$ns at 10.0 " $node_(128) setdest 714.0 1151.0 $tz " 
$ns at 10.0 " $node_(130) setdest 755.0 1055.0 $tz " 
$ns at 10.0 " $node_(132) setdest 382.0 292.0 $tz " 
$ns at 10.0 " $node_(135) setdest 1348.0 1387.0 $tz " 
$ns at 10.0 " $node_(137) setdest 1250.0 1219.0 $tz " 
$ns at 10.0 " $node_(138) setdest 1375.0 714.0 $tz " 
$ns at 10.0 " $node_(139) setdest 1033.0 1358.0 $tz " 
$ns at 10.0 " $node_(140) setdest 776.0 292.0 $tz " 
$ns at 10.0 " $node_(143) setdest 1321.0 841.0 $tz " 
$ns at 10.0 " $node_(144) setdest 750.0 1016.0 $tz " 
$ns at 10.0 " $node_(148) setdest 1098.0 1058.0 $tz " 
$ns at 10.0 " $node_(149) setdest 1314.0 1178.0 $tz " 
$ns at 10.0 " $node_(150) setdest 1267.0 551.0 $tz " 
$ns at 10.0 " $node_(152) setdest 437.0 748.0 $tz " 
$ns at 10.0 " $node_(155) setdest 912.0 1041.0 $tz " 
$ns at 10.0 " $node_(156) setdest 701.0 383.0 $tz " 
$ns at 10.0 " $node_(159) setdest 508.0 1012.0 $tz " 
$ns at 10.0 " $node_(161) setdest 392.0 1400.0 $tz " 
$ns at 10.0 " $node_(162) setdest 1210.0 944.0 $tz " 
$ns at 10.0 " $node_(164) setdest 653.0 225.0 $tz " 
$ns at 10.0 " $node_(165) setdest 835.0 1116.0 $tz " 
$ns at 10.0 " $node_(166) setdest 323.0 1044.0 $tz " 
$ns at 10.0 " $node_(168) setdest 962.0 692.0 $tz " 
$ns at 10.0 " $node_(172) setdest 214.0 1032.0 $tz " 
$ns at 10.0 " $node_(173) setdest 826.0 178.0 $tz " 
$ns at 10.0 " $node_(176) setdest 867.0 983.0 $tz " 
$ns at 10.0 " $node_(179) setdest 1075.0 689.0 $tz " 
$ns at 10.0 " $node_(181) setdest 1110.0 1392.0 $tz " 
$ns at 10.0 " $node_(182) setdest 1157.0 1423.0 $tz " 
$ns at 10.0 " $node_(184) setdest 730.0 1282.0 $tz " 
$ns at 10.0 " $node_(185) setdest 1248.0 385.0 $tz " 
$ns at 10.0 " $node_(186) setdest 778.0 832.0 $tz " 
$ns at 10.0 " $node_(187) setdest 903.0 1203.0 $tz " 
$ns at 10.0 " $node_(193) setdest 426.0 601.0 $tz " 
$ns at 10.0 " $node_(194) setdest 989.0 192.0 $tz " 
$ns at 10.0 " $node_(195) setdest 782.0 958.0 $tz " 
$ns at 10.0 " $node_(196) setdest 94.0 30.0 $tz " 
$ns at 10.0 " $node_(199) setdest 1037.0 112.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(184) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(9) $null0
$ns connect $udp0 $null0

#===================================
#        Applications Definition        
#===================================
set cbr0 [new Application/Traffic/CBR];
$cbr0 attach-agent $udp0
$cbr0 set packet_size_ [lindex $argv 1]
$cbr0 set interval_ [lindex $argv 2]

$ns at 10.0 "$cbr0 start"
$ns at 50.0 "$cbr0 stop"

#===================================
#        Termination        
#===================================
#Define a 'finish' procedure
proc finish {} {
    global ns tracefile ;#namfile
    $ns flush-trace
    close $tracefile
    #close $namfile
    #exec nam out.nam &
    exit 0
}
for {set i 0} {$i < $val(nn) } { incr i } {
}
$ns at $val(stop) "finish"
$ns at $val(stop) "puts \"done\" ; $ns halt"
$ns run