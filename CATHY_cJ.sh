#!/bin/bash
#SBATCH -p express                  # Particion elegida para el trabajo(cola)
#SBATCH -N 1                        # Numero de nodods solicitados
#SBATCH -n 1                       # Numero de cores(CPUs)
#SBATCH --mem-per-cpu=4000Mb        # memoria total solicitada
#SBATCH -t 0-03:00:00               # Duracion solicitada para el trabajo (D-HH:MM:SS)



module purge
# Cargamos los modulos necesarios para ejecutar el trabajo
module load rama0.3  GCC/11.2.0
# module NVHPC/22.7-CUDA-11.7.0
module load LAPACK/3.9.1
module load OpenBLAS/0.3.18
module load Mamba/23.1.0-4
#module load FlexiBLAS/3.2.0

#source  ~/.bashrc
#conda activate CATHY

MYPYTHON=/lustre/home/ica/bmary/.conda/envs/CATHY/bin/python

/lustre/home/ica/bmary/.conda/envs/CATHY/bin/python --version
$MYPYTHON --version


$MYPYTHON /lustre/home/ica/bmary/pycathy_wrapper/examples/SSHydro/plot_1_pyCATHY_weilletal_withDRAGO.py
