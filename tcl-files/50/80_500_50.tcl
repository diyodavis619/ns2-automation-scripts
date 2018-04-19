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
$node_(0) set X_ 459
$node_(0) set Y_ 232
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 136
$node_(1) set Y_ 223
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 289
$node_(2) set Y_ 200
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 133
$node_(3) set Y_ 28
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 205
$node_(4) set Y_ 20
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 22
$node_(5) set Y_ 226
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 314
$node_(6) set Y_ 18
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 23
$node_(7) set Y_ 425
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 33
$node_(8) set Y_ 107
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 200
$node_(9) set Y_ 314
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 434
$node_(10) set Y_ 393
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 105
$node_(11) set Y_ 107
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 222
$node_(12) set Y_ 219
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 49
$node_(13) set Y_ 293
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 198
$node_(14) set Y_ 433
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 221
$node_(15) set Y_ 274
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 204
$node_(16) set Y_ 481
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 237
$node_(17) set Y_ 191
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 58
$node_(18) set Y_ 236
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 394
$node_(19) set Y_ 140
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 349
$node_(20) set Y_ 480
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 188
$node_(21) set Y_ 264
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 24
$node_(22) set Y_ 295
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 188
$node_(23) set Y_ 53
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 161
$node_(24) set Y_ 426
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 439
$node_(25) set Y_ 486
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 491
$node_(26) set Y_ 42
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 324
$node_(27) set Y_ 374
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 451
$node_(28) set Y_ 437
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 427
$node_(29) set Y_ 115
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 245
$node_(30) set Y_ 301
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 269
$node_(31) set Y_ 380
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 140
$node_(32) set Y_ 483
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 122
$node_(33) set Y_ 299
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 490
$node_(34) set Y_ 98
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 407
$node_(35) set Y_ 446
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 165
$node_(36) set Y_ 209
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 66
$node_(37) set Y_ 111
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 304
$node_(38) set Y_ 294
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 242
$node_(39) set Y_ 471
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 446
$node_(40) set Y_ 69
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 482
$node_(41) set Y_ 361
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 442
$node_(42) set Y_ 182
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 158
$node_(43) set Y_ 367
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 164
$node_(44) set Y_ 119
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 437
$node_(45) set Y_ 280
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 413
$node_(46) set Y_ 206
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 479
$node_(47) set Y_ 283
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 299
$node_(48) set Y_ 239
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 345
$node_(49) set Y_ 226
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 230
$node_(50) set Y_ 58
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 397
$node_(51) set Y_ 89
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 223
$node_(52) set Y_ 116
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 230
$node_(53) set Y_ 384
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 114
$node_(54) set Y_ 61
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 34
$node_(55) set Y_ 191
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 329
$node_(56) set Y_ 418
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 61
$node_(57) set Y_ 432
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 130
$node_(58) set Y_ 152
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 439
$node_(59) set Y_ 35
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 296
$node_(60) set Y_ 129
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 30
$node_(61) set Y_ 365
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 394
$node_(62) set Y_ 282
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 203
$node_(63) set Y_ 154
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 32
$node_(64) set Y_ 53
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 337
$node_(65) set Y_ 149
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 339
$node_(66) set Y_ 1
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 478
$node_(67) set Y_ 163
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 393
$node_(68) set Y_ 360
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 33
$node_(69) set Y_ 145
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 61
$node_(70) set Y_ 28
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 293
$node_(71) set Y_ 41
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 330
$node_(72) set Y_ 44
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 332
$node_(73) set Y_ 108
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 77
$node_(74) set Y_ 361
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 288
$node_(75) set Y_ 459
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 346
$node_(76) set Y_ 301
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 19
$node_(77) set Y_ 255
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 265
$node_(78) set Y_ 13
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 97
$node_(79) set Y_ 425
$ns initial_node_pos $node_(79) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]

$ns at 10.0 " $node_(0) setdest 58.0 208.0 $tz " 
$ns at 10.0 " $node_(3) setdest 170.0 483.0 $tz " 
$ns at 10.0 " $node_(5) setdest 496.0 238.0 $tz " 
$ns at 10.0 " $node_(7) setdest 482.0 132.0 $tz " 
$ns at 10.0 " $node_(8) setdest 368.0 448.0 $tz " 
$ns at 10.0 " $node_(10) setdest 368.0 123.0 $tz " 
$ns at 10.0 " $node_(13) setdest 440.0 39.0 $tz " 
$ns at 10.0 " $node_(14) setdest 335.0 442.0 $tz " 
$ns at 10.0 " $node_(16) setdest 184.0 33.0 $tz " 
$ns at 10.0 " $node_(18) setdest 390.0 300.0 $tz " 
$ns at 10.0 " $node_(19) setdest 115.0 326.0 $tz " 
$ns at 10.0 " $node_(22) setdest 483.0 314.0 $tz " 
$ns at 10.0 " $node_(25) setdest 58.0 391.0 $tz " 
$ns at 10.0 " $node_(27) setdest 40.0 333.0 $tz " 
$ns at 10.0 " $node_(29) setdest 110.0 46.0 $tz " 
$ns at 10.0 " $node_(30) setdest 350.0 390.0 $tz " 
$ns at 10.0 " $node_(31) setdest 288.0 116.0 $tz " 
$ns at 10.0 " $node_(32) setdest 107.0 138.0 $tz " 
$ns at 10.0 " $node_(34) setdest 164.0 100.0 $tz " 
$ns at 10.0 " $node_(37) setdest 336.0 333.0 $tz " 
$ns at 10.0 " $node_(39) setdest 218.0 20.0 $tz " 
$ns at 10.0 " $node_(45) setdest 71.0 232.0 $tz " 
$ns at 10.0 " $node_(47) setdest 31.0 279.0 $tz " 
$ns at 10.0 " $node_(48) setdest 428.0 257.0 $tz " 
$ns at 10.0 " $node_(51) setdest 289.0 176.0 $tz " 
$ns at 10.0 " $node_(53) setdest 439.0 335.0 $tz " 
$ns at 10.0 " $node_(54) setdest 378.0 185.0 $tz " 
$ns at 10.0 " $node_(55) setdest 495.0 206.0 $tz " 
$ns at 10.0 " $node_(56) setdest 306.0 71.0 $tz " 
$ns at 10.0 " $node_(57) setdest 466.0 179.0 $tz " 
$ns at 10.0 " $node_(61) setdest 473.0 77.0 $tz " 
$ns at 10.0 " $node_(63) setdest 452.0 222.0 $tz " 
$ns at 10.0 " $node_(64) setdest 444.0 462.0 $tz " 
$ns at 10.0 " $node_(66) setdest 376.0 435.0 $tz " 
$ns at 10.0 " $node_(69) setdest 338.0 467.0 $tz " 
$ns at 10.0 " $node_(70) setdest 452.0 390.0 $tz " 
$ns at 10.0 " $node_(74) setdest 456.0 362.0 $tz " 
$ns at 10.0 " $node_(75) setdest 260.0 57.0 $tz " 
$ns at 10.0 " $node_(77) setdest 494.0 270.0 $tz " 
$ns at 10.0 " $node_(79) setdest 453.0 417.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(40) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(24) $null0
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