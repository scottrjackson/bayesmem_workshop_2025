// model adapted from: 
// https://mc-stan.org/docs/stan-users-guide/regression.html
// added parameters for setting explicit priors

data {
  int<lower=0> N;
  vector[N] x;
  vector[N] y;
  real location_alpha;
  real scale_alpha;
  real scale_beta;
}
parameters {
  real alpha;
  real beta;
  real<lower=0> sigma;
}
model {
  // priors
  alpha ~ normal(location_alpha, scale_alpha);
  beta ~ normal(0., scale_beta);
  // likelihood
  y ~ normal(alpha + beta * x, sigma);
}
