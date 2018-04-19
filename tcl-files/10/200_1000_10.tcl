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
$node_(0) set X_ 331
$node_(0) set Y_ 79
$ns initial_node_pos $node_(0) 20

#???1?Node
set node_(1) [$ns node]
$node_(1) set X_ 788
$node_(1) set Y_ 4
$ns initial_node_pos $node_(1) 20

#???2?Node
set node_(2) [$ns node]
$node_(2) set X_ 770
$node_(2) set Y_ 569
$ns initial_node_pos $node_(2) 20

#???3?Node
set node_(3) [$ns node]
$node_(3) set X_ 953
$node_(3) set Y_ 114
$ns initial_node_pos $node_(3) 20

#???4?Node
set node_(4) [$ns node]
$node_(4) set X_ 115
$node_(4) set Y_ 990
$ns initial_node_pos $node_(4) 20

#???5?Node
set node_(5) [$ns node]
$node_(5) set X_ 350
$node_(5) set Y_ 412
$ns initial_node_pos $node_(5) 20

#???6?Node
set node_(6) [$ns node]
$node_(6) set X_ 547
$node_(6) set Y_ 31
$ns initial_node_pos $node_(6) 20

#???7?Node
set node_(7) [$ns node]
$node_(7) set X_ 142
$node_(7) set Y_ 951
$ns initial_node_pos $node_(7) 20

#???8?Node
set node_(8) [$ns node]
$node_(8) set X_ 911
$node_(8) set Y_ 174
$ns initial_node_pos $node_(8) 20

#???9?Node
set node_(9) [$ns node]
$node_(9) set X_ 875
$node_(9) set Y_ 895
$ns initial_node_pos $node_(9) 20

#???10?Node
set node_(10) [$ns node]
$node_(10) set X_ 533
$node_(10) set Y_ 707
$ns initial_node_pos $node_(10) 20

#???11?Node
set node_(11) [$ns node]
$node_(11) set X_ 499
$node_(11) set Y_ 224
$ns initial_node_pos $node_(11) 20

#???12?Node
set node_(12) [$ns node]
$node_(12) set X_ 249
$node_(12) set Y_ 453
$ns initial_node_pos $node_(12) 20

#???13?Node
set node_(13) [$ns node]
$node_(13) set X_ 838
$node_(13) set Y_ 848
$ns initial_node_pos $node_(13) 20

#???14?Node
set node_(14) [$ns node]
$node_(14) set X_ 970
$node_(14) set Y_ 394
$ns initial_node_pos $node_(14) 20

#???15?Node
set node_(15) [$ns node]
$node_(15) set X_ 944
$node_(15) set Y_ 671
$ns initial_node_pos $node_(15) 20

#???16?Node
set node_(16) [$ns node]
$node_(16) set X_ 309
$node_(16) set Y_ 57
$ns initial_node_pos $node_(16) 20

#???17?Node
set node_(17) [$ns node]
$node_(17) set X_ 400
$node_(17) set Y_ 581
$ns initial_node_pos $node_(17) 20

#???18?Node
set node_(18) [$ns node]
$node_(18) set X_ 143
$node_(18) set Y_ 449
$ns initial_node_pos $node_(18) 20

#???19?Node
set node_(19) [$ns node]
$node_(19) set X_ 877
$node_(19) set Y_ 805
$ns initial_node_pos $node_(19) 20

#???20?Node
set node_(21) [$ns node]
$node_(21) set X_ 567
$node_(21) set Y_ 17
$ns initial_node_pos $node_(21) 20

#???21?Node
set node_(22) [$ns node]
$node_(22) set X_ 242
$node_(22) set Y_ 18
$ns initial_node_pos $node_(22) 20

#???22?Node
set node_(23) [$ns node]
$node_(23) set X_ 119
$node_(23) set Y_ 672
$ns initial_node_pos $node_(23) 20

#???23?Node
set node_(24) [$ns node]
$node_(24) set X_ 510
$node_(24) set Y_ 949
$ns initial_node_pos $node_(24) 20

#???24?Node
set node_(25) [$ns node]
$node_(25) set X_ 22
$node_(25) set Y_ 679
$ns initial_node_pos $node_(25) 20

#???25?Node
set node_(26) [$ns node]
$node_(26) set X_ 374
$node_(26) set Y_ 638
$ns initial_node_pos $node_(26) 20

#???26?Node
set node_(27) [$ns node]
$node_(27) set X_ 986
$node_(27) set Y_ 629
$ns initial_node_pos $node_(27) 20

#???27?Node
set node_(28) [$ns node]
$node_(28) set X_ 29
$node_(28) set Y_ 68
$ns initial_node_pos $node_(28) 20

#???28?Node
set node_(29) [$ns node]
$node_(29) set X_ 293
$node_(29) set Y_ 167
$ns initial_node_pos $node_(29) 20

#???29?Node
set node_(30) [$ns node]
$node_(30) set X_ 75
$node_(30) set Y_ 333
$ns initial_node_pos $node_(30) 20

#???30?Node
set node_(31) [$ns node]
$node_(31) set X_ 689
$node_(31) set Y_ 347
$ns initial_node_pos $node_(31) 20

#???31?Node
set node_(32) [$ns node]
$node_(32) set X_ 587
$node_(32) set Y_ 285
$ns initial_node_pos $node_(32) 20

#???32?Node
set node_(33) [$ns node]
$node_(33) set X_ 691
$node_(33) set Y_ 408
$ns initial_node_pos $node_(33) 20

#???33?Node
set node_(34) [$ns node]
$node_(34) set X_ 918
$node_(34) set Y_ 44
$ns initial_node_pos $node_(34) 20

#???34?Node
set node_(36) [$ns node]
$node_(36) set X_ 631
$node_(36) set Y_ 235
$ns initial_node_pos $node_(36) 20

#???35?Node
set node_(37) [$ns node]
$node_(37) set X_ 606
$node_(37) set Y_ 848
$ns initial_node_pos $node_(37) 20

#???36?Node
set node_(38) [$ns node]
$node_(38) set X_ 831
$node_(38) set Y_ 6
$ns initial_node_pos $node_(38) 20

#???37?Node
set node_(39) [$ns node]
$node_(39) set X_ 70
$node_(39) set Y_ 805
$ns initial_node_pos $node_(39) 20

#???38?Node
set node_(40) [$ns node]
$node_(40) set X_ 895
$node_(40) set Y_ 683
$ns initial_node_pos $node_(40) 20

#???39?Node
set node_(41) [$ns node]
$node_(41) set X_ 164
$node_(41) set Y_ 256
$ns initial_node_pos $node_(41) 20

#???40?Node
set node_(42) [$ns node]
$node_(42) set X_ 876
$node_(42) set Y_ 91
$ns initial_node_pos $node_(42) 20

#???41?Node
set node_(43) [$ns node]
$node_(43) set X_ 752
$node_(43) set Y_ 387
$ns initial_node_pos $node_(43) 20

#???42?Node
set node_(44) [$ns node]
$node_(44) set X_ 587
$node_(44) set Y_ 111
$ns initial_node_pos $node_(44) 20

#???43?Node
set node_(45) [$ns node]
$node_(45) set X_ 364
$node_(45) set Y_ 155
$ns initial_node_pos $node_(45) 20

#???44?Node
set node_(46) [$ns node]
$node_(46) set X_ 312
$node_(46) set Y_ 238
$ns initial_node_pos $node_(46) 20

#???45?Node
set node_(47) [$ns node]
$node_(47) set X_ 912
$node_(47) set Y_ 307
$ns initial_node_pos $node_(47) 20

#???46?Node
set node_(48) [$ns node]
$node_(48) set X_ 194
$node_(48) set Y_ 333
$ns initial_node_pos $node_(48) 20

#???47?Node
set node_(49) [$ns node]
$node_(49) set X_ 178
$node_(49) set Y_ 10
$ns initial_node_pos $node_(49) 20

#???48?Node
set node_(50) [$ns node]
$node_(50) set X_ 447
$node_(50) set Y_ 243
$ns initial_node_pos $node_(50) 20

#???49?Node
set node_(52) [$ns node]
$node_(52) set X_ 302
$node_(52) set Y_ 911
$ns initial_node_pos $node_(52) 20

#???50?Node
set node_(53) [$ns node]
$node_(53) set X_ 764
$node_(53) set Y_ 829
$ns initial_node_pos $node_(53) 20

#???51?Node
set node_(54) [$ns node]
$node_(54) set X_ 445
$node_(54) set Y_ 730
$ns initial_node_pos $node_(54) 20

#???52?Node
set node_(55) [$ns node]
$node_(55) set X_ 43
$node_(55) set Y_ 888
$ns initial_node_pos $node_(55) 20

#???53?Node
set node_(56) [$ns node]
$node_(56) set X_ 344
$node_(56) set Y_ 711
$ns initial_node_pos $node_(56) 20

#???54?Node
set node_(57) [$ns node]
$node_(57) set X_ 354
$node_(57) set Y_ 546
$ns initial_node_pos $node_(57) 20

#???55?Node
set node_(58) [$ns node]
$node_(58) set X_ 191
$node_(58) set Y_ 78
$ns initial_node_pos $node_(58) 20

#???56?Node
set node_(59) [$ns node]
$node_(59) set X_ 915
$node_(59) set Y_ 539
$ns initial_node_pos $node_(59) 20

#???57?Node
set node_(60) [$ns node]
$node_(60) set X_ 702
$node_(60) set Y_ 41
$ns initial_node_pos $node_(60) 20

#???58?Node
set node_(61) [$ns node]
$node_(61) set X_ 409
$node_(61) set Y_ 309
$ns initial_node_pos $node_(61) 20

#???59?Node
set node_(62) [$ns node]
$node_(62) set X_ 157
$node_(62) set Y_ 732
$ns initial_node_pos $node_(62) 20

#???60?Node
set node_(63) [$ns node]
$node_(63) set X_ 63
$node_(63) set Y_ 643
$ns initial_node_pos $node_(63) 20

#???61?Node
set node_(64) [$ns node]
$node_(64) set X_ 909
$node_(64) set Y_ 842
$ns initial_node_pos $node_(64) 20

#???62?Node
set node_(65) [$ns node]
$node_(65) set X_ 433
$node_(65) set Y_ 840
$ns initial_node_pos $node_(65) 20

#???63?Node
set node_(66) [$ns node]
$node_(66) set X_ 38
$node_(66) set Y_ 425
$ns initial_node_pos $node_(66) 20

#???64?Node
set node_(67) [$ns node]
$node_(67) set X_ 964
$node_(67) set Y_ 442
$ns initial_node_pos $node_(67) 20

#???65?Node
set node_(68) [$ns node]
$node_(68) set X_ 33
$node_(68) set Y_ 959
$ns initial_node_pos $node_(68) 20

#???66?Node
set node_(69) [$ns node]
$node_(69) set X_ 760
$node_(69) set Y_ 224
$ns initial_node_pos $node_(69) 20

#???67?Node
set node_(70) [$ns node]
$node_(70) set X_ 265
$node_(70) set Y_ 500
$ns initial_node_pos $node_(70) 20

#???68?Node
set node_(71) [$ns node]
$node_(71) set X_ 77
$node_(71) set Y_ 199
$ns initial_node_pos $node_(71) 20

#???69?Node
set node_(72) [$ns node]
$node_(72) set X_ 772
$node_(72) set Y_ 348
$ns initial_node_pos $node_(72) 20

#???70?Node
set node_(73) [$ns node]
$node_(73) set X_ 287
$node_(73) set Y_ 308
$ns initial_node_pos $node_(73) 20

#???71?Node
set node_(74) [$ns node]
$node_(74) set X_ 71
$node_(74) set Y_ 3
$ns initial_node_pos $node_(74) 20

#???72?Node
set node_(75) [$ns node]
$node_(75) set X_ 695
$node_(75) set Y_ 226
$ns initial_node_pos $node_(75) 20

#???73?Node
set node_(76) [$ns node]
$node_(76) set X_ 818
$node_(76) set Y_ 682
$ns initial_node_pos $node_(76) 20

#???74?Node
set node_(77) [$ns node]
$node_(77) set X_ 81
$node_(77) set Y_ 387
$ns initial_node_pos $node_(77) 20

#???75?Node
set node_(78) [$ns node]
$node_(78) set X_ 560
$node_(78) set Y_ 833
$ns initial_node_pos $node_(78) 20

#???76?Node
set node_(79) [$ns node]
$node_(79) set X_ 75
$node_(79) set Y_ 857
$ns initial_node_pos $node_(79) 20

#???77?Node
set node_(80) [$ns node]
$node_(80) set X_ 583
$node_(80) set Y_ 488
$ns initial_node_pos $node_(80) 20

#???78?Node
set node_(81) [$ns node]
$node_(81) set X_ 38
$node_(81) set Y_ 314
$ns initial_node_pos $node_(81) 20

#???79?Node
set node_(82) [$ns node]
$node_(82) set X_ 554
$node_(82) set Y_ 442
$ns initial_node_pos $node_(82) 20

#???80?Node
set node_(83) [$ns node]
$node_(83) set X_ 412
$node_(83) set Y_ 226
$ns initial_node_pos $node_(83) 20

#???81?Node
set node_(84) [$ns node]
$node_(84) set X_ 46
$node_(84) set Y_ 826
$ns initial_node_pos $node_(84) 20

#???82?Node
set node_(85) [$ns node]
$node_(85) set X_ 279
$node_(85) set Y_ 725
$ns initial_node_pos $node_(85) 20

#???83?Node
set node_(86) [$ns node]
$node_(86) set X_ 794
$node_(86) set Y_ 135
$ns initial_node_pos $node_(86) 20

#???84?Node
set node_(87) [$ns node]
$node_(87) set X_ 455
$node_(87) set Y_ 911
$ns initial_node_pos $node_(87) 20

#???85?Node
set node_(88) [$ns node]
$node_(88) set X_ 446
$node_(88) set Y_ 433
$ns initial_node_pos $node_(88) 20

#???86?Node
set node_(89) [$ns node]
$node_(89) set X_ 820
$node_(89) set Y_ 194
$ns initial_node_pos $node_(89) 20

#???87?Node
set node_(90) [$ns node]
$node_(90) set X_ 437
$node_(90) set Y_ 150
$ns initial_node_pos $node_(90) 20

#???88?Node
set node_(91) [$ns node]
$node_(91) set X_ 802
$node_(91) set Y_ 781
$ns initial_node_pos $node_(91) 20

#???89?Node
set node_(92) [$ns node]
$node_(92) set X_ 225
$node_(92) set Y_ 785
$ns initial_node_pos $node_(92) 20

#???90?Node
set node_(93) [$ns node]
$node_(93) set X_ 907
$node_(93) set Y_ 451
$ns initial_node_pos $node_(93) 20

#???91?Node
set node_(94) [$ns node]
$node_(94) set X_ 913
$node_(94) set Y_ 188
$ns initial_node_pos $node_(94) 20

#???92?Node
set node_(95) [$ns node]
$node_(95) set X_ 197
$node_(95) set Y_ 645
$ns initial_node_pos $node_(95) 20

#???93?Node
set node_(96) [$ns node]
$node_(96) set X_ 173
$node_(96) set Y_ 198
$ns initial_node_pos $node_(96) 20

#???94?Node
set node_(97) [$ns node]
$node_(97) set X_ 655
$node_(97) set Y_ 811
$ns initial_node_pos $node_(97) 20

#???95?Node
set node_(98) [$ns node]
$node_(98) set X_ 4
$node_(98) set Y_ 921
$ns initial_node_pos $node_(98) 20

#???96?Node
set node_(99) [$ns node]
$node_(99) set X_ 361
$node_(99) set Y_ 500
$ns initial_node_pos $node_(99) 20

#???97?Node
set node_(100) [$ns node]
$node_(100) set X_ 196
$node_(100) set Y_ 568
$ns initial_node_pos $node_(100) 20

#???98?Node
set node_(101) [$ns node]
$node_(101) set X_ 451
$node_(101) set Y_ 655
$ns initial_node_pos $node_(101) 20

#???99?Node
set node_(102) [$ns node]
$node_(102) set X_ 307
$node_(102) set Y_ 43
$ns initial_node_pos $node_(102) 20

#???100?Node
set node_(103) [$ns node]
$node_(103) set X_ 170
$node_(103) set Y_ 503
$ns initial_node_pos $node_(103) 20

#???101?Node
set node_(104) [$ns node]
$node_(104) set X_ 361
$node_(104) set Y_ 11
$ns initial_node_pos $node_(104) 20

#???102?Node
set node_(105) [$ns node]
$node_(105) set X_ 120
$node_(105) set Y_ 116
$ns initial_node_pos $node_(105) 20

#???103?Node
set node_(106) [$ns node]
$node_(106) set X_ 317
$node_(106) set Y_ 986
$ns initial_node_pos $node_(106) 20

#???104?Node
set node_(107) [$ns node]
$node_(107) set X_ 279
$node_(107) set Y_ 951
$ns initial_node_pos $node_(107) 20

#???105?Node
set node_(108) [$ns node]
$node_(108) set X_ 294
$node_(108) set Y_ 546
$ns initial_node_pos $node_(108) 20

#???106?Node
set node_(109) [$ns node]
$node_(109) set X_ 346
$node_(109) set Y_ 824
$ns initial_node_pos $node_(109) 20

#???107?Node
set node_(110) [$ns node]
$node_(110) set X_ 149
$node_(110) set Y_ 767
$ns initial_node_pos $node_(110) 20

#???108?Node
set node_(111) [$ns node]
$node_(111) set X_ 93
$node_(111) set Y_ 935
$ns initial_node_pos $node_(111) 20

#???109?Node
set node_(112) [$ns node]
$node_(112) set X_ 589
$node_(112) set Y_ 976
$ns initial_node_pos $node_(112) 20

#???110?Node
set node_(113) [$ns node]
$node_(113) set X_ 205
$node_(113) set Y_ 151
$ns initial_node_pos $node_(113) 20

#???111?Node
set node_(114) [$ns node]
$node_(114) set X_ 492
$node_(114) set Y_ 135
$ns initial_node_pos $node_(114) 20

#???112?Node
set node_(115) [$ns node]
$node_(115) set X_ 860
$node_(115) set Y_ 324
$ns initial_node_pos $node_(115) 20

#???113?Node
set node_(116) [$ns node]
$node_(116) set X_ 413
$node_(116) set Y_ 40
$ns initial_node_pos $node_(116) 20

#???114?Node
set node_(117) [$ns node]
$node_(117) set X_ 555
$node_(117) set Y_ 361
$ns initial_node_pos $node_(117) 20

#???115?Node
set node_(118) [$ns node]
$node_(118) set X_ 743
$node_(118) set Y_ 309
$ns initial_node_pos $node_(118) 20

#???116?Node
set node_(119) [$ns node]
$node_(119) set X_ 638
$node_(119) set Y_ 424
$ns initial_node_pos $node_(119) 20

#???117?Node
set node_(120) [$ns node]
$node_(120) set X_ 803
$node_(120) set Y_ 355
$ns initial_node_pos $node_(120) 20

#???118?Node
set node_(121) [$ns node]
$node_(121) set X_ 265
$node_(121) set Y_ 572
$ns initial_node_pos $node_(121) 20

#???119?Node
set node_(122) [$ns node]
$node_(122) set X_ 710
$node_(122) set Y_ 988
$ns initial_node_pos $node_(122) 20

#???120?Node
set node_(123) [$ns node]
$node_(123) set X_ 229
$node_(123) set Y_ 400
$ns initial_node_pos $node_(123) 20

#???121?Node
set node_(124) [$ns node]
$node_(124) set X_ 513
$node_(124) set Y_ 828
$ns initial_node_pos $node_(124) 20

#???122?Node
set node_(125) [$ns node]
$node_(125) set X_ 633
$node_(125) set Y_ 625
$ns initial_node_pos $node_(125) 20

#???123?Node
set node_(127) [$ns node]
$node_(127) set X_ 176
$node_(127) set Y_ 176
$ns initial_node_pos $node_(127) 20

#???124?Node
set node_(128) [$ns node]
$node_(128) set X_ 512
$node_(128) set Y_ 335
$ns initial_node_pos $node_(128) 20

#???125?Node
set node_(129) [$ns node]
$node_(129) set X_ 147
$node_(129) set Y_ 676
$ns initial_node_pos $node_(129) 20

#???126?Node
set node_(130) [$ns node]
$node_(130) set X_ 28
$node_(130) set Y_ 762
$ns initial_node_pos $node_(130) 20

#???127?Node
set node_(131) [$ns node]
$node_(131) set X_ 743
$node_(131) set Y_ 605
$ns initial_node_pos $node_(131) 20

#???128?Node
set node_(132) [$ns node]
$node_(132) set X_ 643
$node_(132) set Y_ 312
$ns initial_node_pos $node_(132) 20

#???129?Node
set node_(133) [$ns node]
$node_(133) set X_ 838
$node_(133) set Y_ 607
$ns initial_node_pos $node_(133) 20

#???130?Node
set node_(134) [$ns node]
$node_(134) set X_ 587
$node_(134) set Y_ 24
$ns initial_node_pos $node_(134) 20

#???131?Node
set node_(135) [$ns node]
$node_(135) set X_ 668
$node_(135) set Y_ 3
$ns initial_node_pos $node_(135) 20

#???132?Node
set node_(136) [$ns node]
$node_(136) set X_ 589
$node_(136) set Y_ 195
$ns initial_node_pos $node_(136) 20

#???133?Node
set node_(137) [$ns node]
$node_(137) set X_ 408
$node_(137) set Y_ 949
$ns initial_node_pos $node_(137) 20

#???134?Node
set node_(138) [$ns node]
$node_(138) set X_ 122
$node_(138) set Y_ 863
$ns initial_node_pos $node_(138) 20

#???135?Node
set node_(139) [$ns node]
$node_(139) set X_ 631
$node_(139) set Y_ 385
$ns initial_node_pos $node_(139) 20

#???136?Node
set node_(140) [$ns node]
$node_(140) set X_ 746
$node_(140) set Y_ 761
$ns initial_node_pos $node_(140) 20

#???137?Node
set node_(141) [$ns node]
$node_(141) set X_ 850
$node_(141) set Y_ 512
$ns initial_node_pos $node_(141) 20

#???138?Node
set node_(142) [$ns node]
$node_(142) set X_ 348
$node_(142) set Y_ 881
$ns initial_node_pos $node_(142) 20

#???139?Node
set node_(143) [$ns node]
$node_(143) set X_ 202
$node_(143) set Y_ 868
$ns initial_node_pos $node_(143) 20

#???140?Node
set node_(144) [$ns node]
$node_(144) set X_ 644
$node_(144) set Y_ 933
$ns initial_node_pos $node_(144) 20

#???141?Node
set node_(145) [$ns node]
$node_(145) set X_ 33
$node_(145) set Y_ 581
$ns initial_node_pos $node_(145) 20

#???142?Node
set node_(146) [$ns node]
$node_(146) set X_ 714
$node_(146) set Y_ 643
$ns initial_node_pos $node_(146) 20

#???143?Node
set node_(147) [$ns node]
$node_(147) set X_ 503
$node_(147) set Y_ 501
$ns initial_node_pos $node_(147) 20

#???144?Node
set node_(148) [$ns node]
$node_(148) set X_ 935
$node_(148) set Y_ 353
$ns initial_node_pos $node_(148) 20

#???145?Node
set node_(149) [$ns node]
$node_(149) set X_ 761
$node_(149) set Y_ 92
$ns initial_node_pos $node_(149) 20

#???146?Node
set node_(150) [$ns node]
$node_(150) set X_ 199
$node_(150) set Y_ 621
$ns initial_node_pos $node_(150) 20

#???147?Node
set node_(151) [$ns node]
$node_(151) set X_ 622
$node_(151) set Y_ 718
$ns initial_node_pos $node_(151) 20

#???148?Node
set node_(152) [$ns node]
$node_(152) set X_ 522
$node_(152) set Y_ 285
$ns initial_node_pos $node_(152) 20

#???149?Node
set node_(153) [$ns node]
$node_(153) set X_ 105
$node_(153) set Y_ 29
$ns initial_node_pos $node_(153) 20

#???150?Node
set node_(154) [$ns node]
$node_(154) set X_ 33
$node_(154) set Y_ 152
$ns initial_node_pos $node_(154) 20

#???151?Node
set node_(155) [$ns node]
$node_(155) set X_ 592
$node_(155) set Y_ 662
$ns initial_node_pos $node_(155) 20

#???152?Node
set node_(156) [$ns node]
$node_(156) set X_ 791
$node_(156) set Y_ 307
$ns initial_node_pos $node_(156) 20

#???153?Node
set node_(157) [$ns node]
$node_(157) set X_ 720
$node_(157) set Y_ 530
$ns initial_node_pos $node_(157) 20

#???154?Node
set node_(158) [$ns node]
$node_(158) set X_ 612
$node_(158) set Y_ 326
$ns initial_node_pos $node_(158) 20

#???155?Node
set node_(159) [$ns node]
$node_(159) set X_ 113
$node_(159) set Y_ 351
$ns initial_node_pos $node_(159) 20

#???156?Node
set node_(160) [$ns node]
$node_(160) set X_ 572
$node_(160) set Y_ 899
$ns initial_node_pos $node_(160) 20

#???157?Node
set node_(161) [$ns node]
$node_(161) set X_ 90
$node_(161) set Y_ 587
$ns initial_node_pos $node_(161) 20

#???158?Node
set node_(162) [$ns node]
$node_(162) set X_ 879
$node_(162) set Y_ 931
$ns initial_node_pos $node_(162) 20

#???159?Node
set node_(163) [$ns node]
$node_(163) set X_ 573
$node_(163) set Y_ 754
$ns initial_node_pos $node_(163) 20

#???160?Node
set node_(164) [$ns node]
$node_(164) set X_ 842
$node_(164) set Y_ 755
$ns initial_node_pos $node_(164) 20

#???161?Node
set node_(165) [$ns node]
$node_(165) set X_ 829
$node_(165) set Y_ 932
$ns initial_node_pos $node_(165) 20

#???162?Node
set node_(166) [$ns node]
$node_(166) set X_ 312
$node_(166) set Y_ 353
$ns initial_node_pos $node_(166) 20

#???163?Node
set node_(167) [$ns node]
$node_(167) set X_ 88
$node_(167) set Y_ 270
$ns initial_node_pos $node_(167) 20

#???164?Node
set node_(168) [$ns node]
$node_(168) set X_ 890
$node_(168) set Y_ 760
$ns initial_node_pos $node_(168) 20

#???165?Node
set node_(169) [$ns node]
$node_(169) set X_ 215
$node_(169) set Y_ 920
$ns initial_node_pos $node_(169) 20

#???166?Node
set node_(170) [$ns node]
$node_(170) set X_ 811
$node_(170) set Y_ 448
$ns initial_node_pos $node_(170) 20

#???167?Node
set node_(171) [$ns node]
$node_(171) set X_ 738
$node_(171) set Y_ 170
$ns initial_node_pos $node_(171) 20

#???168?Node
set node_(172) [$ns node]
$node_(172) set X_ 698
$node_(172) set Y_ 931
$ns initial_node_pos $node_(172) 20

#???169?Node
set node_(173) [$ns node]
$node_(173) set X_ 456
$node_(173) set Y_ 357
$ns initial_node_pos $node_(173) 20

#???170?Node
set node_(174) [$ns node]
$node_(174) set X_ 504
$node_(174) set Y_ 573
$ns initial_node_pos $node_(174) 20

#???171?Node
set node_(175) [$ns node]
$node_(175) set X_ 49
$node_(175) set Y_ 501
$ns initial_node_pos $node_(175) 20

#???172?Node
set node_(176) [$ns node]
$node_(176) set X_ 110
$node_(176) set Y_ 908
$ns initial_node_pos $node_(176) 20

#???173?Node
set node_(177) [$ns node]
$node_(177) set X_ 93
$node_(177) set Y_ 763
$ns initial_node_pos $node_(177) 20

#???174?Node
set node_(178) [$ns node]
$node_(178) set X_ 563
$node_(178) set Y_ 547
$ns initial_node_pos $node_(178) 20

#???175?Node
set node_(179) [$ns node]
$node_(179) set X_ 477
$node_(179) set Y_ 61
$ns initial_node_pos $node_(179) 20

#???176?Node
set node_(180) [$ns node]
$node_(180) set X_ 772
$node_(180) set Y_ 929
$ns initial_node_pos $node_(180) 20

#???177?Node
set node_(181) [$ns node]
$node_(181) set X_ 777
$node_(181) set Y_ 868
$ns initial_node_pos $node_(181) 20

#???178?Node
set node_(182) [$ns node]
$node_(182) set X_ 681
$node_(182) set Y_ 762
$ns initial_node_pos $node_(182) 20

#???179?Node
set node_(183) [$ns node]
$node_(183) set X_ 664
$node_(183) set Y_ 507
$ns initial_node_pos $node_(183) 20

#???180?Node
set node_(184) [$ns node]
$node_(184) set X_ 694
$node_(184) set Y_ 853
$ns initial_node_pos $node_(184) 20

#???181?Node
set node_(185) [$ns node]
$node_(185) set X_ 279
$node_(185) set Y_ 801
$ns initial_node_pos $node_(185) 20

#???182?Node
set node_(186) [$ns node]
$node_(186) set X_ 468
$node_(186) set Y_ 728
$ns initial_node_pos $node_(186) 20

#???183?Node
set node_(187) [$ns node]
$node_(187) set X_ 894
$node_(187) set Y_ 432
$ns initial_node_pos $node_(187) 20

#???184?Node
set node_(188) [$ns node]
$node_(188) set X_ 833
$node_(188) set Y_ 229
$ns initial_node_pos $node_(188) 20

#???185?Node
set node_(189) [$ns node]
$node_(189) set X_ 231
$node_(189) set Y_ 598
$ns initial_node_pos $node_(189) 20

#???186?Node
set node_(190) [$ns node]
$node_(190) set X_ 448
$node_(190) set Y_ 485
$ns initial_node_pos $node_(190) 20

#???187?Node
set node_(191) [$ns node]
$node_(191) set X_ 58
$node_(191) set Y_ 724
$ns initial_node_pos $node_(191) 20

#???188?Node
set node_(192) [$ns node]
$node_(192) set X_ 808
$node_(192) set Y_ 518
$ns initial_node_pos $node_(192) 20

#???189?Node
set node_(193) [$ns node]
$node_(193) set X_ 740
$node_(193) set Y_ 530
$ns initial_node_pos $node_(193) 20

#???190?Node
set node_(194) [$ns node]
$node_(194) set X_ 212
$node_(194) set Y_ 263
$ns initial_node_pos $node_(194) 20

#???191?Node
set node_(195) [$ns node]
$node_(195) set X_ 781
$node_(195) set Y_ 705
$ns initial_node_pos $node_(195) 20

#???192?Node
set node_(197) [$ns node]
$node_(197) set X_ 179
$node_(197) set Y_ 924
$ns initial_node_pos $node_(197) 20

#???193?Node
set node_(198) [$ns node]
$node_(198) set X_ 676
$node_(198) set Y_ 106
$ns initial_node_pos $node_(198) 20

#???194?Node
set node_(199) [$ns node]
$node_(199) set X_ 342
$node_(199) set Y_ 289
$ns initial_node_pos $node_(199) 20

#???195?Node
set node_(200) [$ns node]
$node_(200) set X_ 533
$node_(200) set Y_ 600
$ns initial_node_pos $node_(200) 20

#???196?Node
set node_(201) [$ns node]
$node_(201) set X_ 287
$node_(201) set Y_ 661
$ns initial_node_pos $node_(201) 20

#???197?Node
set node_(202) [$ns node]
$node_(202) set X_ 374
$node_(202) set Y_ 751
$ns initial_node_pos $node_(202) 20

#???198?Node
set node_(203) [$ns node]
$node_(203) set X_ 55
$node_(203) set Y_ 723
$ns initial_node_pos $node_(203) 20

#===================================
#             ??Movement           
#===================================
set tz [lindex $argv 3]
$ns at 10.0 " $node_(1) setdest 444.0 929.0 $tz " 
$ns at 10.0 " $node_(2) setdest 98.0 553.0 $tz " 
$ns at 10.0 " $node_(6) setdest 733.0 818.0 $tz " 
$ns at 10.0 " $node_(9) setdest 18.0 359.0 $tz " 
$ns at 10.0 " $node_(14) setdest 96.0 881.0 $tz " 
$ns at 10.0 " $node_(24) setdest 401.0 96.0 $tz " 
$ns at 10.0 " $node_(28) setdest 522.0 783.0 $tz " 
$ns at 10.0 " $node_(45) setdest 377.0 931.0 $tz " 
$ns at 10.0 " $node_(47) setdest 53.0 472.0 $tz " 
$ns at 10.0 " $node_(59) setdest 133.0 320.0 $tz " 
$ns at 10.0 " $node_(64) setdest 150.0 644.0 $tz " 
$ns at 10.0 " $node_(114) setdest 253.0 881.0 $tz " 
$ns at 10.0 " $node_(151) setdest 638.0 96.0 $tz " 
$ns at 10.0 " $node_(161) setdest 894.0 49.0 $tz " 
$ns at 10.0 " $node_(164) setdest 750.0 24.0 $tz " 
$ns at 10.0 " $node_(165) setdest 166.0 49.0 $tz " 
$ns at 10.0 " $node_(176) setdest 846.0 164.0 $tz " 
$ns at 10.0 " $node_(179) setdest 883.0 679.0 $tz " 
$ns at 10.0 " $node_(180) setdest 229.0 105.0 $tz " 
$ns at 10.0 " $node_(193) setdest 74.0 764.0 $tz " 
#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(47) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(64) $null0
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