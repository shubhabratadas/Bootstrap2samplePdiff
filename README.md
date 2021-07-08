# Bootstrap2samplePdiff
# This function calculates BOOTSTRAP-based standard error, 2 sample diff-constrained MLE of pi_2. CI of pi2 is part of the output. Add delta to obtain the CI of pi1
# n1 = sample size from the first population -- it should be a positive integer
# n2 = sample size from the second population -- it should be a positive integer
# x1 = number of successes in the sample drawn from the first population -- it should be a nonnegative integer less than or equal to n1
# x2 = number of successes in the sample drawn from the second population -- it should be a nonnegative integer less than or equal to n2

# delta = pi1 - pi2 = difference in two population proportions.
# Index the populations such that delta is nonnegative 
# delta should be between 0 and 1 
# B is the bootstrap replication size
# Examples
 boot_pi2_2prop_diff (100, 100, 0,  30, 1, 10000, 0.95)
 boot_pi2_2prop_diff (45, 125, 35,  75, 0, 10000, 0.9) 
 boot_pi2_2prop_diff (50, 50, 38,  40, 0.1, 1000, 0.95)
 boot_pi2_2prop_diff (0, 50, 30,  30, 0.2, 2000, 0.9)
 boot_pi2_2prop_diff (15, 50, 25,  75, 0.3, 10000, 0.99)

