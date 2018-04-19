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
#        Nodes Definition        
#===================================
#???0?Node
set node_(0) [$ns node]
$node_(0) set X_ 210
$node_(0) set Y_ 286
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 143
$node_(1) set Y_ 107
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 304
$node_(2) set Y_ 304
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 379
$node_(3) set Y_ 290
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 74
$node_(4) set Y_ 30
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 351
$node_(5) set Y_ 412
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 173
$node_(6) set Y_ 400
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 306
$node_(7) set Y_ 136
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 114
$node_(8) set Y_ 402
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 326
$node_(9) set Y_ 476
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 484
$node_(10) set Y_ 300
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 457
$node_(11) set Y_ 228
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 232
$node_(12) set Y_ 391
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 187
$node_(13) set Y_ 144
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 71
$node_(14) set Y_ 89
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 431
$node_(15) set Y_ 278
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 172
$node_(16) set Y_ 478
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 115
$node_(17) set Y_ 200
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 81
$node_(18) set Y_ 175
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 326
$node_(19) set Y_ 53
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 323
$node_(20) set Y_ 212
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 198
$node_(21) set Y_ 172
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 173
$node_(22) set Y_ 243
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 409
$node_(23) set Y_ 64
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 454
$node_(24) set Y_ 328
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 251
$node_(25) set Y_ 190
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 418
$node_(26) set Y_ 407
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 173
$node_(27) set Y_ 47
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 427
$node_(28) set Y_ 96
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 216
$node_(29) set Y_ 464
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 413
$node_(30) set Y_ 171
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 331
$node_(31) set Y_ 151
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 312
$node_(32) set Y_ 375
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 261
$node_(33) set Y_ 419
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 345
$node_(34) set Y_ 369
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 225
$node_(35) set Y_ 348
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 413
$node_(36) set Y_ 456
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 268
$node_(37) set Y_ 287
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 126
$node_(38) set Y_ 457
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 408
$node_(39) set Y_ 355
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 67
$node_(40) set Y_ 230
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 333
$node_(41) set Y_ 266
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 96
$node_(42) set Y_ 347
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 230
$node_(43) set Y_ 74
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 387
$node_(44) set Y_ 158
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 82
$node_(45) set Y_ 273
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 175
$node_(46) set Y_ 317
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 133
$node_(47) set Y_ 329
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 377
$node_(48) set Y_ 459
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 287
$node_(49) set Y_ 469
$ns initial_node_pos $node_(49) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]

$ns at 10.0 " $node_(1) setdest 286.0 423.0 $tz " 
$ns at 10.0 " $node_(7) setdest 177.0 368.0 $tz " 
$ns at 10.0 " $node_(14) setdest 438.0 362.0 $tz " 
$ns at 10.0 " $node_(17) setdest 486.0 441.0 $tz " 
$ns at 10.0 " $node_(18) setdest 493.0 293.0 $tz " 
$ns at 10.0 " $node_(22) setdest 273.0 98.0 $tz " 
$ns at 10.0 " $node_(25) setdest 78.0 340.0 $tz " 
$ns at 10.0 " $node_(31) setdest 363.0 489.0 $tz " 
$ns at 10.0 " $node_(37) setdest 478.0 159.0 $tz " 
$ns at 10.0 " $node_(41) setdest 127.0 423.0 $tz " 
$ns at 10.0 " $node_(44) setdest 116.0 62.0 $tz " 
$ns at 10.0 " $node_(49) setdest 291.0 33.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(23) $udp0
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