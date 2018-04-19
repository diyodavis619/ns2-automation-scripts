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
$node_(0) set X_ 345
$node_(0) set Y_ 43
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 275
$node_(1) set Y_ 243
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 337
$node_(2) set Y_ 161
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 352
$node_(3) set Y_ 88
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 287
$node_(4) set Y_ 417
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 307
$node_(5) set Y_ 279
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 53
$node_(6) set Y_ 68
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 118
$node_(7) set Y_ 491
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 285
$node_(8) set Y_ 310
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 70
$node_(9) set Y_ 433
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 354
$node_(10) set Y_ 326
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 125
$node_(11) set Y_ 309
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 126
$node_(12) set Y_ 207
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 162
$node_(13) set Y_ 26
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 228
$node_(14) set Y_ 412
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 445
$node_(15) set Y_ 310
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 188
$node_(16) set Y_ 320
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 374
$node_(17) set Y_ 413
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 189
$node_(18) set Y_ 278
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 259
$node_(19) set Y_ 381
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 43
$node_(20) set Y_ 305
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 151
$node_(21) set Y_ 232
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 69
$node_(22) set Y_ 160
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 60
$node_(23) set Y_ 23
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 222
$node_(24) set Y_ 26
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 423
$node_(25) set Y_ 403
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 181
$node_(26) set Y_ 153
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 387
$node_(27) set Y_ 151
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 458
$node_(28) set Y_ 446
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 193
$node_(29) set Y_ 489
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 486
$node_(30) set Y_ 378
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 389
$node_(31) set Y_ 192
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 25
$node_(32) set Y_ 202
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 271
$node_(33) set Y_ 478
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 410
$node_(34) set Y_ 234
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 352
$node_(35) set Y_ 461
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 75
$node_(36) set Y_ 125
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 155
$node_(37) set Y_ 366
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 291
$node_(38) set Y_ 68
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 401
$node_(39) set Y_ 447
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 35
$node_(40) set Y_ 229
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 321
$node_(41) set Y_ 444
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 259
$node_(42) set Y_ 52
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 256
$node_(43) set Y_ 152
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 135
$node_(44) set Y_ 134
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 27
$node_(45) set Y_ 383
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 132
$node_(46) set Y_ 438
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 431
$node_(47) set Y_ 377
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 446
$node_(48) set Y_ 76
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 216
$node_(49) set Y_ 326
$ns initial_node_pos $node_(49) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 218.0 243.0 $tz " 
$ns at 10.0 " $node_(1) setdest 158.0 90.0 $tz " 
$ns at 10.0 " $node_(2) setdest 175.0 466.0 $tz " 
$ns at 10.0 " $node_(3) setdest 67.0 53.0 $tz " 
$ns at 10.0 " $node_(4) setdest 215.0 367.0 $tz " 
$ns at 10.0 " $node_(5) setdest 259.0 293.0 $tz " 
$ns at 10.0 " $node_(6) setdest 263.0 337.0 $tz " 
$ns at 10.0 " $node_(7) setdest 89.0 80.0 $tz " 
$ns at 10.0 " $node_(8) setdest 75.0 281.0 $tz " 
$ns at 10.0 " $node_(9) setdest 175.0 390.0 $tz " 
$ns at 10.0 " $node_(10) setdest 235.0 267.0 $tz " 
$ns at 10.0 " $node_(11) setdest 142.0 420.0 $tz " 
$ns at 10.0 " $node_(12) setdest 498.0 160.0 $tz " 
$ns at 10.0 " $node_(13) setdest 385.0 496.0 $tz " 
$ns at 10.0 " $node_(14) setdest 19.0 118.0 $tz " 
$ns at 10.0 " $node_(15) setdest 380.0 23.0 $tz " 
$ns at 10.0 " $node_(16) setdest 428.0 36.0 $tz " 
$ns at 10.0 " $node_(17) setdest 482.0 104.0 $tz " 
$ns at 10.0 " $node_(18) setdest 30.0 253.0 $tz " 
$ns at 10.0 " $node_(19) setdest 25.0 272.0 $tz " 
$ns at 10.0 " $node_(20) setdest 492.0 259.0 $tz " 
$ns at 10.0 " $node_(21) setdest 456.0 343.0 $tz " 
$ns at 10.0 " $node_(22) setdest 489.0 226.0 $tz " 
$ns at 10.0 " $node_(23) setdest 60.0 393.0 $tz " 
$ns at 10.0 " $node_(24) setdest 139.0 185.0 $tz " 
$ns at 10.0 " $node_(25) setdest 296.0 354.0 $tz " 
$ns at 10.0 " $node_(26) setdest 323.0 112.0 $tz " 
$ns at 10.0 " $node_(27) setdest 234.0 121.0 $tz " 
$ns at 10.0 " $node_(28) setdest 478.0 288.0 $tz " 
$ns at 10.0 " $node_(29) setdest 328.0 409.0 $tz " 
$ns at 10.0 " $node_(30) setdest 452.0 245.0 $tz " 
$ns at 10.0 " $node_(31) setdest 261.0 219.0 $tz " 
$ns at 10.0 " $node_(32) setdest 112.0 28.0 $tz " 
$ns at 10.0 " $node_(33) setdest 66.0 467.0 $tz " 
$ns at 10.0 " $node_(34) setdest 492.0 184.0 $tz " 
$ns at 10.0 " $node_(35) setdest 492.0 434.0 $tz " 
$ns at 10.0 " $node_(36) setdest 197.0 228.0 $tz " 
$ns at 10.0 " $node_(37) setdest 41.0 336.0 $tz " 
$ns at 10.0 " $node_(38) setdest 313.0 14.0 $tz " 
$ns at 10.0 " $node_(39) setdest 486.0 471.0 $tz " 
$ns at 10.0 " $node_(40) setdest 130.0 233.0 $tz " 
$ns at 10.0 " $node_(41) setdest 496.0 378.0 $tz " 
$ns at 10.0 " $node_(42) setdest 487.0 59.0 $tz " 
$ns at 10.0 " $node_(43) setdest 200.0 110.0 $tz " 
$ns at 10.0 " $node_(44) setdest 448.0 139.0 $tz " 
$ns at 10.0 " $node_(45) setdest 151.0 354.0 $tz " 
$ns at 10.0 " $node_(46) setdest 227.0 450.0 $tz " 
$ns at 10.0 " $node_(47) setdest 487.0 307.0 $tz " 
$ns at 10.0 " $node_(48) setdest 335.0 76.0 $tz " 
$ns at 10.0 " $node_(49) setdest 18.0 173.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(42) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(46) $null0
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