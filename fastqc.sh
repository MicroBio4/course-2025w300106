#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH--mem=2G
#SBATCH--time=1:00:00
#SBATCH--output=/lisc/data/scratch/course/2025w300106/joge/logs/fastqc.%j.log
#SBATCH--error=/lisc/data/scratch/course/2025w300106/joge/logs/fastqc.%j.err
#SBATCH--mail-type=END,FAIL
#SBATCH--mail-user=shubham.shubham04@gmail.com

## ENVIRONMENT
module load FastQC
module list

## VARIABLES
outDir="/lisc/data/scratch/course/2025w300106/joge/results/fastqc"
readsDir="/lisc/data/scratch/course/2025w300106/joge"

## Execution
echo "Started job at $(date)"
mkdir $outDir
fastqc -t 2 -o $outDir $readsDir/SRR35988120.fastq
echo "Job finished at $(date)"
