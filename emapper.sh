#!/bin/bash
#SBATCH --job-name=emapper
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=32G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/emapper.%j.log
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/emapper.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=shubham.shubham04@gmail.com

## ENVIRONMENT
module load eggnogmapper/2.1.13-foss-2024a
module list

## VARIABLES
wd="/lisc/data/scratch/course/2025w300106/joge/"
input="${wd}/proteins.fasta"
od="${wd}/results/emapper/"

## Execution
mkdir -p ${od}
emapper.py -i ${input} --output_dir ${od} -o emapper --cpu 16 --itype proteins -m diamond --evalue 1e-5 --go_evidence experimental

# input sequences are proteins only
# DIAMOND for fast protein similarity searches 
# E-value cutoff for functional annotations
# Restricts Gene Ontology (GO) term 
