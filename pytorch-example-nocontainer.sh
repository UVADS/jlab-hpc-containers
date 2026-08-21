#!/bin/bash
#SBATCH --account=<your_allocation>     # replace with your allocation 
#SBATCH --partition=gpu                 
#SBATCH --gres=gpu:1
#SBATCH --mem=32G
#SBATCH --cpus-per-task=4
#SBATCH --time=00:10:00                 # 10 minutes
#SBATCH -e slurm-%j.err                 # error file
#SBATCH -o slurm-%j.out                 # stdout file

# get example Py script
curl -o pytorch-example.py https://raw.githubusercontent.com/pytorch/examples/refs/heads/main/mnist/main.py

module purge
module load apptainer
module load pytorch/2.11.0

apptainer exec --nv $CONTAINERDIR/pytorch-2.11.0.sif python pytorch-example.py
