# HPC

Directory for scripts or other utils for running on HPC systems.  These
should be agnostic to the specific simulation tool being used - such utils
should be in a directory dedicated to that particular simulation software.

Items:
- loop_job.sh: Sisyphean job script meant for automating submitting jobs for a
long, continuous simulation.  Perpetually re-submits itself until it completes 
the simulation or fails due to an error.  Written for HPC systems using SLURM.
