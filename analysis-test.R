# Load the built-in PlantGrowth dataset
data(PlantGrowth)

# View the first few rows of the dataset
head(PlantGrowth)

# Summary statistics
summary(PlantGrowth)

# Perform one-way ANOVA
anova_result <- aov(weight ~ group, data = PlantGrowth)

# View the ANOVA results
summary(anova_result)

# Optional: Perform Tukey's HSD test for pairwise comparisons
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)

# Optional: Visualize the data with a boxplot
boxplot(weight ~ group, data = PlantGrowth, 
        main = "Plant Growth by Treatment",
        xlab = "Treatment Group", ylab = "Weight")

anova_result

yep <- apa_print(anova_result)
yep
yep$statistic
