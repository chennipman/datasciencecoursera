best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  ## Read data from input file
  data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")

  # list all states
  all_states <- unique(data$State)
  
  ## check inputparameters
  # check if state is in the file
  if (!(state %in% all_states)){
    stop("invalid state")
  }
  
  # check outcome
  all_diseases <- c("heart attack", "heart failure","pneumonia")
  if (!all(outcome %in% all_diseases)) {
    print(outcome)
    stop("invalid outcome")
  }
  
  # Select the relevant column
  if (outcome == "heart attack"){
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } 

  if (outcome == "heart failure"){
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } 
  
  if (outcome == "pneumonia"){
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } 
  
  # Pick the best hospital
  lowest_mortality_rate <- min(data[,column_name])
  low_mortality_hospitals <- data[data[,column_name]==lowest_mortality_rate,"Hospital.Name"]
  # sort the hosipitals on alphabetical order
  low_mortality_hospitals <- sort(low_mortality_hospitals)
  # select the first of the alphabetical sorted list
  return(low_mortality_hospitals[1])
  
  
}