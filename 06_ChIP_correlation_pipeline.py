#!/usr/bin/python

import os
import sys
import time

if __name__ == '__main__':

	usage = """
	usage: ToolName.py <canFam3_bed_bw> <hg38_bed_bw> <input_mark_info> <outFold>
	"""
	if len(sys.argv) != 5:

		print(usage)
		sys.exit(1)

	canFam3_bed_bw = sys.argv[1]
	hg38_bed_bw = sys.argv[2]
	input_mark_info = sys.argv[3]
	outFold = sys.argv[4]

### Function --------------------------------------
def timeNow ():
	localtime = time.asctime(time.localtime(time.time()))
	print("## %s" % (localtime))

def checkDir (outDirPath):
	if not os.path.exists(outDirPath):
		os.makedirs(outDirPath)		
### -----------------------------------------------

path = os.getcwd() # current path
listMarkInfo = []
checkDir("%s/%s" % (path, outFold)) # check output folder
checkDir("%s/%s/01_extract_mapped_in_canFam3" % (path, outFold))
checkDir("%s/%s/02_bwtools" % (path, outFold))
checkDir("%s/%s/02_bwtools/canFam3" % (path, outFold))
checkDir("%s/%s/02_bwtools/hg38" % (path, outFold))
checkDir("%s/%s/03_matching_file" % (path, outFold))
checkDir("%s/%s/03_matching_file_edit" % (path, outFold))
checkDir("%s/%s/04_correlation" % (path, outFold))

try:
	inFile = open("%s/%s" % (path, input_mark_info), "r")
	for line in inFile:
		tmp = line.strip().split("\t")
		listMarkInfo.append(tmp)
finally:
	inFile.close()


#list_canFam3_bed_bw = os.listdir("%s/%s" % (path, canFam3_bed_bw))
#list_hg38_bed_bw = os.listdir("%s/%s" % (path, hg38_bed_bw))

# 01_01_Extract_mapped_info_inhg38.bed
timeNow ()

print("# 01_01_Extract_mapped_info_inhg38.bed")
os.chdir("%s/%s" % (path, hg38_bed_bw))

command = "for dense in $(ls |grep 'edit.hg38.bed')\
	;do awk '{print $4}' $dense >> %s/%s/extract_mapped_info.txt;done" % (path, outFold)

os.system("rm %s/%s/extract_mapped_info.txt;done" % (path, outFold))
os.system(command)
os.chdir(path)

# 01_02_Extract_mapped_info_inhg38.bed
timeNow ()
print("# 01_02_Extract_mapped_info_inhg38.bed")

command = "python 01_extract_mapped_in_canFam3_bed.py %s/extract_mapped_info.txt \
	%s %s/01_extract_mapped_in_canFam3" % (outFold, canFam3_bed_bw, outFold)

os.system(command)
### --------------------------------------------------------------

# 02_01_bwtools_canFam3
timeNow ()
print("# 02_01_bwtools_canFam3")

os.chdir("%s/%s" % (path, canFam3_bed_bw))

command = "for bw in $(ls |grep 'bigWig');do cp $bw %s/%s/01_extract_mapped_in_canFam3/$bw;done" % (path, outFold)
os.system(command)

os.chdir(path)

outPath = ("%s/%s/02_bwtools/canFam3" % (path, outFold))
os.chdir("%s/%s/01_extract_mapped_in_canFam3" % (path, outFold))

command = "for dense in $(ls |grep '_mapped.bed');do denseCut=$(echo $dense |cut -d '.' -f 1);echo $denseCut\
	;for bw in $(ls |grep 'bigWig');do bwCut=$(echo $bw |cut -d '-' -f 2);echo $bwCut\
	;bwtool summary $dense $bw %s/$bwCut'_'$denseCut.txt -header -keep-bed;done;done" % (outPath)

os.system(command)
os.chdir(path)

# 02_02_bwtools_hg38
timeNow ()
print("# 02_02_bwtools_hg38")
outPath = ("%s/%s/02_bwtools/hg38" % (path, outFold))
os.chdir("%s/%s" % (path, hg38_bed_bw))

command = "for dense in $(ls |grep 'edit.hg38.bed');do denseCut=$(echo $dense |cut -d '.' -f 1);echo $denseCut\
	;for bw in $(ls |grep '.bw');do bwCut=$(echo $bw |cut -d '_' -f 1);echo $bwCut\
	;bwtool summary $dense $bw %s/$bwCut'_'$denseCut.txt -header -keep-bed;done;done" % (outPath)

os.system(command)

os.chdir(path)
### --------------------------------------------------------------

# 03_hg38_canFam3_bwtool_result_matching
timeNow ()
print("# 03_hg38_canFam3_bwtool_result_matching")

command = "python 02_match_pair_info.py %s/02_bwtools/hg38 %s/02_bwtools/canFam3 %s/03_matching_file" \
	% (outFold, outFold, outFold)

os.system(command)
os.chdir(path)
# 04_remove some files
timeNow ()
print("# 04_remove some files")

for i in range(len(listMarkInfo)):
	print(listMarkInfo[i])
	fileName = "state_%s_h3%s.txt" % (listMarkInfo[i][0], listMarkInfo[i][1])
	command = ("mv %s/%s/03_matching_file/%s %s/%s/03_matching_file_edit/%s" \
		% (path, outFold, fileName, path, outFold, fileName))

	os.system(command)

os.system("rm -r %s/%s/03_matching_file" % (path, outFold))
	### --------------------------------------------------------------

# 04_Calculate correlation
timeNow ()
print("## 04_Calculate correlation")

command = "python 03_calculate_correlation.py %s/03_matching_file_edit \
	input_correlation_zero_table %s/04_correlation" % (outFold, outFold)

os.system(command)
