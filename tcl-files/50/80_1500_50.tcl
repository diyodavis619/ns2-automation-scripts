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
$node_(0) set X_ 1221
$node_(0) set Y_ 384
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 836
$node_(1) set Y_ 370
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 421
$node_(2) set Y_ 1028
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 336
$node_(3) set Y_ 1446
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 941
$node_(4) set Y_ 241
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 612
$node_(5) set Y_ 957
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 1338
$node_(6) set Y_ 751
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 1105
$node_(7) set Y_ 1331
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 746
$node_(8) set Y_ 1252
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 1056
$node_(9) set Y_ 1238
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 45
$node_(10) set Y_ 1352
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 38
$node_(11) set Y_ 756
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 720
$node_(12) set Y_ 36
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 492
$node_(13) set Y_ 1376
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 1081
$node_(14) set Y_ 561
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 151
$node_(15) set Y_ 756
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 499
$node_(16) set Y_ 876
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 280
$node_(17) set Y_ 1275
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 618
$node_(18) set Y_ 756
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 951
$node_(19) set Y_ 956
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 401
$node_(20) set Y_ 904
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 1118
$node_(21) set Y_ 304
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 1233
$node_(22) set Y_ 508
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 1120
$node_(23) set Y_ 700
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 563
$node_(24) set Y_ 605
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 229
$node_(25) set Y_ 863
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 1233
$node_(26) set Y_ 173
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 879
$node_(27) set Y_ 1455
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 265
$node_(28) set Y_ 1085
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 214
$node_(29) set Y_ 295
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 545
$node_(30) set Y_ 438
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 186
$node_(31) set Y_ 1285
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 753
$node_(32) set Y_ 1383
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 1316
$node_(33) set Y_ 950
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 444
$node_(34) set Y_ 120
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 913
$node_(35) set Y_ 1168
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 745
$node_(36) set Y_ 914
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 1131
$node_(37) set Y_ 945
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 583
$node_(38) set Y_ 1228
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 80
$node_(39) set Y_ 595
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 581
$node_(40) set Y_ 310
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 1113
$node_(41) set Y_ 1450
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 1458
$node_(42) set Y_ 771
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 670
$node_(43) set Y_ 1078
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 1210
$node_(44) set Y_ 843
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 343
$node_(45) set Y_ 228
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 1233
$node_(46) set Y_ 1230
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 151
$node_(47) set Y_ 1068
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 355
$node_(48) set Y_ 615
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 601
$node_(49) set Y_ 1463
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 1461
$node_(50) set Y_ 68
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 49
$node_(51) set Y_ 310
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 855
$node_(52) set Y_ 1038
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 67
$node_(53) set Y_ 1206
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 467
$node_(54) set Y_ 1257
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 736
$node_(55) set Y_ 1125
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 214
$node_(56) set Y_ 463
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 1453
$node_(57) set Y_ 321
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 365
$node_(58) set Y_ 429
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 1433
$node_(59) set Y_ 1136
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 898
$node_(60) set Y_ 1296
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 548
$node_(61) set Y_ 1115
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 350
$node_(62) set Y_ 1111
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 1028
$node_(63) set Y_ 816
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 1243
$node_(64) set Y_ 1461
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 1099
$node_(65) set Y_ 1089
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 59
$node_(66) set Y_ 443
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 42
$node_(67) set Y_ 918
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 111
$node_(68) set Y_ 1436
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 761
$node_(69) set Y_ 648
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 216
$node_(70) set Y_ 630
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 254
$node_(71) set Y_ 66
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 333
$node_(72) set Y_ 748
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 483
$node_(73) set Y_ 738
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 746
$node_(74) set Y_ 773
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 109
$node_(76) set Y_ 131
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 879
$node_(77) set Y_ 784
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 933
$node_(78) set Y_ 636
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(79) [$ns node]
$node_(79) set X_ 1121
$node_(79) set Y_ 95
$ns initial_node_pos $node_(79) 20

#???79?Node
set node_(80) [$ns node]
$node_(80) set X_ 669
$node_(80) set Y_ 919
$ns initial_node_pos $node_(80) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 646.0 566.0 $tz " 
$ns at 10.0 " $node_(3) setdest 1396.0 383.0 $tz " 
$ns at 10.0 " $node_(6) setdest 35.0 681.0 $tz " 
$ns at 10.0 " $node_(9) setdest 1096.0 801.0 $tz " 
$ns at 10.0 " $node_(10) setdest 1381.0 1405.0 $tz " 
$ns at 10.0 " $node_(12) setdest 271.0 1358.0 $tz " 
$ns at 10.0 " $node_(13) setdest 909.0 1106.0 $tz " 
$ns at 10.0 " $node_(17) setdest 839.0 155.0 $tz " 
$ns at 10.0 " $node_(18) setdest 1283.0 93.0 $tz " 
$ns at 10.0 " $node_(23) setdest 818.0 1436.0 $tz " 
$ns at 10.0 " $node_(24) setdest 421.0 36.0 $tz " 
$ns at 10.0 " $node_(26) setdest 384.0 1243.0 $tz " 
$ns at 10.0 " $node_(27) setdest 1468.0 565.0 $tz " 
$ns at 10.0 " $node_(28) setdest 1345.0 1083.0 $tz " 
$ns at 10.0 " $node_(33) setdest 278.0 133.0 $tz " 
$ns at 10.0 " $node_(39) setdest 618.0 846.0 $tz " 
$ns at 10.0 " $node_(40) setdest 399.0 1345.0 $tz " 
$ns at 10.0 " $node_(41) setdest 96.0 451.0 $tz " 
$ns at 10.0 " $node_(42) setdest 663.0 90.0 $tz " 
$ns at 10.0 " $node_(44) setdest 941.0 54.0 $tz " 
$ns at 10.0 " $node_(46) setdest 610.0 268.0 $tz " 
$ns at 10.0 " $node_(47) setdest 1225.0 991.0 $tz " 
$ns at 10.0 " $node_(49) setdest 833.0 620.0 $tz " 
$ns at 10.0 " $node_(50) setdest 786.0 226.0 $tz " 
$ns at 10.0 " $node_(51) setdest 1266.0 260.0 $tz " 
$ns at 10.0 " $node_(52) setdest 556.0 71.0 $tz " 
$ns at 10.0 " $node_(53) setdest 503.0 88.0 $tz " 
$ns at 10.0 " $node_(55) setdest 1408.0 1340.0 $tz " 
$ns at 10.0 " $node_(57) setdest 48.0 51.0 $tz " 
$ns at 10.0 " $node_(58) setdest 135.0 1263.0 $tz " 
$ns at 10.0 " $node_(59) setdest 190.0 253.0 $tz " 
$ns at 10.0 " $node_(62) setdest 290.0 378.0 $tz " 
$ns at 10.0 " $node_(63) setdest 516.0 1021.0 $tz " 
$ns at 10.0 " $node_(64) setdest 1110.0 406.0 $tz " 
$ns at 10.0 " $node_(65) setdest 1043.0 46.0 $tz " 
$ns at 10.0 " $node_(67) setdest 1255.0 611.0 $tz " 
$ns at 10.0 " $node_(68) setdest 1425.0 896.0 $tz " 
$ns at 10.0 " $node_(74) setdest 418.0 471.0 $tz " 
$ns at 10.0 " $node_(77) setdest 466.0 1465.0 $tz " 
$ns at 10.0 " $node_(79) setdest 143.0 861.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(67) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(52) $null0
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