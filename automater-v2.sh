#!/bin/bash
#######################################
#                                     #
#   This script was written by DIYO   #
#        Version 2.0                  #
#    Has Resuming Capabilities        #
#                                     #
#######################################
files=(*.tcl)	# get all .tcl files in dir to array
speed=(10 8 6 4 2)	# changing node speed
pkt_size=(50 100 150 200 250)	# changing CBR packet size
interval=(0.1 0.05 0.033 0.025 0.02)	# changing CBR packet interval
flag=0;		# helps to tell which protocol was previously running
# check if log file is present so as to retain previous state
if ls log.txt; then
	echo "log file found"
	count=$(tail -n 1 log.txt | cut -d " " -f 1);
	v_fil=$(tail -n 1 log.txt | cut -d " " -f 4);
	prot=$(tail -n 1 log.txt | cut -d " " -f 5);
	v_pks=$(tail -n 1 log.txt | cut -d " " -f 6);
	v_intv=$(tail -n 1 log.txt | cut -d " " -f 7);
	v_spd=$(tail -n 1 log.txt | cut -d " " -f 8);
	# find index for file
	for i in "${!files[@]}"; do
	   if [[ "${files[$i]}" = "${v_fil}" ]]; then
	       	v_fil=$i;
	       	break;
	   fi
	done
	# find index for speed
	for i in "${!speed[@]}"; do
	   if [[ "${speed[$i]}" = "${v_spd}" ]]; then
	       	v_spd=$i;
	       	break;
	   fi
	done
	# find index for pkt_size
	for i in "${!pkt_size[@]}"; do
	   if [[ "${pkt_size[$i]}" = "${v_pks}" ]]; then
	       	v_pks=$i;
	       	break;
	   fi
	done
	# find index for interval
	for i in "${!interval[@]}"; do
	   if [[ "${interval[$i]}" = "${v_intv}" ]]; then
	       	v_intv=$i;
	       	break;
	   fi
	done
	# find protocol
	if [[ $prot = "ZRP" ]]
	then
	    flag=0;
	else
    	flag=1;
	fi
else
	v_fil=0;
	v_intv=0;
	v_spd=0;
	v_pks=0;
	count=1;
fi
# common section of code
for((fil=v_fil;fil<3;fil++))
do
	fn=${files[$fil]};
	echo -e "\n\nNo.of nodes:\t" $(ls ${fn} | cut -d _ -f 1) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	echo -e "Area:\t" $(ls ${fn} | cut -d _ -f 2) "x" $(ls ${fn} | cut -d _ -f 2) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	echo -e "Mobility:\t" $(ls ${fn} | cut -d _ -f 3 | cut -d . -f 1) | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv	
	echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
	for((spd=$v_spd;spd<5;spd++))
	do
		v_spd=0;
		spdn=${speed[$spd]};
		for((pks=$v_pks;pks<5;pks++))
		do
			v_pks=0;
			pksn=${pkt_size[$pks]};
			echo -e "CBR Pkt_size:\t" $pksn | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo -e "Node Speed:\t" $spdn | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			echo -e " \t ZRP \t OLSR" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			for((intv=$v_intv;intv<5;intv++))
			do
				v_intv=0;
				intvn=${interval[$intv]};
				if [[ $flag = 0 ]]; then
					echo $count "of 375 runs"
					echo -ne $intvn "\t" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
					# for ZRP protocol
					echo "$count running on $fn ZRP $pksn $intvn $spdn" >> log.txt	# write to log ie save state
					if ../ns-olsr-zrp ${fn} ZRP $pksn $intvn $spdn; then
						echo "success on" ${fn} ZRP $pksn $intvn $spdn >> success.txt	# record successfull execution
					else echo "failed on" ${fn} ZRP $pksn $intvn $spdn >> error.txt	# record unsuccessfull execution
					fi
					awk -f modified_trace.awk out.tr
					# for OLSR protocol
					echo "$count running on $fn OLSR $pksn $intvn $spdn" >> log.txt	# write to log ie save state
					if ../ns-olsr-zrp ${fn} OLSR $pksn $intvn $spdn; then
						echo "success on" ${fn} OLSR $pksn $intvn $spdn >> success.txt	# record successfull execution
					else echo "failed on" ${fn} OLSR $pksn $intvn $spdn >> error.txt	# record unsuccessfull execution
					fi
					awk -f modified_trace.awk out.tr 
					echo "" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
					((count++));
				else
					# for OLSR protocol
					echo "$count running on $fn OLSR $pksn $intvn $spdn" >> log.txt
					if ../ns-olsr-zrp ${fn} OLSR $pksn $intvn $spdn; then
						echo "success on" ${fn} OLSR $pksn $intvn $spdn >> success.txt
					else echo "failed on" ${fn} OLSR $pksn $intvn $spdn >> error.txt
					fi
					awk -f modified_trace.awk out.tr 
					echo "" | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv					
					((count++));
					flag=0;
				fi
			done
			echo " " | tee -a Throughput.csv Delay.csv PDR.csv NRO.csv Jitter.csv
			rm out.tr
		done
	done
done