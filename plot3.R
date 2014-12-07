#download file and read data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "data.zip",  mode="wb")
f<-unzip("data.zip")
unzip("data.zip")
el_power<-read.table(file="household_power_consumption.txt", sep=";", header=T, dec=".", na.strings="?")
el_power$Date<-as.character(el_power$Date)
el_power$Time<-paste(as.character(el_power$Date), as.character(el_power$Time))
el_power<-el_power[which(el_power$Date=="1/2/2007" | el_power$Date=="2/2/2007"), ]
el_power$Date<-NULL
el_power$Time<-strptime(el_power$Time, format="%d/%m/%Y %H:%M:%S")

# make plot3
with(el_power, plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=""))
with(el_power, lines(Time, Sub_metering_1))
with(el_power, lines(Time, Sub_metering_2, col="red"))
with(el_power, lines(Time, Sub_metering_3, col="blue"))
legend("topright", col=c("black", "red", "blue"), legend=names(el_power)[6:8], lwd=1)
dev.copy(png, "Plot3.png", width = 480, height = 480)
dev.off()
