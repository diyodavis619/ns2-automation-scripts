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
set val(nn)     50           ;# number of mobilenodes
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
#             產生Node              
#===================================

#建立第0個Node
set node_(0) [$ns node]
$node_(0) set X_ 166
$node_(0) set Y_ 657
$ns initial_node_pos $node_(0) 20

#建立第1個Node
set node_(1) [$ns node]
$node_(1) set X_ 276
$node_(1) set Y_ 692
$ns initial_node_pos $node_(1) 20

#建立第2個Node
set node_(2) [$ns node]
$node_(2) set X_ 113
$node_(2) set Y_ 536
$ns initial_node_pos $node_(2) 20

#建立第3個Node
set node_(3) [$ns node]
$node_(3) set X_ 55
$node_(3) set Y_ 854
$ns initial_node_pos $node_(3) 20

#建立第4個Node
set node_(4) [$ns node]
$node_(4) set X_ 641
$node_(4) set Y_ 627
$ns initial_node_pos $node_(4) 20

#建立第5個Node
set node_(5) [$ns node]
$node_(5) set X_ 147
$node_(5) set Y_ 414
$ns initial_node_pos $node_(5) 20

#建立第6個Node
set node_(6) [$ns node]
$node_(6) set X_ 788
$node_(6) set Y_ 536
$ns initial_node_pos $node_(6) 20

#建立第7個Node
set node_(7) [$ns node]
$node_(7) set X_ 484
$node_(7) set Y_ 626
$ns initial_node_pos $node_(7) 20

#建立第8個Node
set node_(8) [$ns node]
$node_(8) set X_ 510
$node_(8) set Y_ 811
$ns initial_node_pos $node_(8) 20

#建立第9個Node
set node_(9) [$ns node]
$node_(9) set X_ 858
$node_(9) set Y_ 775
$ns initial_node_pos $node_(9) 20

#建立第10個Node
set node_(10) [$ns node]
$node_(10) set X_ 786
$node_(10) set Y_ 188
$ns initial_node_pos $node_(10) 20

#建立第11個Node
set node_(11) [$ns node]
$node_(11) set X_ 689
$node_(11) set Y_ 754
$ns initial_node_pos $node_(11) 20

#建立第12個Node
set node_(12) [$ns node]
$node_(12) set X_ 789
$node_(12) set Y_ 947
$ns initial_node_pos $node_(12) 20

#建立第13個Node
set node_(13) [$ns node]
$node_(13) set X_ 638
$node_(13) set Y_ 505
$ns initial_node_pos $node_(13) 20

#建立第14個Node
set node_(14) [$ns node]
$node_(14) set X_ 867
$node_(14) set Y_ 332
$ns initial_node_pos $node_(14) 20

#建立第15個Node
set node_(15) [$ns node]
$node_(15) set X_ 198
$node_(15) set Y_ 226
$ns initial_node_pos $node_(15) 20

#建立第16個Node
set node_(16) [$ns node]
$node_(16) set X_ 738
$node_(16) set Y_ 295
$ns initial_node_pos $node_(16) 20

#建立第17個Node
set node_(17) [$ns node]
$node_(17) set X_ 947
$node_(17) set Y_ 516
$ns initial_node_pos $node_(17) 20

#建立第18個Node
set node_(18) [$ns node]
$node_(18) set X_ 863
$node_(18) set Y_ 101
$ns initial_node_pos $node_(18) 20

#建立第19個Node
set node_(19) [$ns node]
$node_(19) set X_ 777
$node_(19) set Y_ 637
$ns initial_node_pos $node_(19) 20

#建立第20個Node
set node_(20) [$ns node]
$node_(20) set X_ 475
$node_(20) set Y_ 162
$ns initial_node_pos $node_(20) 20

#建立第21個Node
set node_(21) [$ns node]
$node_(21) set X_ 69
$node_(21) set Y_ 244
$ns initial_node_pos $node_(21) 20

#建立第22個Node
set node_(22) [$ns node]
$node_(22) set X_ 179
$node_(22) set Y_ 50
$ns initial_node_pos $node_(22) 20

#建立第23個Node
set node_(23) [$ns node]
$node_(23) set X_ 750
$node_(23) set Y_ 420
$ns initial_node_pos $node_(23) 20

#建立第24個Node
set node_(24) [$ns node]
$node_(24) set X_ 320
$node_(24) set Y_ 48
$ns initial_node_pos $node_(24) 20

#建立第25個Node
set node_(25) [$ns node]
$node_(25) set X_ 350
$node_(25) set Y_ 189
$ns initial_node_pos $node_(25) 20

#建立第26個Node
set node_(26) [$ns node]
$node_(26) set X_ 257
$node_(26) set Y_ 591
$ns initial_node_pos $node_(26) 20

#建立第27個Node
set node_(27) [$ns node]
$node_(27) set X_ 396
$node_(27) set Y_ 564
$ns initial_node_pos $node_(27) 20

#建立第28個Node
set node_(28) [$ns node]
$node_(28) set X_ 59
$node_(28) set Y_ 620
$ns initial_node_pos $node_(28) 20

#建立第29個Node
set node_(29) [$ns node]
$node_(29) set X_ 594
$node_(29) set Y_ 382
$ns initial_node_pos $node_(29) 20

#建立第30個Node
set node_(30) [$ns node]
$node_(30) set X_ 134
$node_(30) set Y_ 935
$ns initial_node_pos $node_(30) 20

#建立第31個Node
set node_(31) [$ns node]
$node_(31) set X_ 380
$node_(31) set Y_ 755
$ns initial_node_pos $node_(31) 20

#建立第32個Node
set node_(32) [$ns node]
$node_(32) set X_ 441
$node_(32) set Y_ 929
$ns initial_node_pos $node_(32) 20

#建立第33個Node
set node_(33) [$ns node]
$node_(33) set X_ 307
$node_(33) set Y_ 872
$ns initial_node_pos $node_(33) 20

#建立第34個Node
set node_(34) [$ns node]
$node_(34) set X_ 319
$node_(34) set Y_ 439
$ns initial_node_pos $node_(34) 20

#建立第35個Node
set node_(35) [$ns node]
$node_(35) set X_ 908
$node_(35) set Y_ 230
$ns initial_node_pos $node_(35) 20

#建立第36個Node
set node_(36) [$ns node]
$node_(36) set X_ 944
$node_(36) set Y_ 854
$ns initial_node_pos $node_(36) 20

#建立第37個Node
set node_(37) [$ns node]
$node_(37) set X_ 486
$node_(37) set Y_ 476
$ns initial_node_pos $node_(37) 20

#建立第38個Node
set node_(38) [$ns node]
$node_(38) set X_ 539
$node_(38) set Y_ 57
$ns initial_node_pos $node_(38) 20

#建立第39個Node
set node_(39) [$ns node]
$node_(39) set X_ 925
$node_(39) set Y_ 692
$ns initial_node_pos $node_(39) 20

#建立第40個Node
set node_(40) [$ns node]
$node_(40) set X_ 675
$node_(40) set Y_ 111
$ns initial_node_pos $node_(40) 20

#建立第41個Node
set node_(41) [$ns node]
$node_(41) set X_ 80
$node_(41) set Y_ 133
$ns initial_node_pos $node_(41) 20

#建立第42個Node
set node_(42) [$ns node]
$node_(42) set X_ 688
$node_(42) set Y_ 855
$ns initial_node_pos $node_(42) 20

#建立第43個Node
set node_(43) [$ns node]
$node_(43) set X_ 608
$node_(43) set Y_ 232
$ns initial_node_pos $node_(43) 20

#建立第44個Node
set node_(44) [$ns node]
$node_(44) set X_ 61
$node_(44) set Y_ 703
$ns initial_node_pos $node_(44) 20

#建立第45個Node
set node_(45) [$ns node]
$node_(45) set X_ 206
$node_(45) set Y_ 791
$ns initial_node_pos $node_(45) 20

#建立第46個Node
set node_(46) [$ns node]
$node_(46) set X_ 438
$node_(46) set Y_ 336
$ns initial_node_pos $node_(46) 20

#建立第47個Node
set node_(47) [$ns node]
$node_(47) set X_ 576
$node_(47) set Y_ 705
$ns initial_node_pos $node_(47) 20

#建立第48個Node
set node_(48) [$ns node]
$node_(48) set X_ 927
$node_(48) set Y_ 430
$ns initial_node_pos $node_(48) 20

#建立第49個Node
set node_(49) [$ns node]
$node_(49) set X_ 582
$node_(49) set Y_ 948
$ns initial_node_pos $node_(49) 20

#===================================
#             產生Movement           
#===================================
set tz [lindex $argv 3]
# for 10% mobility i.e 5 nodes
$ns at 10.0 " $node_(1) setdest 488.0 233.0 $tz " 
$ns at 10.0 " $node_(3) setdest 375.0 923.0 $tz " 
$ns at 10.0 " $node_(13) setdest 154.0 288.0 $tz " 
$ns at 10.0 " $node_(16) setdest 411.0 835.0 $tz " 
$ns at 10.0 " $node_(34) setdest 601.0 848.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(16) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(44) $null0
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