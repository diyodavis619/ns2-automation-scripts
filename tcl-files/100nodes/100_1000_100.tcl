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
$node_(0) set X_ 761
$node_(0) set Y_ 864
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 657
$node_(1) set Y_ 409
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 598
$node_(2) set Y_ 885
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 248
$node_(3) set Y_ 874
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 572
$node_(4) set Y_ 49
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 683
$node_(5) set Y_ 603
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 16
$node_(6) set Y_ 705
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 931
$node_(7) set Y_ 938
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 572
$node_(8) set Y_ 766
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 618
$node_(9) set Y_ 339
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 107
$node_(10) set Y_ 607
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 11
$node_(11) set Y_ 44
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(13) [$ns node]
$node_(13) set X_ 303
$node_(13) set Y_ 62
$ns initial_node_pos $node_(13) 20

#???13?Node
set node_(14) [$ns node]
$node_(14) set X_ 590
$node_(14) set Y_ 123
$ns initial_node_pos $node_(14) 20

#???14?Node
set node_(15) [$ns node]
$node_(15) set X_ 788
$node_(15) set Y_ 731
$ns initial_node_pos $node_(15) 20

#???15?Node
set node_(16) [$ns node]
$node_(16) set X_ 92
$node_(16) set Y_ 316
$ns initial_node_pos $node_(16) 20

#???16?Node
set node_(17) [$ns node]
$node_(17) set X_ 494
$node_(17) set Y_ 192
$ns initial_node_pos $node_(17) 20

#???17?Node
set node_(18) [$ns node]
$node_(18) set X_ 103
$node_(18) set Y_ 422
$ns initial_node_pos $node_(18) 20

#???18?Node
set node_(19) [$ns node]
$node_(19) set X_ 751
$node_(19) set Y_ 619
$ns initial_node_pos $node_(19) 20

#???19?Node
set node_(20) [$ns node]
$node_(20) set X_ 959
$node_(20) set Y_ 650
$ns initial_node_pos $node_(20) 20

#???20?Node
set node_(21) [$ns node]
$node_(21) set X_ 448
$node_(21) set Y_ 924
$ns initial_node_pos $node_(21) 20

#???21?Node
set node_(22) [$ns node]
$node_(22) set X_ 585
$node_(22) set Y_ 631
$ns initial_node_pos $node_(22) 20

#???22?Node
set node_(23) [$ns node]
$node_(23) set X_ 190
$node_(23) set Y_ 477
$ns initial_node_pos $node_(23) 20

#???23?Node
set node_(24) [$ns node]
$node_(24) set X_ 705
$node_(24) set Y_ 959
$ns initial_node_pos $node_(24) 20

#???24?Node
set node_(25) [$ns node]
$node_(25) set X_ 187
$node_(25) set Y_ 668
$ns initial_node_pos $node_(25) 20

#???25?Node
set node_(26) [$ns node]
$node_(26) set X_ 798
$node_(26) set Y_ 361
$ns initial_node_pos $node_(26) 20

#???26?Node
set node_(27) [$ns node]
$node_(27) set X_ 896
$node_(27) set Y_ 842
$ns initial_node_pos $node_(27) 20

#???27?Node
set node_(28) [$ns node]
$node_(28) set X_ 338
$node_(28) set Y_ 364
$ns initial_node_pos $node_(28) 20

#???28?Node
set node_(29) [$ns node]
$node_(29) set X_ 955
$node_(29) set Y_ 707
$ns initial_node_pos $node_(29) 20

#???29?Node
set node_(30) [$ns node]
$node_(30) set X_ 725
$node_(30) set Y_ 359
$ns initial_node_pos $node_(30) 20

#???30?Node
set node_(31) [$ns node]
$node_(31) set X_ 300
$node_(31) set Y_ 112
$ns initial_node_pos $node_(31) 20

#???31?Node
set node_(32) [$ns node]
$node_(32) set X_ 625
$node_(32) set Y_ 961
$ns initial_node_pos $node_(32) 20

#???32?Node
set node_(33) [$ns node]
$node_(33) set X_ 433
$node_(33) set Y_ 291
$ns initial_node_pos $node_(33) 20

#???33?Node
set node_(34) [$ns node]
$node_(34) set X_ 742
$node_(34) set Y_ 203
$ns initial_node_pos $node_(34) 20

#???34?Node
set node_(35) [$ns node]
$node_(35) set X_ 870
$node_(35) set Y_ 750
$ns initial_node_pos $node_(35) 20

#???35?Node
set node_(36) [$ns node]
$node_(36) set X_ 957
$node_(36) set Y_ 883
$ns initial_node_pos $node_(36) 20

#???36?Node
set node_(37) [$ns node]
$node_(37) set X_ 214
$node_(37) set Y_ 81
$ns initial_node_pos $node_(37) 20

#???37?Node
set node_(38) [$ns node]
$node_(38) set X_ 735
$node_(38) set Y_ 848
$ns initial_node_pos $node_(38) 20

#???38?Node
set node_(39) [$ns node]
$node_(39) set X_ 472
$node_(39) set Y_ 877
$ns initial_node_pos $node_(39) 20

#???39?Node
set node_(40) [$ns node]
$node_(40) set X_ 35
$node_(40) set Y_ 898
$ns initial_node_pos $node_(40) 20

#???40?Node
set node_(41) [$ns node]
$node_(41) set X_ 351
$node_(41) set Y_ 605
$ns initial_node_pos $node_(41) 20

#???41?Node
set node_(42) [$ns node]
$node_(42) set X_ 29
$node_(42) set Y_ 212
$ns initial_node_pos $node_(42) 20

#???42?Node
set node_(43) [$ns node]
$node_(43) set X_ 37
$node_(43) set Y_ 257
$ns initial_node_pos $node_(43) 20

#???43?Node
set node_(44) [$ns node]
$node_(44) set X_ 485
$node_(44) set Y_ 626
$ns initial_node_pos $node_(44) 20

#???44?Node
set node_(45) [$ns node]
$node_(45) set X_ 794
$node_(45) set Y_ 307
$ns initial_node_pos $node_(45) 20

#???45?Node
set node_(46) [$ns node]
$node_(46) set X_ 787
$node_(46) set Y_ 501
$ns initial_node_pos $node_(46) 20

#???46?Node
set node_(47) [$ns node]
$node_(47) set X_ 153
$node_(47) set Y_ 877
$ns initial_node_pos $node_(47) 20

#???47?Node
set node_(48) [$ns node]
$node_(48) set X_ 33
$node_(48) set Y_ 409
$ns initial_node_pos $node_(48) 20

#???48?Node
set node_(49) [$ns node]
$node_(49) set X_ 246
$node_(49) set Y_ 722
$ns initial_node_pos $node_(49) 20

#???49?Node
set node_(50) [$ns node]
$node_(50) set X_ 196
$node_(50) set Y_ 553
$ns initial_node_pos $node_(50) 20

#???50?Node
set node_(51) [$ns node]
$node_(51) set X_ 359
$node_(51) set Y_ 316
$ns initial_node_pos $node_(51) 20

#???51?Node
set node_(52) [$ns node]
$node_(52) set X_ 172
$node_(52) set Y_ 251
$ns initial_node_pos $node_(52) 20

#???52?Node
set node_(53) [$ns node]
$node_(53) set X_ 561
$node_(53) set Y_ 416
$ns initial_node_pos $node_(53) 20

#???53?Node
set node_(54) [$ns node]
$node_(54) set X_ 488
$node_(54) set Y_ 561
$ns initial_node_pos $node_(54) 20

#???54?Node
set node_(55) [$ns node]
$node_(55) set X_ 853
$node_(55) set Y_ 199
$ns initial_node_pos $node_(55) 20

#???55?Node
set node_(56) [$ns node]
$node_(56) set X_ 238
$node_(56) set Y_ 385
$ns initial_node_pos $node_(56) 20

#???56?Node
set node_(57) [$ns node]
$node_(57) set X_ 801
$node_(57) set Y_ 235
$ns initial_node_pos $node_(57) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 824
$node_(58) set Y_ 98
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 161
$node_(59) set Y_ 418
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 944
$node_(60) set Y_ 307
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 350
$node_(61) set Y_ 872
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 42
$node_(62) set Y_ 837
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 114
$node_(63) set Y_ 742
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 937
$node_(64) set Y_ 399
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 18
$node_(65) set Y_ 640
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 551
$node_(66) set Y_ 975
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 466
$node_(67) set Y_ 425
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 49
$node_(68) set Y_ 759
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 137
$node_(69) set Y_ 281
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(70) [$ns node]
$node_(70) set X_ 125
$node_(70) set Y_ 687
$ns initial_node_pos $node_(70) 20

#???70?Node
set node_(71) [$ns node]
$node_(71) set X_ 959
$node_(71) set Y_ 485
$ns initial_node_pos $node_(71) 20

#???71?Node
set node_(72) [$ns node]
$node_(72) set X_ 901
$node_(72) set Y_ 746
$ns initial_node_pos $node_(72) 20

#???72?Node
set node_(73) [$ns node]
$node_(73) set X_ 268
$node_(73) set Y_ 255
$ns initial_node_pos $node_(73) 20

#???73?Node
set node_(74) [$ns node]
$node_(74) set X_ 127
$node_(74) set Y_ 18
$ns initial_node_pos $node_(74) 20

#???74?Node
set node_(75) [$ns node]
$node_(75) set X_ 612
$node_(75) set Y_ 594
$ns initial_node_pos $node_(75) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 40
$node_(76) set Y_ 16
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 788
$node_(77) set Y_ 68
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 655
$node_(78) set Y_ 257
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(79) [$ns node]
$node_(79) set X_ 109
$node_(79) set Y_ 129
$ns initial_node_pos $node_(79) 20

#???79?Node
set node_(80) [$ns node]
$node_(80) set X_ 522
$node_(80) set Y_ 459
$ns initial_node_pos $node_(80) 20

#???80?Node
set node_(81) [$ns node]
$node_(81) set X_ 546
$node_(81) set Y_ 270
$ns initial_node_pos $node_(81) 20

#???81?Node
set node_(82) [$ns node]
$node_(82) set X_ 98
$node_(82) set Y_ 511
$ns initial_node_pos $node_(82) 20

#???82?Node
set node_(83) [$ns node]
$node_(83) set X_ 301
$node_(83) set Y_ 525
$ns initial_node_pos $node_(83) 20

#???83?Node
set node_(84) [$ns node]
$node_(84) set X_ 622
$node_(84) set Y_ 166
$ns initial_node_pos $node_(84) 20

#???84?Node
set node_(85) [$ns node]
$node_(85) set X_ 435
$node_(85) set Y_ 353
$ns initial_node_pos $node_(85) 20

#???85?Node
set node_(86) [$ns node]
$node_(86) set X_ 325
$node_(86) set Y_ 411
$ns initial_node_pos $node_(86) 20

#???86?Node
set node_(87) [$ns node]
$node_(87) set X_ 157
$node_(87) set Y_ 787
$ns initial_node_pos $node_(87) 20

#???87?Node
set node_(88) [$ns node]
$node_(88) set X_ 22
$node_(88) set Y_ 979
$ns initial_node_pos $node_(88) 20

#???88?Node
set node_(89) [$ns node]
$node_(89) set X_ 416
$node_(89) set Y_ 464
$ns initial_node_pos $node_(89) 20

#???89?Node
set node_(90) [$ns node]
$node_(90) set X_ 31
$node_(90) set Y_ 144
$ns initial_node_pos $node_(90) 20

#???90?Node
set node_(91) [$ns node]
$node_(91) set X_ 129
$node_(91) set Y_ 353
$ns initial_node_pos $node_(91) 20

#???91?Node
set node_(92) [$ns node]
$node_(92) set X_ 909
$node_(92) set Y_ 112
$ns initial_node_pos $node_(92) 20

#???92?Node
set node_(93) [$ns node]
$node_(93) set X_ 683
$node_(93) set Y_ 85
$ns initial_node_pos $node_(93) 20

#???93?Node
set node_(94) [$ns node]
$node_(94) set X_ 629
$node_(94) set Y_ 529
$ns initial_node_pos $node_(94) 20

#???94?Node
set node_(95) [$ns node]
$node_(95) set X_ 912
$node_(95) set Y_ 246
$ns initial_node_pos $node_(95) 20

#???95?Node
set node_(96) [$ns node]
$node_(96) set X_ 29
$node_(96) set Y_ 362
$ns initial_node_pos $node_(96) 20

#???96?Node
set node_(97) [$ns node]
$node_(97) set X_ 737
$node_(97) set Y_ 511
$ns initial_node_pos $node_(97) 20

#???97?Node
set node_(98) [$ns node]
$node_(98) set X_ 377
$node_(98) set Y_ 670
$ns initial_node_pos $node_(98) 20

#???98?Node
set node_(99) [$ns node]
$node_(99) set X_ 35
$node_(99) set Y_ 503
$ns initial_node_pos $node_(99) 20

#???99?Node
set node_(100) [$ns node]
$node_(100) set X_ 838
$node_(100) set Y_ 614
$ns initial_node_pos $node_(100) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 83.0 825.0 $tz " 
$ns at 10.0 " $node_(1) setdest 744.0 390.0 $tz " 
$ns at 10.0 " $node_(2) setdest 627.0 816.0 $tz " 
$ns at 10.0 " $node_(3) setdest 314.0 814.0 $tz " 
$ns at 10.0 " $node_(4) setdest 609.0 16.0 $tz " 
$ns at 10.0 " $node_(5) setdest 251.0 101.0 $tz " 
$ns at 10.0 " $node_(6) setdest 881.0 901.0 $tz " 
$ns at 10.0 " $node_(7) setdest 672.0 916.0 $tz " 
$ns at 10.0 " $node_(8) setdest 412.0 681.0 $tz " 
$ns at 10.0 " $node_(9) setdest 687.0 337.0 $tz " 
$ns at 10.0 " $node_(10) setdest 901.0 398.0 $tz " 
$ns at 10.0 " $node_(11) setdest 911.0 25.0 $tz " 
$ns at 10.0 " $node_(13) setdest 501.0 938.0 $tz " 
$ns at 10.0 " $node_(14) setdest 714.0 140.0 $tz " 
$ns at 10.0 " $node_(15) setdest 174.0 927.0 0.0 " 
$ns at 10.0 " $node_(16) setdest 918.0 872.0 $tz " 
$ns at 10.0 " $node_(17) setdest 70.0 285.0 $tz " 
$ns at 10.0 " $node_(18) setdest 816.0 790.0 $tz " 
$ns at 10.0 " $node_(19) setdest 720.0 574.0 $tz " 
$ns at 10.0 " $node_(20) setdest 901.0 151.0 $tz " 
$ns at 10.0 " $node_(21) setdest 72.0 337.0 $tz " 
$ns at 10.0 " $node_(22) setdest 940.0 674.0 $tz " 
$ns at 10.0 " $node_(23) setdest 279.0 487.0 $tz " 
$ns at 10.0 " $node_(24) setdest 124.0 944.0 $tz " 
$ns at 10.0 " $node_(25) setdest 894.0 796.0 $tz " 
$ns at 10.0 " $node_(26) setdest 112.0 85.0 $tz " 
$ns at 10.0 " $node_(27) setdest 61.0 590.0 $tz " 
$ns at 10.0 " $node_(28) setdest 431.0 409.0 $tz " 
$ns at 10.0 " $node_(29) setdest 81.0 462.0 $tz " 
$ns at 10.0 " $node_(30) setdest 333.0 25.0 $tz " 
$ns at 10.0 " $node_(31) setdest 527.0 681.0 $tz " 
$ns at 10.0 " $node_(32) setdest 324.0 674.0 $tz " 
$ns at 10.0 " $node_(33) setdest 344.0 242.0 $tz " 
$ns at 10.0 " $node_(34) setdest 642.0 207.0 $tz " 
$ns at 10.0 " $node_(35) setdest 77.0 881.0 $tz " 
$ns at 10.0 " $node_(36) setdest 824.0 670.0 $tz " 
$ns at 10.0 " $node_(37) setdest 64.0 635.0 $tz " 
$ns at 10.0 " $node_(38) setdest 242.0 672.0 $tz " 
$ns at 10.0 " $node_(39) setdest 507.0 822.0 $tz " 
$ns at 10.0 " $node_(40) setdest 688.0 818.0 $tz " 
$ns at 10.0 " $node_(41) setdest 283.0 607.0 $tz " 
$ns at 10.0 " $node_(42) setdest 203.0 16.0 $tz " 
$ns at 10.0 " $node_(43) setdest 701.0 27.0 $tz " 
$ns at 10.0 " $node_(44) setdest 431.0 614.0 $tz " 
$ns at 10.0 " $node_(45) setdest 716.0 288.0 $tz " 
$ns at 10.0 " $node_(46) setdest 203.0 135.0 $tz " 
$ns at 10.0 " $node_(47) setdest 227.0 803.0 $tz " 
$ns at 10.0 " $node_(48) setdest 872.0 320.0 $tz " 
$ns at 10.0 " $node_(49) setdest 779.0 905.0 $tz " 
$ns at 10.0 " $node_(50) setdest 279.0 18.0 $tz " 
$ns at 10.0 " $node_(51) setdest 59.0 161.0 $tz " 
$ns at 10.0 " $node_(52) setdest 203.0 205.0 $tz " 
$ns at 10.0 " $node_(53) setdest 735.0 692.0 $tz " 
$ns at 10.0 " $node_(54) setdest 557.0 624.0 $tz " 
$ns at 10.0 " $node_(55) setdest 344.0 74.0 $tz " 
$ns at 10.0 " $node_(56) setdest 290.0 431.0 $tz " 
$ns at 10.0 " $node_(57) setdest 66.0 698.0 $tz " 
$ns at 10.0 " $node_(58) setdest 64.0 101.0 $tz " 
$ns at 10.0 " $node_(59) setdest 70.0 948.0 $tz " 
$ns at 10.0 " $node_(60) setdest 64.0 757.0 $tz " 
$ns at 10.0 " $node_(61) setdest 398.0 811.0 $tz " 
$ns at 10.0 " $node_(62) setdest 672.0 655.0 $tz " 
$ns at 10.0 " $node_(63) setdest 657.0 485.0 $tz " 
$ns at 10.0 " $node_(64) setdest 66.0 542.0 $tz " 
$ns at 10.0 " $node_(65) setdest 242.0 546.0 $tz " 
$ns at 10.0 " $node_(66) setdest 405.0 937.0 $tz " 
$ns at 10.0 " $node_(67) setdest 544.0 35.0 $tz " 
$ns at 10.0 " $node_(68) setdest 249.0 933.0 $tz " 
$ns at 10.0 " $node_(69) setdest 633.0 927.0 $tz " 
$ns at 10.0 " $node_(70) setdest 157.0 594.0 $tz " 
$ns at 10.0 " $node_(71) setdest 135.0 451.0 $tz " 
$ns at 10.0 " $node_(72) setdest 883.0 255.0 $tz " 
$ns at 10.0 " $node_(73) setdest 294.0 199.0 $tz " 
$ns at 10.0 " $node_(74) setdest 792.0 457.0 $tz " 
$ns at 10.0 " $node_(75) setdest 300.0 929.0 $tz " 
$ns at 10.0 " $node_(76) setdest 848.0 922.0 $tz " 
$ns at 10.0 " $node_(77) setdest 962.0 35.0 $tz " 
$ns at 10.0 " $node_(78) setdest 566.0 237.0 $tz " 
$ns at 10.0 " $node_(79) setdest 861.0 25.0 $tz " 
$ns at 10.0 " $node_(80) setdest 468.0 525.0 $tz " 
$ns at 10.0 " $node_(81) setdest 457.0 248.0 $tz " 
$ns at 10.0 " $node_(82) setdest 911.0 548.0 $tz " 
$ns at 10.0 " $node_(83) setdest 424.0 553.0 $tz " 
$ns at 10.0 " $node_(84) setdest 70.0 218.0 $tz " 
$ns at 10.0 " $node_(85) setdest 148.0 66.0 $tz " 
$ns at 10.0 " $node_(86) setdest 514.0 116.0 $tz " 
$ns at 10.0 " $node_(87) setdest 688.0 712.0 $tz " 
$ns at 10.0 " $node_(88) setdest 546.0 927.0 $tz " 
$ns at 10.0 " $node_(89) setdest 327.0 461.0 $tz " 
$ns at 10.0 " $node_(90) setdest 761.0 16.0 $tz " 
$ns at 10.0 " $node_(91) setdest 281.0 325.0 $tz " 
$ns at 10.0 " $node_(92) setdest 468.0 22.0 $tz " 
$ns at 10.0 " $node_(93) setdest 901.0 481.0 $tz " 
$ns at 10.0 " $node_(94) setdest 531.0 537.0 $tz " 
$ns at 10.0 " $node_(95) setdest 74.0 399.0 $tz " 
$ns at 10.0 " $node_(96) setdest 555.0 362.0 $tz " 
$ns at 10.0 " $node_(97) setdest 590.0 442.0 $tz " 
$ns at 10.0 " $node_(98) setdest 803.0 153.0 $tz " 
$ns at 10.0 " $node_(99) setdest 907.0 577.0 $tz " 
$ns at 10.0 " $node_(100) setdest 805.0 564.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(37) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(62) $null0
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