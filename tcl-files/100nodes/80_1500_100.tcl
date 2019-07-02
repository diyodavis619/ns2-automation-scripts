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
set val(nn)     80           ;# number of mobilenodes
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
$node_(0) set X_ 194
$node_(0) set Y_ 1410
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 789
$node_(1) set Y_ 71
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 1086
$node_(2) set Y_ 1325
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 104
$node_(3) set Y_ 538
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 1246
$node_(4) set Y_ 263
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 715
$node_(5) set Y_ 1216
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1388
$node_(6) set Y_ 1141
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 404
$node_(7) set Y_ 261
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 468
$node_(8) set Y_ 1381
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 718
$node_(9) set Y_ 71
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 616
$node_(10) set Y_ 1158
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 36
$node_(11) set Y_ 571
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 531
$node_(12) set Y_ 266
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 1371
$node_(13) set Y_ 499
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1004
$node_(14) set Y_ 511
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 41
$node_(15) set Y_ 135
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 340
$node_(16) set Y_ 821
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 656
$node_(17) set Y_ 1470
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 1155
$node_(18) set Y_ 1151
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 423
$node_(19) set Y_ 1423
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 51
$node_(20) set Y_ 1110
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 88
$node_(21) set Y_ 54
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 891
$node_(22) set Y_ 70
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 868
$node_(23) set Y_ 894
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 446
$node_(24) set Y_ 63
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 961
$node_(25) set Y_ 75
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 41
$node_(26) set Y_ 78
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 783
$node_(27) set Y_ 221
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 251
$node_(28) set Y_ 1078
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 841
$node_(29) set Y_ 765
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 1051
$node_(30) set Y_ 453
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 894
$node_(31) set Y_ 1043
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 36
$node_(32) set Y_ 758
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 48
$node_(33) set Y_ 300
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 281
$node_(34) set Y_ 321
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 211
$node_(35) set Y_ 161
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 484
$node_(36) set Y_ 1255
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 45
$node_(37) set Y_ 1325
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 541
$node_(38) set Y_ 71
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 531
$node_(39) set Y_ 1343
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 124
$node_(40) set Y_ 726
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 879
$node_(41) set Y_ 280
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 119
$node_(42) set Y_ 303
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 941
$node_(43) set Y_ 1465
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 40
$node_(44) set Y_ 626
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 1338
$node_(45) set Y_ 595
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 690
$node_(46) set Y_ 1323
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 670
$node_(47) set Y_ 394
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 866
$node_(48) set Y_ 1156
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 40
$node_(49) set Y_ 946
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 223
$node_(50) set Y_ 478
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 1421
$node_(51) set Y_ 1308
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 738
$node_(52) set Y_ 708
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 206
$node_(53) set Y_ 1290
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 1151
$node_(54) set Y_ 81
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 833
$node_(55) set Y_ 1365
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 1171
$node_(56) set Y_ 655
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 228
$node_(57) set Y_ 556
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 1213
$node_(58) set Y_ 90
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 338
$node_(59) set Y_ 58
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 63
$node_(60) set Y_ 355
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 356
$node_(61) set Y_ 1463
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 1350
$node_(62) set Y_ 696
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 871
$node_(63) set Y_ 528
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 1046
$node_(64) set Y_ 818
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 1426
$node_(65) set Y_ 1386
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 1341
$node_(66) set Y_ 821
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 438
$node_(67) set Y_ 758
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 1110
$node_(68) set Y_ 209
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 558
$node_(69) set Y_ 491
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 496
$node_(70) set Y_ 976
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 123
$node_(71) set Y_ 844
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 1321
$node_(72) set Y_ 923
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 219
$node_(73) set Y_ 690
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 65
$node_(74) set Y_ 1476
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 665
$node_(75) set Y_ 946
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 735
$node_(76) set Y_ 520
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 43
$node_(77) set Y_ 463
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 1280
$node_(78) set Y_ 1131
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 1326
$node_(79) set Y_ 1456
$ns initial_node_pos $node_(79) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 1100.0 1261.0 $tz " 
$ns at 10.0 " $node_(1) setdest 725.0 454.0 $tz " 
$ns at 10.0 " $node_(2) setdest 458.0 946.0 $tz " 
$ns at 10.0 " $node_(3) setdest 1160.0 899.0 $tz " 
$ns at 10.0 " $node_(4) setdest 601.0 926.0 $tz " 
$ns at 10.0 " $node_(5) setdest 128.0 496.0 $tz " 
$ns at 10.0 " $node_(6) setdest 698.0 1470.0 $tz " 
$ns at 10.0 " $node_(7) setdest 829.0 1485.0 $tz " 
$ns at 10.0 " $node_(8) setdest 206.0 1018.0 $tz " 
$ns at 10.0 " $node_(9) setdest 626.0 328.0 $tz " 
$ns at 10.0 " $node_(10) setdest 959.0 29.0 $tz " 
$ns at 10.0 " $node_(11) setdest 244.0 1495.0 $tz " 
$ns at 10.0 " $node_(12) setdest 1101.0 1146.0 $tz " 
$ns at 10.0 " $node_(13) setdest 605.0 419.0 $tz " 
$ns at 10.0 " $node_(14) setdest 431.0 290.0 $tz " 
$ns at 10.0 " $node_(15) setdest 1231.0 1360.0 $tz " 
$ns at 10.0 " $node_(16) setdest 595.0 1243.0 $tz " 
$ns at 10.0 " $node_(17) setdest 1473.0 926.0 $tz " 
$ns at 10.0 " $node_(18) setdest 698.0 341.0 $tz " 
$ns at 10.0 " $node_(19) setdest 368.0 1001.0 $tz " 
$ns at 10.0 " $node_(20) setdest 1381.0 124.0 $tz " 
$ns at 10.0 " $node_(21) setdest 1201.0 436.0 $tz " 
$ns at 10.0 " $node_(22) setdest 1205.0 565.0 $tz " 
$ns at 10.0 " $node_(23) setdest 310.0 713.0 $tz " 
$ns at 10.0 " $node_(24) setdest 1100.0 29.0 $tz " 
$ns at 10.0 " $node_(25) setdest 168.0 214.0 $tz " 
$ns at 10.0 " $node_(26) setdest 958.0 375.0 $tz " 
$ns at 10.0 " $node_(27) setdest 1201.0 981.0 $tz " 
$ns at 10.0 " $node_(28) setdest 1033.0 823.0 $tz " 
$ns at 10.0 " $node_(29) setdest 316.0 563.0 $tz " 
$ns at 10.0 " $node_(30) setdest 315.0 1385.0 $tz " 
$ns at 10.0 " $node_(31) setdest 506.0 598.0 $tz " 
$ns at 10.0 " $node_(32) setdest 1193.0 1058.0 $tz " 
$ns at 10.0 " $node_(33) setdest 908.0 690.0 $tz " 
$ns at 10.0 " $node_(34) setdest 350.0 1175.0 $tz " 
$ns at 10.0 " $node_(35) setdest 509.0 1320.0 $tz " 
$ns at 10.0 " $node_(36) setdest 146.0 641.0 $tz " 
$ns at 10.0 " $node_(37) setdest 398.0 373.0 $tz " 
$ns at 10.0 " $node_(38) setdest 1110.0 593.0 $tz " 
$ns at 10.0 " $node_(39) setdest 1140.0 693.0 $tz " 
$ns at 10.0 " $node_(40) setdest 784.0 33.0 $tz " 
$ns at 10.0 " $node_(41) setdest 1493.0 1455.0 $tz " 
$ns at 10.0 " $node_(42) setdest 368.0 11.0 $tz " 
$ns at 10.0 " $node_(43) setdest 1001.0 578.0 $tz " 
$ns at 10.0 " $node_(44) setdest 1133.0 1473.0 $tz " 
$ns at 10.0 " $node_(45) setdest 21.0 1298.0 $tz " 
$ns at 10.0 " $node_(46) setdest 771.0 493.0 $tz " 
$ns at 10.0 " $node_(47) setdest 1253.0 901.0 $tz " 
$ns at 10.0 " $node_(48) setdest 715.0 208.0 $tz " 
$ns at 10.0 " $node_(49) setdest 944.0 799.0 $tz " 
$ns at 10.0 " $node_(50) setdest 1009.0 1096.0 $tz " 
$ns at 10.0 " $node_(51) setdest 853.0 1191.0 $tz " 
$ns at 10.0 " $node_(52) setdest 361.0 45.0 $tz " 
$ns at 10.0 " $node_(53) setdest 1173.0 778.0 $tz " 
$ns at 10.0 " $node_(54) setdest 1321.0 779.0 $tz " 
$ns at 10.0 " $node_(55) setdest 721.0 869.0 $tz " 
$ns at 10.0 " $node_(56) setdest 343.0 310.0 $tz " 
$ns at 10.0 " $node_(57) setdest 650.0 613.0 $tz " 
$ns at 10.0 " $node_(58) setdest 389.0 123.0 $tz " 
$ns at 10.0 " $node_(59) setdest 209.0 439.0 $tz " 
$ns at 10.0 " $node_(60) setdest 773.0 1303.0 $tz " 
$ns at 10.0 " $node_(61) setdest 471.0 1008.0 $tz " 
$ns at 10.0 " $node_(62) setdest 21.0 183.0 $tz " 
$ns at 10.0 " $node_(63) setdest 18.0 1113.0 $tz " 
$ns at 10.0 " $node_(64) setdest 666.0 758.0 $tz " 
$ns at 10.0 " $node_(65) setdest 373.0 503.0 $tz " 
$ns at 10.0 " $node_(66) setdest 138.0 898.0 $tz " 
$ns at 10.0 " $node_(67) setdest 521.0 438.0 $tz " 
$ns at 10.0 " $node_(68) setdest 203.0 1101.0 $tz " 
$ns at 10.0 " $node_(69) setdest 40.0 23.0 $tz " 
$ns at 10.0 " $node_(70) setdest 141.0 1270.0 $tz " 
$ns at 10.0 " $node_(71) setdest 641.0 1383.0 $tz " 
$ns at 10.0 " $node_(72) setdest 909.0 201.0 $tz " 
$ns at 10.0 " $node_(73) setdest 1488.0 1303.0 $tz " 
$ns at 10.0 " $node_(74) setdest 351.0 1265.0 $tz " 
$ns at 10.0 " $node_(75) setdest 503.0 356.0 $tz " 
$ns at 10.0 " $node_(76) setdest 24.0 1463.0 $tz " 
$ns at 10.0 " $node_(77) setdest 788.0 1091.0 $tz " 
$ns at 10.0 " $node_(78) setdest 421.0 703.0 $tz " 
$ns at 10.0 " $node_(79) setdest 851.0 458.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(32) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(7) $null0
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