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
set val(x)      1000                       ;# X dimension of topography
set val(y)      1000                       ;# Y dimension of topography
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
$node_(0) set X_ 970
$node_(0) set Y_ 896
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 430
$node_(1) set Y_ 973
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 568
$node_(2) set Y_ 740
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 988
$node_(3) set Y_ 836
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 470
$node_(4) set Y_ 509
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 430
$node_(5) set Y_ 67
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 683
$node_(6) set Y_ 86
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 77
$node_(7) set Y_ 539
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 230
$node_(8) set Y_ 129
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 549
$node_(9) set Y_ 258
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 75
$node_(10) set Y_ 796
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 505
$node_(11) set Y_ 632
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 973
$node_(12) set Y_ 407
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 830
$node_(13) set Y_ 679
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 501
$node_(14) set Y_ 960
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 156
$node_(15) set Y_ 530
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 747
$node_(16) set Y_ 329
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 45
$node_(17) set Y_ 869
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 202
$node_(18) set Y_ 679
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 724
$node_(19) set Y_ 761
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 328
$node_(20) set Y_ 964
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 381
$node_(21) set Y_ 359
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 680
$node_(22) set Y_ 162
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 9
$node_(23) set Y_ 952
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 14
$node_(24) set Y_ 702
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 447
$node_(25) set Y_ 392
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 819
$node_(26) set Y_ 231
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 731
$node_(27) set Y_ 678
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 441
$node_(28) set Y_ 162
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 84
$node_(29) set Y_ 452
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 245
$node_(30) set Y_ 250
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 907
$node_(31) set Y_ 496
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 901
$node_(32) set Y_ 396
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 58
$node_(33) set Y_ 332
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 777
$node_(34) set Y_ 592
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 139
$node_(35) set Y_ 825
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 256
$node_(36) set Y_ 562
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 706
$node_(37) set Y_ 887
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 322
$node_(38) set Y_ 764
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 564
$node_(39) set Y_ 915
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 425
$node_(40) set Y_ 898
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 59
$node_(41) set Y_ 130
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 814
$node_(42) set Y_ 387
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 345
$node_(43) set Y_ 454
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 492
$node_(44) set Y_ 705
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(46) [$ns node]
$node_(46) set X_ 64
$node_(46) set Y_ 9
$ns initial_node_pos $node_(46) 20

#???46?Node
set node_(47) [$ns node]
$node_(47) set X_ 47
$node_(47) set Y_ 579
$ns initial_node_pos $node_(47) 20

#???47?Node
set node_(48) [$ns node]
$node_(48) set X_ 661
$node_(48) set Y_ 973
$ns initial_node_pos $node_(48) 20

#???48?Node
set node_(49) [$ns node]
$node_(49) set X_ 500
$node_(49) set Y_ 824
$ns initial_node_pos $node_(49) 20

#???49?Node
set node_(50) [$ns node]
$node_(50) set X_ 646
$node_(50) set Y_ 309
$ns initial_node_pos $node_(50) 20

#???50?Node
set node_(51) [$ns node]
$node_(51) set X_ 149
$node_(51) set Y_ 147
$ns initial_node_pos $node_(51) 20

#???51?Node
set node_(52) [$ns node]
$node_(52) set X_ 704
$node_(52) set Y_ 532
$ns initial_node_pos $node_(52) 20

#???52?Node
set node_(53) [$ns node]
$node_(53) set X_ 530
$node_(53) set Y_ 113
$ns initial_node_pos $node_(53) 20

#???53?Node
set node_(54) [$ns node]
$node_(54) set X_ 156
$node_(54) set Y_ 39
$ns initial_node_pos $node_(54) 20

#???54?Node
set node_(55) [$ns node]
$node_(55) set X_ 647
$node_(55) set Y_ 762
$ns initial_node_pos $node_(55) 20

#???55?Node
set node_(56) [$ns node]
$node_(56) set X_ 899
$node_(56) set Y_ 220
$ns initial_node_pos $node_(56) 20

#???56?Node
set node_(57) [$ns node]
$node_(57) set X_ 18
$node_(57) set Y_ 376
$ns initial_node_pos $node_(57) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 607
$node_(58) set Y_ 43
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 506
$node_(59) set Y_ 1
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 8
$node_(60) set Y_ 587
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 203
$node_(61) set Y_ 452
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 533
$node_(62) set Y_ 372
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 960
$node_(63) set Y_ 669
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 952
$node_(64) set Y_ 178
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 61
$node_(65) set Y_ 958
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(67) [$ns node]
$node_(67) set X_ 375
$node_(67) set Y_ 590
$ns initial_node_pos $node_(67) 20

#???66?Node
set node_(68) [$ns node]
$node_(68) set X_ 716
$node_(68) set Y_ 418
$ns initial_node_pos $node_(68) 20

#???67?Node
set node_(69) [$ns node]
$node_(69) set X_ 875
$node_(69) set Y_ 949
$ns initial_node_pos $node_(69) 20

#???68?Node
set node_(70) [$ns node]
$node_(70) set X_ 806
$node_(70) set Y_ 946
$ns initial_node_pos $node_(70) 20

#???69?Node
set node_(71) [$ns node]
$node_(71) set X_ 954
$node_(71) set Y_ 567
$ns initial_node_pos $node_(71) 20

#???70?Node
set node_(72) [$ns node]
$node_(72) set X_ 65
$node_(72) set Y_ 223
$ns initial_node_pos $node_(72) 20

#???71?Node
set node_(73) [$ns node]
$node_(73) set X_ 300
$node_(73) set Y_ 350
$ns initial_node_pos $node_(73) 20

#???72?Node
set node_(74) [$ns node]
$node_(74) set X_ 315
$node_(74) set Y_ 657
$ns initial_node_pos $node_(74) 20

#???73?Node
set node_(75) [$ns node]
$node_(75) set X_ 399
$node_(75) set Y_ 253
$ns initial_node_pos $node_(75) 20

#???74?Node
set node_(76) [$ns node]
$node_(76) set X_ 808
$node_(76) set Y_ 860
$ns initial_node_pos $node_(76) 20

#???75?Node
set node_(77) [$ns node]
$node_(77) set X_ 951
$node_(77) set Y_ 965
$ns initial_node_pos $node_(77) 20

#???76?Node
set node_(78) [$ns node]
$node_(78) set X_ 888
$node_(78) set Y_ 819
$ns initial_node_pos $node_(78) 20

#???77?Node
set node_(79) [$ns node]
$node_(79) set X_ 547
$node_(79) set Y_ 571
$ns initial_node_pos $node_(79) 20

#???78?Node
set node_(80) [$ns node]
$node_(80) set X_ 612
$node_(80) set Y_ 831
$ns initial_node_pos $node_(80) 20

#???79?Node
set node_(81) [$ns node]
$node_(81) set X_ 622
$node_(81) set Y_ 658
$ns initial_node_pos $node_(81) 20

#???80?Node
set node_(82) [$ns node]
$node_(82) set X_ 237
$node_(82) set Y_ 859
$ns initial_node_pos $node_(82) 20

#???81?Node
set node_(83) [$ns node]
$node_(83) set X_ 635
$node_(83) set Y_ 452
$ns initial_node_pos $node_(83) 20

#???82?Node
set node_(84) [$ns node]
$node_(84) set X_ 343
$node_(84) set Y_ 858
$ns initial_node_pos $node_(84) 20

#???83?Node
set node_(85) [$ns node]
$node_(85) set X_ 828
$node_(85) set Y_ 754
$ns initial_node_pos $node_(85) 20

#???84?Node
set node_(86) [$ns node]
$node_(86) set X_ 332
$node_(86) set Y_ 94
$ns initial_node_pos $node_(86) 20

#???85?Node
set node_(87) [$ns node]
$node_(87) set X_ 254
$node_(87) set Y_ 700
$ns initial_node_pos $node_(87) 20

#???86?Node
set node_(88) [$ns node]
$node_(88) set X_ 130
$node_(88) set Y_ 722
$ns initial_node_pos $node_(88) 20

#???87?Node
set node_(89) [$ns node]
$node_(89) set X_ 533
$node_(89) set Y_ 457
$ns initial_node_pos $node_(89) 20

#???88?Node
set node_(90) [$ns node]
$node_(90) set X_ 218
$node_(90) set Y_ 971
$ns initial_node_pos $node_(90) 20

#???89?Node
set node_(91) [$ns node]
$node_(91) set X_ 690
$node_(91) set Y_ 616
$ns initial_node_pos $node_(91) 20

#???90?Node
set node_(92) [$ns node]
$node_(92) set X_ 805
$node_(92) set Y_ 82
$ns initial_node_pos $node_(92) 20

#???91?Node
set node_(93) [$ns node]
$node_(93) set X_ 828
$node_(93) set Y_ 488
$ns initial_node_pos $node_(93) 20

#???92?Node
set node_(94) [$ns node]
$node_(94) set X_ 879
$node_(94) set Y_ 599
$ns initial_node_pos $node_(94) 20

#???93?Node
set node_(95) [$ns node]
$node_(95) set X_ 400
$node_(95) set Y_ 696
$ns initial_node_pos $node_(95) 20

#???94?Node
set node_(96) [$ns node]
$node_(96) set X_ 176
$node_(96) set Y_ 346
$ns initial_node_pos $node_(96) 20

#???95?Node
set node_(97) [$ns node]
$node_(97) set X_ 135
$node_(97) set Y_ 614
$ns initial_node_pos $node_(97) 20

#???96?Node
set node_(99) [$ns node]
$node_(99) set X_ 947
$node_(99) set Y_ 757
$ns initial_node_pos $node_(99) 20

#???97?Node
set node_(100) [$ns node]
$node_(100) set X_ 898
$node_(100) set Y_ 316
$ns initial_node_pos $node_(100) 20

#???98?Node
set node_(101) [$ns node]
$node_(101) set X_ 696
$node_(101) set Y_ 584
$ns initial_node_pos $node_(101) 20

#???99?Node
set node_(102) [$ns node]
$node_(102) set X_ 705
$node_(102) set Y_ 791
$ns initial_node_pos $node_(102) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 79.0 903.0 $tz " 
$ns at 10.0 " $node_(3) setdest 13.0 249.0 $tz " 
$ns at 10.0 " $node_(4) setdest 945.0 615.0 $tz " 
$ns at 10.0 " $node_(5) setdest 362.0 986.0 $tz " 
$ns at 10.0 " $node_(10) setdest 956.0 277.0 $tz " 
$ns at 10.0 " $node_(17) setdest 690.0 198.0 $tz " 
$ns at 10.0 " $node_(19) setdest 786.0 37.0 $tz " 
$ns at 10.0 " $node_(21) setdest 501.0 947.0 $tz " 
$ns at 10.0 " $node_(24) setdest 875.0 28.0 $tz " 
$ns at 10.0 " $node_(26) setdest 30.0 486.0 $tz " 
$ns at 10.0 " $node_(31) setdest 115.0 373.0 $tz " 
$ns at 10.0 " $node_(33) setdest 890.0 449.0 $tz " 
$ns at 10.0 " $node_(35) setdest 400.0 128.0 $tz " 
$ns at 10.0 " $node_(41) setdest 758.0 935.0 $tz " 
$ns at 10.0 " $node_(44) setdest 171.0 111.0 $tz " 
$ns at 10.0 " $node_(48) setdest 239.0 41.0 $tz " 
$ns at 1.0 " $node_(52) setdest 92.0 992.0 $tz " 
$ns at 10.0 " $node_(56) setdest 88.0 254.0 $tz " 
$ns at 10.0 " $node_(63) setdest 64.0 688.0 $tz " 
$ns at 10.0 " $node_(65) setdest 867.0 111.0 $tz " 
$ns at 10.0 " $node_(72) setdest 883.0 133.0 $tz " 
$ns at 10.0 " $node_(77) setdest 15.0 539.0 $tz " 
$ns at 10.0 " $node_(78) setdest 341.0 216.0 $tz " 
$ns at 10.0 " $node_(80) setdest 618.0 103.0 $tz " 
$ns at 10.0 " $node_(90) setdest 600.0 122.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(56) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(48) $null0
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