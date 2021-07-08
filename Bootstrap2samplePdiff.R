# this function calculates BOOTSTRAP-based standard error, 2 sample diff-constrained MLE of pi_2 and find CI
# CI of pi2 is part of the output. add delta to obtain the CI of pi1

# To find the restricted MLE This code requires/calls p2_mle_delta function

# n1 = sample size from the first population -- it should be a positive integer
# n2 = sample size from the second population -- it should be a positive integer
# x1 = number of successes in the sample drawn from the first population -- it should be a nonnegative integer less than or equal to n1
# x2 = number of successes in the sample drawn from the second population -- it should be a nonnegative integer less than or equal to n2

# delta = pi1 - pi2 = difference in two population proportions.
# Index the populations such that delta is nonnegative 
# delta should be between 0 and 1 
#B is the bootstrap replication size


boot_pi2_2prop_diff <- function (x1,n1,x2,n2, delta, B, conf) {
  
  set.seed(3458)
  
  alpha <- 1 - conf
  var1 <- rbind(matrix(1,x1,1), matrix(0,(n1-x1),1) )
  var2 <- rbind(matrix(1,x2,1), matrix(0,(n2-x2),1) )
  
  BootstrapSamples1 <- matrix( sample(var1, size= n1*B, replace=TRUE), 
                               nrow=n1, ncol=B)
  
  BootstrapSamples2 <- matrix( sample(var2, size= n2*B, replace=TRUE), 
                               nrow=n2, ncol=B)
  
  Boot.stat <- rep(0,B)
  
  for (i in 1:B){
    Boot.stat[i]  <- p2_mle_delta(sum(BootstrapSamples1[,i]),n1,sum(BootstrapSamples2[,i]),n2,delta)$p2
  }
  
  bias.est <- mean(Boot.stat) -  p2_mle_delta(x1,n1, x2,n2,delta)$p2
  
  out <- list( SE = sd(Boot.stat), bias = bias.est, 
               lower = quantile(Boot.stat, prob=alpha/2 )[[1]],
               upper = quantile(Boot.stat, prob=(1-alpha/2))[[1]]  ) 
  
  
  return(out)
  
}
