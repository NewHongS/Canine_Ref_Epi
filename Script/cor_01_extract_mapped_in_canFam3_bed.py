#!/usr/bin/python

import os
import sys
import time

usage = """
usage: ToolName.py <inFile_mapped> <inFold_bed_bwtool> <outFold>
"""
if len(sys.argv) != 4:

	print(usage)
	sys.exit(1)

inFile_mapped_name = sys.argv[1]
inFold_bed_bwtools_name = sys.argv[2]
outFold = sys.argv[3]

path = os.getcwd() # current path
inFile_mapped = "%s/%s" % (path, inFile_mapped_name)
inFold_bed_bwtool = "%s/%s" % (path, inFold_bed_bwtools_name)

##------------------------------------------------

listBed = os.listdir(inFold_bed_bwtool)
listMapped = []

try:
	inFile = open(inFile_mapped, "r")
	for line in inFile:
		tmp = line.strip()
		listMapped.append(tmp)
finally:
	inFile.close()

# extract need data
for file in listBed:
	if "_13_dense_edit.bed" in file:
		print(file)
		outName = "%s_extract_mapped.bed" % (file.split(".")[0])
		try:
			inFile = open("%s/%s" % (inFold_bed_bwtool, file), "r")
			outFile = open("%s/%s/%s" % (path, outFold, outName), "w")

			listOut = []
			for line in inFile:
				tmp = line.strip().split("\t")
				
				if tmp[3] in listMapped:
					listOut.append(tmp)
			# wirte output
			for i in range(len(listOut)):
				if i > 0:
					outFile.write("\n")
				for j in range(len(listOut[0])):
					if j > 0:
						outFile.write("\t")
					outFile.write(listOut[i][j])
		finally:
			inFile.close()
			outFile.close()