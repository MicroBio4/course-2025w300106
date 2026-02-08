#!/bin/bash
#SBATCH --job-name=featureCounts
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH--mem=20G
#SBATCH--time=1:00:00
#SBATCH--output=/lisc/data/scratch/course/2025w300106/joge/logs/featureCounts.%j.log
#SBATCH--error=/lisc/data/scratch/course/2025w300106/joge/logs/featureCounts.%j.err
#SBATCH--mail-type=END,FAIL
#SBATCH--mail-user=shubham.shubham04@gmail.com

## ENVIRONMENT
module load Subread
module list

## EXECUTION
# I want to use -p for paired ends, counts only 1 read per template and primary alignments only

path="/lisc/data/scratch/course/2025w300106/joge"
gtfFile="$path/test.gtf"
bamfile="$path/results/SRR35988120_filtered.bam"
outDir="$path/results/featureCounts"

echo "Started job at $(date)"
mkdir -p $outDir
featureCounts -p --countReadPairs -C -T 4 -s 2 --primary \
-a $gtfFile -o $outDir/counts.tsv $bamfile
echo "Job finished at $(date)"
