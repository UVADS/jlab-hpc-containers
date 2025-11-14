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
apptainer exec --nv --bind ~/local/pytorch-2.9.1:$HOME/.local ~/pytorch-2.9.1.sif python pytorch-example.py
