#!/bin/bash

i=AxillaryBuds_eSDI3555_24DAP_5pm_R1

#	echo "bsub -q medium -o log/$i.out -e log/$i.err "
 		echo "awk '\$1>4{print \$0}' $i.txt.uniq.txt > filter_low_count/$i.txt" > $i.bsub.cmd
	echo "Queuing $i..."
		sleep 1s
	echo ""
	bsub -q medium -o log/$i.out -e log/$i.err bash $i.bsub.cmd
	echo ""

