plot1 <- function(){
   
    
        #unzip("exdata-data-household_power_consumption.zip")
    
        tdata <- read.table("household_power_consumption.txt", header = TRUE,
                            sep = ";",  nrows = 3)
        classes <- sapply(tdata, class)
        mydata <- read.table("household_power_consumption.txt",
                             header = TRUE,sep = ";", na.strings = "?",
                              colClasses = classes, comment.char = "")
        mydata$tdate<-as.Date(strptime(as.character(mydata$Date),"%d/%m/%Y"))
        mydata<-mydata[mydata$tdate=="2007-02-01"|mydata$tdate=="2007-02-02",]
      

        ### show plot on screen
        par(mfrow = c(1,1))
        
        hist(as.numeric(mydata$Global_active),col = "red", breaks = 12,
             main =  "Global Active Power",xlab = "Global Active Power (kilowatts)")
        
        ### save file to png file
        png(filename = "plot1.png", width = 480, height = 480, units = "px")
        
        hist(as.numeric(mydata$Global_active),col = "red", breaks = 12,
             main =  "Global Active Power",xlab = "Global Active Power (kilowatts)")
        dev.off()
       

}