#!/bin/bash
#SBATCH --job-name=snip
#SBATCH --cpus-per-task=2 
#SBATCH --gres=gpu:1
#SBATCH --time=100:00:00
#SBATCH --mem=8GB
#SBATCH --mail-type=END
#SBATCH --mail-user=bk2374@nyu.edu

module purge
module load tensorflow/python3.6/1.5.0

conda activate /scratch/bk2374/pro_env

#/scratch/bk2374/pro_env/bin/python main.py --path_data=data

/scratch/bk2374/pro_env/bin/python main.py --logdir ./reproduce-vgg --path_data ./data --datasource cifar-10 --aug_kinds fliplr translate_px --arch vgg-d --target_sparsity 0.75 --batch_size 128 --train_iterations 150000 --optimizer momentum --lr_decay_type piecewise --decay_boundaries 30000 60000 90000 120000 --decay_values 0.1 0.02 0.004 0.0008 0.00016 >> log_75.txt 2>&1
