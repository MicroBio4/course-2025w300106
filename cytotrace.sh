#!/bin/bash

#SBATCH --job-name=cytotrace 
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --time=01:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/cytotrace.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/joge/logs/cytotrace.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=shubham.shubham04@gmail.com

module load R
Rscript /lisc/data/scratch/course/2025w300106/joge/Cytoscape.R
