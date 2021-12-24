# Template for writing a paper using overleaf

This repository outlines a workflow for writing a paper in a reproducible manner using `R` and Overleaf. This workflow is useful in enabling efficient collaboration between co-authors and provides a fully reproducible analysis. 

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

For this template, it is assumed that you are using an RStudio project-oriented workflow. Other workflows work (e.g., python and julia based workflows) and the template can be modified if needed. It is good practice to name the files in the order in which they need to be run in order to reproduce the analysis. For example, the workflow files are in the `R/` folder and consist of two primary files: `01-process-data.R` and `02-analysis.R`. In general, the template workflow is divided into two major steps: 1) loading and processing the data and 2) performing the statistical analyses. Because the data processing step is needed before the analysis step, the files start with `01-` and `02-` in order to specify the order in which to execute the files.

## Loading and processing the data

In any analysis, it is **critical** that one does not modify the original data. A lot of work, time, effort, and money went into collecting the data and it is important to have a workflow that preseves the integrity of the data. The file `01-process-data.R` loads the raw data from a file (the file `data/brewing-material.csv` from the [tidy tuesday gitHub repository](https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-03-31/readme.md)) and does some example pre-processing before saving the results in the file `results/brewing_materials_2009-2014.csv`. This is an important step in any analysis because one **should not** modify the raw data directly. 

## Performing the analyses

The statistical analyses are at the heart of the paper. As such, there can be one or more files in the analysis workflow. For this example, there is only a single analysis file. In the file `02-analysis.R`, there are examples of generating figures and latex tables that can then be included in the main latex paper. 


## Other workflows

While the workflow described in this template is useful, it is also basic and not very sophisticated. For a more sophisticated workflow, the [`drake` package](https://books.ropensci.org/drake/) is recommended.


# The writing workflow using Overleaf


The Overleaf project can be [viewed here](https://www.overleaf.com/read/cqpdrnpvqktj)

