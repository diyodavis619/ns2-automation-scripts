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
#             產生Node              
#===================================

#建立第0個Node
set node_(0) [$ns node]
$node_(0) set X_ 1408
$node_(0) set Y_ 1432
$ns initial_node_pos $node_(0) 20

#建立第1個Node
set node_(1) [$ns node]
$node_(1) set X_ 544
$node_(1) set Y_ 127
$ns initial_node_pos $node_(1) 20

#建立第2個Node
set node_(2) [$ns node]
$node_(2) set X_ 451
$node_(2) set Y_ 293
$ns initial_node_pos $node_(2) 20

#建立第3個Node
set node_(3) [$ns node]
$node_(3) set X_ 1072
$node_(3) set Y_ 273
$ns initial_node_pos $node_(3) 20

#建立第4個Node
set node_(4) [$ns node]
$node_(4) set X_ 1243
$node_(4) set Y_ 1088
$ns initial_node_pos $node_(4) 20

#建立第5個Node
set node_(5) [$ns node]
$node_(5) set X_ 598
$node_(5) set Y_ 571
$ns initial_node_pos $node_(5) 20

#建立第6個Node
set node_(6) [$ns node]
$node_(6) set X_ 1164
$node_(6) set Y_ 1049
$ns initial_node_pos $node_(6) 20

#建立第7個Node
set node_(7) [$ns node]
$node_(7) set X_ 800
$node_(7) set Y_ 1083
$ns initial_node_pos $node_(7) 20

#建立第8個Node
set node_(8) [$ns node]
$node_(8) set X_ 565
$node_(8) set Y_ 730
$ns initial_node_pos $node_(8) 20

#建立第9個Node
set node_(9) [$ns node]
$node_(9) set X_ 1331
$node_(9) set Y_ 577
$ns initial_node_pos $node_(9) 20

#建立第10個Node
set node_(10) [$ns node]
$node_(10) set X_ 734
$node_(10) set Y_ 1008
$ns initial_node_pos $node_(10) 20

#建立第11個Node
set node_(11) [$ns node]
$node_(11) set X_ 354
$node_(11) set Y_ 337
$ns initial_node_pos $node_(11) 20

#建立第12個Node
set node_(12) [$ns node]
$node_(12) set X_ 465
$node_(12) set Y_ 176
$ns initial_node_pos $node_(12) 20

#建立第13個Node
set node_(13) [$ns node]
$node_(13) set X_ 1006
$node_(13) set Y_ 230
$ns initial_node_pos $node_(13) 20

#建立第14個Node
set node_(14) [$ns node]
$node_(14) set X_ 301
$node_(14) set Y_ 865
$ns initial_node_pos $node_(14) 20

#建立第15個Node
set node_(15) [$ns node]
$node_(15) set X_ 1084
$node_(15) set Y_ 1164
$ns initial_node_pos $node_(15) 20

#建立第16個Node
set node_(16) [$ns node]
$node_(16) set X_ 1430
$node_(16) set Y_ 881
$ns initial_node_pos $node_(16) 20

#建立第17個Node
set node_(17) [$ns node]
$node_(17) set X_ 402
$node_(17) set Y_ 232
$ns initial_node_pos $node_(17) 20

#建立第18個Node
set node_(18) [$ns node]
$node_(18) set X_ 732
$node_(18) set Y_ 1281
$ns initial_node_pos $node_(18) 20

#建立第19個Node
set node_(19) [$ns node]
$node_(19) set X_ 541
$node_(19) set Y_ 1364
$ns initial_node_pos $node_(19) 20

#建立第20個Node
set node_(20) [$ns node]
$node_(20) set X_ 804
$node_(20) set Y_ 1351
$ns initial_node_pos $node_(20) 20

#建立第21個Node
set node_(21) [$ns node]
$node_(21) set X_ 325
$node_(21) set Y_ 1347
$ns initial_node_pos $node_(21) 20

#建立第22個Node
set node_(22) [$ns node]
$node_(22) set X_ 875
$node_(22) set Y_ 696
$ns initial_node_pos $node_(22) 20

#建立第23個Node
set node_(23) [$ns node]
$node_(23) set X_ 1327
$node_(23) set Y_ 1151
$ns initial_node_pos $node_(23) 20

#建立第24個Node
set node_(24) [$ns node]
$node_(24) set X_ 895
$node_(24) set Y_ 1118
$ns initial_node_pos $node_(24) 20

#建立第25個Node
set node_(25) [$ns node]
$node_(25) set X_ 535
$node_(25) set Y_ 911
$ns initial_node_pos $node_(25) 20

#建立第26個Node
set node_(26) [$ns node]
$node_(26) set X_ 855
$node_(26) set Y_ 629
$ns initial_node_pos $node_(26) 20

#建立第27個Node
set node_(27) [$ns node]
$node_(27) set X_ 310
$node_(27) set Y_ 584
$ns initial_node_pos $node_(27) 20

#建立第28個Node
set node_(28) [$ns node]
$node_(28) set X_ 46
$node_(28) set Y_ 1388
$ns initial_node_pos $node_(28) 20

#建立第29個Node
set node_(29) [$ns node]
$node_(29) set X_ 714
$node_(29) set Y_ 911
$ns initial_node_pos $node_(29) 20

#建立第30個Node
set node_(30) [$ns node]
$node_(30) set X_ 213
$node_(30) set Y_ 923
$ns initial_node_pos $node_(30) 20

#建立第31個Node
set node_(31) [$ns node]
$node_(31) set X_ 1032
$node_(31) set Y_ 1357
$ns initial_node_pos $node_(31) 20

#建立第32個Node
set node_(32) [$ns node]
$node_(32) set X_ 789
$node_(32) set Y_ 576
$ns initial_node_pos $node_(32) 20

#建立第33個Node
set node_(33) [$ns node]
$node_(33) set X_ 60
$node_(33) set Y_ 430
$ns initial_node_pos $node_(33) 20

#建立第34個Node
set node_(34) [$ns node]
$node_(34) set X_ 134
$node_(34) set Y_ 425
$ns initial_node_pos $node_(34) 20

#建立第35個Node
set node_(35) [$ns node]
$node_(35) set X_ 482
$node_(35) set Y_ 83
$ns initial_node_pos $node_(35) 20

#建立第36個Node
set node_(36) [$ns node]
$node_(36) set X_ 946
$node_(36) set Y_ 760
$ns initial_node_pos $node_(36) 20

#建立第37個Node
set node_(37) [$ns node]
$node_(37) set X_ 1470
$node_(37) set Y_ 1170
$ns initial_node_pos $node_(37) 20

#建立第38個Node
set node_(38) [$ns node]
$node_(38) set X_ 624
$node_(38) set Y_ 626
$ns initial_node_pos $node_(38) 20

#建立第39個Node
set node_(39) [$ns node]
$node_(39) set X_ 408
$node_(39) set Y_ 1299
$ns initial_node_pos $node_(39) 20

#建立第40個Node
set node_(40) [$ns node]
$node_(40) set X_ 1141
$node_(40) set Y_ 569
$ns initial_node_pos $node_(40) 20

#建立第41個Node
set node_(41) [$ns node]
$node_(41) set X_ 1144
$node_(41) set Y_ 1100
$ns initial_node_pos $node_(41) 20

#建立第42個Node
set node_(42) [$ns node]
$node_(42) set X_ 944
$node_(42) set Y_ 1406
$ns initial_node_pos $node_(42) 20

#建立第43個Node
set node_(43) [$ns node]
$node_(43) set X_ 775
$node_(43) set Y_ 42
$ns initial_node_pos $node_(43) 20

#建立第44個Node
set node_(44) [$ns node]
$node_(44) set X_ 1065
$node_(44) set Y_ 169
$ns initial_node_pos $node_(44) 20

#建立第45個Node
set node_(45) [$ns node]
$node_(45) set X_ 327
$node_(45) set Y_ 1158
$ns initial_node_pos $node_(45) 20

#建立第46個Node
set node_(46) [$ns node]
$node_(46) set X_ 940
$node_(46) set Y_ 236
$ns initial_node_pos $node_(46) 20

#建立第47個Node
set node_(47) [$ns node]
$node_(47) set X_ 74
$node_(47) set Y_ 95
$ns initial_node_pos $node_(47) 20

#建立第48個Node
set node_(48) [$ns node]
$node_(48) set X_ 1260
$node_(48) set Y_ 1291
$ns initial_node_pos $node_(48) 20

#建立第49個Node
set node_(49) [$ns node]
$node_(49) set X_ 1232
$node_(49) set Y_ 974
$ns initial_node_pos $node_(49) 20

#建立第50個Node
set node_(50) [$ns node]
$node_(50) set X_ 55
$node_(50) set Y_ 883
$ns initial_node_pos $node_(50) 20

#建立第51個Node
set node_(51) [$ns node]
$node_(51) set X_ 718
$node_(51) set Y_ 548
$ns initial_node_pos $node_(51) 20

#建立第52個Node
set node_(52) [$ns node]
$node_(52) set X_ 301
$node_(52) set Y_ 773
$ns initial_node_pos $node_(52) 20

#建立第53個Node
set node_(53) [$ns node]
$node_(53) set X_ 574
$node_(53) set Y_ 251
$ns initial_node_pos $node_(53) 20

#建立第54個Node
set node_(54) [$ns node]
$node_(54) set X_ 51
$node_(54) set Y_ 232
$ns initial_node_pos $node_(54) 20

#建立第55個Node
set node_(55) [$ns node]
$node_(55) set X_ 543
$node_(55) set Y_ 622
$ns initial_node_pos $node_(55) 20

#建立第56個Node
set node_(56) [$ns node]
$node_(56) set X_ 611
$node_(56) set Y_ 1416
$ns initial_node_pos $node_(56) 20

#建立第57個Node
set node_(57) [$ns node]
$node_(57) set X_ 1096
$node_(57) set Y_ 890
$ns initial_node_pos $node_(57) 20

#建立第58個Node
set node_(58) [$ns node]
$node_(58) set X_ 561
$node_(58) set Y_ 973
$ns initial_node_pos $node_(58) 20

#建立第59個Node
set node_(59) [$ns node]
$node_(59) set X_ 1357
$node_(59) set Y_ 804
$ns initial_node_pos $node_(59) 20

#建立第60個Node
set node_(60) [$ns node]
$node_(60) set X_ 1484
$node_(60) set Y_ 361
$ns initial_node_pos $node_(60) 20

#建立第61個Node
set node_(61) [$ns node]
$node_(61) set X_ 1241
$node_(61) set Y_ 31
$ns initial_node_pos $node_(61) 20

#建立第62個Node
set node_(62) [$ns node]
$node_(62) set X_ 1260
$node_(62) set Y_ 113
$ns initial_node_pos $node_(62) 20

#建立第63個Node
set node_(63) [$ns node]
$node_(63) set X_ 1213
$node_(63) set Y_ 271
$ns initial_node_pos $node_(63) 20

#建立第64個Node
set node_(64) [$ns node]
$node_(64) set X_ 154
$node_(64) set Y_ 266
$ns initial_node_pos $node_(64) 20

#建立第65個Node
set node_(65) [$ns node]
$node_(65) set X_ 855
$node_(65) set Y_ 293
$ns initial_node_pos $node_(65) 20

#建立第66個Node
set node_(66) [$ns node]
$node_(66) set X_ 706
$node_(66) set Y_ 648
$ns initial_node_pos $node_(66) 20

#建立第67個Node
set node_(67) [$ns node]
$node_(67) set X_ 1413
$node_(67) set Y_ 767
$ns initial_node_pos $node_(67) 20

#建立第68個Node
set node_(68) [$ns node]
$node_(68) set X_ 855
$node_(68) set Y_ 103
$ns initial_node_pos $node_(68) 20

#建立第69個Node
set node_(69) [$ns node]
$node_(69) set X_ 1345
$node_(69) set Y_ 996
$ns initial_node_pos $node_(69) 20

#建立第70個Node
set node_(70) [$ns node]
$node_(70) set X_ 1483
$node_(70) set Y_ 1468
$ns initial_node_pos $node_(70) 20

#建立第71個Node
set node_(71) [$ns node]
$node_(71) set X_ 929
$node_(71) set Y_ 1010
$ns initial_node_pos $node_(71) 20

#建立第72個Node
set node_(72) [$ns node]
$node_(72) set X_ 455
$node_(72) set Y_ 454
$ns initial_node_pos $node_(72) 20

#建立第73個Node
set node_(73) [$ns node]
$node_(73) set X_ 207
$node_(73) set Y_ 1357
$ns initial_node_pos $node_(73) 20

#建立第74個Node
set node_(74) [$ns node]
$node_(74) set X_ 1079
$node_(74) set Y_ 1286
$ns initial_node_pos $node_(74) 20

#建立第75個Node
set node_(75) [$ns node]
$node_(75) set X_ 940
$node_(75) set Y_ 327
$ns initial_node_pos $node_(75) 20

#建立第76個Node
set node_(76) [$ns node]
$node_(76) set X_ 1188
$node_(76) set Y_ 1211
$ns initial_node_pos $node_(76) 20

#建立第77個Node
set node_(77) [$ns node]
$node_(77) set X_ 1320
$node_(77) set Y_ 331
$ns initial_node_pos $node_(77) 20

#建立第78個Node
set node_(78) [$ns node]
$node_(78) set X_ 1027
$node_(78) set Y_ 1046
$ns initial_node_pos $node_(78) 20

#建立第79個Node
set node_(79) [$ns node]
$node_(79) set X_ 979
$node_(79) set Y_ 683
$ns initial_node_pos $node_(79) 20

#建立第80個Node
set node_(80) [$ns node]
$node_(80) set X_ 1275
$node_(80) set Y_ 857
$ns initial_node_pos $node_(80) 20

#建立第81個Node
set node_(81) [$ns node]
$node_(81) set X_ 179
$node_(81) set Y_ 372
$ns initial_node_pos $node_(81) 20

#建立第82個Node
set node_(82) [$ns node]
$node_(82) set X_ 445
$node_(82) set Y_ 620
$ns initial_node_pos $node_(82) 20

#建立第83個Node
set node_(83) [$ns node]
$node_(83) set X_ 938
$node_(83) set Y_ 912
$ns initial_node_pos $node_(83) 20

#建立第84個Node
set node_(84) [$ns node]
$node_(84) set X_ 433
$node_(84) set Y_ 540
$ns initial_node_pos $node_(84) 20

#建立第85個Node
set node_(85) [$ns node]
$node_(85) set X_ 645
$node_(85) set Y_ 463
$ns initial_node_pos $node_(85) 20

#建立第86個Node
set node_(86) [$ns node]
$node_(86) set X_ 577
$node_(86) set Y_ 1237
$ns initial_node_pos $node_(86) 20

#建立第87個Node
set node_(87) [$ns node]
$node_(87) set X_ 116
$node_(87) set Y_ 653
$ns initial_node_pos $node_(87) 20

#建立第88個Node
set node_(88) [$ns node]
$node_(88) set X_ 1457
$node_(88) set Y_ 721
$ns initial_node_pos $node_(88) 20

#建立第89個Node
set node_(89) [$ns node]
$node_(89) set X_ 180
$node_(89) set Y_ 1040
$ns initial_node_pos $node_(89) 20

#建立第90個Node
set node_(90) [$ns node]
$node_(90) set X_ 936
$node_(90) set Y_ 1241
$ns initial_node_pos $node_(90) 20

#建立第91個Node
set node_(91) [$ns node]
$node_(91) set X_ 749
$node_(91) set Y_ 1493
$ns initial_node_pos $node_(91) 20

#建立第92個Node
set node_(92) [$ns node]
$node_(92) set X_ 655
$node_(92) set Y_ 1330
$ns initial_node_pos $node_(92) 20

#建立第93個Node
set node_(93) [$ns node]
$node_(93) set X_ 903
$node_(93) set Y_ 1482
$ns initial_node_pos $node_(93) 20

#建立第94個Node
set node_(94) [$ns node]
$node_(94) set X_ 588
$node_(94) set Y_ 1049
$ns initial_node_pos $node_(94) 20

#建立第95個Node
set node_(95) [$ns node]
$node_(95) set X_ 886
$node_(95) set Y_ 1325
$ns initial_node_pos $node_(95) 20

#建立第96個Node
set node_(96) [$ns node]
$node_(96) set X_ 645
$node_(96) set Y_ 842
$ns initial_node_pos $node_(96) 20

#建立第97個Node
set node_(97) [$ns node]
$node_(97) set X_ 1411
$node_(97) set Y_ 1257
$ns initial_node_pos $node_(97) 20

#建立第98個Node
set node_(98) [$ns node]
$node_(98) set X_ 1443
$node_(98) set Y_ 516
$ns initial_node_pos $node_(98) 20

#建立第99個Node
set node_(99) [$ns node]
$node_(99) set X_ 1128
$node_(99) set Y_ 160
$ns initial_node_pos $node_(99) 20

#建立第100個Node
set node_(100) [$ns node]
$node_(100) set X_ 1004
$node_(100) set Y_ 474
$ns initial_node_pos $node_(100) 20

#建立第101個Node
set node_(101) [$ns node]
$node_(101) set X_ 1216
$node_(101) set Y_ 860
$ns initial_node_pos $node_(101) 20

#建立第102個Node
set node_(102) [$ns node]
$node_(102) set X_ 61
$node_(102) set Y_ 503
$ns initial_node_pos $node_(102) 20

#建立第103個Node
set node_(103) [$ns node]
$node_(103) set X_ 1376
$node_(103) set Y_ 416
$ns initial_node_pos $node_(103) 20

#建立第104個Node
set node_(104) [$ns node]
$node_(104) set X_ 1290
$node_(104) set Y_ 1046
$ns initial_node_pos $node_(104) 20

#建立第105個Node
set node_(105) [$ns node]
$node_(105) set X_ 498
$node_(105) set Y_ 1452
$ns initial_node_pos $node_(105) 20

#建立第106個Node
set node_(106) [$ns node]
$node_(106) set X_ 383
$node_(106) set Y_ 951
$ns initial_node_pos $node_(106) 20

#建立第107個Node
set node_(107) [$ns node]
$node_(107) set X_ 283
$node_(107) set Y_ 533
$ns initial_node_pos $node_(107) 20

#建立第108個Node
set node_(108) [$ns node]
$node_(108) set X_ 439
$node_(108) set Y_ 782
$ns initial_node_pos $node_(108) 20

#建立第109個Node
set node_(109) [$ns node]
$node_(109) set X_ 434
$node_(109) set Y_ 1139
$ns initial_node_pos $node_(109) 20

#建立第110個Node
set node_(110) [$ns node]
$node_(110) set X_ 679
$node_(110) set Y_ 179
$ns initial_node_pos $node_(110) 20

#建立第111個Node
set node_(111) [$ns node]
$node_(111) set X_ 1248
$node_(111) set Y_ 386
$ns initial_node_pos $node_(111) 20

#建立第112個Node
set node_(112) [$ns node]
$node_(112) set X_ 1204
$node_(112) set Y_ 655
$ns initial_node_pos $node_(112) 20

#建立第113個Node
set node_(113) [$ns node]
$node_(113) set X_ 1360
$node_(113) set Y_ 34
$ns initial_node_pos $node_(113) 20

#建立第114個Node
set node_(114) [$ns node]
$node_(114) set X_ 808
$node_(114) set Y_ 460
$ns initial_node_pos $node_(114) 20

#建立第115個Node
set node_(115) [$ns node]
$node_(115) set X_ 149
$node_(115) set Y_ 1260
$ns initial_node_pos $node_(115) 20

#建立第116個Node
set node_(116) [$ns node]
$node_(116) set X_ 832
$node_(116) set Y_ 991
$ns initial_node_pos $node_(116) 20

#建立第117個Node
set node_(117) [$ns node]
$node_(117) set X_ 134
$node_(117) set Y_ 1171
$ns initial_node_pos $node_(117) 20

#建立第118個Node
set node_(118) [$ns node]
$node_(118) set X_ 1274
$node_(118) set Y_ 713
$ns initial_node_pos $node_(118) 20

#建立第119個Node
set node_(119) [$ns node]
$node_(119) set X_ 343
$node_(119) set Y_ 1456
$ns initial_node_pos $node_(119) 20

#建立第120個Node
set node_(120) [$ns node]
$node_(120) set X_ 755
$node_(120) set Y_ 137
$ns initial_node_pos $node_(120) 20

#建立第121個Node
set node_(121) [$ns node]
$node_(121) set X_ 682
$node_(121) set Y_ 966
$ns initial_node_pos $node_(121) 20

#建立第122個Node
set node_(122) [$ns node]
$node_(122) set X_ 1320
$node_(122) set Y_ 211
$ns initial_node_pos $node_(122) 20

#建立第123個Node
set node_(123) [$ns node]
$node_(123) set X_ 723
$node_(123) set Y_ 1165
$ns initial_node_pos $node_(123) 20

#建立第124個Node
set node_(124) [$ns node]
$node_(124) set X_ 522
$node_(124) set Y_ 1192
$ns initial_node_pos $node_(124) 20

#建立第125個Node
set node_(125) [$ns node]
$node_(125) set X_ 802
$node_(125) set Y_ 686
$ns initial_node_pos $node_(125) 20

#建立第126個Node
set node_(126) [$ns node]
$node_(126) set X_ 456
$node_(126) set Y_ 1356
$ns initial_node_pos $node_(126) 20

#建立第127個Node
set node_(127) [$ns node]
$node_(127) set X_ 1296
$node_(127) set Y_ 1426
$ns initial_node_pos $node_(127) 20

#建立第128個Node
set node_(128) [$ns node]
$node_(128) set X_ 279
$node_(128) set Y_ 425
$ns initial_node_pos $node_(128) 20

#建立第129個Node
set node_(129) [$ns node]
$node_(129) set X_ 1430
$node_(129) set Y_ 139
$ns initial_node_pos $node_(129) 20

#建立第130個Node
set node_(130) [$ns node]
$node_(130) set X_ 324
$node_(130) set Y_ 1275
$ns initial_node_pos $node_(130) 20

#建立第131個Node
set node_(131) [$ns node]
$node_(131) set X_ 1047
$node_(131) set Y_ 542
$ns initial_node_pos $node_(131) 20

#建立第132個Node
set node_(132) [$ns node]
$node_(132) set X_ 588
$node_(132) set Y_ 351
$ns initial_node_pos $node_(132) 20

#建立第133個Node
set node_(133) [$ns node]
$node_(133) set X_ 396
$node_(133) set Y_ 1054
$ns initial_node_pos $node_(133) 20

#建立第134個Node
set node_(134) [$ns node]
$node_(134) set X_ 153
$node_(134) set Y_ 539
$ns initial_node_pos $node_(134) 20

#建立第135個Node
set node_(135) [$ns node]
$node_(135) set X_ 812
$node_(135) set Y_ 175
$ns initial_node_pos $node_(135) 20

#建立第136個Node
set node_(136) [$ns node]
$node_(136) set X_ 860
$node_(136) set Y_ 950
$ns initial_node_pos $node_(136) 20

#建立第137個Node
set node_(137) [$ns node]
$node_(137) set X_ 1433
$node_(137) set Y_ 1070
$ns initial_node_pos $node_(137) 20

#建立第138個Node
set node_(138) [$ns node]
$node_(138) set X_ 272
$node_(138) set Y_ 90
$ns initial_node_pos $node_(138) 20

#建立第139個Node
set node_(139) [$ns node]
$node_(139) set X_ 655
$node_(139) set Y_ 62
$ns initial_node_pos $node_(139) 20

#建立第140個Node
set node_(140) [$ns node]
$node_(140) set X_ 1062
$node_(140) set Y_ 79
$ns initial_node_pos $node_(140) 20

#建立第141個Node
set node_(141) [$ns node]
$node_(141) set X_ 1093
$node_(141) set Y_ 1376
$ns initial_node_pos $node_(141) 20

#建立第142個Node
set node_(142) [$ns node]
$node_(142) set X_ 746
$node_(142) set Y_ 425
$ns initial_node_pos $node_(142) 20

#建立第143個Node
set node_(143) [$ns node]
$node_(143) set X_ 858
$node_(143) set Y_ 235
$ns initial_node_pos $node_(143) 20

#建立第144個Node
set node_(144) [$ns node]
$node_(144) set X_ 228
$node_(144) set Y_ 628
$ns initial_node_pos $node_(144) 20

#建立第145個Node
set node_(145) [$ns node]
$node_(145) set X_ 269
$node_(145) set Y_ 1083
$ns initial_node_pos $node_(145) 20

#建立第146個Node
set node_(146) [$ns node]
$node_(146) set X_ 1348
$node_(146) set Y_ 1308
$ns initial_node_pos $node_(146) 20

#建立第147個Node
set node_(147) [$ns node]
$node_(147) set X_ 1119
$node_(147) set Y_ 779
$ns initial_node_pos $node_(147) 20

#建立第148個Node
set node_(148) [$ns node]
$node_(148) set X_ 655
$node_(148) set Y_ 1090
$ns initial_node_pos $node_(148) 20

#建立第149個Node
set node_(149) [$ns node]
$node_(149) set X_ 667
$node_(149) set Y_ 1220
$ns initial_node_pos $node_(149) 20

#建立第150個Node
set node_(150) [$ns node]
$node_(150) set X_ 1189
$node_(150) set Y_ 1380
$ns initial_node_pos $node_(150) 20

#建立第151個Node
set node_(151) [$ns node]
$node_(151) set X_ 534
$node_(151) set Y_ 516
$ns initial_node_pos $node_(151) 20

#建立第152個Node
set node_(152) [$ns node]
$node_(152) set X_ 371
$node_(152) set Y_ 417
$ns initial_node_pos $node_(152) 20

#建立第153個Node
set node_(153) [$ns node]
$node_(153) set X_ 143
$node_(153) set Y_ 1005
$ns initial_node_pos $node_(153) 20

#建立第154個Node
set node_(154) [$ns node]
$node_(154) set X_ 718
$node_(154) set Y_ 1381
$ns initial_node_pos $node_(154) 20

#建立第155個Node
set node_(155) [$ns node]
$node_(155) set X_ 967
$node_(155) set Y_ 577
$ns initial_node_pos $node_(155) 20

#建立第156個Node
set node_(156) [$ns node]
$node_(156) set X_ 380
$node_(156) set Y_ 666
$ns initial_node_pos $node_(156) 20

#建立第157個Node
set node_(157) [$ns node]
$node_(157) set X_ 674
$node_(157) set Y_ 318
$ns initial_node_pos $node_(157) 20

#建立第158個Node
set node_(158) [$ns node]
$node_(158) set X_ 941
$node_(158) set Y_ 132
$ns initial_node_pos $node_(158) 20

#建立第159個Node
set node_(159) [$ns node]
$node_(159) set X_ 420
$node_(159) set Y_ 361
$ns initial_node_pos $node_(159) 20

#建立第160個Node
set node_(160) [$ns node]
$node_(160) set X_ 51
$node_(160) set Y_ 651
$ns initial_node_pos $node_(160) 20

#建立第161個Node
set node_(161) [$ns node]
$node_(161) set X_ 370
$node_(161) set Y_ 89
$ns initial_node_pos $node_(161) 20

#建立第162個Node
set node_(162) [$ns node]
$node_(162) set X_ 340
$node_(162) set Y_ 1032
$ns initial_node_pos $node_(162) 20

#建立第163個Node
set node_(163) [$ns node]
$node_(163) set X_ 1164
$node_(163) set Y_ 436
$ns initial_node_pos $node_(163) 20

#建立第164個Node
set node_(164) [$ns node]
$node_(164) set X_ 740
$node_(164) set Y_ 332
$ns initial_node_pos $node_(164) 20

#建立第165個Node
set node_(165) [$ns node]
$node_(165) set X_ 1442
$node_(165) set Y_ 644
$ns initial_node_pos $node_(165) 20

#建立第166個Node
set node_(166) [$ns node]
$node_(166) set X_ 529
$node_(166) set Y_ 839
$ns initial_node_pos $node_(166) 20

#建立第167個Node
set node_(167) [$ns node]
$node_(167) set X_ 464
$node_(167) set Y_ 724
$ns initial_node_pos $node_(167) 20

#建立第168個Node
set node_(168) [$ns node]
$node_(168) set X_ 1241
$node_(168) set Y_ 564
$ns initial_node_pos $node_(168) 20

#建立第169個Node
set node_(169) [$ns node]
$node_(169) set X_ 272
$node_(169) set Y_ 220
$ns initial_node_pos $node_(169) 20

#建立第170個Node
set node_(170) [$ns node]
$node_(170) set X_ 820
$node_(170) set Y_ 860
$ns initial_node_pos $node_(170) 20

#建立第171個Node
set node_(171) [$ns node]
$node_(171) set X_ 595
$node_(171) set Y_ 1158
$ns initial_node_pos $node_(171) 20

#建立第172個Node
set node_(172) [$ns node]
$node_(172) set X_ 115
$node_(172) set Y_ 319
$ns initial_node_pos $node_(172) 20

#建立第173個Node
set node_(173) [$ns node]
$node_(173) set X_ 125
$node_(173) set Y_ 774
$ns initial_node_pos $node_(173) 20

#建立第174個Node
set node_(174) [$ns node]
$node_(174) set X_ 393
$node_(174) set Y_ 157
$ns initial_node_pos $node_(174) 20

#建立第175個Node
set node_(175) [$ns node]
$node_(175) set X_ 834
$node_(175) set Y_ 1200
$ns initial_node_pos $node_(175) 20

#建立第176個Node
set node_(176) [$ns node]
$node_(176) set X_ 527
$node_(176) set Y_ 395
$ns initial_node_pos $node_(176) 20

#建立第177個Node
set node_(177) [$ns node]
$node_(177) set X_ 983
$node_(177) set Y_ 866
$ns initial_node_pos $node_(177) 20

#建立第178個Node
set node_(178) [$ns node]
$node_(178) set X_ 1281
$node_(178) set Y_ 510
$ns initial_node_pos $node_(178) 20

#建立第179個Node
set node_(179) [$ns node]
$node_(179) set X_ 101
$node_(179) set Y_ 1286
$ns initial_node_pos $node_(179) 20

#建立第180個Node
set node_(180) [$ns node]
$node_(180) set X_ 693
$node_(180) set Y_ 760
$ns initial_node_pos $node_(180) 20

#建立第181個Node
set node_(181) [$ns node]
$node_(181) set X_ 1477
$node_(181) set Y_ 23
$ns initial_node_pos $node_(181) 20

#建立第182個Node
set node_(182) [$ns node]
$node_(182) set X_ 167
$node_(182) set Y_ 123
$ns initial_node_pos $node_(182) 20

#建立第183個Node
set node_(183) [$ns node]
$node_(183) set X_ 89
$node_(183) set Y_ 1061
$ns initial_node_pos $node_(183) 20

#建立第184個Node
set node_(184) [$ns node]
$node_(184) set X_ 906
$node_(184) set Y_ 425
$ns initial_node_pos $node_(184) 20

#建立第185個Node
set node_(185) [$ns node]
$node_(185) set X_ 172
$node_(185) set Y_ 15
$ns initial_node_pos $node_(185) 20

#建立第186個Node
set node_(186) [$ns node]
$node_(186) set X_ 1060
$node_(186) set Y_ 367
$ns initial_node_pos $node_(186) 20

#建立第187個Node
set node_(187) [$ns node]
$node_(187) set X_ 1026
$node_(187) set Y_ 774
$ns initial_node_pos $node_(187) 20

#建立第188個Node
set node_(188) [$ns node]
$node_(188) set X_ 883
$node_(188) set Y_ 505
$ns initial_node_pos $node_(188) 20

#建立第189個Node
set node_(189) [$ns node]
$node_(189) set X_ 818
$node_(189) set Y_ 362
$ns initial_node_pos $node_(189) 20

#建立第190個Node
set node_(190) [$ns node]
$node_(190) set X_ 1113
$node_(190) set Y_ 996
$ns initial_node_pos $node_(190) 20

#建立第191個Node
set node_(191) [$ns node]
$node_(191) set X_ 874
$node_(191) set Y_ 799
$ns initial_node_pos $node_(191) 20

#建立第192個Node
set node_(192) [$ns node]
$node_(192) set X_ 1129
$node_(192) set Y_ 1448
$ns initial_node_pos $node_(192) 20

#建立第193個Node
set node_(193) [$ns node]
$node_(193) set X_ 1481
$node_(193) set Y_ 1369
$ns initial_node_pos $node_(193) 20

#建立第194個Node
set node_(194) [$ns node]
$node_(194) set X_ 1454
$node_(194) set Y_ 247
$ns initial_node_pos $node_(194) 20

#建立第195個Node
set node_(195) [$ns node]
$node_(195) set X_ 490
$node_(195) set Y_ 1044
$ns initial_node_pos $node_(195) 20

#建立第196個Node
set node_(196) [$ns node]
$node_(196) set X_ 1496
$node_(196) set Y_ 1216
$ns initial_node_pos $node_(196) 20

#建立第197個Node
set node_(197) [$ns node]
$node_(197) set X_ 51
$node_(197) set Y_ 1162
$ns initial_node_pos $node_(197) 20

#建立第198個Node
set node_(198) [$ns node]
$node_(198) set X_ 947
$node_(198) set Y_ 1122
$ns initial_node_pos $node_(198) 20

#建立第199個Node
set node_(199) [$ns node]
$node_(199) set X_ 880
$node_(199) set Y_ 35
$ns initial_node_pos $node_(199) 20

#===================================
#             產生Movement           
#===================================
set tz [lindex $argv 3]
# for 10% mobility i.e 20 nodes
$ns at 10.0 " $node_(22) setdest 1295.0 1218.0 $tz " 
$ns at 10.0 " $node_(25) setdest 1355.0 683.0 $tz " 
$ns at 10.0 " $node_(26) setdest 174.0 718.0 $tz " 
$ns at 10.0 " $node_(36) setdest 158.0 869.0 $tz " 
$ns at 10.0 " $node_(38) setdest 1353.0 909.0 $tz " 
$ns at 10.0 " $node_(55) setdest 39.0 1016.0 $tz " 
$ns at 10.0 " $node_(66) setdest 248.0 318.0 $tz " 
$ns at 10.0 " $node_(79) setdest 1169.0 1318.0 $tz " 
$ns at 10.0 " $node_(83) setdest 1490.0 127.0 $tz " 
$ns at 10.0 " $node_(101) setdest 218.0 506.0 $tz " 
$ns at 10.0 " $node_(106) setdest 1086.0 688.0 $tz " 
$ns at 10.0 " $node_(125) setdest 32.0 762.0 $tz " 
$ns at 10.0 " $node_(136) setdest 651.0 248.0 $tz " 
$ns at 10.0 " $node_(151) setdest 1013.0 1204.0 $tz " 
$ns at 10.0 " $node_(170) setdest 569.0 62.0 $tz " 
$ns at 10.0 " $node_(177) setdest 1144.0 351.0 $tz " 
$ns at 10.0 " $node_(180) setdest 160.0 190.0 $tz " 
$ns at 10.0 " $node_(187) setdest 146.0 1397.0 $tz " 
$ns at 10.0 " $node_(189) setdest 1037.0 967.0 $tz " 
$ns at 10.0 " $node_(191) setdest 234.0 1216.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(22) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(191) $null0
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