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
set val(nn)     100                        ;# number of mobilenodes
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
$node_(0) set X_ 125
$node_(0) set Y_ 751
$ns initial_node_pos $node_(0) 20

#建立第1個Node
set node_(1) [$ns node]
$node_(1) set X_ 555
$node_(1) set Y_ 1309
$ns initial_node_pos $node_(1) 20

#建立第2個Node
set node_(2) [$ns node]
$node_(2) set X_ 337
$node_(2) set Y_ 718
$ns initial_node_pos $node_(2) 20

#建立第3個Node
set node_(3) [$ns node]
$node_(3) set X_ 1359
$node_(3) set Y_ 1018
$ns initial_node_pos $node_(3) 20

#建立第4個Node
set node_(4) [$ns node]
$node_(4) set X_ 383
$node_(4) set Y_ 1390
$ns initial_node_pos $node_(4) 20

#建立第5個Node
set node_(5) [$ns node]
$node_(5) set X_ 211
$node_(5) set Y_ 1325
$ns initial_node_pos $node_(5) 20

#建立第6個Node
set node_(6) [$ns node]
$node_(6) set X_ 1490
$node_(6) set Y_ 881
$ns initial_node_pos $node_(6) 20

#建立第7個Node
set node_(7) [$ns node]
$node_(7) set X_ 883
$node_(7) set Y_ 1398
$ns initial_node_pos $node_(7) 20

#建立第8個Node
set node_(8) [$ns node]
$node_(8) set X_ 159
$node_(8) set Y_ 163
$ns initial_node_pos $node_(8) 20

#建立第9個Node
set node_(9) [$ns node]
$node_(9) set X_ 1381
$node_(9) set Y_ 155
$ns initial_node_pos $node_(9) 20

#建立第10個Node
set node_(10) [$ns node]
$node_(10) set X_ 717
$node_(10) set Y_ 88
$ns initial_node_pos $node_(10) 20

#建立第11個Node
set node_(11) [$ns node]
$node_(11) set X_ 1239
$node_(11) set Y_ 718
$ns initial_node_pos $node_(11) 20

#建立第12個Node
set node_(12) [$ns node]
$node_(12) set X_ 1086
$node_(12) set Y_ 1006
$ns initial_node_pos $node_(12) 20

#建立第13個Node
set node_(13) [$ns node]
$node_(13) set X_ 606
$node_(13) set Y_ 76
$ns initial_node_pos $node_(13) 20

#建立第14個Node
set node_(14) [$ns node]
$node_(14) set X_ 446
$node_(14) set Y_ 602
$ns initial_node_pos $node_(14) 20

#建立第15個Node
set node_(15) [$ns node]
$node_(15) set X_ 127
$node_(15) set Y_ 1435
$ns initial_node_pos $node_(15) 20

#建立第16個Node
set node_(16) [$ns node]
$node_(16) set X_ 1037
$node_(16) set Y_ 1474
$ns initial_node_pos $node_(16) 20

#建立第17個Node
set node_(17) [$ns node]
$node_(17) set X_ 667
$node_(17) set Y_ 825
$ns initial_node_pos $node_(17) 20

#建立第18個Node
set node_(18) [$ns node]
$node_(18) set X_ 1464
$node_(18) set Y_ 432
$ns initial_node_pos $node_(18) 20

#建立第19個Node
set node_(19) [$ns node]
$node_(19) set X_ 951
$node_(19) set Y_ 32
$ns initial_node_pos $node_(19) 20

#建立第20個Node
set node_(20) [$ns node]
$node_(20) set X_ 341
$node_(20) set Y_ 148
$ns initial_node_pos $node_(20) 20

#建立第21個Node
set node_(21) [$ns node]
$node_(21) set X_ 1255
$node_(21) set Y_ 576
$ns initial_node_pos $node_(21) 20

#建立第22個Node
set node_(22) [$ns node]
$node_(22) set X_ 400
$node_(22) set Y_ 1239
$ns initial_node_pos $node_(22) 20

#建立第23個Node
set node_(23) [$ns node]
$node_(23) set X_ 855
$node_(23) set Y_ 1195
$ns initial_node_pos $node_(23) 20

#建立第24個Node
set node_(24) [$ns node]
$node_(24) set X_ 274
$node_(24) set Y_ 1480
$ns initial_node_pos $node_(24) 20

#建立第25個Node
set node_(25) [$ns node]
$node_(25) set X_ 1288
$node_(25) set Y_ 1465
$ns initial_node_pos $node_(25) 20

#建立第26個Node
set node_(26) [$ns node]
$node_(26) set X_ 58
$node_(26) set Y_ 1083
$ns initial_node_pos $node_(26) 20

#建立第27個Node
set node_(27) [$ns node]
$node_(27) set X_ 1305
$node_(27) set Y_ 1277
$ns initial_node_pos $node_(27) 20

#建立第28個Node
set node_(28) [$ns node]
$node_(28) set X_ 1172
$node_(28) set Y_ 1158
$ns initial_node_pos $node_(28) 20

#建立第29個Node
set node_(29) [$ns node]
$node_(29) set X_ 1102
$node_(29) set Y_ 820
$ns initial_node_pos $node_(29) 20

#建立第30個Node
set node_(30) [$ns node]
$node_(30) set X_ 744
$node_(30) set Y_ 1079
$ns initial_node_pos $node_(30) 20

#建立第31個Node
set node_(31) [$ns node]
$node_(31) set X_ 895
$node_(31) set Y_ 472
$ns initial_node_pos $node_(31) 20

#建立第32個Node
set node_(32) [$ns node]
$node_(32) set X_ 927
$node_(32) set Y_ 1051
$ns initial_node_pos $node_(32) 20

#建立第33個Node
set node_(33) [$ns node]
$node_(33) set X_ 1015
$node_(33) set Y_ 1166
$ns initial_node_pos $node_(33) 20

#建立第34個Node
set node_(34) [$ns node]
$node_(34) set X_ 1246
$node_(34) set Y_ 946
$ns initial_node_pos $node_(34) 20

#建立第35個Node
set node_(35) [$ns node]
$node_(35) set X_ 948
$node_(35) set Y_ 776
$ns initial_node_pos $node_(35) 20

#建立第36個Node
set node_(36) [$ns node]
$node_(36) set X_ 1141
$node_(36) set Y_ 1400
$ns initial_node_pos $node_(36) 20

#建立第37個Node
set node_(37) [$ns node]
$node_(37) set X_ 502
$node_(37) set Y_ 748
$ns initial_node_pos $node_(37) 20

#建立第38個Node
set node_(38) [$ns node]
$node_(38) set X_ 209
$node_(38) set Y_ 455
$ns initial_node_pos $node_(38) 20

#建立第39個Node
set node_(39) [$ns node]
$node_(39) set X_ 1339
$node_(39) set Y_ 425
$ns initial_node_pos $node_(39) 20

#建立第40個Node
set node_(40) [$ns node]
$node_(40) set X_ 1463
$node_(40) set Y_ 1306
$ns initial_node_pos $node_(40) 20

#建立第41個Node
set node_(41) [$ns node]
$node_(41) set X_ 823
$node_(41) set Y_ 30
$ns initial_node_pos $node_(41) 20

#建立第42個Node
set node_(42) [$ns node]
$node_(42) set X_ 43
$node_(42) set Y_ 617
$ns initial_node_pos $node_(42) 20

#建立第43個Node
set node_(43) [$ns node]
$node_(43) set X_ 1074
$node_(43) set Y_ 1308
$ns initial_node_pos $node_(43) 20

#建立第44個Node
set node_(44) [$ns node]
$node_(44) set X_ 609
$node_(44) set Y_ 653
$ns initial_node_pos $node_(44) 20

#建立第45個Node
set node_(45) [$ns node]
$node_(45) set X_ 1460
$node_(45) set Y_ 1495
$ns initial_node_pos $node_(45) 20

#建立第46個Node
set node_(46) [$ns node]
$node_(46) set X_ 734
$node_(46) set Y_ 486
$ns initial_node_pos $node_(46) 20

#建立第47個Node
set node_(47) [$ns node]
$node_(47) set X_ 495
$node_(47) set Y_ 260
$ns initial_node_pos $node_(47) 20

#建立第48個Node
set node_(48) [$ns node]
$node_(48) set X_ 34
$node_(48) set Y_ 1337
$ns initial_node_pos $node_(48) 20

#建立第49個Node
set node_(49) [$ns node]
$node_(49) set X_ 1172
$node_(49) set Y_ 379
$ns initial_node_pos $node_(49) 20

#建立第50個Node
set node_(50) [$ns node]
$node_(50) set X_ 1141
$node_(50) set Y_ 32
$ns initial_node_pos $node_(50) 20

#建立第51個Node
set node_(51) [$ns node]
$node_(51) set X_ 825
$node_(51) set Y_ 351
$ns initial_node_pos $node_(51) 20

#建立第52個Node
set node_(52) [$ns node]
$node_(52) set X_ 1290
$node_(52) set Y_ 56
$ns initial_node_pos $node_(52) 20

#建立第53個Node
set node_(53) [$ns node]
$node_(53) set X_ 1476
$node_(53) set Y_ 1113
$ns initial_node_pos $node_(53) 20

#建立第54個Node
set node_(54) [$ns node]
$node_(54) set X_ 127
$node_(54) set Y_ 983
$ns initial_node_pos $node_(54) 20

#建立第55個Node
set node_(55) [$ns node]
$node_(55) set X_ 1055
$node_(55) set Y_ 624
$ns initial_node_pos $node_(55) 20

#建立第56個Node
set node_(56) [$ns node]
$node_(56) set X_ 517
$node_(56) set Y_ 888
$ns initial_node_pos $node_(56) 20

#建立第57個Node
set node_(57) [$ns node]
$node_(57) set X_ 319
$node_(57) set Y_ 583
$ns initial_node_pos $node_(57) 20

#建立第58個Node
set node_(58) [$ns node]
$node_(58) set X_ 779
$node_(58) set Y_ 958
$ns initial_node_pos $node_(58) 20

#建立第59個Node
set node_(59) [$ns node]
$node_(59) set X_ 27
$node_(59) set Y_ 358
$ns initial_node_pos $node_(59) 20

#建立第60個Node
set node_(60) [$ns node]
$node_(60) set X_ 572
$node_(60) set Y_ 504
$ns initial_node_pos $node_(60) 20

#建立第61個Node
set node_(61) [$ns node]
$node_(61) set X_ 897
$node_(61) set Y_ 1329
$ns initial_node_pos $node_(61) 20

#建立第62個Node
set node_(62) [$ns node]
$node_(62) set X_ 239
$node_(62) set Y_ 777
$ns initial_node_pos $node_(62) 20

#建立第63個Node
set node_(63) [$ns node]
$node_(63) set X_ 1455
$node_(63) set Y_ 58
$ns initial_node_pos $node_(63) 20

#建立第64個Node
set node_(64) [$ns node]
$node_(64) set X_ 562
$node_(64) set Y_ 1474
$ns initial_node_pos $node_(64) 20

#建立第65個Node
set node_(65) [$ns node]
$node_(65) set X_ 667
$node_(65) set Y_ 1376
$ns initial_node_pos $node_(65) 20

#建立第66個Node
set node_(66) [$ns node]
$node_(66) set X_ 573
$node_(66) set Y_ 1013
$ns initial_node_pos $node_(66) 20

#建立第67個Node
set node_(67) [$ns node]
$node_(67) set X_ 811
$node_(67) set Y_ 1470
$ns initial_node_pos $node_(67) 20

#建立第68個Node
set node_(68) [$ns node]
$node_(68) set X_ 1079
$node_(68) set Y_ 183
$ns initial_node_pos $node_(68) 20

#建立第69個Node
set node_(69) [$ns node]
$node_(69) set X_ 283
$node_(69) set Y_ 304
$ns initial_node_pos $node_(69) 20

#建立第70個Node
set node_(70) [$ns node]
$node_(70) set X_ 481
$node_(70) set Y_ 65
$ns initial_node_pos $node_(70) 20

#建立第71個Node
set node_(71) [$ns node]
$node_(71) set X_ 260
$node_(71) set Y_ 962
$ns initial_node_pos $node_(71) 20

#建立第72個Node
set node_(72) [$ns node]
$node_(72) set X_ 1009
$node_(72) set Y_ 348
$ns initial_node_pos $node_(72) 20

#建立第73個Node
set node_(73) [$ns node]
$node_(73) set X_ 700
$node_(73) set Y_ 258
$ns initial_node_pos $node_(73) 20

#建立第74個Node
set node_(74) [$ns node]
$node_(74) set X_ 846
$node_(74) set Y_ 622
$ns initial_node_pos $node_(74) 20

#建立第75個Node
set node_(75) [$ns node]
$node_(75) set X_ 401
$node_(75) set Y_ 923
$ns initial_node_pos $node_(75) 20

#建立第76個Node
set node_(76) [$ns node]
$node_(76) set X_ 204
$node_(76) set Y_ 609
$ns initial_node_pos $node_(76) 20

#建立第77個Node
set node_(77) [$ns node]
$node_(77) set X_ 639
$node_(77) set Y_ 351
$ns initial_node_pos $node_(77) 20

#建立第78個Node
set node_(78) [$ns node]
$node_(78) set X_ 1251
$node_(78) set Y_ 232
$ns initial_node_pos $node_(78) 20

#建立第79個Node
set node_(79) [$ns node]
$node_(79) set X_ 1090
$node_(79) set Y_ 488
$ns initial_node_pos $node_(79) 20

#建立第80個Node
set node_(80) [$ns node]
$node_(80) set X_ 1430
$node_(80) set Y_ 274
$ns initial_node_pos $node_(80) 20

#建立第81個Node
set node_(81) [$ns node]
$node_(81) set X_ 90
$node_(81) set Y_ 60
$ns initial_node_pos $node_(81) 20

#建立第82個Node
set node_(82) [$ns node]
$node_(82) set X_ 904
$node_(82) set Y_ 244
$ns initial_node_pos $node_(82) 20

#建立第83個Node
set node_(83) [$ns node]
$node_(83) set X_ 1423
$node_(83) set Y_ 660
$ns initial_node_pos $node_(83) 20

#建立第84個Node
set node_(84) [$ns node]
$node_(84) set X_ 66
$node_(84) set Y_ 208
$ns initial_node_pos $node_(84) 20

#建立第85個Node
set node_(85) [$ns node]
$node_(85) set X_ 1357
$node_(85) set Y_ 1170
$ns initial_node_pos $node_(85) 20

#建立第86個Node
set node_(86) [$ns node]
$node_(86) set X_ 745
$node_(86) set Y_ 699
$ns initial_node_pos $node_(86) 20

#建立第87個Node
set node_(87) [$ns node]
$node_(87) set X_ 141
$node_(87) set Y_ 1188
$ns initial_node_pos $node_(87) 20

#建立第88個Node
set node_(88) [$ns node]
$node_(88) set X_ 36
$node_(88) set Y_ 851
$ns initial_node_pos $node_(88) 20

#建立第89個Node
set node_(89) [$ns node]
$node_(89) set X_ 695
$node_(89) set Y_ 1262
$ns initial_node_pos $node_(89) 20

#建立第90個Node
set node_(90) [$ns node]
$node_(90) set X_ 1323
$node_(90) set Y_ 844
$ns initial_node_pos $node_(90) 20

#建立第91個Node
set node_(91) [$ns node]
$node_(91) set X_ 888
$node_(91) set Y_ 874
$ns initial_node_pos $node_(91) 20

#建立第92個Node
set node_(92) [$ns node]
$node_(92) set X_ 399
$node_(92) set Y_ 477
$ns initial_node_pos $node_(92) 20

#建立第93個Node
set node_(93) [$ns node]
$node_(93) set X_ 420
$node_(93) set Y_ 1081
$ns initial_node_pos $node_(93) 20

#建立第94個Node
set node_(94) [$ns node]
$node_(94) set X_ 65
$node_(94) set Y_ 479
$ns initial_node_pos $node_(94) 20

#建立第95個Node
set node_(95) [$ns node]
$node_(95) set X_ 290
$node_(95) set Y_ 1123
$ns initial_node_pos $node_(95) 20

#建立第96個Node
set node_(96) [$ns node]
$node_(96) set X_ 622
$node_(96) set Y_ 1107
$ns initial_node_pos $node_(96) 20

#建立第97個Node
set node_(97) [$ns node]
$node_(97) set X_ 532
$node_(97) set Y_ 1202
$ns initial_node_pos $node_(97) 20

#建立第98個Node
set node_(98) [$ns node]
$node_(98) set X_ 411
$node_(98) set Y_ 365
$ns initial_node_pos $node_(98) 20

#建立第99個Node
set node_(99) [$ns node]
$node_(99) set X_ 237
$node_(99) set Y_ 69
$ns initial_node_pos $node_(99) 20

#===================================
#             產生Movement           
#===================================
set tz [lindex $argv 3]
# for 50% mobility i.e 50 nodes
$ns at 10.0 " $node_(0) setdest 1116.0 746.0 $tz " 
$ns at 10.0 " $node_(3) setdest 539.0 418.0 $tz " 
$ns at 10.0 " $node_(4) setdest 1481.0 197.0 $tz " 
$ns at 10.0 " $node_(5) setdest 1227.0 1351.0 $tz " 
$ns at 10.0 " $node_(6) setdest 430.0 679.0 $tz " 
$ns at 10.0 " $node_(7) setdest 158.0 72.0 $tz " 
$ns at 10.0 " $node_(8) setdest 1365.0 776.0 $tz " 
$ns at 10.0 " $node_(9) setdest 167.0 890.0 $tz " 
$ns at 10.0 " $node_(10) setdest 718.0 595.0 $tz " 
$ns at 10.0 " $node_(15) setdest 811.0 1102.0 $tz " 
$ns at 10.0 " $node_(17) setdest 81.0 1474.0 $tz " 
$ns at 10.0 " $node_(19) setdest 1490.0 709.0 $tz " 
$ns at 10.0 " $node_(20) setdest 486.0 1013.0 $tz " 
$ns at 10.0 " $node_(26) setdest 1397.0 1402.0 $tz " 
$ns at 10.0 " $node_(28) setdest 206.0 206.0 $tz " 
$ns at 10.0 " $node_(30) setdest 700.0 1483.0 $tz " 
$ns at 10.0 " $node_(33) setdest 1293.0 288.0 $tz " 
$ns at 10.0 " $node_(36) setdest 18.0 204.0 $tz " 
$ns at 10.0 " $node_(37) setdest 302.0 1276.0 $tz " 
$ns at 10.0 " $node_(40) setdest 209.0 1100.0 $tz " 
$ns at 10.0 " $node_(41) setdest 595.0 913.0 $tz " 
$ns at 10.0 " $node_(44) setdest 804.0 204.0 $tz " 
$ns at 10.0 " $node_(45) setdest 1009.0 1088.0 $tz " 
$ns at 10.0 " $node_(47) setdest 1167.0 574.0 $tz " 
$ns at 10.0 " $node_(48) setdest 1225.0 1188.0 $tz " 
$ns at 10.0 " $node_(50) setdest 783.0 1344.0 $tz " 
$ns at 10.0 " $node_(52) setdest 1490.0 858.0 $tz " 
$ns at 10.0 " $node_(53) setdest 23.0 769.0 $tz " 
$ns at 10.0 " $node_(57) setdest 579.0 209.0 $tz " 
$ns at 10.0 " $node_(59) setdest 51.0 1244.0 $tz " 
$ns at 10.0 " $node_(61) setdest 976.0 544.0 $tz " 
$ns at 10.0 " $node_(64) setdest 909.0 674.0 $tz " 
$ns at 10.0 " $node_(67) setdest 881.0 37.0 $tz " 
$ns at 10.0 " $node_(70) setdest 286.0 1383.0 $tz " 
$ns at 10.0 " $node_(71) setdest 158.0 344.0 $tz " 
$ns at 10.0 " $node_(72) setdest 418.0 1490.0 $tz " 
$ns at 10.0 " $node_(73) setdest 1393.0 565.0 $tz " 
$ns at 10.0 " $node_(74) setdest 1448.0 983.0 $tz " 
$ns at 10.0 " $node_(78) setdest 367.0 81.0 $tz " 
$ns at 10.0 " $node_(79) setdest 125.0 727.0 $tz " 
$ns at 10.0 " $node_(81) setdest 186.0 1218.0 $tz " 
$ns at 10.0 " $node_(84) setdest 281.0 479.0 $tz " 
$ns at 10.0 " $node_(85) setdest 755.0 874.0 $tz " 
$ns at 10.0 " $node_(86) setdest 960.0 1265.0 $tz " 
$ns at 10.0 " $node_(87) setdest 937.0 183.0 $tz " 
$ns at 10.0 " $node_(88) setdest 686.0 758.0 $tz " 
$ns at 10.0 " $node_(91) setdest 997.0 1372.0 $tz " 
$ns at 10.0 " $node_(92) setdest 1220.0 1086.0 $tz " 
$ns at 10.0 " $node_(94) setdest 653.0 958.0 $tz " 
$ns at 10.0 " $node_(99) setdest 383.0 830.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(33) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(6) $null0
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