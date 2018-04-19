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
$node_(0) set X_ 143
$node_(0) set Y_ 472
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 82
$node_(1) set Y_ 55
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 8
$node_(2) set Y_ 419
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 325
$node_(3) set Y_ 24
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 263
$node_(4) set Y_ 38
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 371
$node_(5) set Y_ 160
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 433
$node_(6) set Y_ 345
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 225
$node_(7) set Y_ 155
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 87
$node_(8) set Y_ 311
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 286
$node_(9) set Y_ 390
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 216
$node_(10) set Y_ 436
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 102
$node_(11) set Y_ 93
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 15
$node_(12) set Y_ 321
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 134
$node_(13) set Y_ 345
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 76
$node_(14) set Y_ 12
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 283
$node_(15) set Y_ 72
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 42
$node_(16) set Y_ 311
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 23
$node_(17) set Y_ 118
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 431
$node_(18) set Y_ 374
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 154
$node_(19) set Y_ 19
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 317
$node_(20) set Y_ 475
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 169
$node_(21) set Y_ 128
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 27
$node_(22) set Y_ 156
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 75
$node_(23) set Y_ 231
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 19
$node_(24) set Y_ 213
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 124
$node_(25) set Y_ 293
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 386
$node_(26) set Y_ 387
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 292
$node_(27) set Y_ 109
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 174
$node_(28) set Y_ 48
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 65
$node_(29) set Y_ 433
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 277
$node_(30) set Y_ 284
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 423
$node_(31) set Y_ 156
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 80
$node_(32) set Y_ 347
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 209
$node_(33) set Y_ 481
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 319
$node_(34) set Y_ 154
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 421
$node_(35) set Y_ 435
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 258
$node_(36) set Y_ 417
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 216
$node_(37) set Y_ 30
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 62
$node_(38) set Y_ 273
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 285
$node_(39) set Y_ 315
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 276
$node_(40) set Y_ 481
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 117
$node_(41) set Y_ 250
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 377
$node_(42) set Y_ 332
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 168
$node_(43) set Y_ 398
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 188
$node_(44) set Y_ 348
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 96
$node_(45) set Y_ 418
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 245
$node_(46) set Y_ 456
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 123
$node_(47) set Y_ 33
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 27
$node_(48) set Y_ 272
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 335
$node_(49) set Y_ 91
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 220
$node_(50) set Y_ 398
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 249
$node_(51) set Y_ 211
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 153
$node_(52) set Y_ 176
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 76
$node_(53) set Y_ 378
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 325
$node_(54) set Y_ 343
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 145
$node_(55) set Y_ 427
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 164
$node_(56) set Y_ 285
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 277
$node_(57) set Y_ 200
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 432
$node_(58) set Y_ 300
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 68
$node_(59) set Y_ 129
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 49
$node_(60) set Y_ 190
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 154
$node_(61) set Y_ 233
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 13
$node_(62) set Y_ 386
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 191
$node_(63) set Y_ 456
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 307
$node_(64) set Y_ 247
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 339
$node_(65) set Y_ 379
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 260
$node_(66) set Y_ 152
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 35
$node_(67) set Y_ 449
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 148
$node_(68) set Y_ 83
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 343
$node_(69) set Y_ 294
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 423
$node_(70) set Y_ 252
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 205
$node_(71) set Y_ 90
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 221
$node_(72) set Y_ 354
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 325
$node_(73) set Y_ 413
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 14
$node_(74) set Y_ 483
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 192
$node_(75) set Y_ 196
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 360
$node_(76) set Y_ 471
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 106
$node_(77) set Y_ 163
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 105
$node_(78) set Y_ 198
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 384
$node_(79) set Y_ 443
$ns initial_node_pos $node_(79) 20

#???80?Node
set node_(80) [$ns node]
$node_(80) set X_ 390
$node_(80) set Y_ 112
$ns initial_node_pos $node_(80) 20

#???81?Node
set node_(81) [$ns node]
$node_(81) set X_ 344
$node_(81) set Y_ 199
$ns initial_node_pos $node_(81) 20

#???82?Node
set node_(82) [$ns node]
$node_(82) set X_ 285
$node_(82) set Y_ 447
$ns initial_node_pos $node_(82) 20

#???83?Node
set node_(83) [$ns node]
$node_(83) set X_ 245
$node_(83) set Y_ 94
$ns initial_node_pos $node_(83) 20

#???84?Node
set node_(84) [$ns node]
$node_(84) set X_ 191
$node_(84) set Y_ 255
$ns initial_node_pos $node_(84) 20

#???85?Node
set node_(85) [$ns node]
$node_(85) set X_ 109
$node_(85) set Y_ 443
$ns initial_node_pos $node_(85) 20

#???86?Node
set node_(86) [$ns node]
$node_(86) set X_ 243
$node_(86) set Y_ 271
$ns initial_node_pos $node_(86) 20

#???87?Node
set node_(87) [$ns node]
$node_(87) set X_ 400
$node_(87) set Y_ 289
$ns initial_node_pos $node_(87) 20

#???88?Node
set node_(88) [$ns node]
$node_(88) set X_ 117
$node_(88) set Y_ 380
$ns initial_node_pos $node_(88) 20

#???89?Node
set node_(89) [$ns node]
$node_(89) set X_ 43
$node_(89) set Y_ 78
$ns initial_node_pos $node_(89) 20

#???90?Node
set node_(90) [$ns node]
$node_(90) set X_ 348
$node_(90) set Y_ 55
$ns initial_node_pos $node_(90) 20

#???91?Node
set node_(91) [$ns node]
$node_(91) set X_ 124
$node_(91) set Y_ 140
$ns initial_node_pos $node_(91) 20

#???92?Node
set node_(92) [$ns node]
$node_(92) set X_ 370
$node_(92) set Y_ 244
$ns initial_node_pos $node_(92) 20

#???93?Node
set node_(93) [$ns node]
$node_(93) set X_ 30
$node_(93) set Y_ 48
$ns initial_node_pos $node_(93) 20

#???94?Node
set node_(94) [$ns node]
$node_(94) set X_ 73
$node_(94) set Y_ 476
$ns initial_node_pos $node_(94) 20

#???95?Node
set node_(95) [$ns node]
$node_(95) set X_ 222
$node_(95) set Y_ 312
$ns initial_node_pos $node_(95) 20

#???96?Node
set node_(96) [$ns node]
$node_(96) set X_ 413
$node_(96) set Y_ 211
$ns initial_node_pos $node_(96) 20

#???97?Node
set node_(97) [$ns node]
$node_(97) set X_ 269
$node_(97) set Y_ 354
$ns initial_node_pos $node_(97) 20

#???98?Node
set node_(98) [$ns node]
$node_(98) set X_ 397
$node_(98) set Y_ 77
$ns initial_node_pos $node_(98) 20

#???99?Node
set node_(99) [$ns node]
$node_(99) set X_ 40
$node_(99) set Y_ 364
$ns initial_node_pos $node_(99) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(6) setdest 405.0 329.0 $tz " 
$ns at 10.0 " $node_(14) setdest 104.0 9.0 $tz " 
$ns at 10.0 " $node_(16) setdest 59.0 299.0 $tz " 
$ns at 10.0 " $node_(17) setdest 56.0 110.0 $tz " 
$ns at 10.0 " $node_(19) setdest 186.0 20.0 $tz " 
$ns at 10.0 " $node_(24) setdest 56.0 236.0 $tz " 
$ns at 10.0 " $node_(31) setdest 381.0 146.0 $tz " 
$ns at 10.0 " $node_(50) setdest 248.0 382.0 $tz " 
$ns at 10.0 " $node_(74) setdest 37.0 487.0 $tz " 
$ns at 10.0 " $node_(87) setdest 351.0 275.0 $tz "

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(47) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(76) $null0
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