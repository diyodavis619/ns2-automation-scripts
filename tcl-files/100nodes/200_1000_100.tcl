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
set val(nn)     200           ;# number of mobilenodes
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
$node_(0) set X_ 530
$node_(0) set Y_ 567
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(2) [$ns node]
$node_(2) set X_ 218
$node_(2) set Y_ 273
$ns initial_node_pos $node_(2) 20

#???2?Node
set node_(3) [$ns node]
$node_(3) set X_ 477
$node_(3) set Y_ 484
$ns initial_node_pos $node_(3) 20

#???3?Node
set node_(4) [$ns node]
$node_(4) set X_ 330
$node_(4) set Y_ 277
$ns initial_node_pos $node_(4) 20

#???4?Node
set node_(5) [$ns node]
$node_(5) set X_ 249
$node_(5) set Y_ 652
$ns initial_node_pos $node_(5) 20

#???5?Node
set node_(6) [$ns node]
$node_(6) set X_ 983
$node_(6) set Y_ 67
$ns initial_node_pos $node_(6) 20

#???6?Node
set node_(7) [$ns node]
$node_(7) set X_ 288
$node_(7) set Y_ 25
$ns initial_node_pos $node_(7) 20

#???7?Node
set node_(8) [$ns node]
$node_(8) set X_ 515
$node_(8) set Y_ 730
$ns initial_node_pos $node_(8) 20

#???8?Node
set node_(9) [$ns node]
$node_(9) set X_ 146
$node_(9) set Y_ 122
$ns initial_node_pos $node_(9) 20

#???9?Node
set node_(10) [$ns node]
$node_(10) set X_ 796
$node_(10) set Y_ 426
$ns initial_node_pos $node_(10) 20

#???10?Node
set node_(11) [$ns node]
$node_(11) set X_ 67
$node_(11) set Y_ 448
$ns initial_node_pos $node_(11) 20

#???11?Node
set node_(12) [$ns node]
$node_(12) set X_ 741
$node_(12) set Y_ 322
$ns initial_node_pos $node_(12) 20

#???12?Node
set node_(13) [$ns node]
$node_(13) set X_ 162
$node_(13) set Y_ 775
$ns initial_node_pos $node_(13) 20

#???13?Node
set node_(14) [$ns node]
$node_(14) set X_ 764
$node_(14) set Y_ 643
$ns initial_node_pos $node_(14) 20

#???14?Node
set node_(15) [$ns node]
$node_(15) set X_ 897
$node_(15) set Y_ 531
$ns initial_node_pos $node_(15) 20

#???15?Node
set node_(16) [$ns node]
$node_(16) set X_ 20
$node_(16) set Y_ 752
$ns initial_node_pos $node_(16) 20

#???16?Node
set node_(17) [$ns node]
$node_(17) set X_ 518
$node_(17) set Y_ 799
$ns initial_node_pos $node_(17) 20

#???17?Node
set node_(18) [$ns node]
$node_(18) set X_ 62
$node_(18) set Y_ 122
$ns initial_node_pos $node_(18) 20

#???18?Node
set node_(19) [$ns node]
$node_(19) set X_ 771
$node_(19) set Y_ 477
$ns initial_node_pos $node_(19) 20

#???19?Node
set node_(20) [$ns node]
$node_(20) set X_ 626
$node_(20) set Y_ 484
$ns initial_node_pos $node_(20) 20

#???20?Node
set node_(21) [$ns node]
$node_(21) set X_ 912
$node_(21) set Y_ 262
$ns initial_node_pos $node_(21) 20

#???21?Node
set node_(22) [$ns node]
$node_(22) set X_ 480
$node_(22) set Y_ 136
$ns initial_node_pos $node_(22) 20

#???22?Node
set node_(23) [$ns node]
$node_(23) set X_ 445
$node_(23) set Y_ 183
$ns initial_node_pos $node_(23) 20

#???23?Node
set node_(24) [$ns node]
$node_(24) set X_ 556
$node_(24) set Y_ 73
$ns initial_node_pos $node_(24) 20

#???24?Node
set node_(25) [$ns node]
$node_(25) set X_ 271
$node_(25) set Y_ 269
$ns initial_node_pos $node_(25) 20

#???25?Node
set node_(26) [$ns node]
$node_(26) set X_ 819
$node_(26) set Y_ 42
$ns initial_node_pos $node_(26) 20

#???26?Node
set node_(27) [$ns node]
$node_(27) set X_ 46
$node_(27) set Y_ 968
$ns initial_node_pos $node_(27) 20

#???27?Node
set node_(28) [$ns node]
$node_(28) set X_ 137
$node_(28) set Y_ 590
$ns initial_node_pos $node_(28) 20

#???28?Node
set node_(29) [$ns node]
$node_(29) set X_ 282
$node_(29) set Y_ 684
$ns initial_node_pos $node_(29) 20

#???29?Node
set node_(30) [$ns node]
$node_(30) set X_ 667
$node_(30) set Y_ 566
$ns initial_node_pos $node_(30) 20

#???30?Node
set node_(31) [$ns node]
$node_(31) set X_ 631
$node_(31) set Y_ 85
$ns initial_node_pos $node_(31) 20

#???31?Node
set node_(32) [$ns node]
$node_(32) set X_ 384
$node_(32) set Y_ 20
$ns initial_node_pos $node_(32) 20

#???32?Node
set node_(33) [$ns node]
$node_(33) set X_ 800
$node_(33) set Y_ 915
$ns initial_node_pos $node_(33) 20

#???33?Node
set node_(34) [$ns node]
$node_(34) set X_ 804
$node_(34) set Y_ 634
$ns initial_node_pos $node_(34) 20

#???34?Node
set node_(35) [$ns node]
$node_(35) set X_ 349
$node_(35) set Y_ 190
$ns initial_node_pos $node_(35) 20

#???35?Node
set node_(36) [$ns node]
$node_(36) set X_ 128
$node_(36) set Y_ 657
$ns initial_node_pos $node_(36) 20

#???36?Node
set node_(37) [$ns node]
$node_(37) set X_ 128
$node_(37) set Y_ 418
$ns initial_node_pos $node_(37) 20

#???37?Node
set node_(38) [$ns node]
$node_(38) set X_ 991
$node_(38) set Y_ 181
$ns initial_node_pos $node_(38) 20

#???38?Node
set node_(39) [$ns node]
$node_(39) set X_ 805
$node_(39) set Y_ 719
$ns initial_node_pos $node_(39) 20

#???39?Node
set node_(40) [$ns node]
$node_(40) set X_ 335
$node_(40) set Y_ 333
$ns initial_node_pos $node_(40) 20

#???40?Node
set node_(41) [$ns node]
$node_(41) set X_ 32
$node_(41) set Y_ 26
$ns initial_node_pos $node_(41) 20

#???41?Node
set node_(42) [$ns node]
$node_(42) set X_ 313
$node_(42) set Y_ 909
$ns initial_node_pos $node_(42) 20

#???42?Node
set node_(43) [$ns node]
$node_(43) set X_ 980
$node_(43) set Y_ 10
$ns initial_node_pos $node_(43) 20

#???43?Node
set node_(44) [$ns node]
$node_(44) set X_ 145
$node_(44) set Y_ 356
$ns initial_node_pos $node_(44) 20

#???44?Node
set node_(45) [$ns node]
$node_(45) set X_ 630
$node_(45) set Y_ 918
$ns initial_node_pos $node_(45) 20

#???45?Node
set node_(46) [$ns node]
$node_(46) set X_ 265
$node_(46) set Y_ 75
$ns initial_node_pos $node_(46) 20

#???46?Node
set node_(47) [$ns node]
$node_(47) set X_ 192
$node_(47) set Y_ 413
$ns initial_node_pos $node_(47) 20

#???47?Node
set node_(48) [$ns node]
$node_(48) set X_ 703
$node_(48) set Y_ 481
$ns initial_node_pos $node_(48) 20

#???48?Node
set node_(49) [$ns node]
$node_(49) set X_ 932
$node_(49) set Y_ 790
$ns initial_node_pos $node_(49) 20

#???49?Node
set node_(50) [$ns node]
$node_(50) set X_ 722
$node_(50) set Y_ 813
$ns initial_node_pos $node_(50) 20

#???50?Node
set node_(51) [$ns node]
$node_(51) set X_ 916
$node_(51) set Y_ 648
$ns initial_node_pos $node_(51) 20

#???51?Node
set node_(52) [$ns node]
$node_(52) set X_ 872
$node_(52) set Y_ 160
$ns initial_node_pos $node_(52) 20

#???52?Node
set node_(53) [$ns node]
$node_(53) set X_ 637
$node_(53) set Y_ 647
$ns initial_node_pos $node_(53) 20

#???53?Node
set node_(54) [$ns node]
$node_(54) set X_ 658
$node_(54) set Y_ 735
$ns initial_node_pos $node_(54) 20

#???54?Node
set node_(55) [$ns node]
$node_(55) set X_ 849
$node_(55) set Y_ 243
$ns initial_node_pos $node_(55) 20

#???55?Node
set node_(56) [$ns node]
$node_(56) set X_ 324
$node_(56) set Y_ 44
$ns initial_node_pos $node_(56) 20

#???56?Node
set node_(57) [$ns node]
$node_(57) set X_ 443
$node_(57) set Y_ 658
$ns initial_node_pos $node_(57) 20

#???57?Node
set node_(58) [$ns node]
$node_(58) set X_ 142
$node_(58) set Y_ 231
$ns initial_node_pos $node_(58) 20

#???58?Node
set node_(59) [$ns node]
$node_(59) set X_ 981
$node_(59) set Y_ 122
$ns initial_node_pos $node_(59) 20

#???59?Node
set node_(60) [$ns node]
$node_(60) set X_ 389
$node_(60) set Y_ 557
$ns initial_node_pos $node_(60) 20

#???60?Node
set node_(61) [$ns node]
$node_(61) set X_ 981
$node_(61) set Y_ 577
$ns initial_node_pos $node_(61) 20

#???61?Node
set node_(62) [$ns node]
$node_(62) set X_ 594
$node_(62) set Y_ 571
$ns initial_node_pos $node_(62) 20

#???62?Node
set node_(63) [$ns node]
$node_(63) set X_ 28
$node_(63) set Y_ 256
$ns initial_node_pos $node_(63) 20

#???63?Node
set node_(64) [$ns node]
$node_(64) set X_ 518
$node_(64) set Y_ 396
$ns initial_node_pos $node_(64) 20

#???64?Node
set node_(65) [$ns node]
$node_(65) set X_ 124
$node_(65) set Y_ 932
$ns initial_node_pos $node_(65) 20

#???65?Node
set node_(66) [$ns node]
$node_(66) set X_ 228
$node_(66) set Y_ 903
$ns initial_node_pos $node_(66) 20

#???66?Node
set node_(67) [$ns node]
$node_(67) set X_ 28
$node_(67) set Y_ 494
$ns initial_node_pos $node_(67) 20

#???67?Node
set node_(68) [$ns node]
$node_(68) set X_ 738
$node_(68) set Y_ 942
$ns initial_node_pos $node_(68) 20

#???68?Node
set node_(69) [$ns node]
$node_(69) set X_ 913
$node_(69) set Y_ 981
$ns initial_node_pos $node_(69) 20

#???69?Node
set node_(70) [$ns node]
$node_(70) set X_ 961
$node_(70) set Y_ 723
$ns initial_node_pos $node_(70) 20

#???70?Node
set node_(71) [$ns node]
$node_(71) set X_ 186
$node_(71) set Y_ 735
$ns initial_node_pos $node_(71) 20

#???71?Node
set node_(72) [$ns node]
$node_(72) set X_ 445
$node_(72) set Y_ 857
$ns initial_node_pos $node_(72) 20

#???72?Node
set node_(73) [$ns node]
$node_(73) set X_ 467
$node_(73) set Y_ 831
$ns initial_node_pos $node_(73) 20

#???73?Node
set node_(74) [$ns node]
$node_(74) set X_ 320
$node_(74) set Y_ 650
$ns initial_node_pos $node_(74) 20

#???74?Node
set node_(75) [$ns node]
$node_(75) set X_ 722
$node_(75) set Y_ 920
$ns initial_node_pos $node_(75) 20

#???75?Node
set node_(76) [$ns node]
$node_(76) set X_ 26
$node_(76) set Y_ 296
$ns initial_node_pos $node_(76) 20

#???76?Node
set node_(77) [$ns node]
$node_(77) set X_ 714
$node_(77) set Y_ 876
$ns initial_node_pos $node_(77) 20

#???77?Node
set node_(78) [$ns node]
$node_(78) set X_ 516
$node_(78) set Y_ 258
$ns initial_node_pos $node_(78) 20

#???78?Node
set node_(79) [$ns node]
$node_(79) set X_ 845
$node_(79) set Y_ 479
$ns initial_node_pos $node_(79) 20

#???79?Node
set node_(80) [$ns node]
$node_(80) set X_ 567
$node_(80) set Y_ 649
$ns initial_node_pos $node_(80) 20

#???80?Node
set node_(81) [$ns node]
$node_(81) set X_ 176
$node_(81) set Y_ 629
$ns initial_node_pos $node_(81) 20

#???81?Node
set node_(82) [$ns node]
$node_(82) set X_ 894
$node_(82) set Y_ 907
$ns initial_node_pos $node_(82) 20

#???82?Node
set node_(83) [$ns node]
$node_(83) set X_ 190
$node_(83) set Y_ 650
$ns initial_node_pos $node_(83) 20

#???83?Node
set node_(86) [$ns node]
$node_(86) set X_ 168
$node_(86) set Y_ 488
$ns initial_node_pos $node_(86) 20

#???84?Node
set node_(87) [$ns node]
$node_(87) set X_ 664
$node_(87) set Y_ 328
$ns initial_node_pos $node_(87) 20

#???85?Node
set node_(88) [$ns node]
$node_(88) set X_ 707
$node_(88) set Y_ 241
$ns initial_node_pos $node_(88) 20

#???86?Node
set node_(89) [$ns node]
$node_(89) set X_ 871
$node_(89) set Y_ 794
$ns initial_node_pos $node_(89) 20

#???87?Node
set node_(90) [$ns node]
$node_(90) set X_ 854
$node_(90) set Y_ 392
$ns initial_node_pos $node_(90) 20

#???88?Node
set node_(91) [$ns node]
$node_(91) set X_ 90
$node_(91) set Y_ 172
$ns initial_node_pos $node_(91) 20

#???89?Node
set node_(92) [$ns node]
$node_(92) set X_ 203
$node_(92) set Y_ 490
$ns initial_node_pos $node_(92) 20

#???90?Node
set node_(93) [$ns node]
$node_(93) set X_ 930
$node_(93) set Y_ 407
$ns initial_node_pos $node_(93) 20

#???91?Node
set node_(94) [$ns node]
$node_(94) set X_ 37
$node_(94) set Y_ 871
$ns initial_node_pos $node_(94) 20

#???92?Node
set node_(95) [$ns node]
$node_(95) set X_ 664
$node_(95) set Y_ 400
$ns initial_node_pos $node_(95) 20

#???93?Node
set node_(96) [$ns node]
$node_(96) set X_ 72
$node_(96) set Y_ 212
$ns initial_node_pos $node_(96) 20

#???94?Node
set node_(97) [$ns node]
$node_(97) set X_ 706
$node_(97) set Y_ 126
$ns initial_node_pos $node_(97) 20

#???95?Node
set node_(98) [$ns node]
$node_(98) set X_ 856
$node_(98) set Y_ 726
$ns initial_node_pos $node_(98) 20

#???96?Node
set node_(99) [$ns node]
$node_(99) set X_ 464
$node_(99) set Y_ 571
$ns initial_node_pos $node_(99) 20

#???97?Node
set node_(100) [$ns node]
$node_(100) set X_ 842
$node_(100) set Y_ 937
$ns initial_node_pos $node_(100) 20

#???98?Node
set node_(101) [$ns node]
$node_(101) set X_ 170
$node_(101) set Y_ 36
$ns initial_node_pos $node_(101) 20

#???99?Node
set node_(102) [$ns node]
$node_(102) set X_ 205
$node_(102) set Y_ 345
$ns initial_node_pos $node_(102) 20

#???100?Node
set node_(103) [$ns node]
$node_(103) set X_ 243
$node_(103) set Y_ 190
$ns initial_node_pos $node_(103) 20

#???101?Node
set node_(104) [$ns node]
$node_(104) set X_ 542
$node_(104) set Y_ 98
$ns initial_node_pos $node_(104) 20

#???102?Node
set node_(105) [$ns node]
$node_(105) set X_ 75
$node_(105) set Y_ 26
$ns initial_node_pos $node_(105) 20

#???103?Node
set node_(106) [$ns node]
$node_(106) set X_ 458
$node_(106) set Y_ 15
$ns initial_node_pos $node_(106) 20

#???104?Node
set node_(107) [$ns node]
$node_(107) set X_ 86
$node_(107) set Y_ 974
$ns initial_node_pos $node_(107) 20

#???105?Node
set node_(108) [$ns node]
$node_(108) set X_ 983
$node_(108) set Y_ 432
$ns initial_node_pos $node_(108) 20

#???106?Node
set node_(109) [$ns node]
$node_(109) set X_ 80
$node_(109) set Y_ 268
$ns initial_node_pos $node_(109) 20

#???107?Node
set node_(110) [$ns node]
$node_(110) set X_ 250
$node_(110) set Y_ 405
$ns initial_node_pos $node_(110) 20

#???108?Node
set node_(111) [$ns node]
$node_(111) set X_ 936
$node_(111) set Y_ 300
$ns initial_node_pos $node_(111) 20

#???109?Node
set node_(112) [$ns node]
$node_(112) set X_ 745
$node_(112) set Y_ 58
$ns initial_node_pos $node_(112) 20

#???110?Node
set node_(113) [$ns node]
$node_(113) set X_ 198
$node_(113) set Y_ 124
$ns initial_node_pos $node_(113) 20

#???111?Node
set node_(114) [$ns node]
$node_(114) set X_ 528
$node_(114) set Y_ 183
$ns initial_node_pos $node_(114) 20

#???112?Node
set node_(115) [$ns node]
$node_(115) set X_ 854
$node_(115) set Y_ 556
$ns initial_node_pos $node_(115) 20

#???113?Node
set node_(116) [$ns node]
$node_(116) set X_ 26
$node_(116) set Y_ 64
$ns initial_node_pos $node_(116) 20

#???114?Node
set node_(117) [$ns node]
$node_(117) set X_ 790
$node_(117) set Y_ 552
$ns initial_node_pos $node_(117) 20

#???115?Node
set node_(118) [$ns node]
$node_(118) set X_ 20
$node_(118) set Y_ 594
$ns initial_node_pos $node_(118) 20

#???116?Node
set node_(119) [$ns node]
$node_(119) set X_ 32
$node_(119) set Y_ 520
$ns initial_node_pos $node_(119) 20

#???117?Node
set node_(120) [$ns node]
$node_(120) set X_ 462
$node_(120) set Y_ 984
$ns initial_node_pos $node_(120) 20

#???118?Node
set node_(121) [$ns node]
$node_(121) set X_ 779
$node_(121) set Y_ 254
$ns initial_node_pos $node_(121) 20

#???119?Node
set node_(122) [$ns node]
$node_(122) set X_ 805
$node_(122) set Y_ 384
$ns initial_node_pos $node_(122) 20

#???120?Node
set node_(123) [$ns node]
$node_(123) set X_ 683
$node_(123) set Y_ 520
$ns initial_node_pos $node_(123) 20

#???121?Node
set node_(124) [$ns node]
$node_(124) set X_ 573
$node_(124) set Y_ 726
$ns initial_node_pos $node_(124) 20

#???122?Node
set node_(125) [$ns node]
$node_(125) set X_ 224
$node_(125) set Y_ 577
$ns initial_node_pos $node_(125) 20

#???123?Node
set node_(126) [$ns node]
$node_(126) set X_ 639
$node_(126) set Y_ 179
$ns initial_node_pos $node_(126) 20

#???124?Node
set node_(127) [$ns node]
$node_(127) set X_ 824
$node_(127) set Y_ 324
$ns initial_node_pos $node_(127) 20

#???125?Node
set node_(128) [$ns node]
$node_(128) set X_ 294
$node_(128) set Y_ 450
$ns initial_node_pos $node_(128) 20

#???126?Node
set node_(129) [$ns node]
$node_(129) set X_ 553
$node_(129) set Y_ 874
$ns initial_node_pos $node_(129) 20

#???127?Node
set node_(130) [$ns node]
$node_(130) set X_ 603
$node_(130) set Y_ 407
$ns initial_node_pos $node_(130) 20

#???128?Node
set node_(131) [$ns node]
$node_(131) set X_ 49
$node_(131) set Y_ 807
$ns initial_node_pos $node_(131) 20

#???129?Node
set node_(132) [$ns node]
$node_(132) set X_ 471
$node_(132) set Y_ 434
$ns initial_node_pos $node_(132) 20

#???130?Node
set node_(134) [$ns node]
$node_(134) set X_ 156
$node_(134) set Y_ 194
$ns initial_node_pos $node_(134) 20

#???131?Node
set node_(135) [$ns node]
$node_(135) set X_ 569
$node_(135) set Y_ 339
$ns initial_node_pos $node_(135) 20

#???132?Node
set node_(136) [$ns node]
$node_(136) set X_ 22
$node_(136) set Y_ 375
$ns initial_node_pos $node_(136) 20

#???133?Node
set node_(137) [$ns node]
$node_(137) set X_ 986
$node_(137) set Y_ 249
$ns initial_node_pos $node_(137) 20

#???134?Node
set node_(138) [$ns node]
$node_(138) set X_ 149
$node_(138) set Y_ 269
$ns initial_node_pos $node_(138) 20

#???135?Node
set node_(139) [$ns node]
$node_(139) set X_ 207
$node_(139) set Y_ 971
$ns initial_node_pos $node_(139) 20

#???136?Node
set node_(140) [$ns node]
$node_(140) set X_ 568
$node_(140) set Y_ 970
$ns initial_node_pos $node_(140) 20

#???137?Node
set node_(141) [$ns node]
$node_(141) set X_ 339
$node_(141) set Y_ 713
$ns initial_node_pos $node_(141) 20

#???138?Node
set node_(142) [$ns node]
$node_(142) set X_ 326
$node_(142) set Y_ 140
$ns initial_node_pos $node_(142) 20

#???139?Node
set node_(143) [$ns node]
$node_(143) set X_ 541
$node_(143) set Y_ 488
$ns initial_node_pos $node_(143) 20

#???140?Node
set node_(144) [$ns node]
$node_(144) set X_ 728
$node_(144) set Y_ 394
$ns initial_node_pos $node_(144) 20

#???141?Node
set node_(145) [$ns node]
$node_(145) set X_ 64
$node_(145) set Y_ 344
$ns initial_node_pos $node_(145) 20

#???142?Node
set node_(146) [$ns node]
$node_(146) set X_ 370
$node_(146) set Y_ 825
$ns initial_node_pos $node_(146) 20

#???143?Node
set node_(147) [$ns node]
$node_(147) set X_ 415
$node_(147) set Y_ 986
$ns initial_node_pos $node_(147) 20

#???144?Node
set node_(148) [$ns node]
$node_(148) set X_ 616
$node_(148) set Y_ 308
$ns initial_node_pos $node_(148) 20

#???145?Node
set node_(149) [$ns node]
$node_(149) set X_ 115
$node_(149) set Y_ 37
$ns initial_node_pos $node_(149) 20

#???146?Node
set node_(150) [$ns node]
$node_(150) set X_ 269
$node_(150) set Y_ 818
$ns initial_node_pos $node_(150) 20

#???147?Node
set node_(151) [$ns node]
$node_(151) set X_ 269
$node_(151) set Y_ 335
$ns initial_node_pos $node_(151) 20

#???148?Node
set node_(152) [$ns node]
$node_(152) set X_ 320
$node_(152) set Y_ 405
$ns initial_node_pos $node_(152) 20

#???149?Node
set node_(153) [$ns node]
$node_(153) set X_ 175
$node_(153) set Y_ 941
$ns initial_node_pos $node_(153) 20

#???150?Node
set node_(154) [$ns node]
$node_(154) set X_ 133
$node_(154) set Y_ 494
$ns initial_node_pos $node_(154) 20

#???151?Node
set node_(155) [$ns node]
$node_(155) set X_ 981
$node_(155) set Y_ 681
$ns initial_node_pos $node_(155) 20

#???152?Node
set node_(156) [$ns node]
$node_(156) set X_ 33
$node_(156) set Y_ 691
$ns initial_node_pos $node_(156) 20

#???153?Node
set node_(157) [$ns node]
$node_(157) set X_ 445
$node_(157) set Y_ 396
$ns initial_node_pos $node_(157) 20

#???154?Node
set node_(158) [$ns node]
$node_(158) set X_ 836
$node_(158) set Y_ 364
$ns initial_node_pos $node_(158) 20

#???155?Node
set node_(159) [$ns node]
$node_(159) set X_ 165
$node_(159) set Y_ 552
$ns initial_node_pos $node_(159) 20

#???156?Node
set node_(160) [$ns node]
$node_(160) set X_ 730
$node_(160) set Y_ 564
$ns initial_node_pos $node_(160) 20

#???157?Node
set node_(161) [$ns node]
$node_(161) set X_ 333
$node_(161) set Y_ 490
$ns initial_node_pos $node_(161) 20

#???158?Node
set node_(162) [$ns node]
$node_(162) set X_ 946
$node_(162) set Y_ 355
$ns initial_node_pos $node_(162) 20

#???159?Node
set node_(163) [$ns node]
$node_(163) set X_ 825
$node_(163) set Y_ 796
$ns initial_node_pos $node_(163) 20

#???160?Node
set node_(164) [$ns node]
$node_(164) set X_ 279
$node_(164) set Y_ 859
$ns initial_node_pos $node_(164) 20

#???161?Node
set node_(165) [$ns node]
$node_(165) set X_ 707
$node_(165) set Y_ 643
$ns initial_node_pos $node_(165) 20

#???162?Node
set node_(166) [$ns node]
$node_(166) set X_ 868
$node_(166) set Y_ 31
$ns initial_node_pos $node_(166) 20

#???163?Node
set node_(167) [$ns node]
$node_(167) set X_ 879
$node_(167) set Y_ 981
$ns initial_node_pos $node_(167) 20

#???164?Node
set node_(168) [$ns node]
$node_(168) set X_ 781
$node_(168) set Y_ 20
$ns initial_node_pos $node_(168) 20

#???165?Node
set node_(169) [$ns node]
$node_(169) set X_ 688
$node_(169) set Y_ 28
$ns initial_node_pos $node_(169) 20

#???166?Node
set node_(170) [$ns node]
$node_(170) set X_ 396
$node_(170) set Y_ 260
$ns initial_node_pos $node_(170) 20

#???167?Node
set node_(171) [$ns node]
$node_(171) set X_ 379
$node_(171) set Y_ 748
$ns initial_node_pos $node_(171) 20

#???168?Node
set node_(172) [$ns node]
$node_(172) set X_ 113
$node_(172) set Y_ 909
$ns initial_node_pos $node_(172) 20

#???169?Node
set node_(173) [$ns node]
$node_(173) set X_ 641
$node_(173) set Y_ 247
$ns initial_node_pos $node_(173) 20

#???170?Node
set node_(174) [$ns node]
$node_(174) set X_ 849
$node_(174) set Y_ 870
$ns initial_node_pos $node_(174) 20

#???171?Node
set node_(175) [$ns node]
$node_(175) set X_ 733
$node_(175) set Y_ 735
$ns initial_node_pos $node_(175) 20

#???172?Node
set node_(176) [$ns node]
$node_(176) set X_ 581
$node_(176) set Y_ 254
$ns initial_node_pos $node_(176) 20

#???173?Node
set node_(177) [$ns node]
$node_(177) set X_ 484
$node_(177) set Y_ 45
$ns initial_node_pos $node_(177) 20

#???174?Node
set node_(178) [$ns node]
$node_(178) set X_ 698
$node_(178) set Y_ 60
$ns initial_node_pos $node_(178) 20

#???175?Node
set node_(179) [$ns node]
$node_(179) set X_ 805
$node_(179) set Y_ 847
$ns initial_node_pos $node_(179) 20

#???176?Node
set node_(180) [$ns node]
$node_(180) set X_ 484
$node_(180) set Y_ 335
$ns initial_node_pos $node_(180) 20

#???177?Node
set node_(181) [$ns node]
$node_(181) set X_ 937
$node_(181) set Y_ 211
$ns initial_node_pos $node_(181) 20

#???178?Node
set node_(182) [$ns node]
$node_(182) set X_ 784
$node_(182) set Y_ 61
$ns initial_node_pos $node_(182) 20

#???179?Node
set node_(183) [$ns node]
$node_(183) set X_ 300
$node_(183) set Y_ 566
$ns initial_node_pos $node_(183) 20

#???180?Node
set node_(184) [$ns node]
$node_(184) set X_ 942
$node_(184) set Y_ 104
$ns initial_node_pos $node_(184) 20

#???181?Node
set node_(185) [$ns node]
$node_(185) set X_ 688
$node_(185) set Y_ 952
$ns initial_node_pos $node_(185) 20

#???182?Node
set node_(186) [$ns node]
$node_(186) set X_ 24
$node_(186) set Y_ 420
$ns initial_node_pos $node_(186) 20

#???183?Node
set node_(187) [$ns node]
$node_(187) set X_ 424
$node_(187) set Y_ 114
$ns initial_node_pos $node_(187) 20

#???184?Node
set node_(188) [$ns node]
$node_(188) set X_ 620
$node_(188) set Y_ 833
$ns initial_node_pos $node_(188) 20

#???185?Node
set node_(189) [$ns node]
$node_(189) set X_ 474
$node_(189) set Y_ 316
$ns initial_node_pos $node_(189) 20

#???186?Node
set node_(190) [$ns node]
$node_(190) set X_ 815
$node_(190) set Y_ 183
$ns initial_node_pos $node_(190) 20

#???187?Node
set node_(192) [$ns node]
$node_(192) set X_ 407
$node_(192) set Y_ 337
$ns initial_node_pos $node_(192) 20

#???188?Node
set node_(193) [$ns node]
$node_(193) set X_ 975
$node_(193) set Y_ 783
$ns initial_node_pos $node_(193) 20

#???189?Node
set node_(194) [$ns node]
$node_(194) set X_ 297
$node_(194) set Y_ 522
$ns initial_node_pos $node_(194) 20

#???190?Node
set node_(195) [$ns node]
$node_(195) set X_ 379
$node_(195) set Y_ 411
$ns initial_node_pos $node_(195) 20

#???191?Node
set node_(196) [$ns node]
$node_(196) set X_ 568
$node_(196) set Y_ 134
$ns initial_node_pos $node_(196) 20

#???192?Node
set node_(197) [$ns node]
$node_(197) set X_ 899
$node_(197) set Y_ 600
$ns initial_node_pos $node_(197) 20

#???193?Node
set node_(198) [$ns node]
$node_(198) set X_ 979
$node_(198) set Y_ 828
$ns initial_node_pos $node_(198) 20

#???194?Node
set node_(199) [$ns node]
$node_(199) set X_ 989
$node_(199) set Y_ 977
$ns initial_node_pos $node_(199) 20

#???195?Node
set node_(200) [$ns node]
$node_(200) set X_ 401
$node_(200) set Y_ 483
$ns initial_node_pos $node_(200) 20

#???196?Node
set node_(201) [$ns node]
$node_(201) set X_ 726
$node_(201) set Y_ 175
$ns initial_node_pos $node_(201) 20

#???197?Node
set node_(202) [$ns node]
$node_(202) set X_ 26
$node_(202) set Y_ 120
$ns initial_node_pos $node_(202) 20

#???198?Node
set node_(203) [$ns node]
$node_(203) set X_ 229
$node_(203) set Y_ 612
$ns initial_node_pos $node_(203) 20

#???199?Node
set node_(204) [$ns node]
$node_(204) set X_ 434
$node_(204) set Y_ 243
$ns initial_node_pos $node_(204) 20

#???200?Node
set node_(205) [$ns node]
$node_(205) set X_ 112
$node_(205) set Y_ 61
$ns initial_node_pos $node_(205) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(0) setdest 551.0 948.0 $tz " 
$ns at 10.0 " $node_(2) setdest 105.0 75.0 $tz " 
$ns at 10.0 " $node_(3) setdest 491.0 611.0 $tz " 
$ns at 10.0 " $node_(4) setdest 831.0 21.0 $tz " 
$ns at 10.0 " $node_(5) setdest 316.0 942.0 $tz " 
$ns at 10.0 " $node_(6) setdest 8.0 536.0 $tz " 
$ns at 10.0 " $node_(7) setdest 696.0 307.0 $tz " 
$ns at 10.0 " $node_(8) setdest 511.0 691.0 $tz " 
$ns at 10.0 " $node_(9) setdest 769.0 900.0 $tz " 
$ns at 10.0 " $node_(10) setdest 697.0 725.0 $tz " 
$ns at 10.0 " $node_(11) setdest 160.0 898.0 $tz " 
$ns at 10.0 " $node_(12) setdest 663.0 505.0 $tz " 
$ns at 10.0 " $node_(13) setdest 547.0 755.0 $tz " 
$ns at 10.0 " $node_(14) setdest 608.0 717.0 $tz " 
$ns at 10.0 " $node_(15) setdest 73.0 685.0 $tz " 
$ns at 10.0 " $node_(16) setdest 338.0 719.0 $tz " 
$ns at 10.0 " $node_(17) setdest 682.0 755.0 $tz " 
$ns at 10.0 " $node_(18) setdest 898.0 883.0 $tz " 
$ns at 10.0 " $node_(19) setdest 913.0 666.0 $tz " 
$ns at 10.0 " $node_(20) setdest 514.0 649.0 $tz " 
$ns at 10.0 " $node_(21) setdest 690.0 915.0 $tz " 
$ns at 10.0 " $node_(22) setdest 618.0 913.0 $tz " 
$ns at 10.0 " $node_(23) setdest 632.0 32.0 $tz " 
$ns at 10.0 " $node_(24) setdest 729.0 612.0 $tz " 
$ns at 10.0 " $node_(25) setdest 226.0 8.0 $tz " 
$ns at 10.0 " $node_(26) setdest 901.0 242.0 $tz " 
$ns at 10.0 " $node_(27) setdest 807.0 956.0 $tz " 
$ns at 10.0 " $node_(28) setdest 162.0 522.0 $tz " 
$ns at 10.0 " $node_(29) setdest 791.0 768.0 $tz " 
$ns at 10.0 " $node_(30) setdest 224.0 538.0 $tz " 
$ns at 10.0 " $node_(31) setdest 699.0 625.0 $tz " 
$ns at 10.0 " $node_(32) setdest 456.0 243.0 $tz " 
$ns at 10.0 " $node_(33) setdest 692.0 789.0 $tz " 
$ns at 10.0 " $node_(34) setdest 379.0 864.0 $tz " 
$ns at 10.0 " $node_(35) setdest 419.0 125.0 $tz " 
$ns at 10.0 " $node_(36) setdest 67.0 929.0 $tz " 
$ns at 10.0 " $node_(37) setdest 70.0 506.0 $tz " 
$ns at 10.0 " $node_(38) setdest 44.0 11.0 $tz " 
$ns at 10.0 " $node_(39) setdest 306.0 672.0 $tz " 
$ns at 10.0 " $node_(40) setdest 688.0 486.0 $tz " 
$ns at 10.0 " $node_(41) setdest 833.0 537.0 $tz " 
$ns at 10.0 " $node_(42) setdest 290.0 854.0 $tz " 
$ns at 10.0 " $node_(43) setdest 9.0 659.0 $tz " 
$ns at 10.0 " $node_(44) setdest 246.0 494.0 $tz " 
$ns at 10.0 " $node_(45) setdest 618.0 770.0 $tz " 
$ns at 10.0 " $node_(46) setdest 219.0 328.0 $tz " 
$ns at 10.0 " $node_(47) setdest 336.0 526.0 $tz " 
$ns at 10.0 " $node_(48) setdest 826.0 702.0 $tz " 
$ns at 10.0 " $node_(49) setdest 941.0 464.0 $tz " 
$ns at 10.0 " $node_(50) setdest 762.0 685.0 $tz " 
$ns at 10.0 " $node_(51) setdest 402.0 426.0 $tz " 
$ns at 10.0 " $node_(52) setdest 341.0 935.0 $tz " 
$ns at 10.0 " $node_(53) setdest 328.0 839.0 $tz " 
$ns at 10.0 " $node_(54) setdest 610.0 680.0 $tz " 
$ns at 10.0 " $node_(55) setdest 199.0 382.0 $tz " 
$ns at 10.0 " $node_(56) setdest 132.0 385.0 $tz " 
$ns at 10.0 " $node_(57) setdest 519.0 889.0 $tz " 
$ns at 10.0 " $node_(58) setdest 943.0 542.0 $tz " 
$ns at 10.0 " $node_(59) setdest 8.0 409.0 $tz " 
$ns at 10.0 " $node_(60) setdest 55.0 763.0 $tz " 
$ns at 10.0 " $node_(61) setdest 161.0 612.0 $tz " 
$ns at 10.0 " $node_(62) setdest 955.0 929.0 $tz " 
$ns at 10.0 " $node_(63) setdest 945.0 277.0 $tz " 
$ns at 10.0 " $node_(64) setdest 42.0 620.0 $tz " 
$ns at 10.0 " $node_(65) setdest 545.0 856.0 $tz " 
$ns at 10.0 " $node_(66) setdest 220.0 771.0 $tz " 
$ns at 10.0 " $node_(67) setdest 958.0 663.0 $tz " 
$ns at 10.0 " $node_(68) setdest 273.0 899.0 $tz " 
$ns at 10.0 " $node_(69) setdest 837.0 886.0 $tz " 
$ns at 10.0 " $node_(70) setdest 416.0 939.0 $tz " 
$ns at 10.0 " $node_(71) setdest 220.0 661.0 $tz " 
$ns at 10.0 " $node_(72) setdest 818.0 749.0 $tz " 
$ns at 10.0 " $node_(73) setdest 399.0 670.0 $tz " 
$ns at 10.0 " $node_(74) setdest 427.0 918.0 $tz " 
$ns at 10.0 " $node_(75) setdest 674.0 840.0 $tz " 
$ns at 10.0 " $node_(76) setdest 956.0 349.0 $tz " 
$ns at 10.0 " $node_(77) setdest 164.0 731.0 $tz " 
$ns at 10.0 " $node_(78) setdest 491.0 375.0 $tz " 
$ns at 10.0 " $node_(79) setdest 276.0 662.0 $tz " 
$ns at 10.0 " $node_(80) setdest 760.0 837.0 $tz " 
$ns at 10.0 " $node_(81) setdest 232.0 847.0 $tz " 
$ns at 41.0 " $node_(82) setdest 844.0 819.0 $tz " 
$ns at 10.0 " $node_(83) setdest 199.0 927.0 $tz " 
$ns at 10.0 " $node_(86) setdest 919.0 180.0 $tz " 
$ns at 10.0 " $node_(87) setdest 564.0 445.0 $tz " 
$ns at 10.0 " $node_(88) setdest 74.0 329.0 $tz " 
$ns at 10.0 " $node_(89) setdest 898.0 747.0 $tz " 
$ns at 20.0 " $node_(90) setdest 610.0 640.0 $tz " 
$ns at 10.0 " $node_(91) setdest 419.0 841.0 $tz " 
$ns at 10.0 " $node_(92) setdest 310.0 688.0 $tz " 
$ns at 10.0 " $node_(93) setdest 174.0 95.0 $tz " 
$ns at 10.0 " $node_(94) setdest 482.0 716.0 $tz " 
$ns at 10.0 " $node_(95) setdest 35.0 577.0 $tz " 
$ns at 10.0 " $node_(96) setdest 754.0 932.0 $tz " 
$ns at 10.0 " $node_(97) setdest 936.0 840.0 $tz " 
$ns at 10.0 " $node_(98) setdest 878.0 663.0 $tz " 
$ns at 10.0 " $node_(99) setdest 43.0 939.0 $tz " 
$ns at 10.0 " $node_(100) setdest 164.0 847.0 $tz " 
$ns at 10.0 " $node_(101) setdest 56.0 879.0 $tz " 
$ns at 10.0 " $node_(102) setdest 943.0 481.0 $tz " 
$ns at 10.0 " $node_(103) setdest 893.0 218.0 $tz " 
$ns at 10.0 " $node_(104) setdest 907.0 393.0 $tz " 
$ns at 10.0 " $node_(105) setdest 114.0 536.0 $tz " 
$ns at 10.0 " $node_(106) setdest 6.0 502.0 $tz " 
$ns at 10.0 " $node_(107) setdest 70.0 366.0 $tz " 
$ns at 10.0 " $node_(108) setdest 499.0 506.0 $tz " 
$ns at 10.0 " $node_(109) setdest 586.0 915.0 $tz " 
$ns at 10.0 " $node_(110) setdest 755.0 547.0 $tz " 
$ns at 10.0 " $node_(111) setdest 455.0 161.0 $tz " 
$ns at 10.0 " $node_(112) setdest 126.0 318.0 $tz " 
$ns at 10.0 " $node_(113) setdest 914.0 420.0 $tz " 
$ns at 10.0 " $node_(114) setdest 432.0 19.0 $tz " 
$ns at 10.0 " $node_(115) setdest 434.0 635.0 $tz " 
$ns at 10.0 " $node_(116) setdest 627.0 539.0 $tz " 
$ns at 10.0 " $node_(117) setdest 942.0 779.0 $tz " 
$ns at 10.0 " $node_(118) setdest 577.0 848.0 $tz " 
$ns at 10.0 " $node_(119) setdest 93.0 658.0 $tz " 
$ns at 10.0 " $node_(120) setdest 447.0 896.0 $tz " 
$ns at 10.0 " $node_(121) setdest 704.0 452.0 $tz " 
$ns at 10.0 " $node_(122) setdest 48.0 724.0 $tz " 
$ns at 10.0 " $node_(123) setdest 642.0 689.0 $tz " 
$ns at 10.0 " $node_(124) setdest 551.0 686.0 $tz " 
$ns at 10.0 " $node_(125) setdest 322.0 822.0 $tz " 
$ns at 10.0 " $node_(126) setdest 592.0 13.0 $tz " 
$ns at 10.0 " $node_(127) setdest 900.0 507.0 $tz " 
$ns at 10.0 " $node_(128) setdest 154.0 958.0 $tz " 
$ns at 10.0 " $node_(129) setdest 467.0 862.0 $tz " 
$ns at 10.0 " $node_(130) setdest 47.0 401.0 $tz " 
$ns at 10.0 " $node_(131) setdest 286.0 939.0 $tz " 
$ns at 10.0 " $node_(132) setdest 609.0 742.0 $tz " 
$ns at 10.0 " $node_(134) setdest 284.0 96.0 $tz " 
$ns at 10.0 " $node_(135) setdest 426.0 485.0 $tz " 
$ns at 10.0 " $node_(136) setdest 201.0 484.0 $tz " 
$ns at 10.0 " $node_(137) setdest 570.0 314.0 $tz " 
$ns at 10.0 " $node_(138) setdest 908.0 92.0 $tz " 
$ns at 10.0 " $node_(139) setdest 830.0 909.0 $tz " 
$ns at 10.0 " $node_(140) setdest 99.0 759.0 $tz " 
$ns at 10.0 " $node_(141) setdest 939.0 888.0 $tz " 
$ns at 10.0 " $node_(142) setdest 520.0 903.0 $tz " 
$ns at 10.0 " $node_(143) setdest 821.0 685.0 $tz " 
$ns at 10.0 " $node_(144) setdest 29.0 664.0 $tz " 
$ns at 10.0 " $node_(145) setdest 143.0 888.0 $tz " 
$ns at 10.0 " $node_(146) setdest 268.0 690.0 $tz " 
$ns at 10.0 " $node_(147) setdest 339.0 879.0 $tz " 
$ns at 10.0 " $node_(148) setdest 256.0 844.0 $tz " 
$ns at 10.0 " $node_(149) setdest 296.0 132.0 $tz " 
$ns at 10.0 " $node_(150) setdest 284.0 768.0 $tz " 
$ns at 10.0 " $node_(151) setdest 309.0 477.0 $tz " 
$ns at 10.0 " $node_(152) setdest 438.0 699.0 $tz " 
$ns at 10.0 " $node_(153) setdest 150.0 778.0 $tz " 
$ns at 10.0 " $node_(154) setdest 130.0 635.0 $tz " 
$ns at 10.0 " $node_(155) setdest 593.0 880.0 $tz " 
$ns at 10.0 " $node_(156) setdest 486.0 765.0 $tz " 
$ns at 10.0 " $node_(157) setdest 664.0 662.0 $tz " 
$ns at 10.0 " $node_(158) setdest 260.0 939.0 $tz " 
$ns at 10.0 " $node_(159) setdest 489.0 701.0 $tz " 
$ns at 10.0 " $node_(160) setdest 95.0 568.0 $tz " 
$ns at 10.0 " $node_(161) setdest 774.0 688.0 $tz " 
$ns at 10.0 " $node_(162) setdest 508.0 461.0 $tz " 
$ns at 10.0 " $node_(163) setdest 149.0 691.0 $tz " 
$ns at 10.0 " $node_(164) setdest 800.0 677.0 $tz " 
$ns at 10.0 " $node_(165) setdest 908.0 883.0 $tz " 
$ns at 10.0 " $node_(166) setdest 679.0 371.0 $tz " 
$ns at 10.0 " $node_(167) setdest 730.0 898.0 $tz " 
$ns at 10.0 " $node_(168) setdest 761.0 184.0 $tz " 
$ns at 10.0 " $node_(169) setdest 328.0 121.0 $tz " 
$ns at 10.0 " $node_(170) setdest 87.0 169.0 $tz " 
$ns at 10.0 " $node_(171) setdest 488.0 938.0 $tz " 
$ns at 10.0 " $node_(172) setdest 84.0 833.0 $tz " 
$ns at 10.0 " $node_(173) setdest 67.0 121.0 $tz " 
$ns at 10.0 " $node_(174) setdest 400.0 699.0 $tz " 
$ns at 10.0 " $node_(175) setdest 686.0 684.0 $tz " 
$ns at 10.0 " $node_(176) setdest 884.0 307.0 $tz " 
$ns at 10.0 " $node_(177) setdest 300.0 207.0 $tz " 
$ns at 10.0 " $node_(178) setdest 953.0 630.0 $tz " 
$ns at 10.0 " $node_(179) setdest 414.0 760.0 $tz " 
$ns at 10.0 " $node_(180) setdest 898.0 504.0 $tz " 
$ns at 10.0 " $node_(181) setdest 27.0 324.0 $tz " 
$ns at 10.0 " $node_(182) setdest 97.0 163.0 $tz " 
$ns at 10.0 " $node_(183) setdest 56.0 704.0 $tz " 
$ns at 10.0 " $node_(184) setdest 2.0 169.0 $tz " 
$ns at 10.0 " $node_(185) setdest 291.0 625.0 $tz " 
$ns at 10.0 " $node_(186) setdest 149.0 720.0 $tz " 
$ns at 10.0 " $node_(187) setdest 895.0 297.0 $tz " 
$ns at 10.0 " $node_(188) setdest 347.0 764.0 $tz " 
$ns at 10.0 " $node_(189) setdest 215.0 949.0 $tz " 
$ns at 10.0 " $node_(190) setdest 914.0 26.0 $tz " 
$ns at 10.0 " $node_(192) setdest 137.0 470.0 $tz " 
$ns at 10.0 " $node_(193) setdest 924.0 688.0 $tz " 
$ns at 10.0 " $node_(194) setdest 667.0 890.0 $tz " 
$ns at 10.0 " $node_(195) setdest 422.0 662.0 $tz " 
$ns at 10.0 " $node_(196) setdest 439.0 519.0 $tz " 
$ns at 10.0 " $node_(197) setdest 651.0 938.0 $tz " 
$ns at 10.0 " $node_(198) setdest 71.0 793.0 $tz " 
$ns at 10.0 " $node_(199) setdest 783.0 866.0 $tz " 
$ns at 10.0 " $node_(200) setdest 355.0 632.0 $tz " 
$ns at 10.0 " $node_(201) setdest 736.0 25.0 $tz " 
$ns at 10.0 " $node_(202) setdest 20.0 947.0 $tz " 
$ns at 10.0 " $node_(204) setdest 676.0 372.0 $tz " 
$ns at 10.0 " $node_(205) setdest 540.0 30.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(91) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(27) $null0
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