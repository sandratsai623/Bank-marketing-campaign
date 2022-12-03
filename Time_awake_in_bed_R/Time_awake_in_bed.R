install.packages("tidyverse")
library(tidyverse)
library(readr)
sleep_day <- read_csv("sleepDay_merged_re.csv")
view(sleep_day)

install.packages("skimr")
library(skimr)

skim_without_charts(sleep_day)

library('ggplot2')

Time_awake_in_bed = c(sleep_day$TotalTimeInBed-sleep_day$TotalMinutesAsleep)

ggplot(sleep_day, aes(x=Time_awake_in_bed)) +
  geom_histogram(position="identity",fill="#00798c",color="#2e4057") +
  stat_bin(geom="text", aes(label=..count..),vjust=0) +
  scale_x_continuous(breaks = seq(0, 400, by = 25)) +
  scale_y_continuous(breaks = seq(0, 150, by = 25)) +
  geom_vline(xintercept = mean(Time_awake_in_bed), color="brown") +
  annotate("text",                        # Add text for median
           x = mean(Time_awake_in_bed) * 2.3,
           y = mean(Time_awake_in_bed) * 1.7,
           label = paste("Mean =", round(mean(Time_awake_in_bed),digits=1)),
           col = "brown",
           size = 4) +
  labs(title="Time awake in bed",subtitle="sample = 410",caption="Illustrated by Sandra T",y= "Count", x = "Time awake in bed per night")

skim_without_charts(Time_awake_in_bed)
