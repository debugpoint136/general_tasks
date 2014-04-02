#!/bin/bash

for i in `ls -1 AxillaryBuds_eSDI3555_24DAP_5pm_R1.txt`;do

	#echo "bsub -q medium -o log/$i.out -e log/$i.err "
		echo "cat $i | sort | uniq > sorted-uniq/$i.uniq.txt" > take_uniq/$i.bsub.cmd
	echo "Queuing $i..."
		sleep 2s
	echo ""
	bsub -q medium -o log/$i.out -e log/$i.err bash take_uniq/$i.bsub.cmd
	echo ""
done
