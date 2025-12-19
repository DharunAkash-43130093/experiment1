<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .dashboard-header {
            background: linear-gradient(135deg, #4e73df, #224abe);
            color: white;
            padding: 25px;
            border-radius: 12px;
        }

        .dashboard-card {
            border: none;
            border-radius: 16px;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .dashboard-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }

        .card-icon {
            font-size: 45px;
            margin-bottom: 15px;
        }

        .footer-text {
            color: #6c757d;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="container my-5">

    <!-- Header -->
    <div class="dashboard-header mb-5 text-center">
        <h2 class="fw-bold">Admin Dashboard</h2>
        <p class="mb-0">Manage your cafe system efficiently</p>
    </div>

    <!-- Cards -->
    <div class="row g-4">

        <!-- Manage Products -->
        <div class="col-md-6 col-lg-4">
            <a href="/manage-products" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <i class="bi bi-box-seam card-icon text-primary"></i>
                    <h5 class="fw-semibold">Manage Products</h5>
                    <p class="text-muted">Add, edit and remove products</p>
                </div>
            </a>
        </div>

        <!-- Manage Categories -->
        <div class="col-md-6 col-lg-4">
            <a href="/manage-categories" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <i class="bi bi-tags card-icon text-success"></i>
                    <h5 class="fw-semibold">Manage Categories</h5>
                    <p class="text-muted">Organize product categories</p>
                </div>
            </a>
        </div>

        <!-- View Orders -->
        <div class="col-md-6 col-lg-4">
            <a href="/my-orders" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <i class="bi bi-receipt card-icon text-warning"></i>
                    <h5 class="fw-semibold">View Orders</h5>
                    <p class="text-muted">Check customer orders</p>
                </div>
            </a>
        </div>

        <!-- Go to Menu -->
        <div class="col-md-6 col-lg-4">
            <a href="/menu" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <i class="bi bi-cup-hot card-icon text-info"></i>
                    <h5 class="fw-semibold">Menu</h5>
                    <p class="text-muted">View cafe menu</p>
                </div>
            </a>
        </div>

        <!-- Logout -->
        <div class="col-md-6 col-lg-4">
            <a href="/logout" class="text-decoration-none">
                <div class="card dashboard-card text-center p-4">
                    <i class="bi bi-box-arrow-right card-icon text-danger"></i>
                    <h5 class="fw-semibold">Logout</h5>
                    <p class="text-muted">Securely sign out</p>
                </div>
            </a>
        </div>

    </div>

    <!-- Footer -->
    <div class="text-center mt-5 footer-text">
        © 2025 Cafe Management System | Admin Panel
    </div>

</div>

</body>
</html>
