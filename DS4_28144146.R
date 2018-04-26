
#comments
install.packages("tidyverse")
library(tidyverse)

#how to move something from materials to portfolio (on git)
#cp ~/Documents/MICB425_materials/filename ~/Documents/MICB425_portfolio

#git reset --hard origin/master

#Load Data

read.table(file="Saanich.metadata.txt") 
metadata = read.table(file="Saanich.metadata.txt", header=TRUE, row.names=1, sep="\t", na.strings=("NAN"))


read.table(file="Saanich.OTU.txt") 
OTU = read.table(file="Saanich.OTU.txt", header=TRUE, row.names=1, sep="\t", na.strings=("NAN"))


#day 5
library(tidyverse)


metadata %>% 
  select(O2_uM)

#select variables wih 02 or oxygen in the name 
metadata %>%
  select(matches("02|oxygen"))

#filter rows (samples) where oxygen = 0
metadata %>%
  filter(O2_uM == 0)

#
metadata %>% 
  filter(O2_uM == 0) %>%
  select(Depth_m) 

#exercise 2 

library(tidyverse)

metadata %>% 
  select(matches("CH4|methane"))
#may want to use "CH4|methane|nM"

metadata %>%
  select(matches("temp"))

#variables are CH4_nM and Temperature_C

#filter for rows where methane is greater than 100 and temperature is less than 10C 
#instead of & use "," or just list each filter seperately 
metadata %>% 
  filter(CH4_nM > 100 & Temperature_C < 10) %>%
  select(Depth_m, CH4_nM, Temperature_C)

#take my N20 variable which is in nM and change it into uM (nM/1000)
table = metadata %>% 
  mutate(N2O_uM = N2O_nM/1000) %>%
select(N2O_uM, N2O_nM)

#homework convert all variables that in nM to uM. 
#Output a tables showing only the original nM and converted uM variables 

table1 = metadata %>%
  mutate(CH4_uM = CH4_nM/1000) %>%
  mutate(N2O_uM = N2O_nM/1000) %>%
select(CH4_uM, CH4_nM, N2O_uM, N2O_nM)