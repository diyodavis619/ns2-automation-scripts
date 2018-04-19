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
$node_(0) set X_ 416
$node_(0) set Y_ 22
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 469
$node_(1) set Y_ 367
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 424
$node_(2) set Y_ 455
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 364
$node_(3) set Y_ 395
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 301
$node_(4) set Y_ 344
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 223
$node_(5) set Y_ 219
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 151
$node_(6) set Y_ 407
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 476
$node_(7) set Y_ 128
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 144
$node_(8) set Y_ 122
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 29
$node_(9) set Y_ 182
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 255
$node_(10) set Y_ 252
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 299
$node_(11) set Y_ 461
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 325
$node_(12) set Y_ 276
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 457
$node_(13) set Y_ 389
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 315
$node_(14) set Y_ 399
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 327
$node_(15) set Y_ 91
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 199
$node_(16) set Y_ 438
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 68
$node_(17) set Y_ 480
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 115
$node_(18) set Y_ 25
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 133
$node_(19) set Y_ 276
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 212
$node_(20) set Y_ 128
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 399
$node_(21) set Y_ 338
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 77
$node_(22) set Y_ 203
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 216
$node_(23) set Y_ 385
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 256
$node_(24) set Y_ 25
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 341
$node_(25) set Y_ 166
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 428
$node_(26) set Y_ 96
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 220
$node_(27) set Y_ 175
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 219
$node_(28) set Y_ 459
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 124
$node_(29) set Y_ 325
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 37
$node_(30) set Y_ 251
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 85
$node_(31) set Y_ 383
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 452
$node_(32) set Y_ 299
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 42
$node_(33) set Y_ 89
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 113
$node_(34) set Y_ 234
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 12
$node_(35) set Y_ 335
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 115
$node_(36) set Y_ 438
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 151
$node_(37) set Y_ 357
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 410
$node_(38) set Y_ 422
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 248
$node_(39) set Y_ 147
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 421
$node_(40) set Y_ 225
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 39
$node_(41) set Y_ 437
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 43
$node_(42) set Y_ 372
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 305
$node_(43) set Y_ 115
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 98
$node_(44) set Y_ 361
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 324
$node_(45) set Y_ 24
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 277
$node_(46) set Y_ 306
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 357
$node_(47) set Y_ 64
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 158
$node_(48) set Y_ 177
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 344
$node_(49) set Y_ 477
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 326
$node_(50) set Y_ 416
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 181
$node_(51) set Y_ 332
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 76
$node_(52) set Y_ 282
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 178
$node_(53) set Y_ 79
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 386
$node_(54) set Y_ 264
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 21
$node_(55) set Y_ 134
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 291
$node_(56) set Y_ 206
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 463
$node_(57) set Y_ 36
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 478
$node_(58) set Y_ 475
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 360
$node_(59) set Y_ 214
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 22
$node_(60) set Y_ 231
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 34
$node_(61) set Y_ 6
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 464
$node_(62) set Y_ 215
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 218
$node_(63) set Y_ 266
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 216
$node_(64) set Y_ 416
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 104
$node_(65) set Y_ 117
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 341
$node_(66) set Y_ 330
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 234
$node_(67) set Y_ 336
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 112
$node_(68) set Y_ 176
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 73
$node_(69) set Y_ 335
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 240
$node_(70) set Y_ 93
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 363
$node_(71) set Y_ 100
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 86
$node_(72) set Y_ 63
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 157
$node_(73) set Y_ 247
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 185
$node_(74) set Y_ 0
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 276
$node_(75) set Y_ 446
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 162
$node_(76) set Y_ 46
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 129
$node_(77) set Y_ 454
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 438
$node_(78) set Y_ 349
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 428
$node_(79) set Y_ 141
$ns initial_node_pos $node_(79) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]

$ns at 10.0 " $node_(1) setdest 32.0 129.0 $tz " 
$ns at 10.0 " $node_(7) setdest 31.0 283.0 $tz " 
$ns at 10.0 " $node_(14) setdest 280.0 39.0 $tz " 
$ns at 10.0 " $node_(45) setdest 50.0 348.0 $tz " 
$ns at 10.0 " $node_(57) setdest 63.0 438.0 $tz " 
$ns at 10.0 " $node_(58) setdest 63.0 56.0 $tz " 
$ns at 10.0 " $node_(60) setdest 465.0 250.0 $tz " 
$ns at 10.0 " $node_(75) setdest 235.0 63.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(18) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(49) $null0
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