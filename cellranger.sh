#!/bin/bash

#SBATCH --job-name=cellranger
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/cellranger.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/joge/logs/cellranger.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=shubham.shubham04@gmail.ccom

## ENVIRONMENT
module load CellRanger
module list

## VARIABLES
wd="/lisc/data/scratch/course/2025w300106"
index="${wd}/common/NV2_fluo"
fastq_dir="${wd}/common/blastula.12h/run1,${wd}/common/blastula.12h/run2,${wd}/common/blastula.12h/run3"
sample="89085"
outDir="${wd}/joge/results/cellranger"
id="blastula_12h"

## EXECUTION
echo "Started job at $(date)"
mkdir -p ${outDir}
cd ${outDir}

cellranger count --transcriptome $index \
                 --fastqs $fastq_dir \
		 --sample $sample \
		 --force-cells 10000 \
		 --nosecondary \
		 --localcores 16 \
		 --id $id --create-bam false
#--output-dir $outDir

echo "Job finished at $(date)"

