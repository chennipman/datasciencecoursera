corr <- function(directory, threshold = 0, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  correlations <- vector(mode="numeric")
  
  # for loop over all the files (all id's)
  for(i in id) {
    # make filenumber a string with leading zero's 
    i_format <- formatC(i, width = 3, flag = "0")
    
    # create filepath
    filepath = paste(directory,"/",i_format,".csv", sep="")
    
    # read csv file
    frame <- read.csv(filepath)
    
    # select non NA pollutant data to the data frame
    sulfate_na <- is.na(frame[["sulfate"]])
    nitrate_na <- is.na(frame[["nitrate"]])
    observations <- !sulfate_na & !nitrate_na
    nobs <- sum(observations==TRUE)
    
    if(nobs>threshold) {
      # calculate the correlations
      sulfate <- frame[observations, "sulfate"]
      nitrate <- frame[observations, "nitrate"]
      correlation <- cor(sulfate, nitrate )
      
      # append correlation to the vector
      correlations <- c(correlations, correlation)
    }
  }
  correlations
}