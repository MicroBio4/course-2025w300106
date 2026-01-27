#!/bin/bash
#SBATCH --job-name=STAR
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH--mem=20G
#SBATCH--time=12:00:00
#SBATCH--output=/lisc/data/scratch/course/2025w300106/joge/logs/STAR.%j.log
#SBATCH--error=/lisc/data/scratch/course/2025w300106/joge/logs/STAR.%j.err
#SBATCH--mail-type=END,FAIL
#SBATCH--mail-user=shubham.joge@univie.ac.at

## ENVIRONMENT
module load STAR
module list

STAR --genomeDir /lisc/data/scratch/course/2025w300106/joge/jaNemVect_STAR \
     --runThreadN 16 \
     --readFilesIn /lisc/data/scratch/course/2025w300106/joge/SRR35988120.fastq \
     --outFileNamePrefix /lisc/data/scratch/course/2025w300106/joge/results/map/SRR35988120_jaNemVect_\
     --outSAMstrandField intronMotif \
     --outSAMtype BAM SortedByCoordinate
