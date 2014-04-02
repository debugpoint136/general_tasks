#!/bin/bash

#for i in `cat list_of_files.txt`;do
i=AxillaryBuds_eSDI3555_24DAP_5pm_R1
#	echo "bsub -q medium -o log/$i.out -e log/$i.err "
		echo "nawk '{ max[\$2] = !(\$2 in max) ? \$1 : (\$1 > max[\$2]) ? \$1 : max[\$2]} END { for (i in max) print max[i], \"\\t\"i}' $i.txt > filter_redundant/$i.txt" > $i.bsub.cmd
	echo "Queuing $i..."
	#	sleep 1s
	echo ""
	bsub -q medium -o log/$i.out -e log/$i.err bash $i.bsub.cmd
	echo ""
#done
