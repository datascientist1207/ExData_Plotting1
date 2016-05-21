download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./homework.zip")


top5 <- read.table(unz("./homework.zip","household_power_consumption.txt"),header = TRUE, nrows = 5,sep=";",stringsAsFactors = FALSE)
classes <- sapply(top5, class)
PowerConsumption <- read.table(unz("./homework.zip","household_power_consumption.txt"),sep=";",header=TRUE,stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
FebPowerConsumption <- PowerConsumption[grepl("^[12]/2/2007",PowerConsumption$Date ),]
FebPowerConsumption$Date <- as.Date(FebPowerConsumption$Date, format("%d/%m/%Y") )

png(filename="./plot4.png", width=480, height=480)
par(mfcol=c(2,2))
#topleft graph
plot( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="" )


#bottomleft graph
#par("cex') needed to be modified as the legend covered up the graph on my system
SexVariable <- par("cex")
par(cex=.75)
plot( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="" )
lines( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_2, type="l",col="red" )
lines( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ), FebPowerConsumption$Sub_metering_3, type="l",col="blue" )
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"),lty=1,lwd=1)
par(cex=SexVariable)

#topright graph
plot( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ),FebPowerConsumption$Voltage, ylab="Voltage", xlab="datetime", type="l" ) 

#bottomright graph
plot( strptime( paste0(FebPowerConsumption$Date, " ", FebPowerConsumption$Time ),format="%Y-%m-%d %H:%M:%S" ),FebPowerConsumption$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l" ) 
dev.off()
