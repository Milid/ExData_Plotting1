plot2 <- function(){
    
    
    
    #unzip("exdata-data-household_power_consumption.zip")
   
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

         
         plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
         
         })
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    
    ###save to screen
    with(mydata,{

        plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
       
    })
    dev.off()
    
    
}