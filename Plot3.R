### Plot 3 - line estratified 
### (gráfico de linha estratificado por submedição de energia)

download.file(fileUrl,destfile="./data/household_power_consumption.zip")
# Unzip dataSet to /data directory (Extrair o arquivo zipado)
unzip(zipfile="./data/household_power_consumption.zip",exdir="./data")
file <- "./data/household_power_consumption.txt"
# (obter o arquivo)
database <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# (especificar datas a serem utilizadas no projeto)
specData <- database[database$Date %in% c("1/2/2007","2/2/2007") ,]

SubMet1 <- as.numeric(specData$Sub_metering_1)
SubMet2 <- as.numeric(specData$Sub_metering_2)
SubMet3 <- as.numeric(specData$Sub_metering_3)

concatenate <- paste(specData$Date, specData$Time, sep=" ")
weekDate <- strptime(concatenate, "%d/%m/%Y %H:%M:%S")

plot(weekDate, SubMet1, type = "l", xlab = " ", ylab = "Energy sub metering") 
lines(weekDate, SubMet2, type = "l", col = "red") 
lines(weekDate, SubMet3, type = "l", col = "blue") 
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()