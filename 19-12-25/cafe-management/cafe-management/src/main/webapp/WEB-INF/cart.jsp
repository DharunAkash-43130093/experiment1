<!DOCTYPE html>
<html>
<head>
    <title>Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="container mt-4">

<h2>Your Cart</h2>

<table class="table mt-3">
    <thead>
        <tr>
            <th>Item</th><th>Price</th><th>Qty</th>
        </tr>
    </thead>
    <tbody id="cartTable"></tbody>
</table>

<button class="btn btn-success" onclick="placeOrder()">Place Order</button>

<script>
function loadCart() {
    const cart = JSON.parse(localStorage.getItem("cart") || "[]")
    const table = document.getElementById("cartTable")

    table.innerHTML = ""
    cart.forEach(item => {
        table.innerHTML += `
            <tr>
                <td>${item.name}</td>
                <td>₹${item.price}</td>
                <td>${item.quantity}</td>
            </tr>
        `
    })
}

async function placeOrder() {
    const token = localStorage.getItem("token")
    const cart = JSON.parse(localStorage.getItem("cart") || "[]")

    const items = cart.map(c => ({
        productId: c.id,
        quantity: c.quantity
    }))

    const res = await fetch("/api/orders", {
        method: "POST",
        headers: {
            "Content-T			<!DOCTYPE html>
			<html lang="en">
			<head>
			    <meta charset="UTF-8">
			    <title>Your Cart</title>

			    <!-- Bootstrap CSS -->
			    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

			    <!-- Bootstrap Icons -->
			    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

			    <style>
			        body {
			            background: #f4f6f9;
			            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			        }

			        .cart-header {
			            background: linear-gradient(135deg, #198754, #157347);
			            color: white;
			            padding: 20px;
			            border-radius: 12px;
			        }

			        .cart-card {
			            border-radius: 15px;
			            border: none;
			            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
			        }

			        .table thead {
			            background: #e9ecef;
			        }

			        .qty-badge {
			            background: #0d6efd;
			            color: white;
			            padding: 5px 12px;
			            border-radius: 20px;
			            font-size: 14px;
			        }

			        .place-btn {
			            font-size: 18px;
			            padding: 12px;
			            border-radius: 30px;
			        }

			        .empty-cart {
			            color: #6c757d;
			            text-align: center;
			            padding: 40px;
			        }
			    </style>
			</head>

			<body>

			<div class="container my-5">

			    <!-- Header -->
			    <div class="cart-header text-center mb-4">
			        <h2 class="fw-bold"><i class="bi bi-cart-check"></i> Your Cart</h2>
			        <p class="mb-0">Review items before placing your order</p>
			    </div>

			    <!-- Cart Card -->
			    <div class="card cart-card p-4">
			        <div class="table-responsive">
			            <table class="table align-middle">
			                <thead>
			                    <tr>
			                        <th>Item</th>
			                        <th>Price</th>
			                        <th class="text-center">Quantity</th>
			                        <th class="text-end">Subtotal</th>
			                    </tr>
			                </thead>
			                <tbody id="cartTable"></tbody>
			            </table>
			        </div>

			        <!-- Total -->
			        <div class="d-flex justify-content-between align-items-center mt-3">
			            <h5 class="fw-semibold">Total:</h5>
			            <h4 class="fw-bold text-success">₹<span id="cartTotal">0</span></h4>
			        </div>

			        <!-- Action -->
			        <div class="text-end mt-4">
			            <button class="btn btn-success place-btn" onclick="placeOrder()">
			                <i class="bi bi-bag-check-fill"></i> Place Order
			            </button>
			        </div>
			    </div>

			</div>

			<script>
			function loadCart() {
			    const cart = JSON.parse(localStorage.getItem("cart") || "[]")
			    const table = document.getElementById("cartTable")
			    const totalEl = document.getElementById("cartTotal")

			    table.innerHTML = ""
			    let total = 0

			    if (cart.length === 0) {
			        table.innerHTML = `
			            <tr>
			                <td colspan="4" class="empty-cart">
			                    <i class="bi bi-cart-x fs-1"></i>
			                    <p class="mt-2">Your cart is empty</p>
			                </td>
			            </tr>
			        `
			        totalEl.innerText = 0
			        return
			    }

			    cart.forEach(item => {
			        const subtotal = item.price * item.quantity
			        total += subtotal

			        table.innerHTML += `
			            <tr>
			                <td>${item.name}</td>
			                <td>₹${item.price}</td>
			                <td class="text-center">
			                    <span class="qty-badge">${item.quantity}</span>
			                </td>
			                <td class="text-end fw-semibold">₹${subtotal}</td>
			            </tr>
			        `
			    })

			    totalEl.innerText = total
			}

			async function placeOrder() {
			    const token = localStorage.getItem("token")
			    const cart = JSON.parse(localStorage.getItem("cart") || "[]")

			    if (cart.length === 0) {
			        alert("Your cart is empty")
			        return
			    }

			    const items = cart.map(c => ({
			        productId: c.id,
			        quantity: c.quantity
			    }))

			    const res = await fetch("/api/orders", {
			        method: "POST",
			        headers: {
			            "Content-Type": "application/json",
			            "Authorization": "Bearer " + token
			        },
			        body: JSON.stringify({ items })
			    })

			    if (res.ok) {
			        alert("✅ Order placed successfully!")
			        localStorage.removeItem("cart")
			        window.location.href = "myOrders.jsp"
			    } else {
			        alert("❌ Failed to place order")
			    }
			}

			loadCart()
			</script>

			</body>
			</html>
ype": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify({ items })
    })

    if (res.ok) {
        alert("Order placed")
        localStorage.removeItem("cart")
        window.location.href = "myOrders.jsp"
    } else {
        alert("Failed to place order")
    }
}

loadCart()
</script>

</body>
</html>