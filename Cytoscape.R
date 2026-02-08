#!/bin/bash
#SBATCH --job-name=cyto
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=64G
#SBATCH --time=4:00:00
#SBATCH --output=/lisc/data/scratch/course/2025w300106/joge/logs/cytotrace.%j.log
#SBATCH --error=/lisc/data/scratch/course/2025w300106/joge/logs/cytotrace.%j.err
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=shubham.shubham04@gmail.com

module load R
Rscript /lisc/data/scratch/course/2025w300106/joge/Cytoscape.R
