#!/bin/bash
##
## identificacao do job
#SBATCH --job-name=cs-rvsc
##
## solicitando GPU
#SBATCH --partition=gpushort
##
## quantidade de nodes
#SBATCH --nodes=1
##
## quantidade de nucleos
#SBATCH --ntasks=1
#
## quantidade de GPU
#SBATCH --gres=gpu:1
#
## quantidade de tempo solicitado
#SBATCH --time=00:30:00
#
## configura o envio de e-mail quando o job for cancelado/finalizado.
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=saletybaracho@gmail.com

WRKDIR=$SCRATCH/$SLURM_JOB_ID

INP=$SLURM_JOB_NAME".inp"
OUT=$SLUM_JOB_NAME".out"

## Informacoes do job impressos no arquivo de saida.

echo -e "\n## Jobs ativos de $USER: \n"
squeue -a --user=$USER
echo -e "\n## Node de execucao do job:	$(hostname -s) \n"
echo -e "\n## Numero de tarefas para este job: $SLURM_NTASKS \n"

## Inicio do trabalho

## Informacoes sobre o ambiente de execucao impressos no arquivo de saida.
echo -e "\n## Diretorio de submissao do job: 	$SLURM_SUBMIT_DIR \N"

## Carregando modulos
module load Python
module load TensorFlow
module load Keras

## Submissao do job 
time srun python3 train_rvsc.py i o gpu_id
