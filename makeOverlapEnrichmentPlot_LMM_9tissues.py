#!/usr/bin/python

import os

# Basic argument should be changed with your directory and files
path = "/Directory/"
path_chromhmm = "%s/ChromHMM" % (path)

# Folder name including TSS 2kb+/- bed files of tissue-speicif genes
list_TSS = ["Directory_tissue-specific_gene_TSS_bed"]
# Folder name including segments bed files of 11 tissues
list_input_folder = ["Directory_segment_bed"]


for db_TSS in list_TSS:
	for path_input_folder in list_input_folder:

		list_state = os.listdir(path_input_folder)

		for i in range(len(list_state)):
			# Make output directory
			if "segments.bed" in list_state[i]:
				os.system("mkdir %s/9tissue_bubble/%s_overlap_LMM_tissues_%s" % (path_input_folder, list_state[i].split(".")[0], db_TSS))

				tissue = list_state[i].split("_")[0].upper()
				print(tissue)
				# DB path
				path_db = "%s/overlapEnrichment_DB/%s" % (path, db_TSS)

				input_segment_file = "%s/%s" % (path_input_folder, list_state[i])
				output_file = "%s/9tissue_bubble/%s_overlap_LMM_tissues_%s" % (path_input_folder, list_state[i].split(".")[0], db_TSS)


				# Run ChromHMM function
				os.system("java -Xmx60g -jar %s/ChromHMM.jar OverlapEnrichment %s %s %s" \
					% (path_chromhmm, input_segment_file, path_db, output_file))
