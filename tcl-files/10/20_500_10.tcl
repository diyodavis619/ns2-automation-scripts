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
set val(nn)     20           ;# number of mobilenodes
set val(rp)     [lindex $argv 0]           ;# routing protocol
set val(x)      500                       ;# X dimension of topography
set val(y)      500                       ;# Y dimension of topography
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
$node_(0) set X_ 391
$node_(0) set Y_ 179
$ns initial_node_pos $node_(0) 20

#建立第1個Node
set node_(1) [$ns node]
$node_(1) set X_ 262
$node_(1) set Y_ 260
$ns initial_node_pos $node_(1) 20

#建立第2個Node
set node_(2) [$ns node]
$node_(2) set X_ 135
$node_(2) set Y_ 227
$ns initial_node_pos $node_(2) 20

#建立第3個Node
set node_(3) [$ns node]
$node_(3) set X_ 130
$node_(3) set Y_ 122
$ns initial_node_pos $node_(3) 20

#建立第4個Node
set node_(4) [$ns node]
$node_(4) set X_ 277
$node_(4) set Y_ 442
$ns initial_node_pos $node_(4) 20

#建立第5個Node
set node_(5) [$ns node]
$node_(5) set X_ 447
$node_(5) set Y_ 360
$ns initial_node_pos $node_(5) 20

#建立第6個Node
set node_(6) [$ns node]
$node_(6) set X_ 132
$node_(6) set Y_ 41
$ns initial_node_pos $node_(6) 20

#建立第7個Node
set node_(7) [$ns node]
$node_(7) set X_ 277
$node_(7) set Y_ 69
$ns initial_node_pos $node_(7) 20

#建立第8個Node
set node_(8) [$ns node]
$node_(8) set X_ 46
$node_(8) set Y_ 160
$ns initial_node_pos $node_(8) 20

#建立第9個Node
set node_(9) [$ns node]
$node_(9) set X_ 173
$node_(9) set Y_ 360
$ns initial_node_pos $node_(9) 20

#建立第10個Node
set node_(10) [$ns node]
$node_(10) set X_ 28
$node_(10) set Y_ 53
$ns initial_node_pos $node_(10) 20

#建立第11個Node
set node_(11) [$ns node]
$node_(11) set X_ 31
$node_(11) set Y_ 468
$ns initial_node_pos $node_(11) 20

#建立第12個Node
set node_(12) [$ns node]
$node_(12) set X_ 387
$node_(12) set Y_ 254
$ns initial_node_pos $node_(12) 20

#建立第13個Node
set node_(13) [$ns node]
$node_(13) set X_ 55
$node_(13) set Y_ 323
$ns initial_node_pos $node_(13) 20

#建立第14個Node
set node_(14) [$ns node]
$node_(14) set X_ 151
$node_(14) set Y_ 466
$ns initial_node_pos $node_(14) 20

#建立第15個Node
set node_(15) [$ns node]
$node_(15) set X_ 483
$node_(15) set Y_ 262
$ns initial_node_pos $node_(15) 20

#建立第16個Node
set node_(16) [$ns node]
$node_(16) set X_ 385
$node_(16) set Y_ 471
$ns initial_node_pos $node_(16) 20

#建立第17個Node
set node_(17) [$ns node]
$node_(17) set X_ 312
$node_(17) set Y_ 339
$ns initial_node_pos $node_(17) 20

#建立第18個Node
set node_(18) [$ns node]
$node_(18) set X_ 384
$node_(18) set Y_ 97
$ns initial_node_pos $node_(18) 20

#建立第19個Node
set node_(19) [$ns node]
$node_(19) set X_ 258
$node_(19) set Y_ 162
$ns initial_node_pos $node_(19) 20

#===================================
#             產生Movement           
#===================================
set tz [lindex $argv 3]
# for 10% mobility i.e 2 nodes
$ns at 10.0 " $node_(9) setdest 216.0 84.0 $tz " 
$ns at 10.0 " $node_(12) setdest 31.0 254.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(10) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(16) $null0
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