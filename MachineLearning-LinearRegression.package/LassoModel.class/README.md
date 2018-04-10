I represent a linear regression model called lasso
Once fit to X and y, following penalty should be minimized:
   (1 / (2 * n_samples)) * ||y - Xw||^2_2 + alpha * ||w||_1