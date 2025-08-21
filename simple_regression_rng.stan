// model adapted from: 
// https://mc-stan.org/docs/stan-users-guide/regression.html
// added parameters for setting explicit priors

data {
  int<lower=0> N;
  real alpha;
  real beta;
  real<lower=0> sigma;
  vector[N] x;
}

parameters {
}

model {
}

generated quantities {
  array[N] real y_sim = normal_rng(alpha + beta * x, sigma);
}
