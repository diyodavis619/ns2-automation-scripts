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
$node_(0) set X_ 678
$node_(0) set Y_ 741
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 49
$node_(1) set Y_ 585
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 761
$node_(2) set Y_ 685
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 616
$node_(3) set Y_ 749
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 118
$node_(4) set Y_ 687
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 929
$node_(5) set Y_ 754
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 944
$node_(6) set Y_ 619
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 789
$node_(7) set Y_ 263
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 39
$node_(8) set Y_ 24
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 792
$node_(9) set Y_ 350
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 971
$node_(10) set Y_ 588
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 734
$node_(11) set Y_ 948
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 655
$node_(12) set Y_ 668
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 38
$node_(13) set Y_ 532
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 171
$node_(14) set Y_ 729
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 110
$node_(15) set Y_ 551
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 146
$node_(16) set Y_ 671
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 234
$node_(17) set Y_ 832
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 499
$node_(18) set Y_ 258
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 509
$node_(19) set Y_ 507
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(20) [$ns node]
$node_(20) set X_ 780
$node_(20) set Y_ 529
$ns initial_node_pos $node_(20) 20

#???21?Node
set node_(21) [$ns node]
$node_(21) set X_ 684
$node_(21) set Y_ 176
$ns initial_node_pos $node_(21) 20

#???22?Node
set node_(22) [$ns node]
$node_(22) set X_ 34
$node_(22) set Y_ 863
$ns initial_node_pos $node_(22) 20

#???23?Node
set node_(23) [$ns node]
$node_(23) set X_ 967
$node_(23) set Y_ 512
$ns initial_node_pos $node_(23) 20

#???24?Node
set node_(24) [$ns node]
$node_(24) set X_ 18
$node_(24) set Y_ 98
$ns initial_node_pos $node_(24) 20

#???25?Node
set node_(25) [$ns node]
$node_(25) set X_ 27
$node_(25) set Y_ 798
$ns initial_node_pos $node_(25) 20

#???26?Node
set node_(26) [$ns node]
$node_(26) set X_ 531
$node_(26) set Y_ 224
$ns initial_node_pos $node_(26) 20

#???27?Node
set node_(27) [$ns node]
$node_(27) set X_ 515
$node_(27) set Y_ 11
$ns initial_node_pos $node_(27) 20

#???28?Node
set node_(28) [$ns node]
$node_(28) set X_ 185
$node_(28) set Y_ 496
$ns initial_node_pos $node_(28) 20

#???29?Node
set node_(29) [$ns node]
$node_(29) set X_ 231
$node_(29) set Y_ 607
$ns initial_node_pos $node_(29) 20

#???30?Node
set node_(30) [$ns node]
$node_(30) set X_ 308
$node_(30) set Y_ 440
$ns initial_node_pos $node_(30) 20

#???31?Node
set node_(31) [$ns node]
$node_(31) set X_ 285
$node_(31) set Y_ 678
$ns initial_node_pos $node_(31) 20

#???32?Node
set node_(32) [$ns node]
$node_(32) set X_ 236
$node_(32) set Y_ 500
$ns initial_node_pos $node_(32) 20

#???33?Node
set node_(33) [$ns node]
$node_(33) set X_ 78
$node_(33) set Y_ 853
$ns initial_node_pos $node_(33) 20

#???34?Node
set node_(34) [$ns node]
$node_(34) set X_ 860
$node_(34) set Y_ 305
$ns initial_node_pos $node_(34) 20

#???35?Node
set node_(35) [$ns node]
$node_(35) set X_ 839
$node_(35) set Y_ 101
$ns initial_node_pos $node_(35) 20

#???36?Node
set node_(36) [$ns node]
$node_(36) set X_ 112
$node_(36) set Y_ 192
$ns initial_node_pos $node_(36) 20

#???37?Node
set node_(37) [$ns node]
$node_(37) set X_ 174
$node_(37) set Y_ 327
$ns initial_node_pos $node_(37) 20

#???38?Node
set node_(38) [$ns node]
$node_(38) set X_ 683
$node_(38) set Y_ 430
$ns initial_node_pos $node_(38) 20

#???39?Node
set node_(39) [$ns node]
$node_(39) set X_ 879
$node_(39) set Y_ 141
$ns initial_node_pos $node_(39) 20

#???40?Node
set node_(40) [$ns node]
$node_(40) set X_ 15
$node_(40) set Y_ 692
$ns initial_node_pos $node_(40) 20

#???41?Node
set node_(41) [$ns node]
$node_(41) set X_ 923
$node_(41) set Y_ 526
$ns initial_node_pos $node_(41) 20

#???42?Node
set node_(42) [$ns node]
$node_(42) set X_ 852
$node_(42) set Y_ 910
$ns initial_node_pos $node_(42) 20

#???43?Node
set node_(43) [$ns node]
$node_(43) set X_ 973
$node_(43) set Y_ 434
$ns initial_node_pos $node_(43) 20

#???44?Node
set node_(44) [$ns node]
$node_(44) set X_ 903
$node_(44) set Y_ 609
$ns initial_node_pos $node_(44) 20

#???45?Node
set node_(45) [$ns node]
$node_(45) set X_ 439
$node_(45) set Y_ 925
$ns initial_node_pos $node_(45) 20

#???46?Node
set node_(46) [$ns node]
$node_(46) set X_ 443
$node_(46) set Y_ 985
$ns initial_node_pos $node_(46) 20

#???47?Node
set node_(47) [$ns node]
$node_(47) set X_ 748
$node_(47) set Y_ 984
$ns initial_node_pos $node_(47) 20

#???48?Node
set node_(48) [$ns node]
$node_(48) set X_ 704
$node_(48) set Y_ 539
$ns initial_node_pos $node_(48) 20

#???49?Node
set node_(49) [$ns node]
$node_(49) set X_ 936
$node_(49) set Y_ 710
$ns initial_node_pos $node_(49) 20

#???50?Node
set node_(50) [$ns node]
$node_(50) set X_ 349
$node_(50) set Y_ 761
$ns initial_node_pos $node_(50) 20

#???51?Node
set node_(51) [$ns node]
$node_(51) set X_ 827
$node_(51) set Y_ 843
$ns initial_node_pos $node_(51) 20

#???52?Node
set node_(52) [$ns node]
$node_(52) set X_ 967
$node_(52) set Y_ 942
$ns initial_node_pos $node_(52) 20

#???53?Node
set node_(53) [$ns node]
$node_(53) set X_ 634
$node_(53) set Y_ 500
$ns initial_node_pos $node_(53) 20

#???54?Node
set node_(54) [$ns node]
$node_(54) set X_ 736
$node_(54) set Y_ 579
$ns initial_node_pos $node_(54) 20

#???55?Node
set node_(55) [$ns node]
$node_(55) set X_ 748
$node_(55) set Y_ 734
$ns initial_node_pos $node_(55) 20

#???56?Node
set node_(56) [$ns node]
$node_(56) set X_ 698
$node_(56) set Y_ 346
$ns initial_node_pos $node_(56) 20

#???57?Node
set node_(57) [$ns node]
$node_(57) set X_ 59
$node_(57) set Y_ 143
$ns initial_node_pos $node_(57) 20

#???58?Node
set node_(58) [$ns node]
$node_(58) set X_ 690
$node_(58) set Y_ 610
$ns initial_node_pos $node_(58) 20

#???59?Node
set node_(59) [$ns node]
$node_(59) set X_ 801
$node_(59) set Y_ 780
$ns initial_node_pos $node_(59) 20

#???60?Node
set node_(60) [$ns node]
$node_(60) set X_ 246
$node_(60) set Y_ 951
$ns initial_node_pos $node_(60) 20

#???61?Node
set node_(61) [$ns node]
$node_(61) set X_ 712
$node_(61) set Y_ 266
$ns initial_node_pos $node_(61) 20

#???62?Node
set node_(62) [$ns node]
$node_(62) set X_ 289
$node_(62) set Y_ 189
$ns initial_node_pos $node_(62) 20

#???63?Node
set node_(63) [$ns node]
$node_(63) set X_ 618
$node_(63) set Y_ 430
$ns initial_node_pos $node_(63) 20

#???64?Node
set node_(64) [$ns node]
$node_(64) set X_ 517
$node_(64) set Y_ 356
$ns initial_node_pos $node_(64) 20

#???65?Node
set node_(65) [$ns node]
$node_(65) set X_ 909
$node_(65) set Y_ 360
$ns initial_node_pos $node_(65) 20

#???66?Node
set node_(66) [$ns node]
$node_(66) set X_ 526
$node_(66) set Y_ 916
$ns initial_node_pos $node_(66) 20

#???67?Node
set node_(67) [$ns node]
$node_(67) set X_ 265
$node_(67) set Y_ 345
$ns initial_node_pos $node_(67) 20

#???68?Node
set node_(68) [$ns node]
$node_(68) set X_ 256
$node_(68) set Y_ 283
$ns initial_node_pos $node_(68) 20

#???69?Node
set node_(69) [$ns node]
$node_(69) set X_ 541
$node_(69) set Y_ 722
$ns initial_node_pos $node_(69) 20

#???70?Node
set node_(70) [$ns node]
$node_(70) set X_ 961
$node_(70) set Y_ 381
$ns initial_node_pos $node_(70) 20

#???71?Node
set node_(71) [$ns node]
$node_(71) set X_ 210
$node_(71) set Y_ 628
$ns initial_node_pos $node_(71) 20

#???72?Node
set node_(72) [$ns node]
$node_(72) set X_ 477
$node_(72) set Y_ 588
$ns initial_node_pos $node_(72) 20

#???73?Node
set node_(73) [$ns node]
$node_(73) set X_ 364
$node_(73) set Y_ 209
$ns initial_node_pos $node_(73) 20

#???74?Node
set node_(74) [$ns node]
$node_(74) set X_ 561
$node_(74) set Y_ 794
$ns initial_node_pos $node_(74) 20

#???75?Node
set node_(75) [$ns node]
$node_(75) set X_ 285
$node_(75) set Y_ 526
$ns initial_node_pos $node_(75) 20

#???76?Node
set node_(76) [$ns node]
$node_(76) set X_ 549
$node_(76) set Y_ 143
$ns initial_node_pos $node_(76) 20

#???77?Node
set node_(77) [$ns node]
$node_(77) set X_ 947
$node_(77) set Y_ 883
$ns initial_node_pos $node_(77) 20

#???78?Node
set node_(78) [$ns node]
$node_(78) set X_ 138
$node_(78) set Y_ 865
$ns initial_node_pos $node_(78) 20

#???79?Node
set node_(79) [$ns node]
$node_(79) set X_ 585
$node_(79) set Y_ 850
$ns initial_node_pos $node_(79) 20

#???80?Node
set node_(80) [$ns node]
$node_(80) set X_ 420
$node_(80) set Y_ 29
$ns initial_node_pos $node_(80) 20

#???81?Node
set node_(81) [$ns node]
$node_(81) set X_ 332
$node_(81) set Y_ 869
$ns initial_node_pos $node_(81) 20

#???82?Node
set node_(82) [$ns node]
$node_(82) set X_ 358
$node_(82) set Y_ 45
$ns initial_node_pos $node_(82) 20

#???83?Node
set node_(83) [$ns node]
$node_(83) set X_ 367
$node_(83) set Y_ 616
$ns initial_node_pos $node_(83) 20

#???84?Node
set node_(84) [$ns node]
$node_(84) set X_ 792
$node_(84) set Y_ 40
$ns initial_node_pos $node_(84) 20

#???85?Node
set node_(85) [$ns node]
$node_(85) set X_ 247
$node_(85) set Y_ 125
$ns initial_node_pos $node_(85) 20

#???86?Node
set node_(86) [$ns node]
$node_(86) set X_ 923
$node_(86) set Y_ 925
$ns initial_node_pos $node_(86) 20

#???87?Node
set node_(87) [$ns node]
$node_(87) set X_ 88
$node_(87) set Y_ 885
$ns initial_node_pos $node_(87) 20

#???88?Node
set node_(88) [$ns node]
$node_(88) set X_ 80
$node_(88) set Y_ 427
$ns initial_node_pos $node_(88) 20

#???89?Node
set node_(89) [$ns node]
$node_(89) set X_ 292
$node_(89) set Y_ 634
$ns initial_node_pos $node_(89) 20

#???90?Node
set node_(90) [$ns node]
$node_(90) set X_ 874
$node_(90) set Y_ 509
$ns initial_node_pos $node_(90) 20

#???91?Node
set node_(91) [$ns node]
$node_(91) set X_ 393
$node_(91) set Y_ 501
$ns initial_node_pos $node_(91) 20

#???92?Node
set node_(92) [$ns node]
$node_(92) set X_ 37
$node_(92) set Y_ 366
$ns initial_node_pos $node_(92) 20

#???93?Node
set node_(93) [$ns node]
$node_(93) set X_ 477
$node_(93) set Y_ 856
$ns initial_node_pos $node_(93) 20

#???94?Node
set node_(94) [$ns node]
$node_(94) set X_ 214
$node_(94) set Y_ 407
$ns initial_node_pos $node_(94) 20

#???95?Node
set node_(95) [$ns node]
$node_(95) set X_ 945
$node_(95) set Y_ 172
$ns initial_node_pos $node_(95) 20

#???96?Node
set node_(96) [$ns node]
$node_(96) set X_ 92
$node_(96) set Y_ 941
$ns initial_node_pos $node_(96) 20

#???97?Node
set node_(97) [$ns node]
$node_(97) set X_ 525
$node_(97) set Y_ 873
$ns initial_node_pos $node_(97) 20

#???98?Node
set node_(98) [$ns node]
$node_(98) set X_ 618
$node_(98) set Y_ 340
$ns initial_node_pos $node_(98) 20

#???99?Node
set node_(99) [$ns node]
$node_(99) set X_ 23
$node_(99) set Y_ 921
$ns initial_node_pos $node_(99) 20

#???100?Node
set node_(100) [$ns node]
$node_(100) set X_ 805
$node_(100) set Y_ 938
$ns initial_node_pos $node_(100) 20

#???101?Node
set node_(101) [$ns node]
$node_(101) set X_ 332
$node_(101) set Y_ 348
$ns initial_node_pos $node_(101) 20

#???102?Node
set node_(102) [$ns node]
$node_(102) set X_ 443
$node_(102) set Y_ 691
$ns initial_node_pos $node_(102) 20

#???103?Node
set node_(103) [$ns node]
$node_(103) set X_ 934
$node_(103) set Y_ 797
$ns initial_node_pos $node_(103) 20

#???104?Node
set node_(104) [$ns node]
$node_(104) set X_ 387
$node_(104) set Y_ 956
$ns initial_node_pos $node_(104) 20

#???105?Node
set node_(105) [$ns node]
$node_(105) set X_ 197
$node_(105) set Y_ 201
$ns initial_node_pos $node_(105) 20

#???106?Node
set node_(106) [$ns node]
$node_(106) set X_ 129
$node_(106) set Y_ 118
$ns initial_node_pos $node_(106) 20

#???107?Node
set node_(107) [$ns node]
$node_(107) set X_ 122
$node_(107) set Y_ 591
$ns initial_node_pos $node_(107) 20

#???108?Node
set node_(108) [$ns node]
$node_(108) set X_ 357
$node_(108) set Y_ 534
$ns initial_node_pos $node_(108) 20

#???109?Node
set node_(109) [$ns node]
$node_(109) set X_ 774
$node_(109) set Y_ 839
$ns initial_node_pos $node_(109) 20

#???110?Node
set node_(110) [$ns node]
$node_(110) set X_ 743
$node_(110) set Y_ 361
$ns initial_node_pos $node_(110) 20

#???111?Node
set node_(111) [$ns node]
$node_(111) set X_ 399
$node_(111) set Y_ 280
$ns initial_node_pos $node_(111) 20

#???112?Node
set node_(112) [$ns node]
$node_(112) set X_ 591
$node_(112) set Y_ 926
$ns initial_node_pos $node_(112) 20

#???113?Node
set node_(113) [$ns node]
$node_(113) set X_ 500
$node_(113) set Y_ 432
$ns initial_node_pos $node_(113) 20

#???114?Node
set node_(114) [$ns node]
$node_(114) set X_ 361
$node_(114) set Y_ 993
$ns initial_node_pos $node_(114) 20

#???115?Node
set node_(115) [$ns node]
$node_(115) set X_ 27
$node_(115) set Y_ 452
$ns initial_node_pos $node_(115) 20

#???116?Node
set node_(116) [$ns node]
$node_(116) set X_ 440
$node_(116) set Y_ 390
$ns initial_node_pos $node_(116) 20

#???117?Node
set node_(117) [$ns node]
$node_(117) set X_ 159
$node_(117) set Y_ 798
$ns initial_node_pos $node_(117) 20

#???118?Node
set node_(118) [$ns node]
$node_(118) set X_ 21
$node_(118) set Y_ 314
$ns initial_node_pos $node_(118) 20

#???119?Node
set node_(119) [$ns node]
$node_(119) set X_ 66
$node_(119) set Y_ 772
$ns initial_node_pos $node_(119) 20

#???120?Node
set node_(120) [$ns node]
$node_(120) set X_ 186
$node_(120) set Y_ 871
$ns initial_node_pos $node_(120) 20

#???121?Node
set node_(121) [$ns node]
$node_(121) set X_ 519
$node_(121) set Y_ 753
$ns initial_node_pos $node_(121) 20

#???122?Node
set node_(122) [$ns node]
$node_(122) set X_ 214
$node_(122) set Y_ 50
$ns initial_node_pos $node_(122) 20

#???123?Node
set node_(123) [$ns node]
$node_(123) set X_ 54
$node_(123) set Y_ 623
$ns initial_node_pos $node_(123) 20

#???124?Node
set node_(124) [$ns node]
$node_(124) set X_ 594
$node_(124) set Y_ 683
$ns initial_node_pos $node_(124) 20

#???125?Node
set node_(125) [$ns node]
$node_(125) set X_ 421
$node_(125) set Y_ 89
$ns initial_node_pos $node_(125) 20

#???126?Node
set node_(126) [$ns node]
$node_(126) set X_ 124
$node_(126) set Y_ 773
$ns initial_node_pos $node_(126) 20

#???127?Node
set node_(127) [$ns node]
$node_(127) set X_ 655
$node_(127) set Y_ 848
$ns initial_node_pos $node_(127) 20

#???128?Node
set node_(128) [$ns node]
$node_(128) set X_ 943
$node_(128) set Y_ 296
$ns initial_node_pos $node_(128) 20

#???129?Node
set node_(129) [$ns node]
$node_(129) set X_ 526
$node_(129) set Y_ 53
$ns initial_node_pos $node_(129) 20

#???130?Node
set node_(130) [$ns node]
$node_(130) set X_ 904
$node_(130) set Y_ 32
$ns initial_node_pos $node_(130) 20

#???131?Node
set node_(131) [$ns node]
$node_(131) set X_ 976
$node_(131) set Y_ 665
$ns initial_node_pos $node_(131) 20

#???132?Node
set node_(132) [$ns node]
$node_(132) set X_ 609
$node_(132) set Y_ 110
$ns initial_node_pos $node_(132) 20

#???133?Node
set node_(133) [$ns node]
$node_(133) set X_ 380
$node_(133) set Y_ 420
$ns initial_node_pos $node_(133) 20

#???134?Node
set node_(134) [$ns node]
$node_(134) set X_ 562
$node_(134) set Y_ 626
$ns initial_node_pos $node_(134) 20

#???135?Node
set node_(135) [$ns node]
$node_(135) set X_ 844
$node_(135) set Y_ 464
$ns initial_node_pos $node_(135) 20

#???136?Node
set node_(136) [$ns node]
$node_(136) set X_ 261
$node_(136) set Y_ 748
$ns initial_node_pos $node_(136) 20

#???137?Node
set node_(137) [$ns node]
$node_(137) set X_ 349
$node_(137) set Y_ 134
$ns initial_node_pos $node_(137) 20

#???138?Node
set node_(138) [$ns node]
$node_(138) set X_ 830
$node_(138) set Y_ 675
$ns initial_node_pos $node_(138) 20

#???139?Node
set node_(139) [$ns node]
$node_(139) set X_ 388
$node_(139) set Y_ 847
$ns initial_node_pos $node_(139) 20

#???140?Node
set node_(140) [$ns node]
$node_(140) set X_ 361
$node_(140) set Y_ 808
$ns initial_node_pos $node_(140) 20

#???141?Node
set node_(141) [$ns node]
$node_(141) set X_ 160
$node_(141) set Y_ 367
$ns initial_node_pos $node_(141) 20

#???142?Node
set node_(142) [$ns node]
$node_(142) set X_ 254
$node_(142) set Y_ 443
$ns initial_node_pos $node_(142) 20

#???143?Node
set node_(143) [$ns node]
$node_(143) set X_ 772
$node_(143) set Y_ 201
$ns initial_node_pos $node_(143) 20

#???144?Node
set node_(144) [$ns node]
$node_(144) set X_ 821
$node_(144) set Y_ 581
$ns initial_node_pos $node_(144) 20

#???145?Node
set node_(145) [$ns node]
$node_(145) set X_ 163
$node_(145) set Y_ 965
$ns initial_node_pos $node_(145) 20

#???146?Node
set node_(146) [$ns node]
$node_(146) set X_ 449
$node_(146) set Y_ 525
$ns initial_node_pos $node_(146) 20

#???147?Node
set node_(147) [$ns node]
$node_(147) set X_ 266
$node_(147) set Y_ 924
$ns initial_node_pos $node_(147) 20

#???148?Node
set node_(148) [$ns node]
$node_(148) set X_ 953
$node_(148) set Y_ 86
$ns initial_node_pos $node_(148) 20

#???149?Node
set node_(149) [$ns node]
$node_(149) set X_ 861
$node_(149) set Y_ 861
$ns initial_node_pos $node_(149) 20

#???150?Node
set node_(150) [$ns node]
$node_(150) set X_ 677
$node_(150) set Y_ 83
$ns initial_node_pos $node_(150) 20

#???151?Node
set node_(151) [$ns node]
$node_(151) set X_ 605
$node_(151) set Y_ 281
$ns initial_node_pos $node_(151) 20

#???152?Node
set node_(152) [$ns node]
$node_(152) set X_ 423
$node_(152) set Y_ 196
$ns initial_node_pos $node_(152) 20

#???153?Node
set node_(153) [$ns node]
$node_(153) set X_ 569
$node_(153) set Y_ 521
$ns initial_node_pos $node_(153) 20

#???154?Node
set node_(154) [$ns node]
$node_(154) set X_ 765
$node_(154) set Y_ 143
$ns initial_node_pos $node_(154) 20

#???155?Node
set node_(155) [$ns node]
$node_(155) set X_ 665
$node_(155) set Y_ 813
$ns initial_node_pos $node_(155) 20

#???156?Node
set node_(156) [$ns node]
$node_(156) set X_ 49
$node_(156) set Y_ 201
$ns initial_node_pos $node_(156) 20

#???157?Node
set node_(157) [$ns node]
$node_(157) set X_ 630
$node_(157) set Y_ 45
$ns initial_node_pos $node_(157) 20

#???158?Node
set node_(158) [$ns node]
$node_(158) set X_ 83
$node_(158) set Y_ 716
$ns initial_node_pos $node_(158) 20

#???159?Node
set node_(159) [$ns node]
$node_(159) set X_ 198
$node_(159) set Y_ 145
$ns initial_node_pos $node_(159) 20

#???160?Node
set node_(160) [$ns node]
$node_(160) set X_ 748
$node_(160) set Y_ 893
$ns initial_node_pos $node_(160) 20

#???161?Node
set node_(161) [$ns node]
$node_(161) set X_ 854
$node_(161) set Y_ 960
$ns initial_node_pos $node_(161) 20

#???162?Node
set node_(162) [$ns node]
$node_(162) set X_ 170
$node_(162) set Y_ 552
$ns initial_node_pos $node_(162) 20

#???163?Node
set node_(163) [$ns node]
$node_(163) set X_ 92
$node_(163) set Y_ 365
$ns initial_node_pos $node_(163) 20

#???164?Node
set node_(164) [$ns node]
$node_(164) set X_ 416
$node_(164) set Y_ 607
$ns initial_node_pos $node_(164) 20

#???165?Node
set node_(165) [$ns node]
$node_(165) set X_ 462
$node_(165) set Y_ 809
$ns initial_node_pos $node_(165) 20

#???166?Node
set node_(166) [$ns node]
$node_(166) set X_ 298
$node_(166) set Y_ 831
$ns initial_node_pos $node_(166) 20

#???167?Node
set node_(167) [$ns node]
$node_(167) set X_ 450
$node_(167) set Y_ 345
$ns initial_node_pos $node_(167) 20

#???168?Node
set node_(168) [$ns node]
$node_(168) set X_ 754
$node_(168) set Y_ 476
$ns initial_node_pos $node_(168) 20

#???169?Node
set node_(169) [$ns node]
$node_(169) set X_ 93
$node_(169) set Y_ 492
$ns initial_node_pos $node_(169) 20

#???170?Node
set node_(170) [$ns node]
$node_(170) set X_ 918
$node_(170) set Y_ 223
$ns initial_node_pos $node_(170) 20

#???171?Node
set node_(171) [$ns node]
$node_(171) set X_ 480
$node_(171) set Y_ 640
$ns initial_node_pos $node_(171) 20

#???172?Node
set node_(172) [$ns node]
$node_(172) set X_ 565
$node_(172) set Y_ 980
$ns initial_node_pos $node_(172) 20

#???173?Node
set node_(173) [$ns node]
$node_(173) set X_ 863
$node_(173) set Y_ 390
$ns initial_node_pos $node_(173) 20

#???174?Node
set node_(174) [$ns node]
$node_(174) set X_ 874
$node_(174) set Y_ 731
$ns initial_node_pos $node_(174) 20

#???175?Node
set node_(175) [$ns node]
$node_(175) set X_ 345
$node_(175) set Y_ 701
$ns initial_node_pos $node_(175) 20

#???176?Node
set node_(176) [$ns node]
$node_(176) set X_ 803
$node_(176) set Y_ 418
$ns initial_node_pos $node_(176) 20

#???177?Node
set node_(177) [$ns node]
$node_(177) set X_ 13
$node_(177) set Y_ 974
$ns initial_node_pos $node_(177) 20

#???178?Node
set node_(178) [$ns node]
$node_(178) set X_ 850
$node_(178) set Y_ 236
$ns initial_node_pos $node_(178) 20

#???179?Node
set node_(179) [$ns node]
$node_(179) set X_ 283
$node_(179) set Y_ 50
$ns initial_node_pos $node_(179) 20

#???180?Node
set node_(180) [$ns node]
$node_(180) set X_ 240
$node_(180) set Y_ 705
$ns initial_node_pos $node_(180) 20

#???181?Node
set node_(181) [$ns node]
$node_(181) set X_ 307
$node_(181) set Y_ 253
$ns initial_node_pos $node_(181) 20

#???182?Node
set node_(182) [$ns node]
$node_(182) set X_ 716
$node_(182) set Y_ 836
$ns initial_node_pos $node_(182) 20

#???183?Node
set node_(183) [$ns node]
$node_(183) set X_ 306
$node_(183) set Y_ 923
$ns initial_node_pos $node_(183) 20

#???184?Node
set node_(184) [$ns node]
$node_(184) set X_ 665
$node_(184) set Y_ 905
$ns initial_node_pos $node_(184) 20

#???185?Node
set node_(185) [$ns node]
$node_(185) set X_ 900
$node_(185) set Y_ 447
$ns initial_node_pos $node_(185) 20

#???186?Node
set node_(186) [$ns node]
$node_(186) set X_ 787
$node_(186) set Y_ 641
$ns initial_node_pos $node_(186) 20

#???187?Node
set node_(187) [$ns node]
$node_(187) set X_ 892
$node_(187) set Y_ 670
$ns initial_node_pos $node_(187) 20

#???188?Node
set node_(188) [$ns node]
$node_(188) set X_ 127
$node_(188) set Y_ 455
$ns initial_node_pos $node_(188) 20

#???189?Node
set node_(189) [$ns node]
$node_(189) set X_ 196
$node_(189) set Y_ 284
$ns initial_node_pos $node_(189) 20

#???190?Node
set node_(190) [$ns node]
$node_(190) set X_ 723
$node_(190) set Y_ 33
$ns initial_node_pos $node_(190) 20

#???191?Node
set node_(191) [$ns node]
$node_(191) set X_ 131
$node_(191) set Y_ 48
$ns initial_node_pos $node_(191) 20

#???192?Node
set node_(192) [$ns node]
$node_(192) set X_ 612
$node_(192) set Y_ 577
$ns initial_node_pos $node_(192) 20

#???193?Node
set node_(193) [$ns node]
$node_(193) set X_ 74
$node_(193) set Y_ 289
$ns initial_node_pos $node_(193) 20

#???194?Node
set node_(194) [$ns node]
$node_(194) set X_ 692
$node_(194) set Y_ 489
$ns initial_node_pos $node_(194) 20

#???195?Node
set node_(195) [$ns node]
$node_(195) set X_ 565
$node_(195) set Y_ 465
$ns initial_node_pos $node_(195) 20

#???196?Node
set node_(196) [$ns node]
$node_(196) set X_ 627
$node_(196) set Y_ 211
$ns initial_node_pos $node_(196) 20

#???197?Node
set node_(197) [$ns node]
$node_(197) set X_ 468
$node_(197) set Y_ 141
$ns initial_node_pos $node_(197) 20

#???198?Node
set node_(198) [$ns node]
$node_(198) set X_ 696
$node_(198) set Y_ 929
$ns initial_node_pos $node_(198) 20

#???199?Node
set node_(199) [$ns node]
$node_(199) set X_ 123
$node_(199) set Y_ 269
$ns initial_node_pos $node_(199) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(5) setdest 870.0 61.0 $tz " 
$ns at 10.0 " $node_(8) setdest 818.0 329.0 $tz " 
$ns at 10.0 " $node_(10) setdest 67.0 560.0 $tz " 
$ns at 10.0 " $node_(13) setdest 705.0 630.0 $tz " 
$ns at 10.0 " $node_(17) setdest 792.0 160.0 $tz " 
$ns at 10.0 " $node_(23) setdest 180.0 180.0 $tz " 
$ns at 10.0 " $node_(24) setdest 220.0 950.0 $tz " 
$ns at 10.0 " $node_(25) setdest 834.0 800.0 $tz " 
$ns at 10.0 " $node_(27) setdest 916.0 32.0 $tz " 
$ns at 10.0 " $node_(33) setdest 440.0 460.0 $tz " 
$ns at 10.0 " $node_(40) setdest 641.0 905.0 $tz " 
$ns at 10.0 " $node_(41) setdest 187.0 547.0 $tz " 
$ns at 10.0 " $node_(48) setdest 169.0 440.0 $tz " 
$ns at 10.0 " $node_(49) setdest 56.0 749.0 $tz " 
$ns at 10.0 " $node_(50) setdest 734.0 263.0 $tz " 
$ns at 10.0 " $node_(52) setdest 47.0 427.0 $tz " 
$ns at 10.0 " $node_(70) setdest 32.0 618.0 $tz " 
$ns at 10.0 " $node_(74) setdest 636.0 121.0 $tz " 
$ns at 10.0 " $node_(77) setdest 160.0 240.0 $tz " 
$ns at 10.0 " $node_(78) setdest 307.0 72.0 $tz " 
$ns at 10.0 " $node_(80) setdest 490.0 936.0 $tz " 
$ns at 10.0 " $node_(86) setdest 149.0 36.0 $tz " 
$ns at 10.0 " $node_(95) setdest 156.0 254.0 $tz " 
$ns at 10.0 " $node_(96) setdest 183.0 118.0 $tz " 
$ns at 10.0 " $node_(99) setdest 600.0 92.0 $tz " 
$ns at 10.0 " $node_(100) setdest 756.0 112.0 $tz " 
$ns at 10.0 " $node_(103) setdest 58.0 674.0 $tz " 
$ns at 10.0 " $node_(106) setdest 149.0 910.0 $tz " 
$ns at 10.0 " $node_(111) setdest 763.0 670.0 $tz " 
$ns at 10.0 " $node_(112) setdest 360.0 314.0 $tz " 
$ns at 10.0 " $node_(115) setdest 660.0 687.0 $tz " 
$ns at 10.0 " $node_(118) setdest 798.0 605.0 $tz " 
$ns at 10.0 " $node_(119) setdest 698.0 245.0 $tz " 
$ns at 10.0 " $node_(120) setdest 890.0 867.0 $tz " 
$ns at 10.0 " $node_(128) setdest 130.0 334.0 $tz " 
$ns at 10.0 " $node_(130) setdest 114.0 545.0 $tz " 
$ns at 10.0 " $node_(138) setdest 103.0 658.0 $tz " 
$ns at 10.0 " $node_(145) setdest 723.0 896.0 $tz " 
$ns at 10.0 " $node_(147) setdest 338.0 83.0 $tz " 
$ns at 10.0 " $node_(148) setdest 90.0 169.0 $tz " 
$ns at 10.0 " $node_(150) setdest 169.0 636.0 $tz " 
$ns at 10.0 " $node_(155) setdest 465.0 83.0 $tz " 
$ns at 10.0 " $node_(157) setdest 63.0 340.0 $tz " 
$ns at 10.0 " $node_(161) setdest 358.0 83.0 $tz " 
$ns at 10.0 " $node_(170) setdest 69.0 245.0 $tz " 
$ns at 10.0 " $node_(174) setdest 276.0 794.0 $tz " 
$ns at 10.0 " $node_(177) setdest 650.0 976.0 $tz " 
$ns at 10.0 " $node_(178) setdest 369.0 674.0 $tz " 
$ns at 10.0 " $node_(179) setdest 672.0 474.0 $tz " 
$ns at 10.0 " $node_(190) setdest 381.0 914.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(148) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(118) $null0
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