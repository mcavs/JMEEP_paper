# An Effect Analysis of the Balancing Techniques on the Counterfactual Explanations of Student Success Prediction Models

This repository consists the supplemental materials of the paper "An Effect Analysis of the Balancing Techniques on the Counterfactual Explanations of Student Success Prediction Models" which is submitted to [Journal of Measurement and Evaluation in Education and Psychology](https://dergipark.org.tr/en/pub/epod).

The following steps can be runned to reproduce the result in the paper:

1. Install the essential packages [install_packages.R](https://github.com/mcavs/JMEEP_paper/blob/main/install_packages.R)
2. Import the dataset [data_import.R](https://github.com/mcavs/JMEEP_paper/blob/main/import_dataset.R)
3. Preprocess the imported dataset [data_preprocess.R](https://github.com/mcavs/JMEEP_paper/blob/main/data_preprocessing.R)
4. Split the dataset as train and test set [data_splitting.R](https://github.com/mcavs/JMEEP_paper/blob/main/data_splitting.R)
5. Balance the train set [data_splitting.R](https://github.com/mcavs/JMEEP_paper/blob/main/balancing.R)
6. Train the models on the train set [modeling.R](https://github.com/mcavs/JMEEP_paper/blob/main/modeling.R)
7. Train the tuned models in terms of hyperparameters [tuned_models.R](https://github.com/mcavs/JMEEP_paper/blob/main/tuned_models.R)
8. Generate counterfactuals using the MOC method [moc_generate.R](https://github.com/mcavs/JMEEP_paper/blob/main/moc_generate.R)
9. Generate counterfactuals using the NICE method based on proximity [nicepr_generate.R](https://github.com/mcavs/JMEEP_paper/blob/main/nicepr_generate.R)
10. Generate counterfactuals using the NICE method based on sparsity [nicesp_generate.R](https://github.com/mcavs/JMEEP_paper/blob/main/nicesp_generate.R)
11. Generate counterfactuals using the WI method [wi_generate.R](https://github.com/mcavs/JMEEP_paper/blob/main/wi_generate.R)
    
13. Combine the evaluation metrics on the generated counterfactuals [combine_evals.R](https://github.com/mcavs/JMEEP_paper/blob/main/combine_evals.R)
14. Summarize the results in plots [plot.R](https://github.com/mcavs/JMEEP_paper/blob/main/plot.R)
15. Conduct the statistical hypothesis tests on the results [test.R](https://github.com/mcavs/JMEEP_paper/blob/main/test.R)

The steps above can be runned simply as in [RunAll.R](https://github.com/mcavs/JMEEP_paper/blob/main/RunAll.R)
  
## Data 
We used the Open University Learning Analytics dataset - information about 22 courses, 32,593 students, their assessment results, and logs of their interactions with the virtual learning environment. It is collected in the Open University from 2013 and 2014. We followed the same way in the variable and data selection in [Ramos et al. (2023)](https://doi.org/10.1002/widm.1479). We used the dataset for a STEM course, named `FFF` in the original data source, conducted in 2013 with 2,283 students. It consists of 14 predictors, 6 of which are categorical variables encoded numerically given in the following table. The target is a binary variable `status` consisting of `pass` and `fail`. It is converted from the `score` variable in the original dataset which ranges between 0 and 100. A score lower than 40 is coded as a `fail`.

| Variable                | Description                                                                         | Class        | Values          |
|-------------------------|-------------------------------------------------------------------------------------|--------------|-----------------|
| final_result            | student’s final exam result                                                         | categorical  | {Fail, Pass}    |
| week_minus4             | the number of clicks four  weeks before the course starts                           | numeric      | [0, X]          |
| week_minus3             | the number of clicks three weeks before the course starts                           | numeric      | [0, X]          |
| week_minus2             | the number of clicks two weeks before the course starts                             | numeric      | [0, X]          |
| week_minus1             | the number of clicks one week before the course starts                              | numeric      | [0, X]          |
| week_0                  | the number of clicks before the course starts                                       | numeric      | [0, X]          |
| week_1                  | the number of clicks one week after the course starts                               | numeric      | [0, X]          |
| ...                     | ...                                                                                 | ...          | ...             |
| week_37                 | the number of clicks thirty-seven weeks after the course starts                     | numeric      | [0, X]          |


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


