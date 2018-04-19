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
$node_(0) set X_ 175
$node_(0) set Y_ 541
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 522
$node_(1) set Y_ 252
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 777
$node_(2) set Y_ 40
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 938
$node_(3) set Y_ 777
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 683
$node_(4) set Y_ 33
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 628
$node_(5) set Y_ 515
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 728
$node_(6) set Y_ 344
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 911
$node_(7) set Y_ 503
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 563
$node_(8) set Y_ 94
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 184
$node_(9) set Y_ 804
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 824
$node_(10) set Y_ 396
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 273
$node_(11) set Y_ 656
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 76
$node_(12) set Y_ 972
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 634
$node_(13) set Y_ 41
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 904
$node_(14) set Y_ 781
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 544
$node_(15) set Y_ 352
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 728
$node_(16) set Y_ 222
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 774
$node_(17) set Y_ 773
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 143
$node_(18) set Y_ 840
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 914
$node_(19) set Y_ 111
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 0
$node_(20) set Y_ 429
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 620
$node_(21) set Y_ 160
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 473
$node_(22) set Y_ 470
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 255
$node_(23) set Y_ 316
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 955
$node_(24) set Y_ 926
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 216
$node_(25) set Y_ 443
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 485
$node_(26) set Y_ 763
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 178
$node_(27) set Y_ 255
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 433
$node_(28) set Y_ 181
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 991
$node_(29) set Y_ 434
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 838
$node_(30) set Y_ 803
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 94
$node_(31) set Y_ 646
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 323
$node_(32) set Y_ 791
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 541
$node_(33) set Y_ 628
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 115
$node_(34) set Y_ 37
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 745
$node_(35) set Y_ 570
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 615
$node_(36) set Y_ 933
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 500
$node_(37) set Y_ 679
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 335
$node_(38) set Y_ 180
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 66
$node_(39) set Y_ 103
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 447
$node_(40) set Y_ 318
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 26
$node_(41) set Y_ 309
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 637
$node_(42) set Y_ 409
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 90
$node_(43) set Y_ 923
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 373
$node_(44) set Y_ 950
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 458
$node_(45) set Y_ 839
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 410
$node_(46) set Y_ 614
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 777
$node_(47) set Y_ 920
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 688
$node_(48) set Y_ 743
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 595
$node_(49) set Y_ 758
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 278
$node_(50) set Y_ 95
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 18
$node_(51) set Y_ 658
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 603
$node_(52) set Y_ 278
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 121
$node_(53) set Y_ 433
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 686
$node_(54) set Y_ 271
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 314
$node_(55) set Y_ 884
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 354
$node_(56) set Y_ 284
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 888
$node_(57) set Y_ 370
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 37
$node_(58) set Y_ 941
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 67
$node_(59) set Y_ 399
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 940
$node_(60) set Y_ 666
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 141
$node_(61) set Y_ 103
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 431
$node_(62) set Y_ 429
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 69
$node_(63) set Y_ 752
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 982
$node_(64) set Y_ 181
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 248
$node_(65) set Y_ 146
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 637
$node_(66) set Y_ 867
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 880
$node_(67) set Y_ 78
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 39
$node_(68) set Y_ 513
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 724
$node_(69) set Y_ 849
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 750
$node_(70) set Y_ 116
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 320
$node_(71) set Y_ 392
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 262
$node_(72) set Y_ 949
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 875
$node_(73) set Y_ 888
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 378
$node_(74) set Y_ 356
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 686
$node_(75) set Y_ 645
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 566
$node_(76) set Y_ 4
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 340
$node_(77) set Y_ 475
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 138
$node_(78) set Y_ 682
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 888
$node_(79) set Y_ 564
$ns initial_node_pos $node_(79) 20

#???80?Node
set node_(80) [$ns node]
$node_(80) set X_ 757
$node_(80) set Y_ 499
$ns initial_node_pos $node_(80) 20

#???81?Node
set node_(81) [$ns node]
$node_(81) set X_ 262
$node_(81) set Y_ 598
$ns initial_node_pos $node_(81) 20

#???82?Node
set node_(82) [$ns node]
$node_(82) set X_ 519
$node_(82) set Y_ 204
$ns initial_node_pos $node_(82) 20

#???83?Node
set node_(83) [$ns node]
$node_(83) set X_ 509
$node_(83) set Y_ 950
$ns initial_node_pos $node_(83) 20

#???84?Node
set node_(84) [$ns node]
$node_(84) set X_ 850
$node_(84) set Y_ 258
$ns initial_node_pos $node_(84) 20

#???85?Node
set node_(85) [$ns node]
$node_(85) set X_ 19
$node_(85) set Y_ 792
$ns initial_node_pos $node_(85) 20

#???86?Node
set node_(86) [$ns node]
$node_(86) set X_ 539
$node_(86) set Y_ 522
$ns initial_node_pos $node_(86) 20

#???87?Node
set node_(87) [$ns node]
$node_(87) set X_ 924
$node_(87) set Y_ 326
$ns initial_node_pos $node_(87) 20

#???88?Node
set node_(88) [$ns node]
$node_(88) set X_ 350
$node_(88) set Y_ 60
$ns initial_node_pos $node_(88) 20

#???89?Node
set node_(89) [$ns node]
$node_(89) set X_ 832
$node_(89) set Y_ 629
$ns initial_node_pos $node_(89) 20

#???90?Node
set node_(90) [$ns node]
$node_(90) set X_ 69
$node_(90) set Y_ 224
$ns initial_node_pos $node_(90) 20

#???91?Node
set node_(91) [$ns node]
$node_(91) set X_ 95
$node_(91) set Y_ 567
$ns initial_node_pos $node_(91) 20

#???92?Node
set node_(92) [$ns node]
$node_(92) set X_ 365
$node_(92) set Y_ 840
$ns initial_node_pos $node_(92) 20

#???93?Node
set node_(93) [$ns node]
$node_(93) set X_ 371
$node_(93) set Y_ 752
$ns initial_node_pos $node_(93) 20

#???94?Node
set node_(95) [$ns node]
$node_(95) set X_ 190
$node_(95) set Y_ 886
$ns initial_node_pos $node_(95) 20

#???95?Node
set node_(96) [$ns node]
$node_(96) set X_ 455
$node_(96) set Y_ 544
$ns initial_node_pos $node_(96) 20

#???96?Node
set node_(97) [$ns node]
$node_(97) set X_ 135
$node_(97) set Y_ 356
$ns initial_node_pos $node_(97) 20

#???97?Node
set node_(98) [$ns node]
$node_(98) set X_ 283
$node_(98) set Y_ 721
$ns initial_node_pos $node_(98) 20

#???98?Node
set node_(99) [$ns node]
$node_(99) set X_ 460
$node_(99) set Y_ 84
$ns initial_node_pos $node_(99) 20

#???99?Node
set node_(100) [$ns node]
$node_(100) set X_ 790
$node_(100) set Y_ 261
$ns initial_node_pos $node_(100) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(2) setdest 109.0 775.0 $tz " 
$ns at 10.0 " $node_(3) setdest 62.0 650.0 $tz " 
$ns at 10.0 " $node_(4) setdest 205.0 367.0 $tz " 
$ns at 10.0 " $node_(7) setdest 896.0 30.0 $tz " 
$ns at 10.0 " $node_(9) setdest 922.0 266.0 $tz " 
$ns at 10.0 " $node_(10) setdest 126.0 218.0 $tz " 
$ns at 10.0 " $node_(13) setdest 254.0 913.0 $tz " 
$ns at 10.0 " $node_(14) setdest 460.0 58.0 $tz " 
$ns at 10.0 " $node_(18) setdest 181.0 30.0 $tz " 
$ns at 10.0 " $node_(19) setdest 122.0 177.0 $tz " 
$ns at 10.0 " $node_(24) setdest 18.0 566.0 $tz " 
$ns at 10.0 " $node_(29) setdest 254.0 245.0 $tz " 
$ns at 10.0 " $node_(30) setdest 77.0 483.0 $tz " 
$ns at 10.0 " $node_(31) setdest 700.0 162.0 $tz " 
$ns at 10.0 " $node_(33) setdest 298.0 18.0 $tz " 
$ns at 10.0 " $node_(34) setdest 547.0 905.0 $tz " 
$ns at 10.0 " $node_(36) setdest 564.0 450.0 $tz " 
$ns at 10.0 " $node_(39) setdest 254.0 869.0 $tz " 
$ns at 10.0 " $node_(40) setdest 526.0 811.0 $tz " 
$ns at 10.0 " $node_(41) setdest 903.0 692.0 $tz " 
$ns at 10.0 " $node_(42) setdest 86.0 284.0 $tz " 
$ns at 10.0 " $node_(44) setdest 845.0 154.0 $tz " 
$ns at 10.0 " $node_(46) setdest 398.0 54.0 $tz " 
$ns at 10.0 " $node_(47) setdest 860.0 58.0 $tz " 
$ns at 10.0 " $node_(48) setdest 381.0 26.0 $tz " 
$ns at 10.0 " $node_(53) setdest 839.0 541.0 $tz " 
$ns at 10.0 " $node_(57) setdest 56.0 49.0 $tz " 
$ns at 10.0 " $node_(58) setdest 30.0 98.0 $tz " 
$ns at 10.0 " $node_(59) setdest 930.0 852.0 $tz " 
$ns at 10.0 " $node_(60) setdest 220.0 49.0 $tz " 
$ns at 10.0 " $node_(62) setdest 928.0 560.0 $tz " 
$ns at 10.0 " $node_(63) setdest 883.0 947.0 1.0 " 
$ns at 10.0 " $node_(64) setdest 116.0 537.0 $tz " 
$ns at 10.0 " $node_(65) setdest 460.0 952.0 $tz " 
$ns at 10.0 " $node_(66) setdest 964.0 279.0 $tz " 
$ns at 10.0 " $node_(69) setdest 503.0 20.0 $tz " 
$ns at 10.0 " $node_(72) setdest 288.0 524.0 $tz " 
$ns at 10.0 " $node_(73) setdest 35.0 869.0 $tz " 
$ns at 10.0 " $node_(75) setdest 730.0 20.0 $tz " 
$ns at 10.0 " $node_(76) setdest 45.0 843.0 $tz " 
$ns at 10.0 " $node_(79) setdest 7.0 907.0 $tz " 
$ns at 10.0 " $node_(80) setdest 60.0 371.0 $tz " 
$ns at 10.0 " $node_(81) setdest 839.0 956.0 $tz " 
$ns at 10.0 " $node_(83) setdest 828.0 18.0 $tz " 
$ns at 10.0 " $node_(85) setdest 933.0 56.0 $tz " 
$ns at 10.0 " $node_(87) setdest 116.0 966.0 $tz " 
$ns at 10.0 " $node_(90) setdest 786.0 716.0 $tz " 
$ns at 10.0 " $node_(96) setdest 722.0 956.0 $tz " 
$ns at 10.0 " $node_(99) setdest 94.0 896.0 $tz " 
$ns at 10.0 " $node_(100) setdest 309.0 956.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(48) $udp0
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
