#!/usr/bin/python

import os
import sys
import time
import numpy
import scipy.stats as stat

usage = """
usage: ToolName.py <inFile_hg38_canFam3_pair> <inFile_zero_table> <outFold>
"""
if len(sys.argv) != 4:

	print(usage)
	sys.exit(1)

inFile_hg38_canFam3_pair_name = sys.argv[1]
inFile_zero_table_name = sys.argv[2]
outFold_name = sys.argv[3]

path = os.getcwd() # current path
inFile_hg38_canFam3_pair = "%s/%s" % (path, inFile_hg38_canFam3_pair_name)
inFile_zero_table = "%s/%s" % (path, inFile_zero_table_name)
outFold = "%s/%s" % (path, outFold_name)

##------------------------------------------------

list_zero_table = []
list_pair_file = os.listdir(inFile_hg38_canFam3_pair)
list_pearson = [["Label", "Pearson", "p-value"]]
list_spearman = [["Label", "Spearman", "p-value"]]

# Read_zero_table
print("# Read_zero_table")
try:
	inFile = open(inFile_zero_table, "r")
	for line in inFile:
		tmp = line.strip().split("\t")

		list_zero_table.append(tmp)

finally:
	inFile.close()

# calculate correlation
for file in list_pair_file:
	list_signal_canFam3 = []
	list_signal_hg38 = []

	try:
		inFile = open("%s/%s" % (inFile_hg38_canFam3_pair, file))

		lineCount = 0
		for line in inFile:
			tmp = line.strip().split("\t")
			#print(tmp)

			if tmp[1] == "NA":
				tmp[1] = 0
			if tmp[2] == "NA":
				tmp[2] = 0	
			if lineCount > 0:
				list_signal_canFam3.append(float(tmp[1]))
				list_signal_hg38.append(float(tmp[2]))

			lineCount += 1
		# list to tuple for scipy.stats
		list_signal_canFam3

		# Pearson
		tmp_pr = stat.pearsonr(tuple(list_signal_canFam3), tuple(list_signal_hg38))
		list_tmp_pr = [file.split(".")[0], tmp_pr[0], tmp_pr[1]]
		list_pearson.append(list_tmp_pr)
		# Spearman
		tmp_sp = stat.spearmanr(tuple(list_signal_canFam3), tuple(list_signal_hg38))
		list_tmp_sp = [file.split(".")[0], tmp_sp[0], tmp_sp[1]]
		list_spearman.append(list_tmp_sp)

	finally:
		inFile.close()

# Write output
print("# Write output")
try:
	outFile_pr = open("%s/01_Pearson_cor_pValue.txt" % (outFold), "w")
	outFile_sp = open("%s/02_Spearman_cor_pValue.txt" % (outFold), "w")

	for i in range(len(list_pearson)):
		if i > 0:
			outFile_pr.write("\n")
		for j in range(len(list_pearson[i])):
			if j > 0:
				outFile_pr.write("\t")
			outFile_pr.write(str(list_pearson[i][j]))

	for i in range(len(list_spearman)):
		if i > 0:
			outFile_sp.write("\n")
		for j in range(len(list_spearman[i])):
			if j > 0:
				outFile_sp.write("\t")
			outFile_sp.write(str(list_spearman[i][j]))

finally:
	outFile_pr.close()
	outFile_sp.close()