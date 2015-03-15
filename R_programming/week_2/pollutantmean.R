pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)

  all_pol <- vector(mode = "numeric")

  # for loop over all the files (all id's)
  for(i in id) {
    # make filenumber a string with leading zero's 
    i_format <- formatC(i, width = 3, flag = "0")

    # create filepath
    filepath = paste(directory,"/",i_format,".csv", sep="")
    
    # read csv file
    frame <- read.csv(filepath)

    # add non NA pollutant data to the vector
    only_pol <- frame[[pollutant]]
    pol <- only_pol[!is.na(only_pol)]
    all_pol <- c(all_pol,pol)
  }
  
  pollutantmean <- mean(all_pol)
}

