// model adapted from: 
// https://mc-stan.org/docs/stan-users-guide/regression.html
// added parameters for setting explicit priors

data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
  real location_intercept;
  real scale_intercept;
  real location_slope;
  real scale_slope;
}

parameters {
  real intercept;
  real slope;
  real<lower=0> sigma;
}

model {
  // priors
  intercept ~ normal(location_intercept, scale_intercept);
  slope ~ normal(location_slope, scale_slope);
  
  // likelihood
  y ~ normal(intercept + slope * x, sigma);
}
