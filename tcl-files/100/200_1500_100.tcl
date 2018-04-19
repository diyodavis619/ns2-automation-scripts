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
$node_(0) set X_ 812
$node_(0) set Y_ 110
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 635
$node_(1) set Y_ 120
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 648
$node_(2) set Y_ 1082
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 909
$node_(3) set Y_ 160
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 935
$node_(4) set Y_ 1384
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 116
$node_(5) set Y_ 813
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 141
$node_(6) set Y_ 236
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1059
$node_(7) set Y_ 290
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 1094
$node_(8) set Y_ 831
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 569
$node_(9) set Y_ 747
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 758
$node_(10) set Y_ 851
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 1300
$node_(11) set Y_ 995
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 304
$node_(12) set Y_ 1398
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 458
$node_(13) set Y_ 763
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1318
$node_(14) set Y_ 509
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 1175
$node_(15) set Y_ 519
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 798
$node_(16) set Y_ 874
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 380
$node_(17) set Y_ 1126
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 689
$node_(18) set Y_ 179
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 169
$node_(19) set Y_ 390
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1069
$node_(20) set Y_ 582
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 42
$node_(21) set Y_ 51
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 133
$node_(22) set Y_ 155
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 647
$node_(23) set Y_ 1444
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 1280
$node_(24) set Y_ 1122
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 1483
$node_(25) set Y_ 841
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 1420
$node_(26) set Y_ 721
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 1249
$node_(27) set Y_ 298
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 438
$node_(28) set Y_ 275
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 262
$node_(29) set Y_ 622
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 791
$node_(30) set Y_ 1061
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 644
$node_(31) set Y_ 766
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 488
$node_(32) set Y_ 155
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 397
$node_(33) set Y_ 1004
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 486
$node_(34) set Y_ 57
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 1364
$node_(35) set Y_ 890
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 105
$node_(36) set Y_ 679
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 658
$node_(37) set Y_ 614
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 1266
$node_(38) set Y_ 832
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 1397
$node_(39) set Y_ 241
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 85
$node_(40) set Y_ 71
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 546
$node_(41) set Y_ 1031
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 188
$node_(42) set Y_ 1022
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 644
$node_(43) set Y_ 1327
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 943
$node_(44) set Y_ 1283
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 88
$node_(45) set Y_ 1044
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 905
$node_(46) set Y_ 981
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 1238
$node_(47) set Y_ 897
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 94
$node_(48) set Y_ 616
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 1289
$node_(49) set Y_ 582
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 591
$node_(50) set Y_ 988
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 6
$node_(51) set Y_ 142
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 700
$node_(52) set Y_ 1147
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 167
$node_(53) set Y_ 1305
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 1443
$node_(54) set Y_ 1269
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 1269
$node_(55) set Y_ 694
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 938
$node_(56) set Y_ 251
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 719
$node_(57) set Y_ 1227
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 157
$node_(58) set Y_ 272
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 60
$node_(59) set Y_ 747
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 726
$node_(60) set Y_ 131
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 167
$node_(61) set Y_ 136
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 1085
$node_(62) set Y_ 1063
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 1237
$node_(63) set Y_ 391
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 1311
$node_(64) set Y_ 830
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 454
$node_(65) set Y_ 1410
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 444
$node_(66) set Y_ 404
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 908
$node_(67) set Y_ 763
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 388
$node_(68) set Y_ 472
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 1477
$node_(69) set Y_ 580
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 1403
$node_(70) set Y_ 1023
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 556
$node_(71) set Y_ 1210
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 303
$node_(72) set Y_ 759
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 283
$node_(73) set Y_ 966
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 758
$node_(74) set Y_ 502
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 1177
$node_(75) set Y_ 1152
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 185
$node_(76) set Y_ 888
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 1430
$node_(77) set Y_ 433
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 543
$node_(78) set Y_ 326
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 1299
$node_(79) set Y_ 394
$ns initial_node_pos $node_(79) 20

#???80?Node
set node_(80) [$ns node]
$node_(80) set X_ 1145
$node_(80) set Y_ 584
$ns initial_node_pos $node_(80) 20

#???81?Node
set node_(81) [$ns node]
$node_(81) set X_ 118
$node_(81) set Y_ 849
$ns initial_node_pos $node_(81) 20

#???82?Node
set node_(82) [$ns node]
$node_(82) set X_ 502
$node_(82) set Y_ 1344
$ns initial_node_pos $node_(82) 20

#???83?Node
set node_(83) [$ns node]
$node_(83) set X_ 894
$node_(83) set Y_ 54
$ns initial_node_pos $node_(83) 20

#???84?Node
set node_(84) [$ns node]
$node_(84) set X_ 833
$node_(84) set Y_ 752
$ns initial_node_pos $node_(84) 20

#???85?Node
set node_(85) [$ns node]
$node_(85) set X_ 265
$node_(85) set Y_ 1451
$ns initial_node_pos $node_(85) 20

#???86?Node
set node_(86) [$ns node]
$node_(86) set X_ 430
$node_(86) set Y_ 407
$ns initial_node_pos $node_(86) 20

#???87?Node
set node_(87) [$ns node]
$node_(87) set X_ 1301
$node_(87) set Y_ 907
$ns initial_node_pos $node_(87) 20

#???88?Node
set node_(88) [$ns node]
$node_(88) set X_ 444
$node_(88) set Y_ 1234
$ns initial_node_pos $node_(88) 20

#???89?Node
set node_(89) [$ns node]
$node_(89) set X_ 1483
$node_(89) set Y_ 679
$ns initial_node_pos $node_(89) 20

#???90?Node
set node_(90) [$ns node]
$node_(90) set X_ 191
$node_(90) set Y_ 735
$ns initial_node_pos $node_(90) 20

#???91?Node
set node_(91) [$ns node]
$node_(91) set X_ 922
$node_(91) set Y_ 1088
$ns initial_node_pos $node_(91) 20

#???92?Node
set node_(92) [$ns node]
$node_(92) set X_ 331
$node_(92) set Y_ 435
$ns initial_node_pos $node_(92) 20

#???93?Node
set node_(93) [$ns node]
$node_(93) set X_ 419
$node_(93) set Y_ 1356
$ns initial_node_pos $node_(93) 20

#???94?Node
set node_(94) [$ns node]
$node_(94) set X_ 368
$node_(94) set Y_ 30
$ns initial_node_pos $node_(94) 20

#???95?Node
set node_(95) [$ns node]
$node_(95) set X_ 744
$node_(95) set Y_ 341
$ns initial_node_pos $node_(95) 20

#???96?Node
set node_(96) [$ns node]
$node_(96) set X_ 160
$node_(96) set Y_ 1144
$ns initial_node_pos $node_(96) 20

#???97?Node
set node_(97) [$ns node]
$node_(97) set X_ 241
$node_(97) set Y_ 697
$ns initial_node_pos $node_(97) 20

#???98?Node
set node_(98) [$ns node]
$node_(98) set X_ 44
$node_(98) set Y_ 819
$ns initial_node_pos $node_(98) 20

#???99?Node
set node_(99) [$ns node]
$node_(99) set X_ 627
$node_(99) set Y_ 276
$ns initial_node_pos $node_(99) 20

#???100?Node
set node_(100) [$ns node]
$node_(100) set X_ 702
$node_(100) set Y_ 563
$ns initial_node_pos $node_(100) 20

#???101?Node
set node_(101) [$ns node]
$node_(101) set X_ 333
$node_(101) set Y_ 1330
$ns initial_node_pos $node_(101) 20

#???102?Node
set node_(102) [$ns node]
$node_(102) set X_ 274
$node_(102) set Y_ 410
$ns initial_node_pos $node_(102) 20

#???103?Node
set node_(103) [$ns node]
$node_(103) set X_ 807
$node_(103) set Y_ 444
$ns initial_node_pos $node_(103) 20

#???104?Node
set node_(104) [$ns node]
$node_(104) set X_ 661
$node_(104) set Y_ 395
$ns initial_node_pos $node_(104) 20

#???105?Node
set node_(105) [$ns node]
$node_(105) set X_ 1108
$node_(105) set Y_ 463
$ns initial_node_pos $node_(105) 20

#???106?Node
set node_(106) [$ns node]
$node_(106) set X_ 780
$node_(106) set Y_ 1316
$ns initial_node_pos $node_(106) 20

#???107?Node
set node_(107) [$ns node]
$node_(107) set X_ 326
$node_(107) set Y_ 370
$ns initial_node_pos $node_(107) 20

#???108?Node
set node_(108) [$ns node]
$node_(108) set X_ 532
$node_(108) set Y_ 19
$ns initial_node_pos $node_(108) 20

#???109?Node
set node_(109) [$ns node]
$node_(109) set X_ 342
$node_(109) set Y_ 899
$ns initial_node_pos $node_(109) 20

#???110?Node
set node_(110) [$ns node]
$node_(110) set X_ 751
$node_(110) set Y_ 279
$ns initial_node_pos $node_(110) 20

#???111?Node
set node_(111) [$ns node]
$node_(111) set X_ 243
$node_(111) set Y_ 1028
$ns initial_node_pos $node_(111) 20

#???112?Node
set node_(112) [$ns node]
$node_(112) set X_ 326
$node_(112) set Y_ 525
$ns initial_node_pos $node_(112) 20

#???113?Node
set node_(113) [$ns node]
$node_(113) set X_ 911
$node_(113) set Y_ 708
$ns initial_node_pos $node_(113) 20

#???114?Node
set node_(114) [$ns node]
$node_(114) set X_ 940
$node_(114) set Y_ 471
$ns initial_node_pos $node_(114) 20

#???115?Node
set node_(115) [$ns node]
$node_(115) set X_ 612
$node_(115) set Y_ 866
$ns initial_node_pos $node_(115) 20

#???116?Node
set node_(116) [$ns node]
$node_(116) set X_ 764
$node_(116) set Y_ 674
$ns initial_node_pos $node_(116) 20

#???117?Node
set node_(117) [$ns node]
$node_(117) set X_ 36
$node_(117) set Y_ 1161
$ns initial_node_pos $node_(117) 20

#???118?Node
set node_(118) [$ns node]
$node_(118) set X_ 382
$node_(118) set Y_ 702
$ns initial_node_pos $node_(118) 20

#???119?Node
set node_(119) [$ns node]
$node_(119) set X_ 1238
$node_(119) set Y_ 180
$ns initial_node_pos $node_(119) 20

#???120?Node
set node_(120) [$ns node]
$node_(120) set X_ 1094
$node_(120) set Y_ 1383
$ns initial_node_pos $node_(120) 20

#???121?Node
set node_(121) [$ns node]
$node_(121) set X_ 474
$node_(121) set Y_ 1077
$ns initial_node_pos $node_(121) 20

#???122?Node
set node_(122) [$ns node]
$node_(122) set X_ 121
$node_(122) set Y_ 937
$ns initial_node_pos $node_(122) 20

#???123?Node
set node_(123) [$ns node]
$node_(123) set X_ 108
$node_(123) set Y_ 430
$ns initial_node_pos $node_(123) 20

#???124?Node
set node_(124) [$ns node]
$node_(124) set X_ 505
$node_(124) set Y_ 236
$ns initial_node_pos $node_(124) 20

#???125?Node
set node_(125) [$ns node]
$node_(125) set X_ 612
$node_(125) set Y_ 490
$ns initial_node_pos $node_(125) 20

#???126?Node
set node_(126) [$ns node]
$node_(126) set X_ 1029
$node_(126) set Y_ 236
$ns initial_node_pos $node_(126) 20

#???127?Node
set node_(127) [$ns node]
$node_(127) set X_ 105
$node_(127) set Y_ 1450
$ns initial_node_pos $node_(127) 20

#???128?Node
set node_(128) [$ns node]
$node_(128) set X_ 147
$node_(128) set Y_ 325
$ns initial_node_pos $node_(128) 20

#???129?Node
set node_(129) [$ns node]
$node_(129) set X_ 899
$node_(129) set Y_ 371
$ns initial_node_pos $node_(129) 20

#???130?Node
set node_(130) [$ns node]
$node_(130) set X_ 1167
$node_(130) set Y_ 794
$ns initial_node_pos $node_(130) 20

#???131?Node
set node_(131) [$ns node]
$node_(131) set X_ 596
$node_(131) set Y_ 190
$ns initial_node_pos $node_(131) 20

#???132?Node
set node_(132) [$ns node]
$node_(132) set X_ 286
$node_(132) set Y_ 1161
$ns initial_node_pos $node_(132) 20

#???133?Node
set node_(133) [$ns node]
$node_(133) set X_ 30
$node_(133) set Y_ 908
$ns initial_node_pos $node_(133) 20

#???134?Node
set node_(134) [$ns node]
$node_(134) set X_ 694
$node_(134) set Y_ 447
$ns initial_node_pos $node_(134) 20

#???135?Node
set node_(135) [$ns node]
$node_(135) set X_ 591
$node_(135) set Y_ 688
$ns initial_node_pos $node_(135) 20

#???136?Node
set node_(136) [$ns node]
$node_(136) set X_ 69
$node_(136) set Y_ 530
$ns initial_node_pos $node_(136) 20

#???137?Node
set node_(137) [$ns node]
$node_(137) set X_ 716
$node_(137) set Y_ 996
$ns initial_node_pos $node_(137) 20

#???138?Node
set node_(138) [$ns node]
$node_(138) set X_ 1392
$node_(138) set Y_ 652
$ns initial_node_pos $node_(138) 20

#???139?Node
set node_(139) [$ns node]
$node_(139) set X_ 1142
$node_(139) set Y_ 732
$ns initial_node_pos $node_(139) 20

#???140?Node
set node_(140) [$ns node]
$node_(140) set X_ 51
$node_(140) set Y_ 1249
$ns initial_node_pos $node_(140) 20

#???141?Node
set node_(141) [$ns node]
$node_(141) set X_ 1125
$node_(141) set Y_ 1094
$ns initial_node_pos $node_(141) 20

#???142?Node
set node_(142) [$ns node]
$node_(142) set X_ 700
$node_(142) set Y_ 763
$ns initial_node_pos $node_(142) 20

#???143?Node
set node_(143) [$ns node]
$node_(143) set X_ 1061
$node_(143) set Y_ 1191
$ns initial_node_pos $node_(143) 20

#???144?Node
set node_(144) [$ns node]
$node_(144) set X_ 38
$node_(144) set Y_ 1330
$ns initial_node_pos $node_(144) 20

#???145?Node
set node_(145) [$ns node]
$node_(145) set X_ 399
$node_(145) set Y_ 130
$ns initial_node_pos $node_(145) 20

#???146?Node
set node_(146) [$ns node]
$node_(146) set X_ 397
$node_(146) set Y_ 619
$ns initial_node_pos $node_(146) 20

#???147?Node
set node_(147) [$ns node]
$node_(147) set X_ 44
$node_(147) set Y_ 675
$ns initial_node_pos $node_(147) 20

#???148?Node
set node_(148) [$ns node]
$node_(148) set X_ 55
$node_(148) set Y_ 251
$ns initial_node_pos $node_(148) 20

#???149?Node
set node_(149) [$ns node]
$node_(149) set X_ 516
$node_(149) set Y_ 1136
$ns initial_node_pos $node_(149) 20

#???150?Node
set node_(150) [$ns node]
$node_(150) set X_ 311
$node_(150) set Y_ 1083
$ns initial_node_pos $node_(150) 20

#???151?Node
set node_(151) [$ns node]
$node_(151) set X_ 1039
$node_(151) set Y_ 1273
$ns initial_node_pos $node_(151) 20

#???152?Node
set node_(152) [$ns node]
$node_(152) set X_ 352
$node_(152) set Y_ 229
$ns initial_node_pos $node_(152) 20

#???153?Node
set node_(153) [$ns node]
$node_(153) set X_ 187
$node_(153) set Y_ 631
$ns initial_node_pos $node_(153) 20

#???154?Node
set node_(154) [$ns node]
$node_(154) set X_ 280
$node_(154) set Y_ 116
$ns initial_node_pos $node_(154) 20

#???155?Node
set node_(155) [$ns node]
$node_(155) set X_ 166
$node_(155) set Y_ 38
$ns initial_node_pos $node_(155) 20

#???156?Node
set node_(156) [$ns node]
$node_(156) set X_ 719
$node_(156) set Y_ 24
$ns initial_node_pos $node_(156) 20

#???157?Node
set node_(157) [$ns node]
$node_(157) set X_ 888
$node_(157) set Y_ 655
$ns initial_node_pos $node_(157) 20

#???158?Node
set node_(158) [$ns node]
$node_(158) set X_ 972
$node_(158) set Y_ 342
$ns initial_node_pos $node_(158) 20

#???159?Node
set node_(159) [$ns node]
$node_(159) set X_ 581
$node_(159) set Y_ 786
$ns initial_node_pos $node_(159) 20

#???160?Node
set node_(160) [$ns node]
$node_(160) set X_ 969
$node_(160) set Y_ 894
$ns initial_node_pos $node_(160) 20

#???161?Node
set node_(161) [$ns node]
$node_(161) set X_ 341
$node_(161) set Y_ 1233
$ns initial_node_pos $node_(161) 20

#???162?Node
set node_(162) [$ns node]
$node_(162) set X_ 1108
$node_(162) set Y_ 195
$ns initial_node_pos $node_(162) 20

#???163?Node
set node_(163) [$ns node]
$node_(163) set X_ 534
$node_(163) set Y_ 558
$ns initial_node_pos $node_(163) 20

#???164?Node
set node_(164) [$ns node]
$node_(164) set X_ 563
$node_(164) set Y_ 1388
$ns initial_node_pos $node_(164) 20

#???165?Node
set node_(165) [$ns node]
$node_(165) set X_ 114
$node_(165) set Y_ 1188
$ns initial_node_pos $node_(165) 20

#???166?Node
set node_(166) [$ns node]
$node_(166) set X_ 1086
$node_(166) set Y_ 961
$ns initial_node_pos $node_(166) 20

#???167?Node
set node_(167) [$ns node]
$node_(167) set X_ 297
$node_(167) set Y_ 836
$ns initial_node_pos $node_(167) 20

#???168?Node
set node_(168) [$ns node]
$node_(168) set X_ 1386
$node_(168) set Y_ 341
$ns initial_node_pos $node_(168) 20

#???169?Node
set node_(169) [$ns node]
$node_(169) set X_ 230
$node_(169) set Y_ 1207
$ns initial_node_pos $node_(169) 20

#???170?Node
set node_(170) [$ns node]
$node_(170) set X_ 541
$node_(170) set Y_ 822
$ns initial_node_pos $node_(170) 20

#???171?Node
set node_(171) [$ns node]
$node_(171) set X_ 1108
$node_(171) set Y_ 331
$ns initial_node_pos $node_(171) 20

#???172?Node
set node_(172) [$ns node]
$node_(172) set X_ 1384
$node_(172) set Y_ 129
$ns initial_node_pos $node_(172) 20

#???173?Node
set node_(173) [$ns node]
$node_(173) set X_ 660
$node_(173) set Y_ 777
$ns initial_node_pos $node_(173) 20

#???174?Node
set node_(174) [$ns node]
$node_(174) set X_ 1408
$node_(174) set Y_ 517
$ns initial_node_pos $node_(174) 20

#???175?Node
set node_(175) [$ns node]
$node_(175) set X_ 830
$node_(175) set Y_ 308
$ns initial_node_pos $node_(175) 20

#???176?Node
set node_(176) [$ns node]
$node_(176) set X_ 866
$node_(176) set Y_ 1330
$ns initial_node_pos $node_(176) 20

#???177?Node
set node_(177) [$ns node]
$node_(177) set X_ 522
$node_(177) set Y_ 458
$ns initial_node_pos $node_(177) 20

#???178?Node
set node_(178) [$ns node]
$node_(178) set X_ 894
$node_(178) set Y_ 894
$ns initial_node_pos $node_(178) 20

#???179?Node
set node_(179) [$ns node]
$node_(179) set X_ 1081
$node_(179) set Y_ 696
$ns initial_node_pos $node_(179) 20

#???180?Node
set node_(180) [$ns node]
$node_(180) set X_ 64
$node_(180) set Y_ 958
$ns initial_node_pos $node_(180) 20

#???181?Node
set node_(181) [$ns node]
$node_(181) set X_ 361
$node_(181) set Y_ 341
$ns initial_node_pos $node_(181) 20

#???182?Node
set node_(182) [$ns node]
$node_(182) set X_ 194
$node_(182) set Y_ 497
$ns initial_node_pos $node_(182) 20

#???183?Node
set node_(183) [$ns node]
$node_(183) set X_ 23
$node_(183) set Y_ 261
$ns initial_node_pos $node_(183) 20

#???184?Node
set node_(184) [$ns node]
$node_(184) set X_ 949
$node_(184) set Y_ 1201
$ns initial_node_pos $node_(184) 20

#???185?Node
set node_(185) [$ns node]
$node_(185) set X_ 870
$node_(185) set Y_ 577
$ns initial_node_pos $node_(185) 20

#???186?Node
set node_(186) [$ns node]
$node_(186) set X_ 1394
$node_(186) set Y_ 750
$ns initial_node_pos $node_(186) 20

#???187?Node
set node_(187) [$ns node]
$node_(187) set X_ 41
$node_(187) set Y_ 1033
$ns initial_node_pos $node_(187) 20

#???188?Node
set node_(188) [$ns node]
$node_(188) set X_ 1241
$node_(188) set Y_ 734
$ns initial_node_pos $node_(188) 20

#???189?Node
set node_(189) [$ns node]
$node_(189) set X_ 420
$node_(189) set Y_ 949
$ns initial_node_pos $node_(189) 20

#???190?Node
set node_(190) [$ns node]
$node_(190) set X_ 663
$node_(190) set Y_ 919
$ns initial_node_pos $node_(190) 20

#???191?Node
set node_(191) [$ns node]
$node_(191) set X_ 588
$node_(191) set Y_ 131
$ns initial_node_pos $node_(191) 20

#???192?Node
set node_(192) [$ns node]
$node_(192) set X_ 259
$node_(192) set Y_ 194
$ns initial_node_pos $node_(192) 20

#???193?Node
set node_(193) [$ns node]
$node_(193) set X_ 97
$node_(193) set Y_ 1358
$ns initial_node_pos $node_(193) 20

#???194?Node
set node_(194) [$ns node]
$node_(194) set X_ 398
$node_(194) set Y_ 791
$ns initial_node_pos $node_(194) 20

#???195?Node
set node_(195) [$ns node]
$node_(195) set X_ 1271
$node_(195) set Y_ 1432
$ns initial_node_pos $node_(195) 20

#???196?Node
set node_(196) [$ns node]
$node_(196) set X_ 237
$node_(196) set Y_ 1341
$ns initial_node_pos $node_(196) 20

#???197?Node
set node_(197) [$ns node]
$node_(197) set X_ 176
$node_(197) set Y_ 1474
$ns initial_node_pos $node_(197) 20

#???198?Node
set node_(198) [$ns node]
$node_(198) set X_ 842
$node_(198) set Y_ 1169
$ns initial_node_pos $node_(198) 20

#???199?Node
set node_(199) [$ns node]
$node_(199) set X_ 1440
$node_(199) set Y_ 700
$ns initial_node_pos $node_(199) 20

#???200?Node
set node_(200) [$ns node]
$node_(200) set X_ 547
$node_(200) set Y_ 619
$ns initial_node_pos $node_(200) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 1386.0 52.0 $tz " 
$ns at 10.0 " $node_(1) setdest 999.0 127.0 $tz " 
$ns at 10.0 " $node_(2) setdest 1027.0 941.0 $tz " 
$ns at 10.0 " $node_(3) setdest 849.0 49.0 $tz " 
$ns at 10.0 " $node_(4) setdest 1158.0 886.0 $tz " 
$ns at 10.0 " $node_(5) setdest 366.0 383.0 $tz " 
$ns at 10.0 " $node_(6) setdest 38.0 97.0 $tz " 
$ns at 10.0 " $node_(7) setdest 1052.0 72.0 $tz " 
$ns at 10.0 " $node_(8) setdest 963.0 422.0 $tz " 
$ns at 10.0 " $node_(9) setdest 369.0 424.0 $tz " 
$ns at 10.0 " $node_(10) setdest 477.0 611.0 $tz " 
$ns at 10.0 " $node_(11) setdest 913.0 538.0 $tz " 
$ns at 10.0 " $node_(12) setdest 211.0 969.0 $tz " 
$ns at 10.0 " $node_(13) setdest 441.0 502.0 $tz " 
$ns at 10.0 " $node_(14) setdest 994.0 186.0 $tz " 
$ns at 10.0 " $node_(15) setdest 961.0 227.0 $tz " 
$ns at 10.0 " $node_(16) setdest 461.0 338.0 $tz " 
$ns at 10.0 " $node_(17) setdest 502.0 1258.0 $tz " 
$ns at 10.0 " $node_(18) setdest 872.0 36.0 $tz " 
$ns at 10.0 " $node_(19) setdest 516.0 91.0 $tz " 
$ns at 10.0 " $node_(20) setdest 774.0 358.0 $tz " 
$ns at 10.0 " $node_(21) setdest 366.0 16.0 $tz " 
$ns at 10.0 " $node_(22) setdest 283.0 49.0 $tz " 
$ns at 10.0 " $node_(23) setdest 644.0 852.0 $tz " 
$ns at 10.0 " $node_(24) setdest 572.0 408.0 $tz " 
$ns at 10.0 " $node_(25) setdest 1177.0 602.0 $tz " 
$ns at 10.0 " $node_(26) setdest 1136.0 47.0 $tz " 
$ns at 10.0 " $node_(27) setdest 1019.0 80.0 $tz " 
$ns at 10.0 " $node_(28) setdest 22.0 322.0 $tz " 
$ns at 10.0 " $node_(29) setdest 24.0 369.0 $tz " 
$ns at 10.0 " $node_(30) setdest 1222.0 1097.0 $tz " 
$ns at 10.0 " $node_(31) setdest 916.0 127.0 $tz " 
$ns at 10.0 " $node_(32) setdest 405.0 49.0 $tz " 
$ns at 10.0 " $node_(33) setdest 738.0 1136.0 $tz " 
$ns at 10.0 " $node_(34) setdest 583.0 24.0 $tz " 
$ns at 10.0 " $node_(35) setdest 1341.0 261.0 $tz " 
$ns at 10.0 " $node_(36) setdest 1366.0 1475.0 $tz " 
$ns at 10.0 " $node_(37) setdest 355.0 116.0 $tz " 
$ns at 10.0 " $node_(38) setdest 1222.0 1422.0 $tz " 
$ns at 10.0 " $node_(39) setdest 1177.0 138.0 $tz " 
$ns at 10.0 " $node_(40) setdest 550.0 99.0 $tz " 
$ns at 10.0 " $node_(41) setdest 805.0 927.0 $tz " 
$ns at 10.0 " $node_(42) setdest 997.0 1116.0 $tz " 
$ns at 10.0 " $node_(43) setdest 999.0 1252.0 $tz " 
$ns at 10.0 " $node_(44) setdest 1105.0 904.0 $tz " 
$ns at 10.0 " $node_(45) setdest 966.0 1177.0 $tz " 
$ns at 10.0 " $node_(46) setdest 1025.0 747.0 $tz " 
$ns at 10.0 " $node_(47) setdest 1069.0 44.0 $tz " 
$ns at 10.0 " $node_(48) setdest 258.0 261.0 $tz " 
$ns at 10.0 " $node_(49) setdest 788.0 745.0 $tz " 
$ns at 10.0 " $node_(50) setdest 380.0 533.0 $tz " 
$ns at 10.0 " $node_(51) setdest 766.0 33.0 $tz " 
$ns at 10.0 " $node_(52) setdest 927.0 1019.0 $tz " 
$ns at 10.0 " $node_(53) setdest 1188.0 1308.0 $tz " 
$ns at 10.0 " $node_(54) setdest 1202.0 1005.0 $tz " 
$ns at 10.0 " $node_(55) setdest 833.0 497.0 $tz " 
$ns at 10.0 " $node_(56) setdest 961.0 19.0 $tz " 
$ns at 10.0 " $node_(57) setdest 830.0 872.0 $tz " 
$ns at 10.0 " $node_(58) setdest 747.0 16.0 $tz " 
$ns at 10.0 " $node_(59) setdest 961.0 1052.0 $tz " 
$ns at 10.0 " $node_(60) setdest 1058.0 49.0 $tz " 
$ns at 10.0 " $node_(61) setdest 883.0 66.0 $tz " 
$ns at 10.0 " $node_(62) setdest 861.0 772.0 $tz " 
$ns at 10.0 " $node_(63) setdest 1163.0 269.0 $tz " 
$ns at 10.0 " $node_(64) setdest 994.0 455.0 $tz " 
$ns at 10.0 " $node_(65) setdest 302.0 899.0 $tz " 
$ns at 10.0 " $node_(66) setdest 819.0 30.0 $tz " 
$ns at 10.0 " $node_(67) setdest 508.0 144.0 $tz " 
$ns at 10.0 " $node_(68) setdest 427.0 352.0 $tz " 
$ns at 10.0 " $node_(69) setdest 747.0 216.0 $tz " 
$ns at 10.0 " $node_(70) setdest 1102.0 41.0 $tz " 
$ns at 10.0 " $node_(71) setdest 580.0 1136.0 $tz " 
$ns at 10.0 " $node_(72) setdest 219.0 188.0 $tz " 
$ns at 10.0 " $node_(73) setdest 902.0 1127.0 $tz " 
$ns at 10.0 " $node_(74) setdest 861.0 302.0 $tz " 
$ns at 10.0 " $node_(75) setdest 1333.0 1258.0 $tz " 
$ns at 10.0 " $node_(76) setdest 663.0 566.0 $tz " 
$ns at 10.0 " $node_(77) setdest 1038.0 213.0 $tz " 
$ns at 10.0 " $node_(78) setdest 219.0 69.0 $tz " 
$ns at 10.0 " $node_(79) setdest 1030.0 402.0 $tz " 
$ns at 10.0 " $node_(80) setdest 761.0 405.0 $tz " 
$ns at 10.0 " $node_(81) setdest 1319.0 1158.0 $tz " 
$ns at 10.0 " $node_(82) setdest 472.0 897.0 $tz " 
$ns at 10.0 " $node_(83) setdest 1275.0 161.0 $tz " 
$ns at 10.0 " $node_(84) setdest 630.0 380.0 $tz " 
$ns at 10.0 " $node_(85) setdest 38.0 791.0 $tz " 
$ns at 10.0 " $node_(86) setdest 305.0 236.0 $tz " 
$ns at 10.0 " $node_(87) setdest 1488.0 1352.0 $tz " 
$ns at 10.0 " $node_(88) setdest 538.0 1133.0 $tz " 
$ns at 10.0 " $node_(89) setdest 872.0 305.0 $tz " 
$ns at 10.0 " $node_(90) setdest 33.0 461.0 $tz " 
$ns at 10.0 " $node_(91) setdest 863.0 872.0 $tz " 
$ns at 10.0 " $node_(92) setdest 580.0 66.0 $tz " 
$ns at 10.0 " $node_(93) setdest 508.0 911.0 $tz " 
$ns at 10.0 " $node_(94) setdest 486.0 36.0 $tz " 
$ns at 10.0 " $node_(95) setdest 630.0 16.0 $tz " 
$ns at 10.0 " $node_(96) setdest 761.0 1291.0 $tz " 
$ns at 10.0 " $node_(97) setdest 325.0 386.0 $tz " 
$ns at 10.0 " $node_(98) setdest 241.0 502.0 $tz " 
$ns at 10.0 " $node_(99) setdest 675.0 77.0 $tz " 
$ns at 10.0 " $node_(100) setdest 424.0 133.0 $tz " 
$ns at 10.0 " $node_(101) setdest 644.0 1238.0 $tz " 
$ns at 10.0 " $node_(102) setdest 166.0 194.0 $tz " 
$ns at 10.0 " $node_(103) setdest 844.0 163.0 $tz " 
$ns at 10.0 " $node_(104) setdest 322.0 69.0 $tz " 
$ns at 10.0 " $node_(105) setdest 966.0 275.0 $tz " 
$ns at 10.0 " $node_(106) setdest 874.0 1230.0 $tz " 
$ns at 10.0 " $node_(107) setdest 47.0 49.0 $tz " 
$ns at 10.0 " $node_(108) setdest 225.0 773.0 $tz " 
$ns at 10.0 " $node_(109) setdest 652.0 316.0 $tz " 
$ns at 10.0 " $node_(110) setdest 605.0 94.0 $tz " 
$ns at 10.0 " $node_(111) setdest 833.0 1138.0 $tz " 
$ns at 10.0 " $node_(112) setdest 150.0 272.0 $tz " 
$ns at 10.0 " $node_(113) setdest 1025.0 133.0 $tz " 
$ns at 10.0 " $node_(114) setdest 908.0 199.0 $tz " 
$ns at 10.0 " $node_(115) setdest 672.0 313.0 $tz " 
$ns at 10.0 " $node_(116) setdest 938.0 886.0 $tz " 
$ns at 10.0 " $node_(117) setdest 358.0 1136.0 $tz " 
$ns at 10.0 " $node_(118) setdest 1197.0 27.0 $tz " 
$ns at 10.0 " $node_(119) setdest 1113.0 66.0 $tz " 
$ns at 10.0 " $node_(120) setdest 833.0 966.0 $tz " 
$ns at 10.0 " $node_(121) setdest 824.0 1194.0 $tz " 
$ns at 10.0 " $node_(122) setdest 469.0 522.0 $tz " 
$ns at 10.0 " $node_(123) setdest 44.0 186.0 $tz " 
$ns at 10.0 " $node_(124) setdest 922.0 99.0 $tz " 
$ns at 10.0 " $node_(125) setdest 294.0 199.0 $tz " 
$ns at 10.0 " $node_(126) setdest 1355.0 608.0 $tz " 
$ns at 10.0 " $node_(127) setdest 255.0 908.0 $tz " 
$ns at 10.0 " $node_(128) setdest 11.0 52.0 $tz " 
$ns at 10.0 " $node_(129) setdest 591.0 238.0 $tz " 
$ns at 10.0 " $node_(130) setdest 1294.0 325.0 $tz " 
$ns at 10.0 " $node_(131) setdest 408.0 75.0 $tz " 
$ns at 10.0 " $node_(132) setdest 869.0 1258.0 $tz " 
$ns at 10.0 " $node_(133) setdest 1011.0 436.0 $tz " 
$ns at 10.0 " $node_(134) setdest 719.0 205.0 $tz " 
$ns at 10.0 " $node_(135) setdest 461.0 424.0 $tz " 
$ns at 10.0 " $node_(136) setdest 105.0 266.0 $tz " 
$ns at 10.0 " $node_(137) setdest 763.0 263.0 $tz " 
$ns at 10.0 " $node_(138) setdest 569.0 388.0 $tz " 
$ns at 10.0 " $node_(139) setdest 611.0 455.0 $tz " 
$ns at 10.0 " $node_(140) setdest 1269.0 1350.0 $tz " 
$ns at 10.0 " $node_(141) setdest 1355.0 1133.0 $tz " 
$ns at 10.0 " $node_(142) setdest 874.0 147.0 $tz " 
$ns at 10.0 " $node_(143) setdest 1130.0 1008.0 $tz " 
$ns at 10.0 " $node_(144) setdest 441.0 858.0 $tz " 
$ns at 10.0 " $node_(145) setdest 347.0 61.0 $tz " 
$ns at 10.0 " $node_(146) setdest 188.0 266.0 $tz " 
$ns at 10.0 " $node_(147) setdest 166.0 388.0 $tz " 
$ns at 10.0 " $node_(148) setdest 252.0 116.0 $tz " 
$ns at 10.0 " $node_(149) setdest 608.0 1277.0 $tz " 
$ns at 10.0 " $node_(150) setdest 669.0 1205.0 $tz " 
$ns at 10.0 " $node_(151) setdest 1169.0 1127.0 $tz " 
$ns at 10.0 " $node_(152) setdest 533.0 66.0 $tz " 
$ns at 10.0 " $node_(153) setdest 63.0 358.0 $tz " 
$ns at 10.0 " $node_(154) setdest 322.0 36.0 $tz " 
$ns at 10.0 " $node_(155) setdest 411.0 102.0 $tz " 
$ns at 10.0 " $node_(156) setdest 1283.0 22.0 $tz " 
$ns at 10.0 " $node_(157) setdest 616.0 283.0 $tz " 
$ns at 10.0 " $node_(158) setdest 708.0 80.0 $tz " 
$ns at 10.0 " $node_(159) setdest 1400.0 1144.0 $tz " 
$ns at 10.0 " $node_(160) setdest 1047.0 444.0 $tz " 
$ns at 10.0 " $node_(162) setdest 872.0 94.0 $tz " 
$ns at 10.0 " $node_(163) setdest 530.0 269.0 $tz " 
$ns at 10.0 " $node_(164) setdest 833.0 824.0 $tz " 
$ns at 10.0 " $node_(165) setdest 505.0 969.0 $tz " 
$ns at 10.0 " $node_(166) setdest 916.0 627.0 $tz " 
$ns at 10.0 " $node_(167) setdest 588.0 550.0 $tz " 
$ns at 10.0 " $node_(168) setdest 1258.0 224.0 $tz " 
$ns at 10.0 " $node_(169) setdest 361.0 1238.0 $tz " 
$ns at 10.0 " $node_(170) setdest 297.0 169.0 $tz " 
$ns at 10.0 " $node_(171) setdest 986.0 1013.0 $tz " 
$ns at 10.0 " $node_(172) setdest 1163.0 102.0 $tz " 
$ns at 10.0 " $node_(173) setdest 1286.0 138.0 $tz " 
$ns at 10.0 " $node_(174) setdest 558.0 255.0 $tz " 
$ns at 10.0 " $node_(175) setdest 630.0 199.0 $tz " 
$ns at 10.0 " $node_(176) setdest 525.0 886.0 $tz " 
$ns at 10.0 " $node_(177) setdest 372.0 313.0 $tz " 
$ns at 10.0 " $node_(178) setdest 1061.0 336.0 $tz " 
$ns at 10.0 " $node_(179) setdest 741.0 169.0 $tz " 
$ns at 10.0 " $node_(180) setdest 1177.0 949.0 $tz " 
$ns at 10.0 " $node_(181) setdest 436.0 213.0 $tz " 
$ns at 10.0 " $node_(182) setdest 333.0 319.0 $tz " 
$ns at 10.0 " $node_(183) setdest 186.0 24.0 $tz " 
$ns at 10.0 " $node_(184) setdest 1161.0 1222.0 $tz " 
$ns at 10.0 " $node_(185) setdest 852.0 422.0 $tz " 
$ns at 10.0 " $node_(186) setdest 547.0 483.0 $tz " 
$ns at 10.0 " $node_(187) setdest 858.0 1277.0 $tz " 
$ns at 10.0 " $node_(188) setdest 577.0 316.0 $tz " 
$ns at 10.0 " $node_(189) setdest 713.0 352.0 $tz " 
$ns at 10.0 " $node_(190) setdest 350.0 613.0 $tz " 
$ns at 10.0 " $node_(191) setdest 13.0 24.0 $tz " 
$ns at 10.0 " $node_(192) setdest 150.0 97.0 $tz " 
$ns at 10.0 " $node_(193) setdest 172.0 966.0 $tz " 
$ns at 10.0 " $node_(194) setdest 211.0 416.0 $tz " 
$ns at 10.0 " $node_(195) setdest 1305.0 1186.0 $tz " 
$ns at 10.0 " $node_(196) setdest 241.0 947.0 $tz " 
$ns at 10.0 " $node_(197) setdest 688.0 863.0 $tz " 
$ns at 10.0 " $node_(198) setdest 1425.0 1133.0 $tz " 
$ns at 10.0 " $node_(199) setdest 1286.0 83.0 $tz " 
$ns at 10.0 " $node_(200) setdest 153.0 801.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(197) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(59) $null0
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