
data {
  int<lower=0> N;         // Number of data points
  int<lower=1> J;         // Number of companies
  int<lower=1, upper=J> company[N]; //Company Identifier
  vector[N] y;            // Oberserved data (e.g., Return of Equity)
}

parameters {
  vector[J] mu;           // Company-level means
  real<lower=0> tau;      // Hyperparameter for company means
  real<lower=0> sigma;    // Standard deviation within companies
}

model {
  tau ~ normal(0, 5);      // Prior for tau
  sigma ~ normal(0, 5);    // Prior for sigma
  mu ~ normal(0, tau);
  y ~ normal(mu[company], sigma); // Likelihood
}

