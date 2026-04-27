#Mode of Gender Column
mode_gender <- names(sort(table(MentalHealth$Gender), decreasing = TRUE))[1]
MentalHealth$Gender[is.na(MentalHealth$Gender) | MentalHealth$Gender == "" | MentalHealth$Gender == "#"] <- mode_gender
table(MentalHealth$Gender)
mode_gender

#Mean of Stress_Level Column
avg_stress <- round(mean(MentalHealth$Stress_Level, na.rm = TRUE)) #na.rm(skips any missing or invalid entries)
MentalHealth$Stress_Level[is.na(MentalHealth$Stress_Level) | MentalHealth$Stress_Level == "" | MentalHealth$Stress_Level == "#"] <- avg_stress
avg_stress
table(MentalHealth$Stress_Level)

#Delete Row 19 for coming Invalid value
MentalHealth <- MentalHealth[-19, ]

#Mean of Days_Without_Social_Media Column
avg_days <- round(mean(MentalHealth$Days_Without_Social_Media, na.rm = TRUE))
MentalHealth$Days_Without_Social_Media[is.na(MentalHealth$Days_Without_Social_Media) | MentalHealth$Days_Without_Social_Media == "" | MentalHealth$Days_Without_Social_Media == "#"] <- avg_days
avg_days
table(MentalHealth$Days_Without_Social_Media)

#Replace a invalid value with same value in column Sleep_Quality
MentalHealth$Sleep_Quality <- gsub("[^0-9]", "", MentalHealth$Sleep_Quality) #gsub(strips out everything except digits)
MentalHealth$Sleep_Quality <- as.numeric(MentalHealth$Sleep_Quality)


#Plots:

library(dplyr)

#Descriptive statistics
desc <- MentalHealth %>%
  summarize(
    mean_screen = mean(Daily_Screen_Time),
    sd_screen   = sd(Daily_Screen_Time),
    mean_sleep  = mean(Sleep_Quality),
    mean_stress = mean(Stress_Level),
    mean_ex     = mean(Exercise_Frequency),
    mean_happy  = mean(Happiness_Index)
  )
desc

#Group comparison: averages across Gender
by_gender <- MentalHealth %>%
  group_by(Gender) %>%
  summarize(
    n = n(),
    avg_sleep = mean(Sleep_Quality),
    avg_stress = mean(Stress_Level),
    avg_happy = mean(Happiness_Index),
    avg_screen = mean(Daily_Screen_Time)
  )
by_gender

#Variation across platforms
ggplot(MentalHealth, aes(x = Social_Media_Platform, y = Stress_Level, fill = Social_Media_Platform)) +
  geom_boxplot() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Stress level by platform", x = "Platform", y = "Stress (1–10)")


#Average Happiness Index by Social Media Platform
ggplot(MentalHealth, aes(x = Social_Media_Platform, y = Happiness_Index, fill = Social_Media_Platform)) +
  stat_summary(fun = mean, geom = "bar") +
  labs(title = "Average Happiness Index by Platform",
       x = "Platform",
       y = "Average Happiness Index") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Stress Level vs Daily Screen Time
ggplot(MentalHealth, aes(x = Daily_Screen_Time, y = Stress_Level)) +
  geom_point(color = "darkorange", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Stress Level vs Daily Screen Time",
       x = "Screen Time (hours)",
       y = "Stress Level (1–10)") +
  theme_classic()



#Sleep Quality by Gender
ggplot(MentalHealth, aes(x = Gender, y = Sleep_Quality, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Sleep Quality by Gender",
       x = "Gender",
       y = "Sleep Quality (1–10)") +
  theme_light()


#Exercise Frequency by Platform
ggplot(MentalHealth, aes(x = Social_Media_Platform, y = Exercise_Frequency, fill = Social_Media_Platform)) +
  geom_boxplot() +
  labs(title = "Exercise Frequency by Platform",
       x = "Platform",
       y = "Exercise Frequency (times/week)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Days Without Social Media vs Stress Level
ggplot(MentalHealth, aes(x = Days_Without_Social_Media, y = Stress_Level)) +
  geom_point(color = "blue", alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  labs(title = "Offline Days vs Stress Level",
       x = "Days Without Social Media",
       y = "Stress Level (1–10)") +
  theme_classic()


#Happiness Index by Gender
ggplot(MentalHealth, aes(x = Gender, y = Happiness_Index, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Happiness Index by Gender",
       x = "Gender",
       y = "Happiness Index (1–10)") +
  theme_minimal()





