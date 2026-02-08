#!/bin/bash

#SBATCH --job-name=eggnog
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --time=1:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/eggnog.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/joge/logs/eggnog.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=shubham.shubham04@gmail.ccom

## ENVIRONMENT
module load eggnogmapper/2.1.13-foss-2024a
module list

## VARIABLES
wd="/lisc/data/scratch/course/2025w300106/joge/"
input="${wd}/proteins.fasta"
od="${wd}/results/eggnog/"

## EXECUTION
echo "Started job at $(date)"
mkdir -p $od

emapper.py --cpu 8 -i ${wd}/proteins.fasta --itype proteins --evalue 1e-5 \
	--go_evidence experimental --o eggnog --override -m diamond --output_dir $od --excel

echo "Job finished at $(date)"


# cpu 8 Use 8 CPU threads for the annotation steps
# i  input protein fasta file to annotate
# itype proteins  input sequences are proteins   
# evalue is the statistical parameter to filter the ortholog associations for functional annotation
# go_evidence experimental gene ontology classification of hierarchy, Restricts Gene Ontology (GO) term assignments to those supported by "experimental" evidence codes
