library(tidyverse)

setwd("~/Uni/2026/BABS3301/Data")

rm(list=ls())

data <- read_tsv("tsv/DFT_H4K20me3_narrow_normalised_auto_data.tsv", skip=2, col_names=FALSE)

########## autosome ################

# extract quartile labels from column 2 and signal values from columns 3 onwards
plot_data <- data %>%
  select(-X1) %>%                          # drop sample name column
  rename(quartile = X2) %>%               # label column 2 as quartile
  pivot_longer(cols = -quartile,           # pivot all bin columns to long format
               names_to = "bin",
               values_to = "signal") %>%
  mutate(bin = as.numeric(gsub("X", "", bin)) - 3)  # convert bin to position, centered on TSS

# create bp positions (-10000 to +10000)
n_bins <- 400
positions <- seq(-10000, 10000, length.out = n_bins)

# add positions
plot_data <- plot_data %>%
  group_by(quartile) %>%
  mutate(position = positions) %>%
  ungroup()

plot_data <- plot_data %>%
  mutate(quartile = gsub("auto_", "", quartile)) %>%
  mutate(quartile = gsub(".bed", "", quartile))


### mine? ####
ggplot(plot_data, aes(x = position, y = signal, color = quartile)) +
  geom_point(size = 0.1, alpha = 0.5, shape = 18) +
  geom_line() +
  theme_classic() +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black", size = 0.5) +
  scale_color_manual(values = c("Q1" = "blue",
                                "Q2" = "green",
                                "Q3" = "orange",
                                "Q4" = "red")) +
  geom_smooth(method = "loess", span = 0.25) +
  labs(x = "Position on Autosomes Relative to TSS (bp)",
       y = "Normalised Read Depth",
       color = "Expression quartile",
       title = "DFT H4K20me3 (narrow) signal around TSS") +
  theme(plot.title = element_text(size = 18), axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

ggsave("actuals_plots/DFT_H4K20me3_narrow_Quartiles_10kb_auto.png", dpi=300,
       width = 5.84, height = 3.95)

######### X Chromosome ##########

data <- read_tsv("tsv/DFT_H4K20me3_narrow_normalised_X_data.tsv", skip=2, col_names=FALSE)

plot_data <- data %>%
  select(-X1) %>%                          # drop sample name column
  rename(quartile = X2) %>%               # label column 2 as quartile
  pivot_longer(cols = -quartile,           # pivot all bin columns to long format
               names_to = "bin",
               values_to = "signal") %>%
  mutate(bin = as.numeric(gsub("X", "", bin)) - 3)  # convert bin to position, centered on TSS

# create bp positions (-10000 to +10000)
n_bins <- 400
positions <- seq(-10000, 10000, length.out = n_bins)

# add positions
plot_data <- plot_data %>%
  group_by(quartile) %>%
  mutate(position = positions) %>%
  ungroup()

plot_data <- plot_data %>%
  mutate(quartile = gsub("X_", "", quartile)) %>%
  mutate(quartile = gsub(".bed", "", quartile))


### mine? ####
ggplot(plot_data, aes(x = position, y = signal, color = quartile)) +
  geom_point(size = 0.1, alpha = 0.5, shape = 18) +
  geom_line() +
  theme_classic() +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black", size = 0.5) +
  scale_color_manual(values = c("Q1" = "blue",
                                "Q2" = "green",
                                "Q3" = "orange",
                                "Q4" = "red")) +
  geom_smooth(method = "loess", span = 0.25) +
  labs(x = "Position on X chromosome Relative to TSS (bp)",
       y = "Normalised Read Depth",
       color = "Expression quartile",
       title = "DFT H4K20me3 (narrow) signal around TSS") +
  theme(plot.title = element_text(size = 18), axis.title.x = element_text(size = 14),
        axis.title.y = element_text(size = 14))

ggsave("actuals_plots/DFT_H4K20me3_narrow_Quartiles_10kb_ChrX.png", dpi=300,
       width = 5.84, height = 3.95)
