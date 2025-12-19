<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .orders-header {
            background: linear-gradient(135deg, #20c997, #0d6efd);
            color: white;
            padding: 25px;
            border-radius: 12px;
        }

        .order-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .order-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .status-badge {
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }

        .status-PENDING { background: #ffc107; color: #212529; }
        .status-COMPLETED { background: #198754; color: white; }
        .status-CANCELLED { background: #dc3545; color: white; }

        .empty-text {
            text-align: center;
            color: #6c757d;
            padding: 40px;
        }
    </style>
</head>

<body>

<div class="container my-5">

    <!-- Header -->
    <div class="orders-header text-center mb-5">
        <h2 class="fw-bold"><i class="bi bi-receipt"></i> My Orders</h2>
        <p class="mb-0">Track your order history</p>
    </div>

    <!-- Orders -->
    <div id="orders" class="row g-4"></div>

</div>

<script>
async function loadOrders() {
    const token = localStorage.getItem("token")
    const div = document.getElementById("orders")

    if (!token) {
        div.innerHTML = `
            <div class="col-12 empty-text">
                <i class="bi bi-lock fs-1"></i>
                <p>Please login to view your orders</p>
            </div>
        `
        return
    }

    const res = await fetch("/api/orders/my", {
        headers: { "Authorization": "Bearer " + token }
    })

    const orders = await res.json()
    div.innerHTML = ""

    if (orders.length === 0) {
        div.innerHTML = `
            <div class="col-12 empty-text">
                <i class="bi bi-bag fs-1"></i>
                <p>No orders placed yet</p>
            </div>
        `
        return
    }

    orders.forEach(o => {
        const statusClass = "status-" + o.status

        div.innerHTML += `
            <div class="col-md-6 col-lg-4">
                <div class="card order-card p-4 h-100">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h5 class="fw-semibold mb-0">Order #${o.id}</h5>
                        <span class="status-badge ${statusClass}">
                            ${o.status}
                        </span>
                    </div>

                    <p class="text-muted mb-1">
                        <i class="bi bi-currency-rupee"></i>
                        Total: <b>₹${o.totalAmount}</b>
                    </p>

                    <p class="text-muted mb-0">
                        <i class="bi bi-clock"></i>
                        Order placed successfully
                    </p>
                </div>
            </div>
        `
    })
}

loadOrders()
</script>

</body>
</html>
