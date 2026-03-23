#!/bin/bash

#SBATCH --time=04:00:00			### The limit on wall time for a single instance of the job
#SBATCH --nodes=2-4 			### Total number of nodes to use
#SBATCH --ntasks=384  			### Total number of tasks
#SBATCH --cpus-per-task=1  		### Number of threads per task (OMP threads)
##SBATCH --exclude=BAD_NODES		### Optional, exclude nodes if needed
#SBATCH --job-name=JOB_NAME
#SBATCH --account=ACCOUNT_ID
#SBATCH --partition=PARTITION
#SBATCH --mail-user=USERNAME@EMAIL.COM
#SBATCH --mail-type=FAIL
#

### Script for creating a job script that automatically resubmits itself.
### This is intended for use with very long simulations that exceed the
### wall-time limits on your system and are designed to continue running
### from some sort of arbitrary checkpoint.
### This is made with slurm in mind, but might be able to be converted to work
### on systems using other management tools.

### the following lines are only for activating a conda environment, replace
### these with whatever your job needs for its environment
source /user/home/path/.bashrc
conda activate /user/home/path/.conda/envs/your_env

### If the file 'finished' exists, do nothing instead of resubmitting the job.
if [ ! -f "finished" ] ; then
	sbatch --dependency=afterany:$SLURM_JOBID loop_job.sh
else
	exit 0
fi

### Start job commands ###
echo "Hello, World!" > output.txt
### End job commands ###

### If the job hit the wall time while still running, the job will abort before
### it can create finished.  If the job completes, or an error causes the job
### to fail, finished will be created, which will stop the job from endlessly
### submitting itself.
touch finished
