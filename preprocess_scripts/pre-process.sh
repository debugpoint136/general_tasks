#!/bin/bash



	#echo "bsub -q medium -o log/$i.out -e log/$i.err "
	echo "awk -F, '\$3<27{print \$2\"\t\"\$4}' AxillaryBuds_eSDI3555_24DAP_5pm_R1.genome.perfmatch.bam.reads.collapsed.fa.csv > reqd_info/$i.txt" > AxillaryBuds_eSDI3555_24DAP_5pm_R1.bsub.cmd
	echo "Queuing AxillaryBuds_eSDI3555_24DAP_5pm_R1..."
	echo ""
	bsub -q medium -o log/AxillaryBuds_eSDI3555_24DAP_5pm_R1.out -e log/AxillaryBuds_eSDI3555_24DAP_5pm_R1.err bash AxillaryBuds_eSDI3555_24DAP_5pm_R1.bsub.cmd
	echo ""

