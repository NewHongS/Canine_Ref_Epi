#!/usr/bin/python

import os

# Basic argument should be changed with your directory and files
path = "/Directory/"
path_chromhmm = "%s/ChromHMM" % (path)

# Folder name including bed files of expressed- and unexpressed-genes
list_FPKM = ["Directory_Exp_Unexp"]
# Folder name including segments bed files of 11 tissues
list_input_folder = ["Directory_segment_bed"]

for db_FPKM in list_FPKM:

	for path_input_folder in list_input_folder:

		#-------------------------------------------------------------
		# Extract Info aboug Segment file in each State
		def extract_segment (path, state):
			list_tmp = []
			tmp = os.listdir("%s/%s" % (path, state))
			for i in range(len(tmp)):
				if "segments.bed" in tmp[i]:
					list_tmp.append(tmp[i])
			return list_tmp
		#-------------------------------------------------------------
		list_state = []
		list_segment = []

		list_state = os.listdir(path_input_folder)

		for i in range(len(list_state)):
			# Make output directory
			os.system("mkdir %s/%s/%s_overlap_Exp_UnExp_%s_onlyEnsembl" % (path_input_folder, list_state[i], list_state[i], db_FPKM))
			list_segment = extract_segment(path_input_folder, list_state[i])

			for j in range(len(list_segment)):
				tissue = list_segment[j].split("_")[0].upper()
				print(tissue)

				# DB path
				path_db = "%s/overlapEnrichment_DB/02_Exp_UnExp_onlyEnsembl_180421/%s/%s" % (path, db_FPKM, tissue)

				input_segment_file = "%s/%s/%s" % (path_input_folder, list_state[i], list_segment[j])
				output_name = list_segment[j].split(".")[0]
				output_file = "%s/%s/%s_overlap_Exp_UnExp_%s_onlyEnsembl/%s" \
				% (path_input_folder, list_state[i], list_state[i], db_FPKM, output_name)


				# Run ChromHMM function
				os.system("java -Xmx60g -jar %s/ChromHMM.jar OverlapEnrichment %s %s %s" \
					% (chromhmmPath, input_segment_file, path_db, output_file))


