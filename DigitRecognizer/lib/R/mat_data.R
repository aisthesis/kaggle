mat_data <- function(filename){
      ## given csv data, removes column names and 
      ## creates an mat_data.mat array
      ## uses R.matlab package

      temp_dataframe <- read.csv(filename)
      temp_matrix <- as.matrix(temp_dataframe)
      temp_matrix2 <- matrix(temp_matrix, ncol = ncol(temp_dataframe), dimnames = NULL)
      writeMat('mat_data', temp_matrix2 = temp_matrix2)
      
}