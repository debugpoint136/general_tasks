#!/bin/python
#+-----------------------------------+
#+------csv processing script--------+
#+------Deepak Purushotham-----------+
#+----------Apr 1, 2014--------------+
#------------------------------------+


import os,sys,time, csv
from pprint import pprint
from collections import defaultdict

# this script will input all the csv files and do the following
# 1. just awk and take the 2 cols of interest
# 2. throw away everything that is greater than 26 in length
# 3. make a dictionary of lists for all these 


lookup = dict()
d = defaultdict(list)
cnt =0
print "reading the files and adding to hash.."
with open("list_of_files.txt",'r') as list_of_files:
	for file in list_of_files :
		filename = file.rstrip('\n')
		# add all the filenames into a lookup table
		lookup[filename] = cnt
		cnt = cnt + 1


with open("list_of_files.txt",'r') as list_of_files:
	for file in list_of_files :
			a = file.rstrip('\n')
			index = lookup[a]
			
			filename = file.rstrip('\n') + ".txt"
			with open(filename,'r') as fh:

				for line in fh :
					line = line.rstrip('\n')
					key = line.split('\t')[1]
					value = line.split('\t')[0]
					value = int(value)
					
					if key not in d :
						d[key] = [0] * cnt #intialize empty lists with a length of number of samples
					
					d[key][index] = value


			print "!!!!!!!!!!!!!!!!!!!!!!---Processing file " + str(index+1) + "---!!!!!!!!!!!!!!!!!!!!!!" 

time.sleep(2)

print "Compiling output..."
time.sleep(2)

sample_headers = []

with open("output.csv", 'w') as f:
    writer = csv.writer(f)
    for sample, index in lookup.iteritems():
    	sample_headers.append(sample)

#prepare the header
    header = ','.join(sample_headers)
    header = "Sequence," + header + "\n"

    f.write(header) # just save the header, before entering the data
    

# now enter the data
    for k,v in d.iteritems():
        	writer.writerow([k] + v)
