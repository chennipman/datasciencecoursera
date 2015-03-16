complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  all_nobs <- data.frame(matrix(ncol=2, nrow=length(id)))
  colnames(all_nobs) <- c("id", "nobs")
  
  # for loop over all the files (all id's)
  for(j in seq_along(id)) {
    i <- id[j]
    # make filenumber a string with leading zero's 
    i_format <- formatC(i, width = 3, flag = "0")
    
    # create filepath
    filepath = paste(directory,"/",i_format,".csv", sep="")
    
    # read csv file
    frame <- read.csv(filepath)
    
    # count nobs
    sulfate_na <- is.na(frame[["sulfate"]])
    nitrate_na <- is.na(frame[["nitrate"]])
    observations <- !sulfate_na & !nitrate_na
    nobs <- sum(observations==TRUE)
    print(nobs)  
    all_nobs[j,"id"] <- i
    all_nobs[j,"nobs"] <- nobs
    }
all_nobs
}
