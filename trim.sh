#!/bin/bash
#SBATCH --job-name=trimmomatic
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH--mem=16G
#SBATCH--time=12:00:00
#SBATCH--output=/lisc/data/scratch/course/2025w300106/joge/logs/trimmomatic.%j.log
#SBATCH--error=/lisc/data/scratch/course/2025w300106/joge/logs/trimmomatic.%j.err
#SBATCH--mail-type=END,FAIL
#SBATCH--mail-user=shubham.shubham04@gmail.com
  
## ENVIRONMENT
module load Trimmomatic
module list

## VARIABLES
wd="/lisc/data/scratch/course/2025w300106/joge"
outDir="$wd/results/trimmomatic"

## EXECUTION
echo "Started job at $(date)"
mkdir -p $outDir

trimmomatic PE -threads 4 -summary $outDir/summary \
  $wd/SRR35988120.fastq
  -baseout $outDir/SRR35988120_ \
  ILLUMINACLIP:$wd/trim_adapters.fa:2:30:10 \
  SLIDINGWINDOW:4:20 MINLEN:75
echo "Job finished at $(date)" 
