library(ggplot2)
library(gganimate)

x <- Nile
start_tuning <- 10
end_tuning <- 30

d1 <- density(x, bw =  start_tuning)
d2 <- density(x, bw = end_tuning)
df1 <- as.data.frame(cbind(xvals = d1$x, yvals = d1$y * d1$n * 1, i=1))
df2 <- as.data.frame(cbind(xvals = d2$x, yvals = d2$y * d2$n * 1, i=2))
m <- merge(x = df1, y = df2, all = TRUE)
ggplot(m, aes(x = xvals, y = yvals))  + geom_line() + transition_states(i)
