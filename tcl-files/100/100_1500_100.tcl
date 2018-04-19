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
set val(nn)     100           ;# number of mobilenodes
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
$node_(0) set X_ 858
$node_(0) set Y_ 1107
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 513
$node_(1) set Y_ 61
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 708
$node_(2) set Y_ 336
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 294
$node_(3) set Y_ 1452
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 223
$node_(4) set Y_ 1107
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 813
$node_(5) set Y_ 1316
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 661
$node_(6) set Y_ 161
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 82
$node_(7) set Y_ 1466
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 599
$node_(8) set Y_ 1062
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1258
$node_(9) set Y_ 885
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 1166
$node_(10) set Y_ 1361
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 817
$node_(11) set Y_ 248
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 434
$node_(12) set Y_ 1213
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 316
$node_(13) set Y_ 141
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 128
$node_(14) set Y_ 1406
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 124
$node_(15) set Y_ 577
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 656
$node_(16) set Y_ 1314
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 29
$node_(17) set Y_ 965
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1100
$node_(18) set Y_ 1174
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 1166
$node_(19) set Y_ 469
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 1169
$node_(20) set Y_ 80
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 747
$node_(21) set Y_ 1105
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(23) [$ns node]
$node_(23) set X_ 480
$node_(23) set Y_ 366
$ns initial_node_pos $node_(23) 20

#???23?Node
set node_(24) [$ns node]
$node_(24) set X_ 429
$node_(24) set Y_ 1058
$ns initial_node_pos $node_(24) 20

#???24?Node
set node_(25) [$ns node]
$node_(25) set X_ 26
$node_(25) set Y_ 1147
$ns initial_node_pos $node_(25) 20

#???25?Node
set node_(26) [$ns node]
$node_(26) set X_ 687
$node_(26) set Y_ 582
$ns initial_node_pos $node_(26) 20

#???26?Node
set node_(27) [$ns node]
$node_(27) set X_ 261
$node_(27) set Y_ 1308
$ns initial_node_pos $node_(27) 20

#???27?Node
set node_(28) [$ns node]
$node_(28) set X_ 866
$node_(28) set Y_ 769
$ns initial_node_pos $node_(28) 20

#???28?Node
set node_(29) [$ns node]
$node_(29) set X_ 365
$node_(29) set Y_ 331
$ns initial_node_pos $node_(29) 20

#???29?Node
set node_(30) [$ns node]
$node_(30) set X_ 1067
$node_(30) set Y_ 382
$ns initial_node_pos $node_(30) 20

#???30?Node
set node_(31) [$ns node]
$node_(31) set X_ 238
$node_(31) set Y_ 455
$ns initial_node_pos $node_(31) 20

#???31?Node
set node_(32) [$ns node]
$node_(32) set X_ 1027
$node_(32) set Y_ 1325
$ns initial_node_pos $node_(32) 20

#???32?Node
set node_(33) [$ns node]
$node_(33) set X_ 1362
$node_(33) set Y_ 132
$ns initial_node_pos $node_(33) 20

#???33?Node
set node_(34) [$ns node]
$node_(34) set X_ 1247
$node_(34) set Y_ 227
$ns initial_node_pos $node_(34) 20

#???34?Node
set node_(35) [$ns node]
$node_(35) set X_ 1347
$node_(35) set Y_ 1211
$ns initial_node_pos $node_(35) 20

#???35?Node
set node_(36) [$ns node]
$node_(36) set X_ 427
$node_(36) set Y_ 1408
$ns initial_node_pos $node_(36) 20

#???36?Node
set node_(37) [$ns node]
$node_(37) set X_ 1030
$node_(37) set Y_ 650
$ns initial_node_pos $node_(37) 20

#???37?Node
set node_(38) [$ns node]
$node_(38) set X_ 874
$node_(38) set Y_ 933
$ns initial_node_pos $node_(38) 20

#???38?Node
set node_(39) [$ns node]
$node_(39) set X_ 1154
$node_(39) set Y_ 1131
$ns initial_node_pos $node_(39) 20

#???39?Node
set node_(40) [$ns node]
$node_(40) set X_ 691
$node_(40) set Y_ 1440
$ns initial_node_pos $node_(40) 20

#???40?Node
set node_(41) [$ns node]
$node_(41) set X_ 69
$node_(41) set Y_ 738
$ns initial_node_pos $node_(41) 20

#???41?Node
set node_(42) [$ns node]
$node_(42) set X_ 990
$node_(42) set Y_ 10
$ns initial_node_pos $node_(42) 20

#???42?Node
set node_(43) [$ns node]
$node_(43) set X_ 672
$node_(43) set Y_ 811
$ns initial_node_pos $node_(43) 20

#???43?Node
set node_(44) [$ns node]
$node_(44) set X_ 1216
$node_(44) set Y_ 1265
$ns initial_node_pos $node_(44) 20

#???44?Node
set node_(45) [$ns node]
$node_(45) set X_ 796
$node_(45) set Y_ 575
$ns initial_node_pos $node_(45) 20

#???45?Node
set node_(46) [$ns node]
$node_(46) set X_ 778
$node_(46) set Y_ 912
$ns initial_node_pos $node_(46) 20

#???46?Node
set node_(47) [$ns node]
$node_(47) set X_ 924
$node_(47) set Y_ 1383
$ns initial_node_pos $node_(47) 20

#???47?Node
set node_(48) [$ns node]
$node_(48) set X_ 930
$node_(48) set Y_ 574
$ns initial_node_pos $node_(48) 20

#???48?Node
set node_(49) [$ns node]
$node_(49) set X_ 26
$node_(49) set Y_ 338
$ns initial_node_pos $node_(49) 20

#???49?Node
set node_(50) [$ns node]
$node_(50) set X_ 1217
$node_(50) set Y_ 1472
$ns initial_node_pos $node_(50) 20

#???50?Node
set node_(51) [$ns node]
$node_(51) set X_ 216
$node_(51) set Y_ 836
$ns initial_node_pos $node_(51) 20

#???51?Node
set node_(52) [$ns node]
$node_(52) set X_ 937
$node_(52) set Y_ 466
$ns initial_node_pos $node_(52) 20

#???52?Node
set node_(53) [$ns node]
$node_(53) set X_ 1219
$node_(53) set Y_ 761
$ns initial_node_pos $node_(53) 20

#???53?Node
set node_(54) [$ns node]
$node_(54) set X_ 218
$node_(54) set Y_ 699
$ns initial_node_pos $node_(54) 20

#???54?Node
set node_(55) [$ns node]
$node_(55) set X_ 713
$node_(55) set Y_ 1213
$ns initial_node_pos $node_(55) 20

#???55?Node
set node_(56) [$ns node]
$node_(56) set X_ 651
$node_(56) set Y_ 497
$ns initial_node_pos $node_(56) 20

#???56?Node
set node_(57) [$ns node]
$node_(57) set X_ 1378
$node_(57) set Y_ 1132
$ns initial_node_pos $node_(57) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 436
$node_(58) set Y_ 723
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 102
$node_(59) set Y_ 199
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 1286
$node_(60) set Y_ 1100
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 1490
$node_(61) set Y_ 395
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 1052
$node_(62) set Y_ 766
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 579
$node_(63) set Y_ 1216
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 988
$node_(64) set Y_ 1444
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 169
$node_(65) set Y_ 325
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 284
$node_(66) set Y_ 579
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 63
$node_(67) set Y_ 1261
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 1321
$node_(68) set Y_ 487
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 1013
$node_(69) set Y_ 1050
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(70) [$ns node]
$node_(70) set X_ 1133
$node_(70) set Y_ 227
$ns initial_node_pos $node_(70) 20

#???70?Node
set node_(71) [$ns node]
$node_(71) set X_ 1325
$node_(71) set Y_ 691
$ns initial_node_pos $node_(71) 20

#???71?Node
set node_(72) [$ns node]
$node_(72) set X_ 72
$node_(72) set Y_ 412
$ns initial_node_pos $node_(72) 20

#???72?Node
set node_(73) [$ns node]
$node_(73) set X_ 461
$node_(73) set Y_ 136
$ns initial_node_pos $node_(73) 20

#???73?Node
set node_(74) [$ns node]
$node_(74) set X_ 113
$node_(74) set Y_ 1037
$ns initial_node_pos $node_(74) 20

#???74?Node
set node_(75) [$ns node]
$node_(75) set X_ 1422
$node_(75) set Y_ 707
$ns initial_node_pos $node_(75) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 1338
$node_(76) set Y_ 1011
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 1458
$node_(77) set Y_ 891
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 1352
$node_(78) set Y_ 368
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(79) [$ns node]
$node_(79) set X_ 166
$node_(79) set Y_ 1241
$ns initial_node_pos $node_(79) 20

#???79?Node
set node_(80) [$ns node]
$node_(80) set X_ 964
$node_(80) set Y_ 869
$ns initial_node_pos $node_(80) 20

#???80?Node
set node_(81) [$ns node]
$node_(81) set X_ 380
$node_(81) set Y_ 489
$ns initial_node_pos $node_(81) 20

#???81?Node
set node_(82) [$ns node]
$node_(82) set X_ 1435
$node_(82) set Y_ 197
$ns initial_node_pos $node_(82) 20

#???82?Node
set node_(83) [$ns node]
$node_(83) set X_ 817
$node_(83) set Y_ 416
$ns initial_node_pos $node_(83) 20

#???83?Node
set node_(84) [$ns node]
$node_(84) set X_ 505
$node_(84) set Y_ 913
$ns initial_node_pos $node_(84) 20

#???84?Node
set node_(85) [$ns node]
$node_(85) set X_ 530
$node_(85) set Y_ 625
$ns initial_node_pos $node_(85) 20

#???85?Node
set node_(86) [$ns node]
$node_(86) set X_ 736
$node_(86) set Y_ 688
$ns initial_node_pos $node_(86) 20

#???86?Node
set node_(87) [$ns node]
$node_(87) set X_ 1084
$node_(87) set Y_ 22
$ns initial_node_pos $node_(87) 20

#???87?Node
set node_(88) [$ns node]
$node_(88) set X_ 580
$node_(88) set Y_ 272
$ns initial_node_pos $node_(88) 20

#???88?Node
set node_(89) [$ns node]
$node_(89) set X_ 935
$node_(89) set Y_ 1258
$ns initial_node_pos $node_(89) 20

#???89?Node
set node_(90) [$ns node]
$node_(90) set X_ 355
$node_(90) set Y_ 851
$ns initial_node_pos $node_(90) 20

#???90?Node
set node_(91) [$ns node]
$node_(91) set X_ 1034
$node_(91) set Y_ 274
$ns initial_node_pos $node_(91) 20

#???91?Node
set node_(92) [$ns node]
$node_(92) set X_ 1240
$node_(92) set Y_ 540
$ns initial_node_pos $node_(92) 20

#???92?Node
set node_(93) [$ns node]
$node_(93) set X_ 268
$node_(93) set Y_ 309
$ns initial_node_pos $node_(93) 20

#???93?Node
set node_(94) [$ns node]
$node_(94) set X_ 781
$node_(94) set Y_ 122
$ns initial_node_pos $node_(94) 20

#???94?Node
set node_(95) [$ns node]
$node_(95) set X_ 1158
$node_(95) set Y_ 994
$ns initial_node_pos $node_(95) 20

#???95?Node
set node_(96) [$ns node]
$node_(96) set X_ 846
$node_(96) set Y_ 26
$ns initial_node_pos $node_(96) 20

#???96?Node
set node_(97) [$ns node]
$node_(97) set X_ 862
$node_(97) set Y_ 1452
$ns initial_node_pos $node_(97) 20

#???97?Node
set node_(98) [$ns node]
$node_(98) set X_ 238
$node_(98) set Y_ 966
$ns initial_node_pos $node_(98) 20

#???98?Node
set node_(99) [$ns node]
$node_(99) set X_ 1379
$node_(99) set Y_ 1330
$ns initial_node_pos $node_(99) 20

#???99?Node
set node_(100) [$ns node]
$node_(100) set X_ 563
$node_(100) set Y_ 1438
$ns initial_node_pos $node_(100) 20

#???100?Node
set node_(101) [$ns node]
$node_(101) set X_ 1225
$node_(101) set Y_ 875
$ns initial_node_pos $node_(101) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 647.0 961.0 $tz " 
$ns at 10.0 " $node_(1) setdest 936.0 188.0 $tz " 
$ns at 10.0 " $node_(2) setdest 841.0 341.0 $tz " 
$ns at 10.0 " $node_(3) setdest 124.0 1286.0 $tz " 
$ns at 10.0 " $node_(4) setdest 58.0 919.0 $tz " 
$ns at 10.0 " $node_(5) setdest 938.0 1222.0 $tz " 
$ns at 10.0 " $node_(6) setdest 905.0 72.0 $tz " 
$ns at 10.0 " $node_(7) setdest 166.0 1294.0 $tz " 
$ns at 10.0 " $node_(8) setdest 399.0 891.0 $tz " 
$ns at 10.0 " $node_(9) setdest 1066.0 705.0 $tz " 
$ns at 10.0 " $node_(10) setdest 972.0 1100.0 $tz " 
$ns at 10.0 " $node_(11) setdest 886.0 99.0 $tz " 
$ns at 10.0 " $node_(12) setdest 152.0 1033.0 $tz " 
$ns at 10.0 " $node_(13) setdest 461.0 49.0 $tz " 
$ns at 10.0 " $node_(14) setdest 75.0 1150.0 $tz " 
$ns at 10.0 " $node_(15) setdest 86.0 355.0 $tz " 
$ns at 10.0 " $node_(16) setdest 661.0 1008.0 $tz " 
$ns at 10.0 " $node_(17) setdest 313.0 769.0 $tz " 
$ns at 10.0 " $node_(18) setdest 750.0 1008.0 $tz " 
$ns at 10.0 " $node_(19) setdest 1495.0 627.0 $tz " 
$ns at 10.0 " $node_(20) setdest 1322.0 75.0 $tz " 
$ns at 10.0 " $node_(21) setdest 852.0 1005.0 $tz " 
$ns at 10.0 " $node_(23) setdest 744.0 180.0 $tz " 
$ns at 10.0 " $node_(24) setdest 152.0 927.0 $tz " 
$ns at 10.0 " $node_(25) setdest 91.0 969.0 $tz " 
$ns at 10.0 " $node_(26) setdest 561.0 447.0 $tz " 
$ns at 10.0 " $node_(27) setdest 297.0 1100.0 $tz " 
$ns at 10.0 " $node_(28) setdest 1027.0 700.0 $tz " 
$ns at 10.0 " $node_(29) setdest 513.0 172.0 $tz " 
$ns at 10.0 " $node_(30) setdest 1492.0 527.0 $tz " 
$ns at 10.0 " $node_(31) setdest 133.0 241.0 $tz " 
$ns at 10.0 " $node_(32) setdest 1091.0 1416.0 $tz " 
$ns at 10.0 " $node_(33) setdest 1205.0 394.0 $tz " 
$ns at 10.0 " $node_(34) setdest 1474.0 341.0 $tz " 
$ns at 10.0 " $node_(35) setdest 1027.0 1102.0 $tz " 
$ns at 10.0 " $node_(36) setdest 372.0 1150.0 $tz " 
$ns at 10.0 " $node_(37) setdest 647.0 327.0 $tz " 
$ns at 10.0 " $node_(38) setdest 688.0 874.0 $tz " 
$ns at 10.0 " $node_(39) setdest 927.0 1038.0 $tz " 
$ns at 10.0 " $node_(40) setdest 738.0 1261.0 $tz " 
$ns at 10.0 " $node_(41) setdest 122.0 499.0 $tz " 
$ns at 10.0 " $node_(42) setdest 977.0 211.0 $tz " 
$ns at 10.0 " $node_(43) setdest 819.0 697.0 $tz " 
$ns at 10.0 " $node_(44) setdest 1211.0 1133.0 $tz " 
$ns at 10.0 " $node_(45) setdest 1088.0 316.0 $tz " 
$ns at 10.0 " $node_(46) setdest 605.0 791.0 $tz " 
$ns at 10.0 " $node_(47) setdest 919.0 1200.0 $tz " 
$ns at 10.0 " $node_(48) setdest 1484.0 180.0 $tz " 
$ns at 10.0 " $node_(49) setdest 102.0 97.0 $tz " 
$ns at 10.0 " $node_(50) setdest 1066.0 1258.0 $tz " 
$ns at 10.0 " $node_(51) setdest 388.0 636.0 $tz " 
$ns at 10.0 " $node_(52) setdest 1258.0 449.0 $tz " 
$ns at 10.0 " $node_(53) setdest 977.0 572.0 $tz " 
$ns at 10.0 " $node_(54) setdest 47.0 511.0 $tz " 
$ns at 10.0 " $node_(55) setdest 474.0 1116.0 $tz " 
$ns at 10.0 " $node_(56) setdest 366.0 230.0 $tz " 
$ns at 10.0 " $node_(57) setdest 1280.0 980.0 $tz " 
$ns at 10.0 " $node_(58) setdest 269.0 541.0 $tz " 
$ns at 10.0 " $node_(59) setdest 725.0 275.0 $tz " 
$ns at 10.0 " $node_(60) setdest 1175.0 888.0 $tz " 
$ns at 10.0 " $node_(61) setdest 1411.0 194.0 $tz " 
$ns at 10.0 " $node_(62) setdest 1136.0 608.0 $tz " 
$ns at 10.0 " $node_(63) setdest 330.0 1077.0 $tz " 
$ns at 10.0 " $node_(64) setdest 794.0 1255.0 $tz " 
$ns at 10.0 " $node_(65) setdest 219.0 127.0 $tz " 
$ns at 10.0 " $node_(66) setdest 249.0 363.0 $tz " 
$ns at 10.0 " $node_(67) setdest 186.0 1016.0 $tz " 
$ns at 10.0 " $node_(68) setdest 1463.0 1102.0 $tz " 
$ns at 10.0 " $node_(69) setdest 694.0 936.0 $tz " 
$ns at 10.0 " $node_(70) setdest 1486.0 127.0 $tz " 
$ns at 10.0 " $node_(71) setdest 1413.0 530.0 $tz " 
$ns at 10.0 " $node_(72) setdest 399.0 408.0 $tz " 
$ns at 10.0 " $node_(73) setdest 22.0 52.0 $tz " 
$ns at 10.0 " $node_(74) setdest 241.0 886.0 $tz " 
$ns at 10.0 " $node_(75) setdest 1083.0 552.0 $tz " 
$ns at 10.0 " $node_(76) setdest 1052.0 938.0 $tz " 
$ns at 10.0 " $node_(77) setdest 1177.0 830.0 $tz " 
$ns at 10.0 " $node_(78) setdest 1372.0 80.0 $tz " 
$ns at 10.0 " $node_(79) setdest 280.0 1063.0 $tz " 
$ns at 10.0 " $node_(80) setdest 655.0 922.0 $tz " 
$ns at 10.0 " $node_(81) setdest 263.0 266.0 $tz " 
$ns at 10.0 " $node_(82) setdest 1477.0 469.0 $tz " 
$ns at 10.0 " $node_(83) setdest 1180.0 375.0 $tz " 
$ns at 10.0 " $node_(84) setdest 575.0 772.0 $tz " 
$ns at 10.0 " $node_(85) setdest 627.0 436.0 $tz " 
$ns at 10.0 " $node_(86) setdest 733.0 477.0 $tz " 
$ns at 10.0 " $node_(87) setdest 1469.0 672.0 $tz " 
$ns at 10.0 " $node_(88) setdest 563.0 22.0 $tz " 
$ns at 10.0 " $node_(89) setdest 855.0 1169.0 $tz " 
$ns at 10.0 " $node_(90) setdest 605.0 711.0 $tz " 
$ns at 10.0 " $node_(91) setdest 1480.0 277.0 $tz " 
$ns at 10.0 " $node_(92) setdest 1497.0 658.0 $tz " 
$ns at 10.0 " $node_(93) setdest 722.0 227.0 $tz " 
$ns at 10.0 " $node_(94) setdest 916.0 352.0 $tz " 
$ns at 10.0 " $node_(95) setdest 924.0 819.0 $tz " 
$ns at 10.0 " $node_(96) setdest 613.0 36.0 $tz " 
$ns at 10.0 " $node_(97) setdest 830.0 1200.0 $tz " 
$ns at 10.0 " $node_(98) setdest 66.0 811.0 $tz " 
$ns at 10.0 " $node_(99) setdest 1161.0 1222.0 $tz " 
$ns at 10.0 " $node_(100) setdest 494.0 1308.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(68) $udp0
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