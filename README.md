course-2025w300106

STAR RNA-seq Alignment Script
This SLURM batch script automates the alignment of paired-end RNA-seq reads using the STAR (Spliced Transcripts Alignment to a Reference) aligner on the University of Vienna (Uni Wien) HPC cluster.

Overview
The script maps raw FASTQ files (SRR23260644_1.fastq and SRR23260644_2.fastq) to a reference genome using a pre-existing STAR genome index. It is configured to handle the alignment process from input to coordinate-sorted output, preparing the data for subsequent bioinformatic pipelines.

Job Specifications
Resources: 1 Node | 16 CPU Threads | 20 GB RAM

Time Limit: 12 Hours

Scheduler: SLURM

Notifications: Email alerts enabled for job completion or failure.

Output & Logging
Primary Output: A coordinate-sorted .bam file.

Logging: All STAR logs and error reports are directed to the logs/ directory.

Downstream Applications
The resulting alignment files are optimized for:

Quantification: Gene-level read counting for differential expression analysis.

Splicing Analysis: Splice junction detection and alternative splicing studies.

Quality Control: Alignment quality assessment and coverage visualization in genome browsers (e.g., IGV).
