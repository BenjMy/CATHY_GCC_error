#!/bin/bash
###################################################################################################################
#############################################  DESCRIPCION ########################################################
###################################################################################################################
#   Descripcion de los que hace el Script de trabajo                                                                                                                                   
#                                                                                                                 
###################################################################################################################
###########################  CONFIGURACION DE LA SOLICITUD DE RECURSOS AL CLUSTER #################################
###################################################################################################################
#SBATCH -p express                  # Particion elegida para el trabajo(cola)
#SBATCH -N 1                        # Numero de nodods solicitados
#SBATCH -n 10                	    # Numero de cores(CPUs)
#SBATCH --mem-per-cpu=4000Mb        # memoria total solicitada
#SBATCH -t 0-03:00:00         	    # Duracion solicitada para el trabajo (D-HH:MM:SS)
#SBATCH --job-name=CATHY_test        # Nombre del trabajo

#SBATCH -o CATHY_test-%j.out         # fichero de salida estandart

#SBATCH --mail-type=begin    	             #Envia un correo cuando el trabajo inicia
#SBATCH --mail-type=end      	             #Envia un correo cuando el trabajo finaliza
#SBATCH --mail-user=benjamin.mary@ica.csic.es          #Direccion de correo a la que enviar los mensajes

 


###################################################################################################################
################################# DESPLIEGUE DEL SOFTWARE A UTILIZAR  #############################################
###################################################################################################################
echo "Iniciando la carga de Software en Drago..."

# Fecha/Hora de inicio del trabajo
INICIO_CARGA=$(date +%s)
INICIO_CARGA_HUMANO=$(date)

# Limpiamos los posibles modulos que tengamos cargados previamente para evitar problemas
module purge

# Cargamos los modulos necesarios para ejecutar el trabajo
module load rama0.3  GCC/11.2.0 
# module NVHPC/22.7-CUDA-11.7.0
module load LAPACK/3.9.1
module load OpenBLAS/0.3.18
#module load FlexiBLAS/3.2.0
conda activate CATHY

# Guarda el tiempo de finalizacion de carga en segundos
FIN_CARGA=$(date +%s)

# Calcula la duracion total en segundos
TIEMPO_CARGA=$((FIN_CARGA - INICIO_CARGA))

###################################################################################################################
########################################## TRABAJO A EJECUTAR #####################################################
###################################################################################################################
# Informacion sobre elos recursos solicitados en Drago
echo ""
echo "#################################################################"
echo "DATOS DE RECURSOS DEL TRABAJO EN DRAGO"
echo "Nombre del Trabajo: $SLURM_JOB_NAME"
echo "Numero de Trabajo: $SLURM_JOB_ID"
echo "Cola de Trabajo: $SLURM_JOB_PARTITION"
echo "Numero de nodos: $SLURM_NNODES"
echo "Numero de Cores (Tareas): $SLURM_NTASKS "
echo "Memoria por Core: $SLURM_MEM_PER_CPU"
echo "Directorio: $SLURM_SUBMIT_DIR" 
echo "#################################################################"
echo ""


# numero de cores a utilizar - Debe coincidir con el numeto de cores solicitados
hilos=$SLURM_JOB_CPUS_PER_NODE  # Al seleccionar un Nodo podemos utilizar esta variable del Slurm directamente


###################################################################################################################
########################################## COMANDOS DEL TRABAJO  ##################################################
###################################################################################################################


# source ./bashrc (if it doesnt work with conda activate CATHY)
#/lustre/home/ica/bmary/.conda/envs/CATHY 
python /lustre/home/ica/bmary/pycathy_wrapper/examples/SSHydro/plot_1_pyCATHY_weilletal.py


###################################################################################################################
########################################## TIEMPOS DE CALCULO  ####################################################
###################################################################################################################
# Fecha/Hora de fin del trabajo
FIN_TRABAJO=$(date +%s)
FIN_TRABAJO_HUMANO=$(date)

# Calcula la duracion total en segundos
DURACION=$((FIN_TRABAJO - INICIO_CARGA))

# Convierte los segundos a un formato de horas, minutos y segundos
HORAS=$((DURACION / 3600))
MINUTOS=$(((DURACION % 3600) / 60))
SEGUNDOS=$((DURACION % 60))



# Imprime los tiempos en el archivo de salida del trabajo
echo ""
echo "--------------------------------------------------------"
echo "Tarea finalizada!"
echo "Hora de inicio: $INICIO_CARGA_HUMANO"
echo "Hora de finalizacion: $FIN_TRABAJO_HUMANO"
echo "Tiempo de Carga de Modulos en Drago (en segundos): ${TIEMPO_CARGA}"
echo "Tiempo de ejecucion total: ${HORAS}h ${MINUTOS}m ${SEGUNDOS}s"
echo "Tiempo de ejecucion total (en segundos): ${DURACION}"
echo "--------------------------------------------------------"
