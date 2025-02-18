library(marinecs100b)
library(ggplot2)
# Distributions of continuous variables -----------------------------------

# P1 What type of visualization is appropriate for a single continuous variable?
# histogram
# P2 What type of visualization is appropriate for a continuous variable across
# categorical variables?
# box plots
# P3 Use ggplot to visualize the distribution of sea surface salinity. Save your
# figure as “comm101p3.png”.
View(woa_sal)
ggplot(woa_sal, aes(x = salinity)) +
  geom_histogram()
ggsave("comm101p3.png")
# P4 Use ggplot to visualize the distribution of sea surface salinity by ocean
# basin. Save your figure as “comm101p4.png”.
ggplot(woa_sal, aes(y= salinity, x = ocean)) +
  geom_boxplot()
ggsave("comm101p4.png")
# P5 Interpret your figures from P3 and P4. What patterns do you notice?
#The ocean is pretty consistently salty, but it mostly has a salinity of around
# 37 ppm. In Part 4 we can see the different salinities over location while in
# part 3 we cannot see by location, just by frequency. The Mediterranean is
#the most salty part. In the box plot you can see the spread and the outliers
#as well as how close together most of the data is, seen by the narrow boxes.

# P6 Critique your figures from P3 and P4. What changes would highlight the
# patterns you interpreted in P5? You don’t need to write code for these
# changes, just describe them verbally.
#We would remove some outliers and then shorten the range of the salinity axis
# so that it is more zoomed in and easier to see and notice the salinities. We
#would also put units on the salinity axis to make it easier to read. I would
#also color the oceans differently.

# Relationships between continuous variables ------------------------------

# P7 Visualize the relationship between salinity and latitude by ocean basin.
ggplot(woa_sal, aes(x=latitude, y=salinity)) +
  geom_point()
ggsave("comm101p7.png")
# P8 Edit your figure from P7 to improve its interpretability in at least one of
# the following categories: visually differentiating the oceans, appropriateness
# of the labels, or use of negative space. Save this figure as “comm101p8.png”.
ocean_color <- c("#0072B2","#E69F00","#56B4E9","#F0E442")
ggplot(woa_sal, aes(x=latitude, y=salinity, color = ocean)) +
  geom_point() +
  theme_bw() +
  scale_color_manual(values = ocean_color) +
  theme(legend.position = "inside",
        legend.position.inside = c(0.50, 0.30)) +
  labs (x = "Latitude",
        y = "Salinity (ppt)",
        color = "Ocean")
ggsave("comm101p8.png")
