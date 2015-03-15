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


  # Select the column in the data file
  if (pollutant=="sulfate") {
    column <- 1
  } else if (pollutant=="nitrate") {
    column <- 2
  } else {
    print("Error: Unknown pollutant in pollutantmean")
    return
  }
      
  print(column)
  
  # for loop over all the files (all id's)


  # Ignore all the NA values

  # calculate the mean
 
  pollutantmean <- 1
}







