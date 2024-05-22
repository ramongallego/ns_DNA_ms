#!/bin/bash
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -q all.q


## A script to run Blastn in a fasta file
## All parameters can be set up below , then copy the file to the output folder
blast_output_dir="/home/belenarias/edna/dada2/output_r2/demultiplexed_20221202_0950/after_cleanup"
# cp "$0" "${blast_output_dir}"/blast.sh
BLAST_DB='/storage/projects/GenbankReferenceDBs/nt/nt'
# BLAST PARAMETERS
PERCENT_IDENTITY="75"
WORD_SIZE="30"
EVALUE="1e-30"
# number of matches recorded in the alignment, orginal is "20" but I'm going to try "50":
MAXIMUM_MATCHES="50"
CULLING="5"

	################################################################################
	# BLAST CLUSTERS
	################################################################################
	echo $(date +%H:%M) "BLASTing..."
	#blast_output="/home/belenarias/edna/dada2/output_test/demultiplexed_20221103_1310/edna_db/edna_project01_blastn.txt"
	blastn \
		-query "/home/belenarias/edna/dada2/output_r2/demultiplexed_20221202_0950/after_cleanup/Hash_Key_after_cleanup_2022_12.fasta" \
		-db "${BLAST_DB}" \
		-num_threads 20 \
		-perc_identity "${PERCENT_IDENTITY}" \
		-word_size "${WORD_SIZE}" \
		-evalue "${EVALUE}" \
		-max_target_seqs "${MAXIMUM_MATCHES}" \
		-culling_limit="${CULLING}" \
		-outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore staxids qlen"  \
		-out "${blast_output_dir}"/hash_key_75_221214_blastn.txt

#testear si el staxids sin s deja solo un valor
#staxids
#staxid?
