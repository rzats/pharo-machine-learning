I represent a linear regression model called elastic net.
Once fit to X and y, following penalty should be minimized:
 1 / (2 * n_samples) * ||y - Xw||^2_2
        + alpha * l1_ratio * ||w||_1
        + 0.5 * alpha * (1 - l1_ratio) * ||w||^2_2