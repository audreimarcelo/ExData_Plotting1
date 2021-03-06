### Plot 2 - time series plot
### (gr�fico de linha para Global_active_power)

download.file(fileUrl,destfile="./data/household_power_consumption.zip")
# Unzip dataSet to /data directory (Extrair o arquivo zipado)
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")
file <- "./data/household_power_consumption.txt"
# (obter o arquivo)
database <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# (especificar datas a serem utilizadas no projeto)
specData <- database[database$Date %in% c("1/2/2007","2/2/2007") ,]

GlobActPw <- as.numeric(specData$Global_active_power)

concatenate <- paste(specData$Date, specData$Time, sep=" ")
weekDate <- strptime(concatenate, "%d/%m/%Y %H:%M:%S")

plot(weekDate, GlobActPw, type = "l", xlab = " ", 
     ylab = "Global Active Power (kilowatts)") 

dev.copy(png, file = "Plot2.png", width = 480, height = 480)
dev.off()