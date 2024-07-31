# An Effect Analysis of the Balancing Techniques on the Counterfactual Explanations of Student Success Prediction Models

This repository consists the supplemental materials of the paper "An Effect Analysis of the Balancing Techniques on the Counterfactual Explanations of Student Success Prediction Models" which is submitted to [Journal of Measurement and Evaluation in Education and Psychology](https://dergipark.org.tr/en/pub/epod).

The following steps can be runned to reproduce the result in the paper:

1. Install the essential packages [install_packages.R](https://github.com/mcavs/JMEEP_paper/blob/main/install_packages.R)
2. Import the dataset [data_import.R](https://github.com/mcavs/JMEEP_paper/blob/main/data_import.R)
3. Preprocess the imported dataset [data_preprocess.R](https://github.com/mcavs/JMEEP_paper/blob/main/data_preprocess.R)
4. Split the dataset as train and test set [data_splitting.R](https://github.com/mcavs/JMEEP_paper/blob/main/data_splitting.R)
5. Train the model on the train set [modeling.R](https://github.com/mcavs/JMEEP_paper/blob/main/modeling.R)
6. Generate counterfactuals using the MOC method [modeling_with_ranger.R](https://github.com/mcavs/JMEEP_paper/blob/main/MOC.R)
7. Generate counterfactuals using the NICE method based on proximity [NiCE_pr.R](https://github.com/mcavs/JMEEP_paper/blob/main/NiCE_pr.R)
8. Generate counterfactuals using the NICE method based on sparsity [NiCE_sp.R](https://github.com/mcavs/JMEEP_paper/blob/main/NiCE_sp.R)
9. Generate counterfactuals using the WI method [WhatIf.R](https://github.com/mcavs/JMEEP_paper/blob/main/WhatIf.R)
10. Combine the evaluation metrics on the generated counterfactuals [combine_evals.R](https://github.com/mcavs/JMEEP_paper/blob/main/combine_evals.R)
11. Summarize the results in plots [plot.R](https://github.com/mcavs/JMEEP_paper/blob/main/plot.R)
12. Conduct the statistical hypothesis tests on the results [test.R](https://github.com/mcavs/JMEEP_paper/blob/main/test.R)

The steps above can be runned simply as in [RunAll.R](https://github.com/mcavs/JMEEP_paper/blob/main/RunAll.R)
  
## Data 
We used the Open University Learning Analytics dataset - information about 22 courses, 32,593 students, their assessment results, and logs of their interactions with the virtual learning environment. It is collected in the Open University from 2013 and 2014. We followed the same way in the variable and data selection in [Ramos et al. (2023)](https://doi.org/10.1002/widm.1479). We used the dataset for a STEM course, named `FFF` in the original data source, conducted in 2013 with 2,283 students. It consists of 14 predictors, 6 of which are categorical variables encoded numerically given in the following table. The target is a binary variable `status` consisting of `pass` and `fail`. It is converted from the `score` variable in the original dataset which ranges between 0 and 100. A score lower than 40 is coded as a `fail`.

| Variable                | Description                                                                         | Class        | Values          |
|-------------------------|-------------------------------------------------------------------------------------|--------------|-----------------|
| gender                  | student’s gender                                                                    | categorical  | {0, 1}          |
| region                  | the geographic region, where the student lived while taking the module presentation | categorical  | {1, 2, ..., 13} |
| education               | the highest student education level on entry to the module presentation             | categorical  | {1, 2, ..., 5}  |
| imd_band                | the IMD band of the place where the student lived during the module presentation    | categorical  | {1, 2, ..., 10} |
| age_band                | a band of student’s age                                                             | categorical  | {1, 2, 3}       |
| num_of_prev_attempts    | the number of how many times the student has attempted this module                  | numeric      | [0, 4]          |
| credits                 | the total number of credits for the modules the student is currently studying       | numeric      | [60, 360]       |
| disability              | indicates whether the student has declared a disability                             | categorical  | {0, 1}          |
| assessment_results      | the weighted sum of all previous assessments                                        | numeric      | [24.25, 72.75]  |
| n\_clicks\_disc\_forum  | the number of clicks on discussion forum                                            | numeric      | [0, 7670]       |
| n\_clicks\_disc\_hpage  | the number of clicks on discussion homepage                                         | numeric      | [4, 3150]       |
| n\_clicks\_assignments  | the number of clicks on assignments                                                 | numeric      | [0, 7193]       |
| n\_clicks\_quizzes      | the number of clicks on quizzes                                                     | numeric      | [0, 4857]       |
| n\_clicks\_course\_page | the number of clicks on course page                                                 | numeric      | [0, 1196]       |

The dataset given in `data/FFF_2013J_data.csv`. It can be prepared using the .Rmd file `data/data_preparation.Rmd`.


## Results

The generated counterfactuals by each method and their quality criteria are stored in `eval_files` folder. The files in this folder created in Steps 6-9 above.


## Plots
There are two plots `Figures 3` and `4` in the paper. 

You can used pre-saved experiments results in the files `data_rashomon.csv` and `data_VDisc.csv` if you do not have enough computation power to re-run the experiments.


### Figure 3
The averages of the quality metrics for the methods.

<img src="https://github.com/mcavs/HEXED2024_paper/blob/main/Plots/plot1.png" width="800">

Run [plot.R](https://github.com/mcavs/HEXED2024_paper/blob/main/plot.R) to reproduce `Figure 3`.


### Figure 4 
The distributions of the quality metrics for the methods

<img src="https://github.com/mcavs/HEXED2024_paper/blob/main/Plots/plot2.png" width="800">

Run [plot.R](https://github.com/mcavs/HEXED2024_paper/blob/main/plot.R) to reproduce `Figure 4`.


