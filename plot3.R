download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./homework.zip")


top5 <- read.table(unz("./homework.zip","household_power_consumption.txt"),header = TRUE, nrows = 5,sep=";",stringsAsFactors = FALSE)
classes <- sapply(top5, class)
PowerConsumption <- read.table(unz("./homework.zip","household_power_consumption.txt"),sep=";",header=TRUE,stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
FebPowerConsumption <- PowerConsumption[grepl("^[12]/2/2007",PowerConsumption$Date ),]
FebPowerConsumption$Date <- as.Date(FebPowerConsumption$Date, format("%d/%m/%Y") )

png(filename="./plot3.png", width=480, height=480)
plot( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="" )
lines( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_2, type="l",col="red" )
lines( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_3, type="l",col="blue" )
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1,lwd=1)
dev.off()