#!/bin/bash

#SBATCH --job-name=Analysis_beacon         # create a short name for your job
#SBATCH --time=0:20:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#dSBATCH --output=/home/youwei/project_beacon/2024_10/data/Analysis_Vrms_$SLURM_ARRAY_TASK_ID.out
#dSBATCH --error=/home/youwei/project_beacon/2024_10/data/Analysis_Vrms_$SLURM_ARRAY_TASK_ID.err



#SBATCH --output=/home/youwei/project_beacon/2024_10/data/output_%A_%a.out  # Output file for each job
#SBATCH --error=/home/youwei/project_beacon/2024_10/data/error_%A_%a.err    # Error file for each job
#SBATCH --array=0-13                # Define job array with 5 jobs (corresponding to 5 lines in parameters.txt)

#conda activate /project2/avieregg/youwei/miniconda/root_env
#conda activate root_env
cd ~/project_beacon/2024_10

# Get the parameters for the current job from the file
PARAM_LINE=$(sed -n "$((SLURM_ARRAY_TASK_ID + 1))p" /home/youwei/project_beacon/2024_10/Analysis_parameter.txt)

# Extract the parameters from the line
FILENUM=$(echo $PARAM_LINE | cut -d ' ' -f 1)
CH=$(echo $PARAM_LINE | cut -d ' ' -f 2)

# Define the parameters you want to pass
#FILENUM=$1  # First argument to bash script
#CH=$2

# Use SLURM_ARRAY_TASK_ID to set the run number
RUN_NUMBER=$(printf "%03d" $SLURM_ARRAY_TASK_ID)

python Analysis_Vrms.py --param1 "$FILENUM" --ch "$CH"

#sbatch ./sampler.sh