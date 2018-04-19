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
$node_(0) set X_ 423
$node_(0) set Y_ 303
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 136
$node_(1) set Y_ 57
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 336
$node_(2) set Y_ 116
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 152
$node_(3) set Y_ 37
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 147
$node_(4) set Y_ 270
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 39
$node_(5) set Y_ 83
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 125
$node_(6) set Y_ 297
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 203
$node_(7) set Y_ 349
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 14
$node_(8) set Y_ 48
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 151
$node_(9) set Y_ 396
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 300
$node_(10) set Y_ 84
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 256
$node_(11) set Y_ 21
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 13
$node_(12) set Y_ 93
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 14
$node_(13) set Y_ 341
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 35
$node_(14) set Y_ 330
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 232
$node_(15) set Y_ 108
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 126
$node_(16) set Y_ 242
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 244
$node_(17) set Y_ 351
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 336
$node_(18) set Y_ 396
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 93
$node_(19) set Y_ 133
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 420
$node_(20) set Y_ 512
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 403
$node_(21) set Y_ 10
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 296
$node_(22) set Y_ 24
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 223
$node_(23) set Y_ 249
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 345
$node_(24) set Y_ 150
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 257
$node_(25) set Y_ 224
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 110
$node_(26) set Y_ 384
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 8
$node_(27) set Y_ 72
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 406
$node_(28) set Y_ 44
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 214
$node_(29) set Y_ 54
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 299
$node_(30) set Y_ 503
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 63
$node_(31) set Y_ 178
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 363
$node_(32) set Y_ 409
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 15
$node_(33) set Y_ 27
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 339
$node_(34) set Y_ 229
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 34
$node_(35) set Y_ 287
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 212
$node_(36) set Y_ 301
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 373
$node_(37) set Y_ 272
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 455
$node_(38) set Y_ 450
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 172
$node_(39) set Y_ 21
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 427
$node_(40) set Y_ 362
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 12
$node_(41) set Y_ 185
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 231
$node_(42) set Y_ 512
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 106
$node_(43) set Y_ 184
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 451
$node_(44) set Y_ 510
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 42
$node_(45) set Y_ 191
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 188
$node_(46) set Y_ 111
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 87
$node_(47) set Y_ 463
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 71
$node_(48) set Y_ 210
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 324
$node_(49) set Y_ 17
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 420
$node_(50) set Y_ 41
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 333
$node_(51) set Y_ 355
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 437
$node_(52) set Y_ 178
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 16
$node_(53) set Y_ 501
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 109
$node_(54) set Y_ 14
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 44
$node_(55) set Y_ 223
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 124
$node_(56) set Y_ 276
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 251
$node_(57) set Y_ 165
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 14
$node_(58) set Y_ 235
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 148
$node_(59) set Y_ 349
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 59
$node_(60) set Y_ 505
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 16
$node_(61) set Y_ 316
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 92
$node_(62) set Y_ 277
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 45
$node_(63) set Y_ 447
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 11
$node_(64) set Y_ 394
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 422
$node_(65) set Y_ 244
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 299
$node_(66) set Y_ 170
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 11
$node_(67) set Y_ 429
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 68
$node_(68) set Y_ 385
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 412
$node_(69) set Y_ 251
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 174
$node_(70) set Y_ 302
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 153
$node_(71) set Y_ 503
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 226
$node_(72) set Y_ 392
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 76
$node_(73) set Y_ 121
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 189
$node_(74) set Y_ 396
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 25
$node_(75) set Y_ 153
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 328
$node_(76) set Y_ 308
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 26
$node_(77) set Y_ 371
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 348
$node_(78) set Y_ 190
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 104
$node_(79) set Y_ 500
$ns initial_node_pos $node_(79) 20

#???80?Node
set node_(80) [$ns node]
$node_(80) set X_ 181
$node_(80) set Y_ 252
$ns initial_node_pos $node_(80) 20

#???81?Node
set node_(81) [$ns node]
$node_(81) set X_ 176
$node_(81) set Y_ 182
$ns initial_node_pos $node_(81) 20

#???82?Node
set node_(82) [$ns node]
$node_(82) set X_ 179
$node_(82) set Y_ 231
$ns initial_node_pos $node_(82) 20

#???83?Node
set node_(83) [$ns node]
$node_(83) set X_ 292
$node_(83) set Y_ 302
$ns initial_node_pos $node_(83) 20

#???84?Node
set node_(84) [$ns node]
$node_(84) set X_ 14
$node_(84) set Y_ 121
$ns initial_node_pos $node_(84) 20

#???85?Node
set node_(85) [$ns node]
$node_(85) set X_ 266
$node_(85) set Y_ 401
$ns initial_node_pos $node_(85) 20

#???86?Node
set node_(86) [$ns node]
$node_(86) set X_ 345
$node_(86) set Y_ 504
$ns initial_node_pos $node_(86) 20

#???87?Node
set node_(87) [$ns node]
$node_(87) set X_ 150
$node_(87) set Y_ 109
$ns initial_node_pos $node_(87) 20

#???88?Node
set node_(88) [$ns node]
$node_(88) set X_ 217
$node_(88) set Y_ 197
$ns initial_node_pos $node_(88) 20

#???89?Node
set node_(89) [$ns node]
$node_(89) set X_ 303
$node_(89) set Y_ 399
$ns initial_node_pos $node_(89) 20

#???90?Node
set node_(90) [$ns node]
$node_(90) set X_ 381
$node_(90) set Y_ 92
$ns initial_node_pos $node_(90) 20

#???91?Node
set node_(91) [$ns node]
$node_(91) set X_ 366
$node_(91) set Y_ 57
$ns initial_node_pos $node_(91) 20

#???92?Node
set node_(92) [$ns node]
$node_(92) set X_ 350
$node_(92) set Y_ 27
$ns initial_node_pos $node_(92) 20

#???93?Node
set node_(93) [$ns node]
$node_(93) set X_ 76
$node_(93) set Y_ 77
$ns initial_node_pos $node_(93) 20

#???94?Node
set node_(94) [$ns node]
$node_(94) set X_ 283
$node_(94) set Y_ 130
$ns initial_node_pos $node_(94) 20

#???95?Node
set node_(95) [$ns node]
$node_(95) set X_ 250
$node_(95) set Y_ 301
$ns initial_node_pos $node_(95) 20

#???96?Node
set node_(96) [$ns node]
$node_(96) set X_ 292
$node_(96) set Y_ 353
$ns initial_node_pos $node_(96) 20

#???97?Node
set node_(97) [$ns node]
$node_(97) set X_ 422
$node_(97) set Y_ 419
$ns initial_node_pos $node_(97) 20

#???98?Node
set node_(98) [$ns node]
$node_(98) set X_ 233
$node_(98) set Y_ 40
$ns initial_node_pos $node_(98) 20

#???99?Node
set node_(99) [$ns node]
$node_(99) set X_ 26
$node_(99) set Y_ 270
$ns initial_node_pos $node_(99) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 46.0 499.0 $tz " 
$ns at 10.0 " $node_(1) setdest 173.0 77.0 $tz " 
$ns at 10.0 " $node_(2) setdest 300.0 116.0 $tz " 
$ns at 10.0 " $node_(3) setdest 28.0 478.0 $tz " 
$ns at 10.0 " $node_(4) setdest 446.0 382.0 $tz " 
$ns at 10.0 " $node_(5) setdest 441.0 59.0 $tz " 
$ns at 10.0 " $node_(6) setdest 56.0 333.0 $tz " 
$ns at 10.0 " $node_(7) setdest 219.0 361.0 $tz " 
$ns at 10.0 " $node_(8) setdest 87.0 20.0 $tz " 
$ns at 10.0 " $node_(9) setdest 188.0 427.0 $tz " 
$ns at 10.0 " $node_(10) setdest 272.0 93.0 $tz " 
$ns at 10.0 " $node_(11) setdest 127.0 485.0 $tz " 
$ns at 10.0 " $node_(12) setdest 108.0 96.0 $tz " 
$ns at 10.0 " $node_(13) setdest 85.0 364.0 $tz " 
$ns at 10.0 " $node_(14) setdest 447.0 340.0 $tz " 
$ns at 10.0 " $node_(15) setdest 264.0 123.0 $tz " 
$ns at 10.0 " $node_(16) setdest 174.0 436.0 $tz " 
$ns at 10.0 " $node_(17) setdest 278.0 340.0 $tz " 
$ns at 10.0 " $node_(18) setdest 374.0 376.0 $tz " 
$ns at 10.0 " $node_(19) setdest 127.0 149.0 $tz " 
$ns at 10.0 " $node_(20) setdest 394.0 477.0 $tz " 
$ns at 10.0 " $node_(21) setdest 99.0 216.0 $tz " 
$ns at 10.0 " $node_(22) setdest 266.0 59.0 $tz " 
$ns at 10.0 " $node_(23) setdest 450.0 365.0 $tz " 
$ns at 10.0 " $node_(24) setdest 393.0 220.0 $tz " 
$ns at 10.0 " $node_(25) setdest 162.0 215.0 $tz " 
$ns at 10.0 " $node_(26) setdest 100.0 409.0 $tz " 
$ns at 10.0 " $node_(27) setdest 70.0 46.0 $tz " 
$ns at 10.0 " $node_(28) setdest 310.0 483.0 $tz " 
$ns at 10.0 " $node_(29) setdest 194.0 39.0 $tz " 
$ns at 10.0 " $node_(30) setdest 448.0 316.0 $tz " 
$ns at 10.0 " $node_(31) setdest 445.0 123.0 $tz " 
$ns at 10.0 " $node_(32) setdest 62.0 286.0 $tz " 
$ns at 10.0 " $node_(33) setdest 51.0 9.0 $tz " 
$ns at 10.0 " $node_(34) setdest 358.0 460.0 $tz " 
$ns at 10.0 " $node_(35) setdest 410.0 493.0 $tz " 
$ns at 10.0 " $node_(36) setdest 227.0 333.0 $tz " 
$ns at 10.0 " $node_(37) setdest 182.0 452.0 $tz " 
$ns at 10.0 " $node_(38) setdest 214.0 489.0 $tz " 
$ns at 10.0 " $node_(39) setdest 400.0 421.0 $tz " 
$ns at 10.0 " $node_(40) setdest 59.0 436.0 $tz " 
$ns at 10.0 " $node_(41) setdest 126.0 373.0 $tz " 
$ns at 10.0 " $node_(42) setdest 384.0 265.0 $tz " 
$ns at 10.0 " $node_(43) setdest 166.0 150.0 $tz " 
$ns at 10.0 " $node_(44) setdest 80.0 181.0 $tz " 
$ns at 10.0 " $node_(45) setdest 126.0 437.0 $tz " 
$ns at 10.0 " $node_(46) setdest 220.0 137.0 $tz " 
$ns at 10.0 " $node_(47) setdest 322.0 155.0 $tz " 
$ns at 10.0 " $node_(48) setdest 445.0 233.0 $tz " 
$ns at 10.0 " $node_(49) setdest 416.0 26.0 $tz " 
$ns at 10.0 " $node_(50) setdest 69.0 164.0 $tz " 
$ns at 10.0 " $node_(51) setdest 381.0 355.0 $tz " 
$ns at 10.0 " $node_(52) setdest 21.0 487.0 $tz " 
$ns at 10.0 " $node_(53) setdest 38.0 425.0 $tz " 
$ns at 10.0 " $node_(54) setdest 378.0 400.0 $tz " 
$ns at 10.0 " $node_(55) setdest 450.0 201.0 $tz " 
$ns at 10.0 " $node_(56) setdest 452.0 288.0 $tz " 
$ns at 10.0 " $node_(57) setdest 324.0 440.0 $tz " 
$ns at 10.0 " $node_(58) setdest 144.0 233.0 $tz " 
$ns at 10.0 " $node_(59) setdest 170.0 377.0 $tz " 
$ns at 10.0 " $node_(60) setdest 375.0 485.0 $tz " 
$ns at 10.0 " $node_(61) setdest 66.0 310.0 $tz " 
$ns at 10.0 " $node_(62) setdest 317.0 242.0 $tz " 
$ns at 10.0 " $node_(63) setdest 298.0 438.0 $tz " 
$ns at 10.0 " $node_(64) setdest 93.0 347.0 $tz " 
$ns at 10.0 " $node_(65) setdest 451.0 261.0 $tz " 
$ns at 10.0 " $node_(66) setdest 227.0 184.0 $tz " 
$ns at 10.0 " $node_(67) setdest 34.0 392.0 $tz " 
$ns at 10.0 " $node_(68) setdest 68.0 415.0 $tz " 
$ns at 10.0 " $node_(69) setdest 246.0 498.0 $tz " 
$ns at 10.0 " $node_(70) setdest 146.0 314.0 $tz " 
$ns at 10.0 " $node_(71) setdest 393.0 465.0 $tz " 
$ns at 10.0 " $node_(72) setdest 261.0 422.0 $tz " 
$ns at 10.0 " $node_(73) setdest 216.0 16.0 $tz " 
$ns at 10.0 " $node_(74) setdest 236.0 427.0 $tz " 
$ns at 10.0 " $node_(75) setdest 450.0 168.0 $tz " 
$ns at 10.0 " $node_(76) setdest 381.0 317.0 $tz " 
$ns at 10.0 " $node_(77) setdest 373.0 476.0 $tz " 
$ns at 10.0 " $node_(78) setdest 442.0 92.0 $tz " 
$ns at 10.0 " $node_(79) setdest 85.0 497.0 $tz " 
$ns at 10.0 " $node_(80) setdest 213.0 276.0 $tz " 
$ns at 10.0 " $node_(81) setdest 219.0 177.0 $tz " 
$ns at 10.0 " $node_(82) setdest 396.0 148.0 $tz " 
$ns at 10.0 " $node_(83) setdest 277.0 298.0 $tz " 
$ns at 10.0 " $node_(84) setdest 66.0 133.0 $tz " 
$ns at 10.0 " $node_(85) setdest 265.0 385.0 $tz " 
$ns at 10.0 " $node_(86) setdest 91.0 448.0 $tz " 
$ns at 10.0 " $node_(87) setdest 113.0 107.0 $tz " 
$ns at 10.0 " $node_(88) setdest 78.0 248.0 $tz " 
$ns at 10.0 " $node_(89) setdest 213.0 379.0 $tz " 
$ns at 10.0 " $node_(90) setdest 343.0 100.0 $tz " 
$ns at 10.0 " $node_(91) setdest 329.0 72.0 $tz " 
$ns at 10.0 " $node_(92) setdest 253.0 490.0 $tz " 
$ns at 10.0 " $node_(93) setdest 132.0 20.0 $tz " 
$ns at 10.0 " $node_(94) setdest 251.0 435.0 $tz " 
$ns at 10.0 " $node_(95) setdest 216.0 283.0 $tz " 
$ns at 10.0 " $node_(96) setdest 251.0 337.0 $tz " 
$ns at 10.0 " $node_(97) setdest 367.0 420.0 $tz " 
$ns at 10.0 " $node_(98) setdest 183.0 489.0 $tz " 
$ns at 10.0 " $node_(99) setdest 136.0 253.0 $tz " 


#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(5) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(60) $null0
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