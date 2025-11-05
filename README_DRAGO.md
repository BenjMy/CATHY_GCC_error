# CATHY with DRAGO CSIC



## Create conda env (once)
Poder cargar miniconda procedemos de la siguiente forma.
```bat
micromamba create -n pycathy_DRAGO python=3.10
micromamba activate pycathy_DRAGO
micromamba install numpy=1.26 scipy -c conda-forge
```

## Install pyCATHY
```bat
git clone https://github.com/BenjMy/pycathy_wrapper.git
cd pycathy_wrapper
pip install .
```
error: numpy 2.1.3 is installed but numpy<1.29.0,>=1.22.4 is required by {'scipy'}


## Testing pyCATHY
```bat
python 
```




## Load module (every time I connect to DRAGO)
```bat
module purge
module load rama0.3  GCC/11.2.0
module load LAPACK/3.9.1
module load OpenBLAS/0.3.18
module load Mamba/22.11.1-1
conda activate pgCATHY
```



## Execute 
https://docaic.rstools.csic.es/es/computacion/slurm


Visualiza información sobre particiones y nodos desde en despliegue de SLURM.
```bat
sinfo --help
```

Con este comando podemos ejecutar jobs.
```bat
srun
srun --job-name=test_DA_SLURM --cpus-per-task=4 python DA_ETa.py -study CRG_paper -sc 0 -nens 64 -DAtype enkf_Evensen2009 -damping 1 -dataErr 1e99 -refModel ERA5_from_weill -DA_OBS_loc 0 -GapCoverage 0.6
srun --job-name=my_jobtest_DA_SLURM_name --cpus-per-task=4 --nodes=1 --account=bmary python DA_ETa.py -study CRG_paper -sc 0 -nens 64 -DAtype enkf_Evensen2009 -damping 1 -dataErr 1e99 -refModel ERA5_from_weill -DA_OBS_loc 0 -GapCoverage 0.6

srun -p generic -N 1 -n 1 python DA_ETa.py -study CRG_paper -sc 0 -nens 64 -DAtype enkf_Evensen2009 -damping 1 -dataErr 1e99 -refModel ERA5_from_weill -DA_OBS_loc 0 -GapCoverage 0.6

 

```

Con este comando podemos cancelar jobs lanzados, ya estén pendientes de
priorización o en ejecución.
```bat
scancel
```









python 


