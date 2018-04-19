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
$node_(0) set X_ 1231
$node_(0) set Y_ 1066
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 255
$node_(1) set Y_ 1489
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 1045
$node_(2) set Y_ 1123
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 1130
$node_(3) set Y_ 403
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 1200
$node_(4) set Y_ 85
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 1425
$node_(5) set Y_ 344
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1416
$node_(6) set Y_ 458
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1101
$node_(7) set Y_ 498
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 267
$node_(8) set Y_ 1085
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1432
$node_(9) set Y_ 1226
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 368
$node_(10) set Y_ 282
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 1223
$node_(11) set Y_ 1130
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 142
$node_(12) set Y_ 1058
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 285
$node_(13) set Y_ 6
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1076
$node_(14) set Y_ 898
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 458
$node_(15) set Y_ 671
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 1156
$node_(16) set Y_ 871
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 214
$node_(17) set Y_ 730
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 21
$node_(18) set Y_ 1287
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 510
$node_(19) set Y_ 1125
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 744
$node_(20) set Y_ 378
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 112
$node_(21) set Y_ 1337
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1151
$node_(22) set Y_ 1289
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 593
$node_(23) set Y_ 1024
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 1055
$node_(24) set Y_ 1348
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 1119
$node_(25) set Y_ 762
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 241
$node_(26) set Y_ 1207
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 312
$node_(27) set Y_ 1266
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 751
$node_(28) set Y_ 537
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 1410
$node_(29) set Y_ 551
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 505
$node_(30) set Y_ 498
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 816
$node_(31) set Y_ 1194
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 667
$node_(32) set Y_ 1030
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 194
$node_(33) set Y_ 1121
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 437
$node_(34) set Y_ 1321
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 1353
$node_(35) set Y_ 253
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 1269
$node_(36) set Y_ 805
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 568
$node_(37) set Y_ 605
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 643
$node_(38) set Y_ 544
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 912
$node_(39) set Y_ 132
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 1294
$node_(40) set Y_ 867
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 128
$node_(41) set Y_ 380
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 193
$node_(42) set Y_ 557
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 1242
$node_(43) set Y_ 123
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 1092
$node_(44) set Y_ 966
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 1355
$node_(45) set Y_ 1335
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(47) [$ns node]
$node_(47) set X_ 53
$node_(47) set Y_ 637
$ns initial_node_pos $node_(47) 20

#???47?Node
set node_(48) [$ns node]
$node_(48) set X_ 483
$node_(48) set Y_ 569
$ns initial_node_pos $node_(48) 20

#???48?Node
set node_(49) [$ns node]
$node_(49) set X_ 1023
$node_(49) set Y_ 619
$ns initial_node_pos $node_(49) 20

#???49?Node
set node_(50) [$ns node]
$node_(50) set X_ 1367
$node_(50) set Y_ 733
$ns initial_node_pos $node_(50) 20

#???50?Node
set node_(51) [$ns node]
$node_(51) set X_ 818
$node_(51) set Y_ 101
$ns initial_node_pos $node_(51) 20

#???51?Node
set node_(52) [$ns node]
$node_(52) set X_ 1092
$node_(52) set Y_ 675
$ns initial_node_pos $node_(52) 20

#???52?Node
set node_(53) [$ns node]
$node_(53) set X_ 1314
$node_(53) set Y_ 1126
$ns initial_node_pos $node_(53) 20

#???53?Node
set node_(54) [$ns node]
$node_(54) set X_ 1223
$node_(54) set Y_ 523
$ns initial_node_pos $node_(54) 20

#???54?Node
set node_(55) [$ns node]
$node_(55) set X_ 1221
$node_(55) set Y_ 1237
$ns initial_node_pos $node_(55) 20

#???55?Node
set node_(56) [$ns node]
$node_(56) set X_ 726
$node_(56) set Y_ 674
$ns initial_node_pos $node_(56) 20

#???56?Node
set node_(57) [$ns node]
$node_(57) set X_ 29
$node_(57) set Y_ 886
$ns initial_node_pos $node_(57) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 753
$node_(58) set Y_ 1270
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 235
$node_(59) set Y_ 253
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 485
$node_(60) set Y_ 1432
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 1156
$node_(61) set Y_ 614
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 810
$node_(62) set Y_ 634
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 435
$node_(63) set Y_ 937
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 653
$node_(64) set Y_ 1357
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 408
$node_(65) set Y_ 1123
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 1119
$node_(66) set Y_ 1428
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 928
$node_(67) set Y_ 910
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 574
$node_(68) set Y_ 1238
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 258
$node_(69) set Y_ 939
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(70) [$ns node]
$node_(70) set X_ 962
$node_(70) set Y_ 1148
$ns initial_node_pos $node_(70) 20

#???70?Node
set node_(71) [$ns node]
$node_(71) set X_ 668
$node_(71) set Y_ 626
$ns initial_node_pos $node_(71) 20

#???71?Node
set node_(72) [$ns node]
$node_(72) set X_ 1233
$node_(72) set Y_ 707
$ns initial_node_pos $node_(72) 20

#???72?Node
set node_(73) [$ns node]
$node_(73) set X_ 406
$node_(73) set Y_ 259
$ns initial_node_pos $node_(73) 20

#???73?Node
set node_(74) [$ns node]
$node_(74) set X_ 801
$node_(74) set Y_ 226
$ns initial_node_pos $node_(74) 20

#???74?Node
set node_(75) [$ns node]
$node_(75) set X_ 310
$node_(75) set Y_ 527
$ns initial_node_pos $node_(75) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 1083
$node_(76) set Y_ 1172
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 637
$node_(77) set Y_ 1146
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 326
$node_(78) set Y_ 891
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(79) [$ns node]
$node_(79) set X_ 103
$node_(79) set Y_ 654
$ns initial_node_pos $node_(79) 20

#???79?Node
set node_(80) [$ns node]
$node_(80) set X_ 353
$node_(80) set Y_ 1035
$ns initial_node_pos $node_(80) 20

#???80?Node
set node_(81) [$ns node]
$node_(81) set X_ 67
$node_(81) set Y_ 544
$ns initial_node_pos $node_(81) 20

#???81?Node
set node_(82) [$ns node]
$node_(82) set X_ 1014
$node_(82) set Y_ 829
$ns initial_node_pos $node_(82) 20

#???82?Node
set node_(83) [$ns node]
$node_(83) set X_ 98
$node_(83) set Y_ 1275
$ns initial_node_pos $node_(83) 20

#???83?Node
set node_(84) [$ns node]
$node_(84) set X_ 810
$node_(84) set Y_ 726
$ns initial_node_pos $node_(84) 20

#???84?Node
set node_(85) [$ns node]
$node_(85) set X_ 387
$node_(85) set Y_ 530
$ns initial_node_pos $node_(85) 20

#???85?Node
set node_(86) [$ns node]
$node_(86) set X_ 576
$node_(86) set Y_ 1458
$ns initial_node_pos $node_(86) 20

#???86?Node
set node_(87) [$ns node]
$node_(87) set X_ 1116
$node_(87) set Y_ 1046
$ns initial_node_pos $node_(87) 20

#???87?Node
set node_(88) [$ns node]
$node_(88) set X_ 364
$node_(88) set Y_ 1462
$ns initial_node_pos $node_(88) 20

#???88?Node
set node_(89) [$ns node]
$node_(89) set X_ 241
$node_(89) set Y_ 1325
$ns initial_node_pos $node_(89) 20

#???89?Node
set node_(90) [$ns node]
$node_(90) set X_ 426
$node_(90) set Y_ 1201
$ns initial_node_pos $node_(90) 20

#???90?Node
set node_(91) [$ns node]
$node_(91) set X_ 174
$node_(91) set Y_ 868
$ns initial_node_pos $node_(91) 20

#???91?Node
set node_(92) [$ns node]
$node_(92) set X_ 767
$node_(92) set Y_ 1364
$ns initial_node_pos $node_(92) 20

#???92?Node
set node_(93) [$ns node]
$node_(93) set X_ 1017
$node_(93) set Y_ 500
$ns initial_node_pos $node_(93) 20

#???93?Node
set node_(94) [$ns node]
$node_(94) set X_ 1337
$node_(94) set Y_ 435
$ns initial_node_pos $node_(94) 20

#???94?Node
set node_(95) [$ns node]
$node_(95) set X_ 1140
$node_(95) set Y_ 1144
$ns initial_node_pos $node_(95) 20

#???95?Node
set node_(96) [$ns node]
$node_(96) set X_ 1287
$node_(96) set Y_ 607
$ns initial_node_pos $node_(96) 20

#???96?Node
set node_(97) [$ns node]
$node_(97) set X_ 394
$node_(97) set Y_ 85
$ns initial_node_pos $node_(97) 20

#???97?Node
set node_(98) [$ns node]
$node_(98) set X_ 941
$node_(98) set Y_ 292
$ns initial_node_pos $node_(98) 20

#???98?Node
set node_(99) [$ns node]
$node_(99) set X_ 1417
$node_(99) set Y_ 837
$ns initial_node_pos $node_(99) 20

#???99?Node
set node_(100) [$ns node]
$node_(100) set X_ 274
$node_(100) set Y_ 358
$ns initial_node_pos $node_(100) 20

#???100?Node
set node_(101) [$ns node]
$node_(101) set X_ 844
$node_(101) set Y_ 1296
$ns initial_node_pos $node_(101) 20

#???101?Node
set node_(102) [$ns node]
$node_(102) set X_ 551
$node_(102) set Y_ 196
$ns initial_node_pos $node_(102) 20

#???102?Node
set node_(103) [$ns node]
$node_(103) set X_ 1442
$node_(103) set Y_ 1001
$ns initial_node_pos $node_(103) 20

#???103?Node
set node_(104) [$ns node]
$node_(104) set X_ 1333
$node_(104) set Y_ 512
$ns initial_node_pos $node_(104) 20

#???104?Node
set node_(105) [$ns node]
$node_(105) set X_ 682
$node_(105) set Y_ 4
$ns initial_node_pos $node_(105) 20

#???105?Node
set node_(106) [$ns node]
$node_(106) set X_ 132
$node_(106) set Y_ 740
$ns initial_node_pos $node_(106) 20

#???106?Node
set node_(107) [$ns node]
$node_(107) set X_ 723
$node_(107) set Y_ 914
$ns initial_node_pos $node_(107) 20

#???107?Node
set node_(108) [$ns node]
$node_(108) set X_ 333
$node_(108) set Y_ 757
$ns initial_node_pos $node_(108) 20

#???108?Node
set node_(109) [$ns node]
$node_(109) set X_ 916
$node_(109) set Y_ 44
$ns initial_node_pos $node_(109) 20

#???109?Node
set node_(110) [$ns node]
$node_(110) set X_ 1436
$node_(110) set Y_ 1325
$ns initial_node_pos $node_(110) 20

#???110?Node
set node_(111) [$ns node]
$node_(111) set X_ 932
$node_(111) set Y_ 1016
$ns initial_node_pos $node_(111) 20

#???111?Node
set node_(112) [$ns node]
$node_(112) set X_ 28
$node_(112) set Y_ 1217
$ns initial_node_pos $node_(112) 20

#???112?Node
set node_(113) [$ns node]
$node_(113) set X_ 1355
$node_(113) set Y_ 1446
$ns initial_node_pos $node_(113) 20

#???113?Node
set node_(114) [$ns node]
$node_(114) set X_ 1251
$node_(114) set Y_ 230
$ns initial_node_pos $node_(114) 20

#???114?Node
set node_(115) [$ns node]
$node_(115) set X_ 1003
$node_(115) set Y_ 1067
$ns initial_node_pos $node_(115) 20

#???115?Node
set node_(116) [$ns node]
$node_(116) set X_ 655
$node_(116) set Y_ 59
$ns initial_node_pos $node_(116) 20

#???116?Node
set node_(118) [$ns node]
$node_(118) set X_ 74
$node_(118) set Y_ 800
$ns initial_node_pos $node_(118) 20

#???117?Node
set node_(119) [$ns node]
$node_(119) set X_ 14
$node_(119) set Y_ 200
$ns initial_node_pos $node_(119) 20

#???118?Node
set node_(120) [$ns node]
$node_(120) set X_ 60
$node_(120) set Y_ 1006
$ns initial_node_pos $node_(120) 20

#???119?Node
set node_(121) [$ns node]
$node_(121) set X_ 1360
$node_(121) set Y_ 1190
$ns initial_node_pos $node_(121) 20

#???120?Node
set node_(122) [$ns node]
$node_(122) set X_ 866
$node_(122) set Y_ 1439
$ns initial_node_pos $node_(122) 20

#???121?Node
set node_(123) [$ns node]
$node_(123) set X_ 513
$node_(123) set Y_ 245
$ns initial_node_pos $node_(123) 20

#???122?Node
set node_(124) [$ns node]
$node_(124) set X_ 814
$node_(124) set Y_ 848
$ns initial_node_pos $node_(124) 20

#???123?Node
set node_(125) [$ns node]
$node_(125) set X_ 307
$node_(125) set Y_ 833
$ns initial_node_pos $node_(125) 20

#???124?Node
set node_(126) [$ns node]
$node_(126) set X_ 1042
$node_(126) set Y_ 1259
$ns initial_node_pos $node_(126) 20

#???125?Node
set node_(127) [$ns node]
$node_(127) set X_ 100
$node_(127) set Y_ 292
$ns initial_node_pos $node_(127) 20

#???126?Node
set node_(128) [$ns node]
$node_(128) set X_ 946
$node_(128) set Y_ 732
$ns initial_node_pos $node_(128) 20

#???127?Node
set node_(129) [$ns node]
$node_(129) set X_ 1235
$node_(129) set Y_ 980
$ns initial_node_pos $node_(129) 20

#???128?Node
set node_(130) [$ns node]
$node_(130) set X_ 62
$node_(130) set Y_ 1480
$ns initial_node_pos $node_(130) 20

#???129?Node
set node_(131) [$ns node]
$node_(131) set X_ 1391
$node_(131) set Y_ 655
$ns initial_node_pos $node_(131) 20

#???130?Node
set node_(132) [$ns node]
$node_(132) set X_ 1012
$node_(132) set Y_ 1430
$ns initial_node_pos $node_(132) 20

#???131?Node
set node_(133) [$ns node]
$node_(133) set X_ 648
$node_(133) set Y_ 460
$ns initial_node_pos $node_(133) 20

#???132?Node
set node_(134) [$ns node]
$node_(134) set X_ 917
$node_(134) set Y_ 1225
$ns initial_node_pos $node_(134) 20

#???133?Node
set node_(135) [$ns node]
$node_(135) set X_ 217
$node_(135) set Y_ 1396
$ns initial_node_pos $node_(135) 20

#???134?Node
set node_(136) [$ns node]
$node_(136) set X_ 1073
$node_(136) set Y_ 310
$ns initial_node_pos $node_(136) 20

#???135?Node
set node_(137) [$ns node]
$node_(137) set X_ 121
$node_(137) set Y_ 964
$ns initial_node_pos $node_(137) 20

#???136?Node
set node_(138) [$ns node]
$node_(138) set X_ 310
$node_(138) set Y_ 671
$ns initial_node_pos $node_(138) 20

#???137?Node
set node_(139) [$ns node]
$node_(139) set X_ 585
$node_(139) set Y_ 901
$ns initial_node_pos $node_(139) 20

#???138?Node
set node_(140) [$ns node]
$node_(140) set X_ 55
$node_(140) set Y_ 112
$ns initial_node_pos $node_(140) 20

#???139?Node
set node_(141) [$ns node]
$node_(141) set X_ 793
$node_(141) set Y_ 950
$ns initial_node_pos $node_(141) 20

#???140?Node
set node_(142) [$ns node]
$node_(142) set X_ 1344
$node_(142) set Y_ 1042
$ns initial_node_pos $node_(142) 20

#???141?Node
set node_(143) [$ns node]
$node_(143) set X_ 1232
$node_(143) set Y_ 1469
$ns initial_node_pos $node_(143) 20

#???142?Node
set node_(144) [$ns node]
$node_(144) set X_ 679
$node_(144) set Y_ 274
$ns initial_node_pos $node_(144) 20

#???143?Node
set node_(145) [$ns node]
$node_(145) set X_ 94
$node_(145) set Y_ 926
$ns initial_node_pos $node_(145) 20

#???144?Node
set node_(146) [$ns node]
$node_(146) set X_ 48
$node_(146) set Y_ 350
$ns initial_node_pos $node_(146) 20

#???145?Node
set node_(147) [$ns node]
$node_(147) set X_ 753
$node_(147) set Y_ 1114
$ns initial_node_pos $node_(147) 20

#???146?Node
set node_(148) [$ns node]
$node_(148) set X_ 55
$node_(148) set Y_ 442
$ns initial_node_pos $node_(148) 20

#???147?Node
set node_(149) [$ns node]
$node_(149) set X_ 914
$node_(149) set Y_ 810
$ns initial_node_pos $node_(149) 20

#???148?Node
set node_(150) [$ns node]
$node_(150) set X_ 114
$node_(150) set Y_ 214
$ns initial_node_pos $node_(150) 20

#???149?Node
set node_(151) [$ns node]
$node_(151) set X_ 842
$node_(151) set Y_ 323
$ns initial_node_pos $node_(151) 20

#???150?Node
set node_(152) [$ns node]
$node_(152) set X_ 789
$node_(152) set Y_ 1048
$ns initial_node_pos $node_(152) 20

#???151?Node
set node_(153) [$ns node]
$node_(153) set X_ 541
$node_(153) set Y_ 1364
$ns initial_node_pos $node_(153) 20

#???152?Node
set node_(154) [$ns node]
$node_(154) set X_ 23
$node_(154) set Y_ 1098
$ns initial_node_pos $node_(154) 20

#???153?Node
set node_(156) [$ns node]
$node_(156) set X_ 23
$node_(156) set Y_ 1408
$ns initial_node_pos $node_(156) 20

#???154?Node
set node_(157) [$ns node]
$node_(157) set X_ 307
$node_(157) set Y_ 1145
$ns initial_node_pos $node_(157) 20

#???155?Node
set node_(158) [$ns node]
$node_(158) set X_ 649
$node_(158) set Y_ 353
$ns initial_node_pos $node_(158) 20

#???156?Node
set node_(159) [$ns node]
$node_(159) set X_ 1417
$node_(159) set Y_ 1100
$ns initial_node_pos $node_(159) 20

#???157?Node
set node_(160) [$ns node]
$node_(160) set X_ 683
$node_(160) set Y_ 807
$ns initial_node_pos $node_(160) 20

#???158?Node
set node_(161) [$ns node]
$node_(161) set X_ 64
$node_(161) set Y_ 60
$ns initial_node_pos $node_(161) 20

#???159?Node
set node_(162) [$ns node]
$node_(162) set X_ 1378
$node_(162) set Y_ 932
$ns initial_node_pos $node_(162) 20

#???160?Node
set node_(163) [$ns node]
$node_(163) set X_ 600
$node_(163) set Y_ 753
$ns initial_node_pos $node_(163) 20

#???161?Node
set node_(164) [$ns node]
$node_(164) set X_ 878
$node_(164) set Y_ 483
$ns initial_node_pos $node_(164) 20

#???162?Node
set node_(165) [$ns node]
$node_(165) set X_ 1160
$node_(165) set Y_ 1358
$ns initial_node_pos $node_(165) 20

#???163?Node
set node_(166) [$ns node]
$node_(166) set X_ 335
$node_(166) set Y_ 1387
$ns initial_node_pos $node_(166) 20

#???164?Node
set node_(167) [$ns node]
$node_(167) set X_ 90
$node_(167) set Y_ 1124
$ns initial_node_pos $node_(167) 20

#???165?Node
set node_(168) [$ns node]
$node_(168) set X_ 501
$node_(168) set Y_ 1273
$ns initial_node_pos $node_(168) 20

#???166?Node
set node_(169) [$ns node]
$node_(169) set X_ 1332
$node_(169) set Y_ 351
$ns initial_node_pos $node_(169) 20

#???167?Node
set node_(170) [$ns node]
$node_(170) set X_ 655
$node_(170) set Y_ 176
$ns initial_node_pos $node_(170) 20

#???168?Node
set node_(171) [$ns node]
$node_(171) set X_ 227
$node_(171) set Y_ 445
$ns initial_node_pos $node_(171) 20

#???169?Node
set node_(172) [$ns node]
$node_(172) set X_ 1019
$node_(172) set Y_ 398
$ns initial_node_pos $node_(172) 20

#???170?Node
set node_(173) [$ns node]
$node_(173) set X_ 810
$node_(173) set Y_ 423
$ns initial_node_pos $node_(173) 20

#???171?Node
set node_(174) [$ns node]
$node_(174) set X_ 160
$node_(174) set Y_ 1230
$ns initial_node_pos $node_(174) 20

#???172?Node
set node_(175) [$ns node]
$node_(175) set X_ 363
$node_(175) set Y_ 400
$ns initial_node_pos $node_(175) 20

#???173?Node
set node_(176) [$ns node]
$node_(176) set X_ 244
$node_(176) set Y_ 55
$ns initial_node_pos $node_(176) 20

#???174?Node
set node_(177) [$ns node]
$node_(177) set X_ 1050
$node_(177) set Y_ 39
$ns initial_node_pos $node_(177) 20

#???175?Node
set node_(178) [$ns node]
$node_(178) set X_ 184
$node_(178) set Y_ 137
$ns initial_node_pos $node_(178) 20

#???176?Node
set node_(179) [$ns node]
$node_(179) set X_ 923
$node_(179) set Y_ 375
$ns initial_node_pos $node_(179) 20

#???177?Node
set node_(180) [$ns node]
$node_(180) set X_ 145
$node_(180) set Y_ 482
$ns initial_node_pos $node_(180) 20

#???178?Node
set node_(181) [$ns node]
$node_(181) set X_ 250
$node_(181) set Y_ 1001
$ns initial_node_pos $node_(181) 20

#???179?Node
set node_(182) [$ns node]
$node_(182) set X_ 146
$node_(182) set Y_ 1467
$ns initial_node_pos $node_(182) 20

#???180?Node
set node_(183) [$ns node]
$node_(183) set X_ 96
$node_(183) set Y_ 1393
$ns initial_node_pos $node_(183) 20

#???181?Node
set node_(184) [$ns node]
$node_(184) set X_ 498
$node_(184) set Y_ 385
$ns initial_node_pos $node_(184) 20

#???182?Node
set node_(185) [$ns node]
$node_(185) set X_ 307
$node_(185) set Y_ 175
$ns initial_node_pos $node_(185) 20

#???183?Node
set node_(186) [$ns node]
$node_(186) set X_ 682
$node_(186) set Y_ 1216
$ns initial_node_pos $node_(186) 20

#???184?Node
set node_(187) [$ns node]
$node_(187) set X_ 432
$node_(187) set Y_ 137
$ns initial_node_pos $node_(187) 20

#???185?Node
set node_(188) [$ns node]
$node_(188) set X_ 476
$node_(188) set Y_ 1057
$ns initial_node_pos $node_(188) 20

#???186?Node
set node_(189) [$ns node]
$node_(189) set X_ 1255
$node_(189) set Y_ 437
$ns initial_node_pos $node_(189) 20

#???187?Node
set node_(190) [$ns node]
$node_(190) set X_ 907
$node_(190) set Y_ 605
$ns initial_node_pos $node_(190) 20

#???188?Node
set node_(191) [$ns node]
$node_(191) set X_ 1089
$node_(191) set Y_ 177
$ns initial_node_pos $node_(191) 20

#???189?Node
set node_(192) [$ns node]
$node_(192) set X_ 1308
$node_(192) set Y_ 1276
$ns initial_node_pos $node_(192) 20

#???190?Node
set node_(193) [$ns node]
$node_(193) set X_ 1255
$node_(193) set Y_ 1375
$ns initial_node_pos $node_(193) 20

#???191?Node
set node_(194) [$ns node]
$node_(194) set X_ 957
$node_(194) set Y_ 1283
$ns initial_node_pos $node_(194) 20

#???192?Node
set node_(195) [$ns node]
$node_(195) set X_ 494
$node_(195) set Y_ 742
$ns initial_node_pos $node_(195) 20

#???193?Node
set node_(196) [$ns node]
$node_(196) set X_ 476
$node_(196) set Y_ 835
$ns initial_node_pos $node_(196) 20

#???194?Node
set node_(197) [$ns node]
$node_(197) set X_ 540
$node_(197) set Y_ 30
$ns initial_node_pos $node_(197) 20

#???195?Node
set node_(198) [$ns node]
$node_(198) set X_ 878
$node_(198) set Y_ 1125
$ns initial_node_pos $node_(198) 20

#???196?Node
set node_(199) [$ns node]
$node_(199) set X_ 1203
$node_(199) set Y_ 330
$ns initial_node_pos $node_(199) 20

#???197?Node
set node_(200) [$ns node]
$node_(200) set X_ 400
$node_(200) set Y_ 827
$ns initial_node_pos $node_(200) 20

#???198?Node
set node_(201) [$ns node]
$node_(201) set X_ 559
$node_(201) set Y_ 558
$ns initial_node_pos $node_(201) 20

#???199?Node
set node_(202) [$ns node]
$node_(202) set X_ 494
$node_(202) set Y_ 1201
$ns initial_node_pos $node_(202) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 1151.0 60.0 $tz " 
$ns at 10.0 " $node_(1) setdest 616.0 683.0 $tz " 
$ns at 10.0 " $node_(2) setdest 17.0 744.0 $tz " 
$ns at 10.0 " $node_(6) setdest 112.0 914.0 $tz " 
$ns at 10.0 " $node_(9) setdest 1091.0 50.0 $tz " 
$ns at 10.0 " $node_(16) setdest 14.0 498.0 $tz " 
$ns at 10.0 " $node_(18) setdest 689.0 107.0 $tz " 
$ns at 10.0 " $node_(21) setdest 1107.0 1482.0 $tz " 
$ns at 10.0 " $node_(24) setdest 428.0 50.0 $tz " 
$ns at 10.0 " $node_(26) setdest 1321.0 1419.0 $tz " 
$ns at 10.0 " $node_(29) setdest 269.0 753.0 $tz " 
$ns at 10.0 " $node_(35) setdest 8.0 1005.0 $tz " 
$ns at 10.0 " $node_(36) setdest 10.0 637.0 $tz " 
$ns at 10.0 " $node_(37) setdest 685.0 1416.0 $tz " 
$ns at 10.0 " $node_(43) setdest 167.0 616.0 $tz " 
$ns at 10.0 " $node_(45) setdest 171.0 75.0 $tz " 
$ns at 10.0 " $node_(50) setdest 578.0 850.0 $tz " 
$ns at 10.0 " $node_(55) setdest 978.0 32.0 $tz " 
$ns at 10.0 " $node_(60) setdest 423.0 141.0 $tz " 
$ns at 10.0 " $node_(61) setdest 80.0 1246.0 $tz " 
$ns at 10.0 " $node_(66) setdest 321.0 94.0 $tz " 
$ns at 10.0 " $node_(67) setdest 332.0 1355.0 $tz " 
$ns at 10.0 " $node_(72) setdest 191.0 969.0 $tz " 
$ns at 10.0 " $node_(76) setdest 773.0 46.0 $tz " 
$ns at 10.0 " $node_(86) setdest 1298.0 89.0 $tz " 
$ns at 10.0 " $node_(88) setdest 230.0 233.0 $tz " 
$ns at 10.0 " $node_(99) setdest 48.0 285.0 $tz " 
$ns at 10.0 " $node_(103) setdest 144.0 660.0 $tz " 
$ns at 10.0 " $node_(107) setdest 175.0 1433.0 $tz " 
$ns at 10.0 " $node_(110) setdest 287.0 132.0 $tz " 
$ns at 10.0 " $node_(111) setdest 483.0 71.0 $tz " 
$ns at 10.0 " $node_(114) setdest 76.0 508.0 $tz " 
$ns at 10.0 " $node_(118) setdest 1205.0 1328.0 $tz " 
$ns at 10.0 " $node_(120) setdest 819.0 1367.0 $tz " 
$ns at 10.0 " $node_(122) setdest 828.0 50.0 $tz " 
$ns at 10.0 " $node_(123) setdest 1069.0 1437.0 $tz " 
$ns at 10.0 " $node_(126) setdest 112.0 41.0 $tz " 
$ns at 10.0 " $node_(129) setdest 19.0 864.0 $tz " 
$ns at 10.0 " $node_(130) setdest 748.0 66.0 $tz " 
$ns at 10.0 " $node_(131) setdest 185.0 350.0 $tz " 
$ns at 10.0 " $node_(140) setdest 1267.0 1162.0 $tz " 
$ns at 10.0 " $node_(143) setdest 892.0 171.0 $tz " 
$ns at 10.0 " $node_(159) setdest 107.0 582.0 $tz " 
$ns at 10.0 " $node_(162) setdest 358.0 50.0 $tz " 
$ns at 10.0 " $node_(182) setdest 92.0 178.0 $tz " 
$ns at 10.0 " $node_(188) setdest 1025.0 144.0 $tz " 
$ns at 10.0 " $node_(193) setdest 1333.0 87.0 $tz " 
$ns at 10.0 " $node_(197) setdest 782.0 557.0 $tz " 
$ns at 10.0 " $node_(198) setdest 773.0 166.0 $tz " 
$ns at 10.0 " $node_(199) setdest 528.0 858.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(114) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(99) $null0
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