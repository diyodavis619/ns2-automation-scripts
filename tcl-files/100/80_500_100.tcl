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
$node_(0) set X_ 165
$node_(0) set Y_ 300
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 280
$node_(1) set Y_ 289
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 148
$node_(2) set Y_ 17
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 380
$node_(3) set Y_ 273
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 73
$node_(4) set Y_ 423
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 197
$node_(5) set Y_ 374
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 163
$node_(6) set Y_ 234
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 61
$node_(7) set Y_ 193
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 264
$node_(8) set Y_ 242
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 171
$node_(9) set Y_ 199
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 171
$node_(10) set Y_ 77
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 226
$node_(11) set Y_ 132
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 132
$node_(12) set Y_ 456
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 290
$node_(13) set Y_ 367
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 133
$node_(14) set Y_ 187
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 268
$node_(15) set Y_ 127
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 74
$node_(16) set Y_ 368
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 229
$node_(17) set Y_ 293
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 385
$node_(18) set Y_ 110
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 296
$node_(19) set Y_ 262
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 192
$node_(20) set Y_ 124
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 253
$node_(21) set Y_ 465
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 334
$node_(22) set Y_ 166
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 187
$node_(23) set Y_ 447
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 240
$node_(24) set Y_ 344
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 266
$node_(25) set Y_ 411
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 340
$node_(26) set Y_ 471
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 39
$node_(27) set Y_ 347
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 34
$node_(28) set Y_ 131
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 92
$node_(29) set Y_ 326
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 51
$node_(30) set Y_ 66
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 415
$node_(31) set Y_ 171
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 327
$node_(32) set Y_ 412
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 179
$node_(33) set Y_ 392
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 74
$node_(34) set Y_ 454
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 86
$node_(35) set Y_ 225
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 336
$node_(36) set Y_ 312
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 315
$node_(37) set Y_ 113
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 415
$node_(38) set Y_ 390
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 362
$node_(39) set Y_ 70
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 41
$node_(40) set Y_ 282
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 315
$node_(41) set Y_ 53
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 84
$node_(42) set Y_ 276
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 209
$node_(43) set Y_ 65
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 238
$node_(44) set Y_ 210
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 126
$node_(45) set Y_ 148
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 129
$node_(46) set Y_ 414
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 73
$node_(47) set Y_ 30
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 281
$node_(48) set Y_ 65
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 18
$node_(49) set Y_ 391
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 434
$node_(50) set Y_ 291
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 472
$node_(51) set Y_ 352
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 208
$node_(52) set Y_ 177
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 192
$node_(53) set Y_ 275
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 119
$node_(54) set Y_ 63
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 21
$node_(55) set Y_ 443
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 102
$node_(56) set Y_ 111
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 205
$node_(57) set Y_ 462
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 94
$node_(58) set Y_ 145
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 383
$node_(59) set Y_ 362
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 136
$node_(60) set Y_ 255
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 433
$node_(61) set Y_ 234
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 337
$node_(62) set Y_ 242
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 385
$node_(63) set Y_ 92
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 290
$node_(64) set Y_ 21
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 451
$node_(66) set Y_ 430
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 463
$node_(67) set Y_ 283
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 47
$node_(68) set Y_ 234
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 149
$node_(69) set Y_ 342
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(71) [$ns node]
$node_(71) set X_ 240
$node_(71) set Y_ 19
$ns initial_node_pos $node_(71) 20

#???70?Node
set node_(72) [$ns node]
$node_(72) set X_ 382
$node_(72) set Y_ 158
$ns initial_node_pos $node_(72) 20

#???71?Node
set node_(73) [$ns node]
$node_(73) set X_ 319
$node_(73) set Y_ 461
$ns initial_node_pos $node_(73) 20

#???72?Node
set node_(74) [$ns node]
$node_(74) set X_ 402
$node_(74) set Y_ 213
$ns initial_node_pos $node_(74) 20

#???73?Node
set node_(75) [$ns node]
$node_(75) set X_ 21
$node_(75) set Y_ 164
$ns initial_node_pos $node_(75) 20

#???74?Node
set node_(76) [$ns node]
$node_(76) set X_ 307
$node_(76) set Y_ 195
$ns initial_node_pos $node_(76) 20

#???75?Node
set node_(77) [$ns node]
$node_(77) set X_ 106
$node_(77) set Y_ 367
$ns initial_node_pos $node_(77) 20

#???76?Node
set node_(78) [$ns node]
$node_(78) set X_ 427
$node_(78) set Y_ 340
$ns initial_node_pos $node_(78) 20

#???77?Node
set node_(79) [$ns node]
$node_(79) set X_ 383
$node_(79) set Y_ 431
$ns initial_node_pos $node_(79) 20

#???78?Node
set node_(80) [$ns node]
$node_(80) set X_ 12
$node_(80) set Y_ 302
$ns initial_node_pos $node_(80) 20

#???79?Node
set node_(82) [$ns node]
$node_(82) set X_ 204
$node_(82) set Y_ 255
$ns initial_node_pos $node_(82) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 127.0 290.0 $tz " 
$ns at 10.0 " $node_(1) setdest 318.0 293.0 $tz " 
$ns at 10.0 " $node_(2) setdest 119.0 23.0 $tz " 
$ns at 10.0 " $node_(3) setdest 362.0 236.0 $tz " 
$ns at 10.0 " $node_(4) setdest 72.0 386.0 $tz " 
$ns at 10.0 " $node_(5) setdest 193.0 345.0 $tz " 
$ns at 10.0 " $node_(6) setdest 94.0 193.0 $tz " 
$ns at 10.0 " $node_(7) setdest 109.0 144.0 $tz " 
$ns at 10.0 " $node_(8) setdest 339.0 208.0 $tz " 
$ns at 10.0 " $node_(9) setdest 190.0 159.0 $tz " 
$ns at 10.0 " $node_(10) setdest 199.0 40.0 $tz " 
$ns at 10.0 " $node_(11) setdest 259.0 83.0 $tz " 
$ns at 10.0 " $node_(12) setdest 186.0 422.0 $tz " 
$ns at 10.0 " $node_(13) setdest 294.0 335.0 $tz " 
$ns at 10.0 " $node_(14) setdest 175.0 151.0 $tz " 
$ns at 10.0 " $node_(15) setdest 231.0 52.0 $tz " 
$ns at 10.0 " $node_(16) setdest 69.0 321.0 $tz " 
$ns at 10.0 " $node_(17) setdest 214.0 250.0 $tz " 
$ns at 10.0 " $node_(18) setdest 308.0 79.0 $tz " 
$ns at 10.0 " $node_(19) setdest 272.0 219.0 $tz " 
$ns at 10.0 " $node_(20) setdest 250.0 72.0 $tz " 
$ns at 10.0 " $node_(21) setdest 280.0 403.0 $tz " 
$ns at 10.0 " $node_(22) setdest 250.0 146.0 $tz " 
$ns at 10.0 " $node_(23) setdest 220.0 445.0 $tz " 
$ns at 10.0 " $node_(24) setdest 219.0 336.0 $tz " 
$ns at 10.0 " $node_(25) setdest 181.0 356.0 $tz " 
$ns at 10.0 " $node_(26) setdest 354.0 416.0 $tz " 
$ns at 10.0 " $node_(27) setdest 102.0 318.0 $tz " 
$ns at 10.0 " $node_(28) setdest 76.0 86.0 $tz " 
$ns at 10.0 " $node_(29) setdest 109.0 290.0 $tz " 
$ns at 10.0 " $node_(30) setdest 27.0 42.0 $tz " 
$ns at 10.0 " $node_(31) setdest 403.0 120.0 $tz " 
$ns at 10.0 " $node_(32) setdest 336.0 378.0 $tz " 
$ns at 10.0 " $node_(33) setdest 172.0 370.0 $tz " 
$ns at 10.0 " $node_(34) setdest 99.0 418.0 $tz " 
$ns at 10.0 " $node_(35) setdest 61.0 150.0 $tz " 
$ns at 10.0 " $node_(36) setdest 276.0 277.0 $tz " 
$ns at 10.0 " $node_(37) setdest 333.0 70.0 $tz " 
$ns at 10.0 " $node_(38) setdest 370.0 348.0 $tz " 
$ns at 10.0 " $node_(39) setdest 402.0 42.0 $tz " 
$ns at 10.0 " $node_(40) setdest 57.0 255.0 $tz " 
$ns at 10.0 " $node_(41) setdest 340.0 34.0 $tz " 
$ns at 10.0 " $node_(42) setdest 103.0 236.0 $tz " 
$ns at 10.0 " $node_(43) setdest 253.0 49.0 $tz " 
$ns at 10.0 " $node_(44) setdest 241.0 171.0 $tz " 
$ns at 10.0 " $node_(45) setdest 108.0 95.0 $tz " 
$ns at 10.0 " $node_(46) setdest 158.0 417.0 $tz " 
$ns at 10.0 " $node_(47) setdest 47.0 12.0 $tz " 
$ns at 10.0 " $node_(48) setdest 306.0 36.0 $tz " 
$ns at 10.0 " $node_(49) setdest 47.0 375.0 $tz " 
$ns at 10.0 " $node_(50) setdest 366.0 253.0 $tz " 
$ns at 10.0 " $node_(51) setdest 467.0 314.0 $tz " 
$ns at 10.0 " $node_(52) setdest 148.0 130.0 $tz " 
$ns at 10.0 " $node_(53) setdest 226.0 261.0 $tz " 
$ns at 10.0 " $node_(54) setdest 163.0 45.0 $tz " 
$ns at 10.0 " $node_(55) setdest 48.0 405.0 $tz " 
$ns at 10.0 " $node_(56) setdest 151.0 67.0 $tz " 
$ns at 10.0 " $node_(57) setdest 236.0 388.0 $tz " 
$ns at 10.0 " $node_(58) setdest 42.0 94.0 $tz " 
$ns at 10.0 " $node_(59) setdest 381.0 325.0 $tz " 
$ns at 10.0 " $node_(60) setdest 126.0 225.0 $tz " 
$ns at 10.0 " $node_(61) setdest 436.0 141.0 $tz " 
$ns at 10.0 " $node_(62) setdest 288.0 215.0 $tz " 
$ns at 10.0 " $node_(63) setdest 242.0 114.0 $tz " 
$ns at 10.0 " $node_(64) setdest 337.0 22.0 $tz " 
$ns at 10.0 " $node_(66) setdest 377.0 404.0 $tz " 
$ns at 10.0 " $node_(67) setdest 389.0 233.0 $tz " 
$ns at 10.0 " $node_(68) setdest 44.0 180.0 $tz " 
$ns at 10.0 " $node_(69) setdest 187.0 325.0 $tz " 
$ns at 10.0 " $node_(71) setdest 269.0 14.0 $tz " 
$ns at 10.0 " $node_(72) setdest 301.0 98.0 $tz " 
$ns at 10.0 " $node_(73) setdest 304.0 394.0 $tz " 
$ns at 10.0 " $node_(74) setdest 336.0 154.0 $tz " 
$ns at 10.0 " $node_(75) setdest 80.0 176.0 $tz " 
$ns at 10.0 " $node_(76) setdest 300.0 173.0 $tz " 
$ns at 10.0 " $node_(77) setdest 114.0 326.0 $tz " 
$ns at 10.0 " $node_(78) setdest 310.0 306.0 $tz " 
$ns at 10.0 " $node_(79) setdest 317.0 391.0 $tz " 
$ns at 10.0 " $node_(80) setdest 55.0 273.0 $tz " 
$ns at 10.0 " $node_(82) setdest 209.0 218.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(54) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(66) $null0
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