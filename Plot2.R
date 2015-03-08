
#import data loading, etc. utility functions
source('utility.R')

#This function carries out the plotting of graph 2. 
plot2 <- function(pngDevice, ylab='Global Active Power (kilowatts)'){
    print('Running plot2')
    
    data <- getData()
    
    #if a new png is requested, open a new png device.
    if(pngDevice){
        dir.create('out', showWarnings='F')
        png('out/plot2.png', width=480, height=480, bg='transparent')
    }
    
    #do the plot
    with(data, {
        plot(DateTime, Global_active_power, type='l', xlab='', ylab=ylab)
    })
    
    #if a new png was created, dispose of it, which saves the file.
    if(pngDevice){
        dev.off()
    }
}

#if plotting is not disabled, carry out the plot.
if(!disablePlottingToFile){
    plot2(T)
}