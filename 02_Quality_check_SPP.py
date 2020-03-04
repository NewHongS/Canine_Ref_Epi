#!/usr/bin/python
# required files : run_spp.R

import os, sys

# Basic argument should be changed with your directory and files
path = "/Directory/"
# Input file format (Table_ChIP_Control_pair.txt)
# Each row include space separated sample names of ChIP or MBD-seq and paired control
# ex) ChIP_A Control_A
#     ChIP_B Control_B
#     MBD_X Control_X
#     MBD_Y Control_Y

input_file_name = "%s/Table_ChIP_Control_pair.txt" % (path)

try:
	input_file = open(input_file_name, "r")
	for line in input_file:
		tmp = line.strip().split("\t")

		input_Exp = tmp[0]
		input_Con = tmp[1]

		output_file = "180625_%s.spp.txt" % (tmp[0].split(".")[0])

		command = ("Rscript run_spp.R -c=%s -i=%s -savp -out=%s -p=20" 
			% (input_Exp, input_Con, output_file))

		## Run SPP package
		print("code = %s" % (command))
		os.system(command)

	os.system("date")
	
finally:
	input_file.close()