best <- function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate

  
  ## Read outcome data
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
    
  if (outcome == "heart attack"){
    print("heart attack")
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } 

  if (outcome == "heart failure"){
    print("heart failure")
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } 
  
  if (outcome == "pneumonia"){
    print("pneumonia")
    column_name <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } 
  
  
  
}