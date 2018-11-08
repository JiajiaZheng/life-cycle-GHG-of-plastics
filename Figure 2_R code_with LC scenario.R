library(readxl)
scenarios <- read_excel("C:/Users/jzheng/Box/Suh's lab/GSRs/Jiajia/Calculations/scenarios.xlsx")
# View(scenarios)


###################################################### Figure 2 left panel ###########################################################
year <- scenarios$Year
p_aver <- scenarios$Petro_average
p_inci <- scenarios$Petro_incineration
p_recy <- scenarios$Petro_recycling
c_aver <- scenarios$Corn_average
c_comp <- scenarios$Corn_composting
c_recy <- scenarios$Corn_recycling
s_aver <- scenarios$Sugarcane_average
s_comp <- scenarios$Sugarcane_composting
s_recy <- scenarios$Sugarcane_recycling

library(ggplot2)

f2a <- ggplot(data=scenarios, aes(x=year), size = 0.8) +
  geom_line(aes(y=p_aver, color="p_aver", lty = "p_aver"), size = 0.8) +
  geom_line(aes(y=c_aver, color="c_aver", lty = "c_aver"), size = 0.8) +
  geom_line(aes(y=s_aver, color="s_aver", lty = "s_aver"), size = 0.8) +    
  # geom_line(aes(y=p_inci, color="p_inci", lty = "p_inci"), size = 0.8) +
  # geom_line(aes(y=c_comp, color="c_comp", lty = "c_comp"), size = 0.8) +
  # geom_line(aes(y=s_comp, color="s_comp", lty = "s_comp"), size = 0.8) +
  # geom_line(aes(y=p_recy, color="p_recy", lty = "p_recy"), size = 0.8) +
  # geom_line(aes(y=c_recy, color="c_recy", lty = "c_recy"), size = 0.8) +
  # geom_line(aes(y=s_recy, color="s_recy", lty = "s_recy"), size = 0.8) +
  scale_color_manual(name="scenario", values = c("p_inci"="#E74C3C","p_aver"="#E74C3C","c_comp"="#F1C40F",
                                                 "c_aver"="#F1C40F","s_comp"="#27AE60","s_aver"="#27AE60",
                                                 "p_recy"="#E74C3C","c_recy"="#F1C40F","s_recy"="#27AE60"),
                     breaks=c("p_inci", "p_aver", "c_comp", "c_aver", "s_comp",
                              "s2aver", "s1recy", "c_recy", "s_recy")) +
  scale_linetype_manual(name="scenario", values =c("p_inci"=3,"p_aver"=1, "c_comp"=3,"c_aver"=1,
                                                   "s_comp"=3, "s_aver"=1, "p_recy"=2, "c_recy"=2,"s_recy"=2),
                        breaks=c("p_inci", "p_aver", "c_comp", "c_aver","s_comp",
                                 "s_aver","p_recy","c_recy", "s_recy")) +  
  scale_x_continuous(breaks = seq(2015, 2050, 5), expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0, 8200, 2000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                     limits = c(0, 8200), expand = c(0, 0))

f2a <- f2a + geom_ribbon(aes(x=year, ymin = p_recy, ymax = p_inci), fill = "#E74C3C", alpha = 0.2) +
  geom_ribbon(aes(x=year, ymin=c_recy, ymax = c_comp), fill = "#F1C40F", alpha = 0.2) +
  geom_ribbon(aes(x=year, ymin=s_recy, ymax = s_comp), fill = "#27AE60", alpha = 0.2)

f2a <- f2a + theme_bw() + 
  labs(x = "Year", y = expression("Life cycle GHG emissions (Mt "*"CO"[2]*"eq)")) +
  theme(axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        axis.text.x = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0, 
                                   margin = margin(t = 8, b = 8)),
        axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                   margin = margin(r = 8)), 
        legend.position = "none",
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.15, "cm"), plot.margin = unit(c(0.8, 0.6, 0.8, 0.4), "cm"))

f2a <- f2a + annotate("rect", xmin = 2015, xmax = 2035.5, ymin = 7300, ymax = 8200, fill="white") +
  annotate("text", size = 5, x = 2021, y = 7700, label="Petroleum-based", hjust=0) +
  annotate("text", size = 5, x = 2021, y = 7200, label="Corn-based", hjust=0) +
  annotate("text", size = 5, x = 2021, y = 6700, label="Sugarcane-based", hjust=0) +
  # annotate("text", size = 5, x = 2019.3, y = 8200, label="Incineration/composting", hjust=0) +
  # annotate("text", size = 5, x = 2019.3, y = 7800, label="Average EoL method mix", hjust=0) +
  # annotate("text", size = 5, x = 2019.3, y = 7400, label="Recycling", hjust=0) +
  annotate("rect", xmin = 2016.5, xmax = 2020.5, ymin = 7580, ymax = 7820, color= "#E74C3C", fill="#E74C3C", alpha = 0.5) +
  annotate("rect", xmin = 2016.5, xmax = 2020.5, ymin = 7080, ymax = 7320, color= "#F1C40F",  fill="#F1C40F", alpha = 0.5) +
  annotate("rect", xmin = 2016.5, xmax = 2020.5, ymin = 6580, ymax = 6820, color="#27AE60", fill="#27AE60", alpha = 0.5)
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9800, yend = 9800), color="#E74C3C", lwd = 1) +
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9400, yend = 9400), color="#F1C40F", lwd = 1) +
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9000, yend = 9000), color="#27AE60", lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 8200, yend = 8200), color="black", lty = 3, lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 7800, yend = 7800), color="black", lty = 1, lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 7400, yend = 7400), color="black", lty = 2, lwd = 1)


# Side bar of Figure 2 left panel

f2a_sidedf <- data.frame(parameter = c("min","median","max"), petroleum = c(4954, 7182, 9225), corn = c(4678, 5995, 7288), 
                      sugarcane = c(4092, 4912, 5815))

f2a_sidebar <- ggplot(f2a_sidedf) +
  # geom_rect(data=f2a_sidedf, mapping = aes(xmin=0.35, xmax=0.6, ymin=4954, ymax=9225), 
  #           color="black", fill="#E74C3C", alpha=0.15) +
  # geom_rect(data=f2a_sidedf, mapping = aes(xmin=0.9, xmax=1.15, ymin=4678, ymax=7288),
  #           color="black", fill="#F1C40F", alpha=0.15) +
  # geom_rect(data=f2a_sidedf, mapping = aes(xmin=1.45, xmax=1.7, ymin=4092, ymax=5815),
  #           color="black", fill="#27AE60", alpha=0.15) +
  geom_segment(mapping = aes(x = 0.41, xend = 0.41, y = 4954, yend = 7969), size=0.6, color="#E74C3C") +  
  geom_point(mapping = aes(x = 0.41, y = 7969), shape = 17, color="#E74C3C") +
  geom_point(mapping = aes(x = 0.41, y = 4954), shape = 15, color="#E74C3C") +
  geom_point(mapping = aes(x = 0.41, y = 6554), color="#E74C3C") +
  
  geom_segment(mapping = aes(x = 1.01, xend = 1.01, y = 4644, yend = 7254), size=0.6, color="#F1C40F") +  
  geom_point(mapping = aes(x = 1.01, y = 7254), shape = 17, color="#F1C40F") +
  geom_point(mapping = aes(x = 1.01, y = 4644), shape = 15, color="#F1C40F") +
  geom_point(mapping = aes(x = 1.01, y = 5962), color="#F1C40F") +
  
  geom_segment(mapping = aes(x = 1.61, xend = 1.61, y = 4059, yend = 5782), size=0.6, color="#27AE60") +  
  geom_point(mapping = aes(x = 1.61, y = 5782), shape = 17, color="#27AE60") +
  geom_point(mapping = aes(x = 1.61, y = 4059), shape = 15, color="#27AE60") +
  geom_point(mapping = aes(x = 1.61, y = 4879), color="#27AE60") +

## Annotation of the sidebar
  
  geom_point(mapping = aes(x = 0.22, y = 1050), shape = 17, color = "black") +
  geom_point(mapping = aes(x = 0.22, y = 750), color = "black") + 
  geom_point(mapping = aes(x = 0.22, y = 450), shape = 15, color = "black") +
  annotate("text", size = 3.4, x = 0.36, y = 1050, label="Inci./Comp.", hjust=0) +
  annotate("text", size = 3.4, x = 0.36, y = 750, label="Aver. EoL", hjust=0) +
  annotate("text", size = 3.4, x = 0.36, y = 450, label="Recy.", hjust=0) +
  
  scale_x_continuous(limits=c(0, 2.02), expand = c(0, 0)) +
  scale_y_continuous(limits=c(0, 8200), expand = c(0, 0)) +
  
  theme_bw() +
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(), 
        panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank(),
        axis.text = element_blank(), axis.ticks.y=element_blank(), axis.ticks.x=element_blank(),
        axis.title = element_blank()) +
  
  # annotate("rect", xmin = 0.2, xmax = 0.4, ymin = 400, ymax = 2000, color= "black", fill="grey", alpha = 0.5) +
  # geom_segment(mapping = aes(x = 0.3, xend = 0.5, y = 2000, yend = 2150), color="black", lty = 1, lwd = 0.3, 
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_segment(mapping = aes(x = 0.4, xend = 0.52, y = 1200, yend = 1200), color="black", lty = 1, lwd = 0.3, 
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_segment(mapping = aes(x = 0.2, xend = 0.4, y = 1200, yend = 1200), color="black", lty = 1, lwd = 0.5) +
  # geom_segment(mapping = aes(x = 0.3, xend = 0.5, y = 400, yend = 300), color="black", lty = 1, lwd = 0.3,
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # annotate("text", size = 4, x = 0.53, y = 2200, label="Incineration or compost", hjust = 0) +
  # annotate("text", size = 4, x = 0.57, y = 1250, label="Average EoL method mix", hjust = 0) +
  # annotate("text", size = 4, x = 0.53, y = 350, label="Recycling", hjust = 0) +
  # annotate("text", size = 4, x = 0.5, y = 9700, label="Year 2050", hjust = 0) +
  
  theme(plot.margin = unit(c(0, 0.5, 0, 0.2), "cm"))

  
###################################################### Figure 2 right panel ###########################################################

lc <- read_excel("C:/Users/jzheng/Box/Suh's lab/GSRs/Jiajia/Calculations/lcscenario.xlsx")
View(lc)

year2 <- lc$Year
p_aver2 <- lc$Petro_average
p_inci2 <- lc$Petro_incineration
p_recy2 <- lc$Petro_recycling
c_aver2 <- lc$Corn_average
c_inci2 <- lc$Corn_incineration
c_recy2 <- lc$Corn_recycling
s_aver2 <- lc$Sugarcane_average
s_inci2 <- lc$Sugarcane_incineration
s_recy2 <- lc$Sugarcane_recycling

f2b <- ggplot(data=lc, aes(x=year2), size = 0.8) +

  geom_line(aes(y=p_aver2, color="p_aver2", lty = "p_aver2"), size = 1) +
  geom_line(aes(y=c_aver2, color="c_aver2", lty = "c_aver2"), size = 1) +
  geom_line(aes(y=s_aver2, color="s_aver2", lty = "s_aver2"), size = 1) +    
  # geom_line(aes(y=p_inci2, color="p_inci2", lty = "p_inci2"), size = 0.8) +
  # geom_line(aes(y=c_inci2, color="c_inci2", lty = "c_inci2"), size = 0.8) +
  # geom_line(aes(y=s_inci2, color="s_inci2", lty = "s_inci2"), size = 0.8) +
  # geom_line(aes(y=p_recy2, color="p_recy2", lty = "p_recy2"), size = 0.8) +
  # geom_line(aes(y=c_recy2, color="c_recy2", lty = "c_recy2"), size = 0.8) +
  # geom_line(aes(y=s_recy2, color="s_recy2", lty = "s_recy2"), size = 0.8) +
  scale_color_manual(name="lc", values = c("p_inci2"="#E74C3C","p_aver2"="#E74C3C","c_inci2"="#F1C40F",
                                                 "c_aver2"="#F1C40F","s_inci2"="#27AE60","s_aver2"="#27AE60",
                                                 "p_recy2"="#E74C3C","c_recy2"="#F1C40F","s_recy2"="#27AE60"),
                     breaks=c("p_inci2", "p_aver2", "c_inci2", "c_aver2", "s_inci2",
                              "s2aver2", "s1recy2", "c_recy2", "s_recy2")) +
  scale_linetype_manual(name="lc", values =c("p_inci2"=3,"p_aver2"=1, "c_inci2"=3,"c_aver2"=1,
                                                   "s_inci2"=3, "s_aver2"=1, "p_recy2"=2, "c_recy2"=2,"s_recy2"=2),
                        breaks=c("p_inci2", "p_aver2", "c_inci2", "c_aver2","s_inci2",
                                 "s_aver2","p_recy2","c_recy2", "s_recy2")) +  
  scale_x_continuous(breaks = seq(2015, 2050, 5), expand = c(0, 0)) +
  scale_y_continuous(breaks = seq(0, 8200, 2000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                     limits = c(0, 8200), expand = c(0, 0))

f2b <- f2b + geom_ribbon(aes(x=year2, ymin = p_recy2, ymax = p_inci2), fill = "#E74C3C", alpha = 0.2) +
  geom_ribbon(aes(x=year2, ymin=c_recy2, ymax = c_inci2), fill = "#F1C40F", alpha = 0.2) +
  geom_ribbon(aes(x=year2, ymin=s_recy2, ymax = s_inci2), fill = "#27AE60", alpha = 0.2)

f2b <- f2b + theme_bw() + 
  labs(x = "Year", y = "") +
  theme(axis.title.x = element_text(size = 15),
        axis.title.y = element_text(size = 15),
        axis.text.x = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0, 
                                   margin = margin(t = 8, b = 8)),
        axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.25,
                                   margin = margin(r = 8)), 
        legend.position = "none",
        panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),
        panel.grid.minor.y = element_blank()) +
  theme(axis.ticks.length = unit(-0.15, "cm"), plot.margin = unit(c(0.8, 0.6, 0.8, 0.4), "cm"))

f2b <- f2b + annotate("rect", xmin = 2015, xmax = 2035.5, ymin = 7300, ymax = 8200, fill="white")
  # annotate("text", size = 5, x = 2020, y = 9500, label="Petroleum-based", hjust=0) +
  # annotate("text", size = 5, x = 2020, y = 9100, label="Corn-based", hjust=0) +
  # annotate("text", size = 5, x = 2020, y = 8700, label="Sugarcane-based", hjust=0) 
  # annotate("text", size = 5, x = 2019.3, y = 8200, label="Incineration/composting", hjust=0) +
  # annotate("text", size = 5, x = 2019.3, y = 7800, label="Average EoL method mix", hjust=0) +
  # annotate("text", size = 5, x = 2019.3, y = 7400, label="Recycling", hjust=0) +
  # annotate("rect", xmin = 2016, xmax = 2019, ymin = 9400, ymax = 9600, color= "#E74C3C", fill="#E74C3C", alpha = 0.5) +
  # annotate("rect", xmin = 2016, xmax = 2019, ymin = 9000, ymax = 9200, color= "#F1C40F",  fill="#F1C40F", alpha = 0.5) +
  # annotate("rect", xmin = 2016, xmax = 2019, ymin = 8600, ymax = 8800, color="#27AE60", fill="#27AE60", alpha = 0.5) +
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9800, yend = 9800), color="#E74C3C", lwd = 1) +
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9400, yend = 9400), color="#F1C40F", lwd = 1) +
  # geom_segment(mapping = aes(x = 2015, xend = 2018, y = 9000, yend = 9000), color="#27AE60", lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 8200, yend = 8200), color="black", lty = 3, lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 7800, yend = 7800), color="black", lty = 1, lwd = 1) +
  # geom_segment(mapping = aes(x = 2016, xend = 2019, y = 7400, yend = 7400), color="black", lty = 2, lwd = 1)


# Side bar of Figure 2 right panel

f2b_sidedf <- data.frame(parameter = c("min","median","max"), petroleum = c(1541, 3316, 5003), corn = c(1830, 2611, 3483), 
                       sugarcane = c(1606, 2203, 2932))

f2b_sidebar <- ggplot(f2b_sidedf) +
  # geom_rect(data=f2b_sidedf, mapping = aes(xmin=0.35, xmax=0.6, ymin=1541, ymax=5003), 
  #           color="black", fill="#E74C3C", alpha=0.15) +
  # geom_rect(data=f2b_sidedf, mapping = aes(xmin=0.9, xmax=1.15, ymin=1830, ymax=3483),
  #           color="black", fill="#F1C40F", alpha=0.15) +
  # geom_rect(data=f2b_sidedf, mapping = aes(xmin=1.45, xmax=1.7, ymin=1606, ymax=2932),
  #           color="black", fill="#27AE60", alpha=0.15) +
  # geom_segment(mapping = aes(x = 0.35, xend = 0.6, y = 3316, yend = 3316), color="black") +
  # geom_segment(mapping = aes(x = 0.9, xend = 1.15, y = 2611, yend = 2611), color="black") +
  # geom_segment(mapping = aes(x = 1.45, xend = 1.7, y = 2203, yend = 2203), color="black") +  
  geom_segment(mapping = aes(x = 0.41, xend = 0.41, y = 1541, yend = 4823), size=0.6, color="#E74C3C") +
  geom_point(mapping = aes(x = 0.41, xend = 0.48, y = 4823), shape = 17, color="#E74C3C") +
  geom_point(mapping = aes(x = 0.41, xend = 0.48, y = 1541), shape = 15, color="#E74C3C") +
  geom_point(mapping = aes(x = 0.41, y = 3226), color="#E74C3C") +
  
  geom_segment(mapping = aes(x = 1.01, xend = 1.01, y = 1825, yend = 3739), size=0.6, color="#F1C40F") +  
  geom_point(mapping = aes(x = 1.01, y = 3739), shape = 17, color="#F1C40F") +
  geom_point(mapping = aes(x = 1.01, y = 1825), shape = 15, color="#F1C40F") +
  geom_point(mapping = aes(x = 1.01, y = 2831), color="#F1C40F") +
  
  geom_segment(mapping = aes(x = 1.61, xend = 1.61, y = 1600, yend = 3187), size=0.6, color="#27AE60") +  
  geom_point(mapping = aes(x = 1.61, y = 3187), shape = 17, color="#27AE60") +
  geom_point(mapping = aes(x = 1.61, y = 1600), shape = 15, color="#27AE60") +
  geom_point(mapping = aes(x = 1.61, y = 2423), color="#27AE60") +
  
  scale_x_continuous(limits=c(0, 2.05), expand = c(0, 0)) +
  scale_y_continuous(limits=c(0, 8200), expand = c(0, 0)) +
  
  theme_bw() +
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(), 
        panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank(),
        axis.text = element_blank(), axis.ticks.y=element_blank(), axis.ticks.x=element_blank(),
        axis.title = element_blank()) +
  
  # annotate("rect", xmin = 0.2, xmax = 0.4, ymin = 400, ymax = 2000, color= "black", fill="grey", alpha = 0.5) +
  # geom_segment(mapping = aes(x = 0.3, xend = 0.5, y = 2000, yend = 2150), color="black", lty = 1, lwd = 0.3, 
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_segment(mapping = aes(x = 0.4, xend = 0.52, y = 1200, yend = 1200), color="black", lty = 1, lwd = 0.3, 
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # geom_segment(mapping = aes(x = 0.2, xend = 0.4, y = 1200, yend = 1200), color="black", lty = 1, lwd = 0.5) +
  # geom_segment(mapping = aes(x = 0.3, xend = 0.5, y = 400, yend = 300), color="black", lty = 1, lwd = 0.3,
  #              arrow = arrow(length = unit(0.2, "cm"))) +
  # annotate("text", size = 5, x = 0.53, y = 2200, label="100% compost\nor incineration", hjust = 0) +
  # annotate("text", size = 5, x = 0.57, y = 1250, label="Average EoL\nmethod mix", hjust = 0) +
  # annotate("text", size = 5, x = 0.53, y = 350, label="100% recycling", hjust = 0) +
  # annotate("text", size = 5, x = 0.7, y = 9700, label="Year 2050", hjust = 0) +

  theme(plot.margin = unit(c(0, 0.5, 0, 0.2), "cm"))

################################################## Combine two panels ######################################################

library(cowplot)
theme_set(theme_grey())

jpeg("Fig 2.jpeg", width = 13.5, height = 6, units = 'in', res = 1200)
plot_grid(f2a + theme(panel.border = element_rect(colour = "black", fill = NA, size = 0.7), 
                      plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "Current energy mix", hjust = 0.5), 
                        
          f2a_sidebar + theme(panel.border = element_rect(colour = "black", fill = NA, size = 0.7), 
                              plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "Year 2050", hjust = 0.5),
          
          f2b + theme(panel.border = element_rect(colour = "black", fill = NA, size = 0.7),
                      plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "Low carbon energy", hjust = 0.5), 
          
          f2b_sidebar + theme(panel.border = element_rect(colour = "black", fill = NA, size = 0.7), 
                             plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "Year 2050", hjust = 0.5),
          
          align = "h", nrow = 1, ncol = 4, rel_widths = c(5, 1, 5, 1), labels = c("a","","b", ""), label_size = 16)

dev.off()
