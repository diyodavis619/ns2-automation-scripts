$#!/bin/bash
#######################################
#                                     #
#   This script was written by DIYO   #
#        Version 1.0                  #
#    Has No Resuming Capabilities     #
#                                     #
#######################################
speed=(10 8 6 4 2)	# changing node speed
pkt_size=(50 100 150 200 250)	# changing CBR packet size
interval=(0.1 0.05 0.033 0.025 0.02)	# changing CBR packet interval
count=1
for file in $( ls *.tcl )
do
	echo -e "No.of nodes:\t" $(ls ${file} | cut -d _ -f 1) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	echo -e "Area:\t" $(ls ${file} | cut -d _ -f 2) "x" $(ls ${file} | cut -d _ -f 2) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	echo -e "Mobility:\t" $(ls ${file} | cut -d _ -f 3 | cut -d . -f 1) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv	
	echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	for spd in "${speed[@]}"
	do
		for pks in "${pkt_size[@]}"
		do
			echo -e "CBR Pkt_size:\t" $pks | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo -e "Node Speed:\t" $spd | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo -e " \t DSDV \t AODV \t AOMDV \t DSR" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			for intv in "${interval[@]}"
			do
				echo $count "of 500 runs"
				echo -ne $intv "\t" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
				# for DSDV protocol
				if ns ${file} DSDV $pks $intv $spd; then
					echo "success on" ${file} DSDV $pks $intv $spd >> success.txt	# record successfull execution
				else echo "failed on" ${file} DSDV $pks $intv $spd >> error.txt		# record unsuccessfull execution
				fi
				awk -f modified_trace.awk out.tr
				# for AODV protocol
				if ns ${file} AODV $pks $intv $spd; then
					echo "success on" ${file} AODV $pks $intv $spd >> success.txt	# record successfull execution
				else echo "failed on" ${file} AODV $pks $intv $spd >> error.txt		# record unsuccessfull execution
				fi
				awk -f modified_trace.awk out.tr 
				# for AOMDV protocol
				if ns ${file} AOMDV $pks $intv $spd; then
					echo "success on" ${file} AOMDV $pks $intv $spd >> success.txt	# record successfull execution
				else echo "failed on" ${file} AOMDV $pks $intv $spd >> error.txt	# record unsuccessfull execution
				fi
				awk -f modified_trace.awk out.tr
				# for DSR protocol
				if ns ${file} DSR $pks $intv $spd; then
					echo "success on" ${file} DSR $pks $intv $spd >> success.txt	# record successfull execution
				else echo "failed on" ${file} DSR $pks $intv $spd >> error.txt		# record unsuccessfull execution
				fi
				awk -f modified_trace.awk out.tr
				echo "" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
				((count++));
			done
			echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			rm out.tr
		done
	done
done