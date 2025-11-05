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
pip install . (or python setup.py develop)
```


## Testing pyCATHY
```bat
python plot_1_pyCATHY_withDRAGO.py
```




## Load module (every time I connect to DRAGO)
```bat
module purge
module load rama0.3  GCC/11.2.0
module load LAPACK/3.9.1
module load OpenBLAS/0.3.18
module load Mamba/23.1.0-4
conda activate pgCATHY
```

or directly via shell file 


## Testing pyCATHY within DRAGO
```bat
sbatch CATHY_cJ.sh
```

**Checking status**:
```bat
squeue -i 5
```

## Error

cat slurm-1172765.out 
Python 3.10.19
Python 3.10.19
🏁 Initiate CATHY object
🍳 gfortran compilation
/lustre/home/ica/bmary/SSHydro/test_HPC_weill/prepro/src
bashCommand
streamer.f90:62:71:

   62 |   OPEN(UNIT=uni, FILE= fileName, ACTION= action, STATUS=status, ACCESS="transparent", IOSTAT=ii)   !##LF95##
      |                                                                       1
Warning: ACCESS specifier in OPEN statement at (1) has invalid value ‘transparent’
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot open crt1.o: No such file or directory
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot open crti.o: No such file or directory
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot open crtn.o: No such file or directory
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot find -lm
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot find -lm
/lustre/opt/foss/0.3/software/binutils/2.37-GCCcore-11.2.0/bin/ld.gold: error: cannot find -lc
/tmp/cc0jANtT.o:mpar.f90:function __mpar_MOD_rrow: error: undefined reference to 'memmove'
/tmp/cc0jANtT.o:mpar.f90:function __mpar_MOD_rrow: error: undefined reference to 'memset'
/tmp/cc0jANtT.o:mpar.f90:function __mpar_MOD_rrow: error: undefined reference to 'memmove'
/tmp/cc0jANtT.o:mpar.f90:function __mpar_MOD_rparfile: error: undefined reference to 'fmod'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_close_dtm: error: undefined reference to 'free'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_close_dtm: error: undefined reference to 'free'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_save_dtm: error: undefined reference to 'free'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_save_dtm: error: undefined reference to 'free'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_load_dtm: error: undefined reference to 'malloc'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_load_dtm: error: undefined reference to 'malloc'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_init_dtm: error: undefined reference to 'malloc'
/tmp/ccosywal.o:mbbio.f90:function __mbbio_MOD_init_dtm: error: undefined reference to 'malloc'
/tmp/ccPa8hS4.o:cca.f90:function cca_: error: undefined reference to 'pow'
/tmp/ccPa8hS4.o:cca.f90:function cca_: error: undefined reference to 'pow'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'sin'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'sin'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'pow'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'lroundf'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'lroundf'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'powf'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'lroundf'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'powf'
/tmp/cc3NwzxH.o:dsf.f90:function dsf_: error: undefined reference to 'lroundf'
/tmp/cc4kmEbV.o:facet.f90:function facet_: error: undefined reference to 'atan'
/tmp/ccCBz5WD.o:hg.f90:function hydraulicgeometry_: error: undefined reference to 'powf'
/tmp/ccCBz5WD.o:hg.f90:function hydraulicgeometry_: error: undefined reference to 'pow'
/tmp/ccCBz5WD.o:hg.f90:function hydraulicgeometry_: error: undefined reference to 'powf'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memcpy'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memset'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'log10f'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'log10f'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memcpy'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memset'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memcpy'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memset'
/tmp/ccTk9Cgl.o:mrbb_sr.f90:function rbb_: error: undefined reference to 'memcpy'
/tmp/ccQ5nJMG.o:bb2shp_sr.f90:function bb2shp_sr_: error: undefined reference to 'memmove'
/tmp/ccQ5nJMG.o:bb2shp_sr.f90:function bb2shp_sr_: error: undefined reference to 'memmove'
/tmp/ccfuXO0g.o:dbase.f90:function __dbf_MOD_set_field_reald: error: undefined reference to 'lround'
/tmp/ccfuXO0g.o:dbase.f90:function __dbf_MOD_findrecord: error: undefined reference to 'memcmp'
collect2: error: ld returned 1 exit status
streamer.f90:62:71:




