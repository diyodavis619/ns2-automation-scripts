# automation-scripts
A set of bash scripts (automater) written to automate my projects mundane tasks.

These scripts were written to automate tasks which would have required days if not weeks if it were to be done manually.

To give a glimpse of what these scripts does, it executes a program named ns2 on various .tcl files in the current directory. 
The files needed to be executed with changing parameters like node speed, packet interval, packet size, etc. These scripts does all that accordingly. 
Furthermore, for each iteration the generated trace files need to be analyzed so as to get meaningful insights like Throughput, Jitter, Delay, etc. and these generated outputs need to be stored to a spreadsheet file for comparision purposes later. The scripts even does this part and outputs the results in a tabular format to various csv files.

The difference between v1 and v2 is that v1 cannot continue if the script was stopped midway while v2 saves checkpoints during each iteration and can thus continue from where it left off.
