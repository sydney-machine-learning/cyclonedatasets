
Cycl <- read.table("https://raw.githubusercontent.com/sydney-machine-learning/cyclonedatasets/main/SouthernHemisJTWC_Rawdata/southern_hemisphere_1982-2019.csv",
                   sep = ",", fill = T)

#write.csv(Cycl, "cycl_data.csv")

Data_clean <- read.csv("cycl_data.csv")
str(Data_clean)

Data_clean$lon <-substring(Data_clean$V8, 1,5)
Data_clean$lat <-substring(Data_clean$V7, 1,4)

Data_clean$lon_tenth <- as.numeric(Data_clean$lon) / 10
Data_clean$lat_tenth <- as.numeric(Data_clean$lat) / 10

library(dplyr)

SI <- filter(Data_clean, lon_tenth <= 135)
SP <- filter(Data_clean, lon_tenth > 135)

#SEI <- SI %>%
  #select(lon_tenth) %>%
  #filter(between(lon_tenth,90,135))

write.csv(SP, "South_pacific_hurricane.csv")
write.csv(SI,"South_indian_hurricane.csv")
getwd()


# as.numeric(Sp_dat$Speed.knots)
# #Sp_dat$bin <- ifelse(Sp_dat$Speed.knots < - 25,"NA", "Cat 0")
# 
# 
# 
# Sp_dat$Bin.Category <- ifelse(Sp_dat$Speed.knots >= 2,"Extremely Wet", NA)
# Sp_dat$Bin.Category <- ifelse(Sp_dat$Speed.knots >= 1.5 & Sp_dat$Speed.knots. < 2,"Very Wet", NA)
# Sp_dat$Bin.Category <- ifelse(Sp_dat$Speed.knots < -1,"moderate drought","non-drought")
# 
# Sp_dat[Sp_dat$Speed.knots >= 107,]$Bin.Category <- 'Cat 5'
# Sp_dat[Sp_dat$Speed.knots >= 86 & Sp_dat$Speed.knots < 107,]$Bin.Category <- 'Cat 4'
# Sp_dat[Sp_dat$Speed.knots >= 64 & Sp_dat$Speed.knots < 85,]$Bin.Category <- 'Cat 3'
# Sp_dat[Sp_dat$Speed.knots >= 48 & Sp_dat$Speed.knots < 63,]$Bin.Category <- 'Cat 2'
# Sp_dat[Sp_dat$Speed.knots > 34 & Sp_dat$Speed.knots <= 47,]$Bin.Category <- 'Cat 1'
# Sp_dat[Sp_dat$Speed.knots > 17 & Sp_dat$Speed.knots <= 33,]$Bin.Category <- 'Cat 0'
# Sp_dat[Sp_dat$Speed.knots <= 33]$Bin.Category <- 'Cat 0'
# 
# boxplot(Sp_dat~Bin.Category, data = Sp_dat)
# 
# 
