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
#             產生Node              
#===================================

#建立第0個Node
set node_(0) [$ns node]
$node_(0) set X_ 607
$node_(0) set Y_ 155
$ns initial_node_pos $node_(0) 20

#建立第1個Node
set node_(1) [$ns node]
$node_(1) set X_ 929
$node_(1) set Y_ 650
$ns initial_node_pos $node_(1) 20

#建立第2個Node
set node_(2) [$ns node]
$node_(2) set X_ 712
$node_(2) set Y_ 718
$ns initial_node_pos $node_(2) 20

#建立第3個Node
set node_(3) [$ns node]
$node_(3) set X_ 510
$node_(3) set Y_ 927
$ns initial_node_pos $node_(3) 20

#建立第4個Node
set node_(4) [$ns node]
$node_(4) set X_ 861
$node_(4) set Y_ 172
$ns initial_node_pos $node_(4) 20

#建立第5個Node
set node_(5) [$ns node]
$node_(5) set X_ 41
$node_(5) set Y_ 448
$ns initial_node_pos $node_(5) 20

#建立第6個Node
set node_(6) [$ns node]
$node_(6) set X_ 66
$node_(6) set Y_ 269
$ns initial_node_pos $node_(6) 20

#建立第7個Node
set node_(7) [$ns node]
$node_(7) set X_ 932
$node_(7) set Y_ 458
$ns initial_node_pos $node_(7) 20

#建立第8個Node
set node_(8) [$ns node]
$node_(8) set X_ 324
$node_(8) set Y_ 706
$ns initial_node_pos $node_(8) 20

#建立第9個Node
set node_(9) [$ns node]
$node_(9) set X_ 234
$node_(9) set Y_ 437
$ns initial_node_pos $node_(9) 20

#建立第10個Node
set node_(10) [$ns node]
$node_(10) set X_ 690
$node_(10) set Y_ 661
$ns initial_node_pos $node_(10) 20

#建立第11個Node
set node_(11) [$ns node]
$node_(11) set X_ 176
$node_(11) set Y_ 787
$ns initial_node_pos $node_(11) 20

#建立第12個Node
set node_(12) [$ns node]
$node_(12) set X_ 563
$node_(12) set Y_ 60
$ns initial_node_pos $node_(12) 20

#建立第13個Node
set node_(13) [$ns node]
$node_(13) set X_ 29
$node_(13) set Y_ 25
$ns initial_node_pos $node_(13) 20

#建立第14個Node
set node_(14) [$ns node]
$node_(14) set X_ 23
$node_(14) set Y_ 114
$ns initial_node_pos $node_(14) 20

#建立第15個Node
set node_(15) [$ns node]
$node_(15) set X_ 89
$node_(15) set Y_ 850
$ns initial_node_pos $node_(15) 20

#建立第16個Node
set node_(16) [$ns node]
$node_(16) set X_ 416
$node_(16) set Y_ 851
$ns initial_node_pos $node_(16) 20

#建立第17個Node
set node_(17) [$ns node]
$node_(17) set X_ 673
$node_(17) set Y_ 279
$ns initial_node_pos $node_(17) 20

#建立第18個Node
set node_(18) [$ns node]
$node_(18) set X_ 275
$node_(18) set Y_ 873
$ns initial_node_pos $node_(18) 20

#建立第19個Node
set node_(19) [$ns node]
$node_(19) set X_ 185
$node_(19) set Y_ 235
$ns initial_node_pos $node_(19) 20

#建立第20個Node
set node_(20) [$ns node]
$node_(20) set X_ 813
$node_(20) set Y_ 275
$ns initial_node_pos $node_(20) 20

#建立第21個Node
set node_(21) [$ns node]
$node_(21) set X_ 208
$node_(21) set Y_ 633
$ns initial_node_pos $node_(21) 20

#建立第22個Node
set node_(22) [$ns node]
$node_(22) set X_ 488
$node_(22) set Y_ 182
$ns initial_node_pos $node_(22) 20

#建立第23個Node
set node_(23) [$ns node]
$node_(23) set X_ 645
$node_(23) set Y_ 407
$ns initial_node_pos $node_(23) 20

#建立第24個Node
set node_(24) [$ns node]
$node_(24) set X_ 901
$node_(24) set Y_ 841
$ns initial_node_pos $node_(24) 20

#建立第25個Node
set node_(25) [$ns node]
$node_(25) set X_ 20
$node_(25) set Y_ 564
$ns initial_node_pos $node_(25) 20

#建立第26個Node
set node_(26) [$ns node]
$node_(26) set X_ 580
$node_(26) set Y_ 655
$ns initial_node_pos $node_(26) 20

#建立第27個Node
set node_(27) [$ns node]
$node_(27) set X_ 386
$node_(27) set Y_ 385
$ns initial_node_pos $node_(27) 20

#建立第28個Node
set node_(28) [$ns node]
$node_(28) set X_ 770
$node_(28) set Y_ 563
$ns initial_node_pos $node_(28) 20

#建立第29個Node
set node_(29) [$ns node]
$node_(29) set X_ 642
$node_(29) set Y_ 585
$ns initial_node_pos $node_(29) 20

#建立第30個Node
set node_(30) [$ns node]
$node_(30) set X_ 669
$node_(30) set Y_ 948
$ns initial_node_pos $node_(30) 20

#建立第31個Node
set node_(31) [$ns node]
$node_(31) set X_ 367
$node_(31) set Y_ 950
$ns initial_node_pos $node_(31) 20

#建立第32個Node
set node_(32) [$ns node]
$node_(32) set X_ 569
$node_(32) set Y_ 333
$ns initial_node_pos $node_(32) 20

#建立第33個Node
set node_(33) [$ns node]
$node_(33) set X_ 267
$node_(33) set Y_ 167
$ns initial_node_pos $node_(33) 20

#建立第34個Node
set node_(34) [$ns node]
$node_(34) set X_ 402
$node_(34) set Y_ 476
$ns initial_node_pos $node_(34) 20

#建立第35個Node
set node_(35) [$ns node]
$node_(35) set X_ 185
$node_(35) set Y_ 948
$ns initial_node_pos $node_(35) 20

#建立第36個Node
set node_(36) [$ns node]
$node_(36) set X_ 744
$node_(36) set Y_ 158
$ns initial_node_pos $node_(36) 20

#建立第37個Node
set node_(37) [$ns node]
$node_(37) set X_ 148
$node_(37) set Y_ 138
$ns initial_node_pos $node_(37) 20

#建立第38個Node
set node_(38) [$ns node]
$node_(38) set X_ 113
$node_(38) set Y_ 44
$ns initial_node_pos $node_(38) 20

#建立第39個Node
set node_(39) [$ns node]
$node_(39) set X_ 439
$node_(39) set Y_ 661
$ns initial_node_pos $node_(39) 20

#建立第40個Node
set node_(40) [$ns node]
$node_(40) set X_ 561
$node_(40) set Y_ 836
$ns initial_node_pos $node_(40) 20

#建立第41個Node
set node_(41) [$ns node]
$node_(41) set X_ 911
$node_(41) set Y_ 966
$ns initial_node_pos $node_(41) 20

#建立第42個Node
set node_(42) [$ns node]
$node_(42) set X_ 33
$node_(42) set Y_ 652
$ns initial_node_pos $node_(42) 20

#建立第43個Node
set node_(43) [$ns node]
$node_(43) set X_ 69
$node_(43) set Y_ 179
$ns initial_node_pos $node_(43) 20

#建立第44個Node
set node_(44) [$ns node]
$node_(44) set X_ 798
$node_(44) set Y_ 644
$ns initial_node_pos $node_(44) 20

#建立第45個Node
set node_(45) [$ns node]
$node_(45) set X_ 68
$node_(45) set Y_ 362
$ns initial_node_pos $node_(45) 20

#建立第46個Node
set node_(46) [$ns node]
$node_(46) set X_ 936
$node_(46) set Y_ 236
$ns initial_node_pos $node_(46) 20

#建立第47個Node
set node_(47) [$ns node]
$node_(47) set X_ 913
$node_(47) set Y_ 567
$ns initial_node_pos $node_(47) 20

#建立第48個Node
set node_(48) [$ns node]
$node_(48) set X_ 680
$node_(48) set Y_ 505
$ns initial_node_pos $node_(48) 20

#建立第49個Node
set node_(49) [$ns node]
$node_(49) set X_ 389
$node_(49) set Y_ 564
$ns initial_node_pos $node_(49) 20

#建立第50個Node
set node_(50) [$ns node]
$node_(50) set X_ 320
$node_(50) set Y_ 611
$ns initial_node_pos $node_(50) 20

#建立第51個Node
set node_(51) [$ns node]
$node_(51) set X_ 172
$node_(51) set Y_ 333
$ns initial_node_pos $node_(51) 20

#建立第52個Node
set node_(52) [$ns node]
$node_(52) set X_ 304
$node_(52) set Y_ 362
$ns initial_node_pos $node_(52) 20

#建立第53個Node
set node_(53) [$ns node]
$node_(53) set X_ 760
$node_(53) set Y_ 44
$ns initial_node_pos $node_(53) 20

#建立第54個Node
set node_(54) [$ns node]
$node_(54) set X_ 48
$node_(54) set Y_ 957
$ns initial_node_pos $node_(54) 20

#建立第55個Node
set node_(55) [$ns node]
$node_(55) set X_ 294
$node_(55) set Y_ 269
$ns initial_node_pos $node_(55) 20

#建立第56個Node
set node_(56) [$ns node]
$node_(56) set X_ 130
$node_(56) set Y_ 547
$ns initial_node_pos $node_(56) 20

#建立第57個Node
set node_(57) [$ns node]
$node_(57) set X_ 926
$node_(57) set Y_ 94
$ns initial_node_pos $node_(57) 20

#建立第58個Node
set node_(58) [$ns node]
$node_(58) set X_ 110
$node_(58) set Y_ 476
$ns initial_node_pos $node_(58) 20

#建立第59個Node
set node_(59) [$ns node]
$node_(59) set X_ 789
$node_(59) set Y_ 875
$ns initial_node_pos $node_(59) 20

#建立第60個Node
set node_(60) [$ns node]
$node_(60) set X_ 761
$node_(60) set Y_ 375
$ns initial_node_pos $node_(60) 20

#建立第61個Node
set node_(61) [$ns node]
$node_(61) set X_ 967
$node_(61) set Y_ 334
$ns initial_node_pos $node_(61) 20

#建立第62個Node
set node_(62) [$ns node]
$node_(62) set X_ 50
$node_(62) set Y_ 758
$ns initial_node_pos $node_(62) 20

#建立第63個Node
set node_(63) [$ns node]
$node_(63) set X_ 316
$node_(63) set Y_ 776
$ns initial_node_pos $node_(63) 20

#建立第64個Node
set node_(64) [$ns node]
$node_(64) set X_ 760
$node_(64) set Y_ 450
$ns initial_node_pos $node_(64) 20

#建立第65個Node
set node_(65) [$ns node]
$node_(65) set X_ 508
$node_(65) set Y_ 401
$ns initial_node_pos $node_(65) 20

#建立第66個Node
set node_(66) [$ns node]
$node_(66) set X_ 376
$node_(66) set Y_ 105
$ns initial_node_pos $node_(66) 20

#建立第67個Node
set node_(67) [$ns node]
$node_(67) set X_ 854
$node_(67) set Y_ 491
$ns initial_node_pos $node_(67) 20

#建立第68個Node
set node_(68) [$ns node]
$node_(68) set X_ 241
$node_(68) set Y_ 60
$ns initial_node_pos $node_(68) 20

#建立第69個Node
set node_(69) [$ns node]
$node_(69) set X_ 673
$node_(69) set Y_ 805
$ns initial_node_pos $node_(69) 20

#建立第70個Node
set node_(70) [$ns node]
$node_(70) set X_ 445
$node_(70) set Y_ 747
$ns initial_node_pos $node_(70) 20

#建立第71個Node
set node_(71) [$ns node]
$node_(71) set X_ 935
$node_(71) set Y_ 766
$ns initial_node_pos $node_(71) 20

#建立第72個Node
set node_(72) [$ns node]
$node_(72) set X_ 919
$node_(72) set Y_ 397
$ns initial_node_pos $node_(72) 20

#建立第73個Node
set node_(73) [$ns node]
$node_(73) set X_ 476
$node_(73) set Y_ 550
$ns initial_node_pos $node_(73) 20

#建立第74個Node
set node_(74) [$ns node]
$node_(74) set X_ 558
$node_(74) set Y_ 744
$ns initial_node_pos $node_(74) 20

#建立第75個Node
set node_(75) [$ns node]
$node_(75) set X_ 448
$node_(75) set Y_ 277
$ns initial_node_pos $node_(75) 20

#建立第76個Node
set node_(76) [$ns node]
$node_(76) set X_ 267
$node_(76) set Y_ 522
$ns initial_node_pos $node_(76) 20

#建立第77個Node
set node_(77) [$ns node]
$node_(77) set X_ 797
$node_(77) set Y_ 746
$ns initial_node_pos $node_(77) 20

#建立第78個Node
set node_(78) [$ns node]
$node_(78) set X_ 550
$node_(78) set Y_ 477
$ns initial_node_pos $node_(78) 20

#建立第79個Node
set node_(79) [$ns node]
$node_(79) set X_ 125
$node_(79) set Y_ 695
$ns initial_node_pos $node_(79) 20

#===================================
#             產生Movement           
#===================================
set tz [lindex $argv 3]
# for 50% mobility i.e 40 nodes
$ns at 10.0 " $node_(2) setdest 295.0 454.0 $tz " 
$ns at 10.0 " $node_(3) setdest 614.0 36.0 $tz " 
$ns at 10.0 " $node_(4) setdest 969.0 416.0 $tz " 
$ns at 10.0 " $node_(7) setdest 225.0 375.0 $tz " 
$ns at 10.0 " $node_(8) setdest 619.0 891.0 $tz " 
$ns at 10.0 " $node_(9) setdest 122.0 641.0 $tz " 
$ns at 10.0 " $node_(10) setdest 879.0 316.0 $tz " 
$ns at 10.0 " $node_(16) setdest 75.0 595.0 $tz " 
$ns at 10.0 " $node_(17) setdest 63.0 88.0 $tz " 
$ns at 10.0 " $node_(19) setdest 667.0 226.0 $tz " 
$ns at 10.0 " $node_(20) setdest 133.0 201.0 $tz " 
$ns at 10.0 " $node_(26) setdest 433.0 50.0 $tz " 
$ns at 10.0 " $node_(27) setdest 870.0 694.0 $tz " 
$ns at 10.0 " $node_(28) setdest 701.0 779.0 $tz " 
$ns at 10.0 " $node_(29) setdest 326.0 39.0 $tz " 
$ns at 10.0 " $node_(35) setdest 800.0 950.0 $tz " 
$ns at 10.0 " $node_(36) setdest 719.0 880.0 $tz " 
$ns at 10.0 " $node_(37) setdest 817.0 85.0 $tz " 
$ns at 10.0 " $node_(39) setdest 685.0 51.0 $tz " 
$ns at 10.0 " $node_(40) setdest 773.0 369.0 $tz " 
$ns at 10.0 " $node_(43) setdest 236.0 704.0 $tz " 
$ns at 10.0 " $node_(47) setdest 838.0 851.0 $tz " 
$ns at 10.0 " $node_(48) setdest 948.0 898.0 $tz " 
$ns at 10.0 " $node_(49) setdest 513.0 36.0 $tz " 
$ns at 10.0 " $node_(50) setdest 398.0 195.0 $tz " 
$ns at 10.0 " $node_(51) setdest 930.0 41.0 $tz " 
$ns at 10.0 " $node_(52) setdest 601.0 766.0 $tz " 
$ns at 10.0 " $node_(55) setdest 4.0 385.0 $tz " 
$ns at 10.0 " $node_(60) setdest 948.0 539.0 $tz " 
$ns at 10.0 " $node_(62) setdest 791.0 225.0 $tz " 
$ns at 10.0 " $node_(64) setdest 492.0 480.0 $tz " 
$ns at 10.0 " $node_(68) setdest 391.0 325.0 $tz " 
$ns at 10.0 " $node_(69) setdest 963.0 975.0 $tz " 
$ns at 10.0 " $node_(70) setdest 661.0 351.0 $tz " 
$ns at 10.0 " $node_(73) setdest 185.0 885.0 $tz " 
$ns at 10.0 " $node_(74) setdest 552.0 252.0 $tz " 
$ns at 10.0 " $node_(75) setdest 502.0 742.0 $tz " 
$ns at 10.0 " $node_(76) setdest 111.0 952.0 $tz " 
$ns at 10.0 " $node_(77) setdest 927.0 185.0 $tz " 
$ns at 10.0 " $node_(78) setdest 354.0 620.0 $tz " 

#===================================
#        Agents Definition        
#===================================
set udp0 [new Agent/UDP]
$ns attach-agent $node_(7) $udp0
$udp0 set packetSize_ 1500

set null0 [new Agent/Null]
$ns attach-agent $node_(52) $null0
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