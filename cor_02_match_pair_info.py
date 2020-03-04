#!/usr/bin/python

import os
import sys
import time

usage = """
usage: ToolName.py <inFold_human> <inFold_canine> <outFold>
"""
if len(sys.argv) != 4:

	print(usage)
	sys.exit(1)

inFold_human_name = sys.argv[1]
inFold_canine_name = sys.argv[2]
outFold = sys.argv[3]

path = os.getcwd() # current path

inFold_human = "%s/%s" % (path, inFold_human_name)
inFold_canine = "%s/%s" % (path, inFold_canine_name)
outFold = "%s/%s" % (path, outFold)

##-----------------------------------------

listHg38 = os.listdir(inFold_human)
listCanFam3 = os.listdir(inFold_canine)

for canFam3 in listCanFam3:

	canFam3_mark = canFam3.split("_")[0]
	canFam3_state = canFam3.split("_")[1]

	#print("%s / %s" % (canFam3_mark, canFam3_state))
	for hg38 in listHg38:

		hg38_mark = hg38.split("_")[0].lower()
		hg38_state = hg38.split("_")[1]

		#print("%s / %s" % (hg38_mark, hg38_state))

		## File matching
		if canFam3_mark in hg38_mark and canFam3_state == hg38_state:

			print("%s / %s" % (hg38_mark, hg38_state))

			listOut = [["Name", "Signal_canFam3", "Signal_hg38"]]
			try:
				inFile_canFam3 = open("%s/%s" % (inFold_canine, canFam3), "r")
				inFile_hg38 = open("%s/%s" % (inFold_human, hg38), "r")
				outFile = open("%s/state_%s_%s.txt" % (outFold, hg38_state, hg38_mark), "w")

				lineCount = 0
				for line_canFam3 in inFile_canFam3:
					tmp_canFam3 = line_canFam3.strip().split("\t")
					name_canFam3 = tmp_canFam3[3]
					signal_canFam3 = tmp_canFam3[13]

					for line_hg38 in inFile_hg38:
						tmp_hg38 = line_hg38.strip().split("\t")
						name_hg38 = tmp_hg38[3]
						signal_hg38 = tmp_hg38[13]

						# peak name matching
						if  name_canFam3 == name_hg38:
							if lineCount > 0:
								tmp = [name_canFam3, signal_canFam3, signal_hg38]
								listOut.append(tmp)

							lineCount += 1
							break

				# write out file
				print("# write out file")
				for i in range(len(listOut)):
					if i > 0:
						outFile.write("\n")
					for j in range(len(listOut[i])):
						if j > 0 :
							outFile.write("\t")
						outFile.write(listOut[i][j])


			finally:
				inFile_canFam3.close()
				inFile_hg38.close()

			break


	
