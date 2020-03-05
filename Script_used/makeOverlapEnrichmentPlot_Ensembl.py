#!/usr/bin/python

import os

# Basic argument should be changed with your directory and files
path = "/Directory/"
path_chromhmm = "%s/ChromHMM" % (path)

# Path including segments bed files of 11 tissues
path_input_folder = "%s/Directory_segment_bed" % (path)
# Path including Ensembl gene information bed files
# files: Gene, Exon, TSS, TSS2kb, TES, TES2kb, CpGIsland, Repeats (Figure 2A)
path_db = "%s/overlapEnrichment_DB/Ensemble_bed_files" % (path)

list_state = []
list_segment = []

#-------------------------------------------------------------
# Extract Info about segment file in each state
def extract_segment (path, state):
	listTmp = []
	tmp = os.listdir("%s/%s" % (path, state))
	for i in range(len(tmp)):
		if "segments.bed" in tmp[i]:
			listTmp.append(tmp[i])
	return listTmp
#-------------------------------------------------------------
list_state = os.listdir(path_input_folder)

for i in range(len(list_state)):
	# Make output directory
	os.system("mkdir %s/%s/%s_overlap_onlyEnsembl_with2kb" % (path_input_folder, list_state[i], list_state[i]))
	list_segment = extract_segment(path_input_folder, list_state[i])

	for j in range(len(list_segment)):
		input_segment_file = "%s/%s/%s" % (path_input_folder, list_state[i], list_segment[j])
		output_name = list_segment[j].split(".")[0]
		output_file = "%s/%s/%s_overlap_onlyEnsembl_with2kb/%s" % (path_input_folder, list_state[i], list_state[i], output_name)


		# Run ChromHMM function
		os.system("java -Xmx60g -jar %s/ChromHMM.jar OverlapEnrichment %s %s %s" \
			% (path_chromhmm, input_segment_file, path_db, output_file))


