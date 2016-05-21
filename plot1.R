download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./homework.zip")


top5 <- read.table(unz("./homework.zip","household_power_consumption.txt"),header = TRUE, nrows = 5,sep=";",stringsAsFactors = FALSE)
classes <- sapply(top5, class)
PowerConsumption <- read.table(unz("./homework.zip","household_power_consumption.txt"),sep=";",header=TRUE,stringsAsFactors = FALSE, colClasses = classes,na.strings = "?")
FebPowerConsumption <- PowerConsumption[grepl("^[12]/2/2007",PowerConsumption$Date ),]

png(filename="./plot1.png", width=480, height=480)
hist(FebPowerConsumption$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()