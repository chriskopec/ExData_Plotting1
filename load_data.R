url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
zipfile <- 'household_power_consumption.zip'
datafile <- "household_power_consumption.txt"
project_data_file <- 'project_data.rds'

if(!file.exists(zipfile)) {
  download.file(url, zipfile)
}

if(!file.exists(project_data_file)) {
  data <- read.table(unz(zipfile, datafile), header=TRUE, sep=";", 
                     colClasses=c("character", "character", rep("numeric",7)), na="?")
  data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  date_range <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  data <- subset(data, Date %in% date_range)
  
  saveRDS(data, project_data_file)
  
} else {
  data <- readRDS(project_data_file)
}
