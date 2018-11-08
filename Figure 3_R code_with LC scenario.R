install.packages("tidyverse")
library(tidyverse)

################################### Current Energy Mix: Petroleum-based ###################################################

petro <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                              "EoL-Recycling", "Total"),
                    amount = c(2.665, 1.314, 0.005, 0.662, -0.531, 4.116))
                    
petro$stage <- as.factor(petro$stage)
petro$id <- seq_along(petro$amount)
petro$type <- ifelse(petro$amount > 4, "total", "slice")
# petro[petro$stage %in% c("total"), "type"] <- "net"

petro$end <- cumsum(petro$amount)
petro$end <- c(head(petro$end, -1), 0)
petro$start <- c(0, head(petro$end, -1))
petro <- petro[,c(3,1,4,6,5,2)]
petro

petro$type <- as.factor(petro$type)

library(ggplot2)

f3a1 <- ggplot(petro, aes(fill = type)) + 
  scale_fill_manual(values = c("#F5B7B1", "#EC7063")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

################################### Current Energy Mix: Corn-based ###################################################

corn <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                              "EoL-Recycling", "EoL-Composting", "EoL-Digestion","Total"),
                    amount = c(2.144,1.314,0.063,0.408,-0.395,0.254,0.012,3.800))

corn$stage <- as.factor(corn$stage)
corn$id <- seq_along(corn$amount)
corn$type <- ifelse(corn$amount > 3, "total", "slice")

corn$end <- cumsum(corn$amount)
corn$end <- c(head(corn$end, -1), 0)
corn$start <- c(0, head(corn$end, -1))
corn <- corn[,c(3,1,4,6,5,2)]
corn

corn$type <- as.factor(corn$type)

f3a2 <- ggplot(corn, aes(fill = type)) + 
  scale_fill_manual(values = c("#F9E79F", "#F4D03F")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

################################## Current Energy Mix: Sugarcane-based ###################################################

cane <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                             "EoL-Recycling", "EoL-Composting", "EoL-Digestion","Total"),
                   amount = c(1.227,1.314,0.063,0.408,-0.068,0.254,0.012,3.211))

cane$stage <- as.factor(cane$stage)
cane$id <- seq_along(cane$amount)
cane$type <- ifelse(cane$amount > 3.000, "total","slice")

cane$end <- cumsum(cane$amount)
cane$end <- c(head(cane$end, -1), 0)
cane$start <- c(0, head(cane$end, -1))
cane <- cane[,c(3,1,4,6,5,2)]
cane

cane$type <- as.factor(cane$type)

f3a3 <- ggplot(cane, aes(fill = type)) + 
  scale_fill_manual(values = c("#A9DFBF", "#52BE80")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

##################################################################################################################
################################### Low carbon Energy Mix: Petroleum-based ###################################################

petro2 <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                              "EoL-Recycling", "Total"),
                    amount = c(1.172,0.179,0.005,1.114,-0.232,2.237))

petro2$stage <- as.factor(petro2$stage)
petro2$id <- seq_along(petro2$amount)
petro2$type <- ifelse(petro2$amount > 2, "total", "slice")
# petro[petro$stage %in% c("total"), "type"] <- "net"

petro2$end <- cumsum(petro2$amount)
petro2$end <- c(head(petro2$end, -1), 0)
petro2$start <- c(0, head(petro2$end, -1))
petro2 <- petro2[,c(3,1,4,6,5,2)]
petro2

petro2$type <- as.factor(petro2$type)

f3b1 <- ggplot(petro2, aes(fill = type)) + 
  scale_fill_manual(values = c("#F5B7B1", "#EC7063")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

#################################### Low carbon Energy Mix: Corn-based ###################################################

corn2 <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                             "EoL-Recycling", "EoL-Composting", "EoL-Digestion","Total"),
                   amount = c(0.884,0.179,0.063,0.597,-0.019,0.277,0.026,2.006))

corn2$stage <- as.factor(corn2$stage)
corn2$id <- seq_along(corn2$amount)
corn2$type <- ifelse(corn2$amount > 1.9, "total", "slice")

corn2$end <- cumsum(corn2$amount)
corn2$end <- c(head(corn2$end, -1), 0)
corn2$start <- c(0, head(corn2$end, -1))
corn2 <- corn2[,c(3,1,4,6,5,2)]
corn2

corn2$type <- as.factor(corn2$type)

f3b2 <- ggplot(corn2, aes(fill = type)) + 
  scale_fill_manual(values = c("#F9E79F", "#F4D03F")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

##################################### Low carbon Energy Mix: Sugarcane-based ###################################################

cane2 <- data.frame(stage = c("Resin production", "Conversion", "EoL-Landfill", "EoL-Incineration",  
                             "EoL-Recycling", "EoL-Composting", "EoL-Digestion","Total"),
                   amount = c(0.541,0.179,0.063,0.597,0.102,0.277,0.026,1.783))

cane2$stage <- as.factor(cane2$stage)
cane2$id <- seq_along(cane2$amount)
cane2$type <- ifelse(cane2$amount > 1.5, "total","slice")

cane2$end <- cumsum(cane2$amount)
cane2$end <- c(head(cane2$end, -1), 0)
cane2$start <- c(0, head(cane2$end, -1))
cane2 <- cane2[,c(3,1,4,6,5,2)]
cane2

cane2$type <- as.factor(cane2$type)

f3b3 <- ggplot(cane2, aes(fill = type)) + 
  scale_fill_manual(values = c("#A9DFBF", "#52BE80")) +
  geom_rect(aes(fct_inorder(stage), xmin = id - 0.3, xmax = id + 0.3, ymin = start, ymax = end)) 

#########################################################################################################################
###################################### Combine the six panels ###########################################################

library(cowplot)
theme_set(theme_grey())
f3a <- plot_grid(f3a1 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                           limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() +
                   labs(x = "", title = "Petroleum-based", y = expression("GHG emissions (kg "*"CO"[2]*" eq/kg plastic)")) +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_blank(),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         legend.position = "none",
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(plot.margin = unit(c(1.0, 0.05, 0.5, 0.8), "cm"),
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 
                 f3a2 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                           limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() +
                   labs(x = "", title = "Corn-based") +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_blank(),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         legend.position = "none",
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(plot.margin = unit(c(1.0, 0.18, 0.5, 0.85), "cm"), 
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 
                 f3a3 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                           limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() + labs(x = "", title = "Sugarcane-based") +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_blank(),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(legend.position = "none", plot.margin = unit(c(1.0, 0.8, 0.5, 0.4), "cm"),
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 align = "h", ncol = 3, rel_widths = c(1,1,1))


f3b <- plot_grid(f3b1 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                   limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() +
                   labs(x = "", title = "Petroleum-based", y = "") +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_text(color = "black", size = 14, angle = 90, hjust = 1, vjust = 0.3, 
                                                    margin = margin(t = 5, b = 5)),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         legend.position = "none",
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(plot.margin = unit(c(0.2, 0.05, 0.8, 0.8), "cm"),
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 
                 f3b2 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                          limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() +
                   labs(x = "Life stage", title = "Corn-based", vjust = 1) +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_text(color = "black", size = 14, angle = 90, hjust = 1, vjust = 0.3, 
                                                    margin = margin(t = 5, b = 5)),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         legend.position = "none",
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(plot.margin = unit(c(0.2, 0.18, 0.8, 0.85), "cm"), 
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 
                 f3b3 + scale_y_continuous(breaks = seq(0, 5.000, 1.000), labels=function(x) format(x, big.mark = ",", scientific = FALSE), 
                                          limits = c(0, 5.000), expand = c(0, 0)) +
                   theme_bw() + labs(x = "", title = "Sugarcane-based") +
                   
                   theme(plot.title = element_text(hjust = 0.5, size = 14),
                         axis.title.x = element_text(size = 14, margin = margin(t = 8)),
                         axis.title.y = element_text(size = 14, margin = margin(r = 8)),
                         axis.text.x = element_text(color = "black", size = 14, angle = 90, hjust = 1, vjust = 0.3, 
                                                    margin = margin(t = 5, b = 5)),
                         axis.text.y = element_text(color = "black", size = 14, angle = 0, hjust = 0.5, vjust = 0.5,
                                                    margin = margin(l = 3, r = 3)), 
                         panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
                         panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) +
                   theme(legend.position = "none", plot.margin = unit(c(0.2, 0.8, 0.8, 0.4), "cm"),
                         panel.border = element_rect(colour = "black", fill = NA, size = 0.7)),
                 align = "h", ncol = 3, rel_widths = c(1,1,1)) 

jpeg("Fig 3.jpeg", width = 9, height = 9, units = 'in', res = 1200)
plot_grid(f3a + theme(plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "\n  Current energy mix", hjust = 0.5), 
          f3b + theme(plot.title = element_text(hjust = 0.5, size = 16)) + labs(title = "  Low carbon energy\n", hjust = 0.5), 
          labels = "auto", ncol = 1, rel_heights = c(0.74,1))
dev.off()
