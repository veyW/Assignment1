#download file and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip",  mode="wb")
f<-unzip("data.zip")
unzip("data.zip")
el_power<-read.table(file="household_power_consumption.txt", sep=";", header=T, dec=".", na.strings="?")
el_power$Time<-paste(as.character(el_power$Date), as.character(el_power$Time))
el_power$Time<-format(strptime(el_power$Time, format="%d/%m/%Y %H:%M:%S"), usetz=F)
el_power$Date<-as.character(el_power$Date)
el_power<-el_power[which(el_power$Date=="1/2/2007" | el_power$Date=="2/2/2007"), ]
el_power$Date<-NULL

# make plot1
hist(el_power$Global_active_power, col="red", main="Global active power", xlab="global active power (kw)")
dev.copy(png, "Plot1.png", width = 480, height = 480)
dev.off()
