plot3 <- function(){
    
    
    
    #data <- read.table(unzip("exdata-data-household_power_consumption.zip"))
    tdata <- read.table("household_power_consumption.txt", header = TRUE,
                        sep = ";",  nrows = 3)
    classes <- sapply(tdata, class)
    mydata <- read.table("household_power_consumption.txt",
                         header = TRUE,sep = ";", na.strings = "?",
                         colClasses = classes, comment.char = "")
    
    mydata$tdate<-as.Date(strptime(as.character(mydata$Date),"%d/%m/%Y"))
    mydata<-mydata[mydata$tdate=="2007-02-01"|mydata$tdate=="2007-02-02",]
    mydata$datetime<-strptime(paste(as.character(mydata$tdate),mydata$Time),"%Y-%m-%d %H:%M:%S")
    ###show plot on screen
    with(mydata,{
       
        
        plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = "")
        lines(datetime,Sub_metering_2,col = "red")
        lines(datetime,Sub_metering_3,col = "blue")
        legend( "topright",
               legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
               col=c("black","red","blue"), lwd=1)
    })
    ###save to png file
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    with(mydata,{
        
        
        plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering", xlab = "")
        lines(datetime,Sub_metering_2,col = "red")
        lines(datetime,Sub_metering_3,col = "blue")
        legend( "topright",
                legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
                col=c("black","red","blue"), lwd=1)
    })
    
    
    dev.off()
    
    
}