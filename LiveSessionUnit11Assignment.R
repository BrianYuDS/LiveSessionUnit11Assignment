###################################
## Live Session Unit 11 Assignment 
## Brian Yu
###################################

library(fpp) #fpp package must be installed first

## a) Plot the time series.
## Can you identify seasonal fluctuations and/or a trend?
data(ukcars)
plot(ukcars)
  # There seems to be a seasonality compenent to this time series

## b) Use a classical decomposition to calculate the trend-cycle and seasonal indicies.
fitd <- decompose(ukcars)
trend_indicies <- fitd$trend
seasonal_indicies <- fitd$seasonal
plot(fitd)

## c) Do the results support the graphical interpretation from part (a)?
head(trend_indicies, 113)
head(seasonal_indicies, 113)
# By decomposing the time series, a definitive seasonal fluctuation trend.
# From Q1 to Q2 of a year, the trend decrease. From Q3 to Q4, the trend increases.

## d) Compute and plot the seasonally adjusted data.
fit_season_adj <- seasadj(fitd)
plot(fit_season_adj)

## e) Change one observation to be an outlier (e.g., add 500 to one observation), and
## recompute the seasonally adjusted data. What is the effect of the outlier?
ts <- ukcars
ts[50] = ts[50] + 500
fitd2 <- decompose(ts)
fit_season_adj2 <- seasadj(fitd2)
plot(fit_season_adj2)
  # At index 50, we added 500 to the observation value, and it causes a spike 
  # in the plot at index 50.

## f) Does it make any difference if the outlier is near the end rather than in
## the middle of the time series?
ts2 <- ts
ts[100] = ts[100] + 500
fitd2 <- decompose(ts)
fit_season_adj3 <- seasadj(fitd2)
plot(fit_season_adj3)
  # From observation of the graph, it doesn't seem to make a difference if the outlier
  # is near the end rather than in the middle of the time series

## g) Use STL to decompose the series.
fitstl <- stl(ukcars, s.window = 5)
plot(fitstl)

