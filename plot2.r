library(data.table)
setwd("E:\\DataScience Specialization\\course4\\A1\\ExData_Plotting1")

DT <- fread("./household_power_consumption.txt", 
            select = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
            colClasses = list(date = c("Date"),
                              time = c("Time"),
                              numeric = c("Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
            ),
            dec=".", na.strings=c("?") )

ds <- subset(DT, as.Date(DT$Date,"%d/%m/%Y") >=as.Date("01/02/2007","%d/%m/%Y") & as.Date(DT$Date,"%d/%m/%Y") <=as.Date("02/02/2007","%d/%m/%Y"))


png("plot2.png", width = 480, height = 480, bg = "white")


ds[,DateTime:=(as.POSIXct(paste(ds$Date, ds$Time), format="%d/%m/%Y %H:%M:%S"))]
plot(ds$Global_active_power~ds$DateTime, type="n", main="", ylab="Global Active Power (kilowatts)",xlab ="")
lines(ds$Global_active_power~ds$DateTime) 


dev.off()