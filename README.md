# Template for writing a paper using overleaf

Writing a technical statistics/data science paper consists of two major tasks. 

1) Processing the data, modeling, and generating figures from the analysis.
2) Writing the document for publication. 

While this is a gross oversimplification, managing these steps are important for creating a reproducible workflow. This repository provides a workflow for managing a applied statisitcal analysis project using RStudio projects and Overleaf.

# File structure

This repository has the following file structure. This can be modified for your own needs, but this is a good starting point.

    .
    ├── R                       # R scripts and functions
    ├── data                    # A folder that contains the raw data (depending on the project, this may or may not be pushed to gitHub)
    ├── figures                 # Figures from the analysis
    ├── results                 # Results and intermediate files for the analysis (typically these will NOT be pushed to gitHub)
    ├── manuscript              # Files for the creation of the Overleaf manuscript
    ├── paper-template.Rproj    # A Rstudio project file (change the name to match your project
    ├── .gitignore              # The ignore file for the gitHub repository
    └── README.md
    
The raw data are to be placed in the data folder. While there is much written about data management, DO NOT edit the files in `data/` by hand. If there are changes/processing of the data that needs to be done, save the results of these changes in the `results/` folder.

The `R` folder contains `.R` files and scripts for the analysis. The output of these scripts gets saved in the `figures/` folder (if the output is a figure) and the `results/` folder if the output of the script is post-processed data or, tables in latex format (the output of either the `kable()` or `xtable()` packages).

The folder `manuscript/` contains the latex files for the document on Overleaf (and also associated `.cls` and `.sty` files for the target journal). 

The file `paper-template.Rproj` is an RStudio project file and can be renamed given your project and the `README.md` is this description file for the project which should be modified to give instructions on your specific implementation of the workflow.

# The analysis workflow

For this template, it is assumed that you are using an RStudio project-oriented workflow. Other workflows work (e.g., python and julia based workflows) and the template can be modified if needed.





# The overleaf workflow

The workflow on Overleaf can be viewed at https://www.overleaf.com/read/cqpdrnpvqktj

