## Exercise US.Oil Productions
#read thedata
library(readxl)
USOIL <- read_excel("D:/ProjectAR/R Studio/Input Data/allyearsstates.xls", sheet = "ALL_STATES_ALL_YRS_BOE")

#data visualization
library(dplyr)
library(ggplot2)

## data processing
ave.state <- USOIL %>% group_by(state)%>% summarise(total.oil=sum(oil_prod_BBL), 
                                                    total.gas=sum(ADgas_prod_MCF), 
                                                    total.condensate=sum(conden_prod_BBL), 
                                                    oilwell.count=sum(num_oil_wells), 
                                                    gaswell.count=sum(num_gas_wells)) %>%head (10)


ggplot() +  ggtitle('Oil average per state') + ylab('STB') + xlab('State') +
  geom_point( data = ave.state, aes(state, aver), colour = '#7FFF00')

ggplot(data = ave.state, aes(x=state, y=total.oil)) + 
  geom_bar(stat="identity", width=0.5, fill="#69b3a2")  + ggtitle("Average Production per-state") + theme_bw()

