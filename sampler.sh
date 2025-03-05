#!/bin/bash

#SBATCH --job-name=sample_beacon         # create a short name for your job
#SBATCH --time=0:15:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=/home/youwei/project_beacon/2024_10/sampling/sampling_01.out
#SBATCH --error=/home/youwei/project_beacon/2024_10/sampling/sampling_01.err


#conda activate /project2/avieregg/youwei/miniconda/root_env
#conda activate root_env
cd ~/project_beacon/2024_10

# Use SLURM_ARRAY_TASK_ID to set the run number
RUN_NUMBER=$(printf "%03d" $SLURM_ARRAY_TASK_ID)

python sampler.py

#sbatch ./sampler.sh