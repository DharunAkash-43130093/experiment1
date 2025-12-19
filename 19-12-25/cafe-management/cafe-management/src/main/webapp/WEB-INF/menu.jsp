<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cafe Menu</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .menu-header {
            background: linear-gradient(135deg, #fd7e14, #dc3545);
            color: white;
            padding: 25px;
            border-radius: 12px;
        }

        .menu-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
            transition: all 0.3s ease;
        }

        .menu-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.15);
        }

        .price-badge {
            background: #dc3545;
            color: white;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
        }

        .cart-btn {
            border-radius: 30px;
        }

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
    <div class="menu-header text-center mb-5">
        <h2 class="fw-bold"><i class="bi bi-cup-hot-fill"></i>DA Cafe Menu</h2>
        <p class="mb-0">Choose your favorite items</p>
    </div>

    <!-- Products -->
    <div id="products" class="row g-4"></div>

</div>

<script>
async function loadProducts() {
    const res = await fetch("/api/products")
    const products = await res.json()

    const div = document.getElementById("products")
    div.innerHTML = ""

    if (products.length === 0) {
        div.innerHTML = `
            <div class="col-12 empty-text">
                <i class="bi bi-emoji-frown fs-1"></i>
                <p>No items available</p>
            </div>
        `
        return
    }

    products.forEach(p => {
        div.innerHTML += `
            <div class="col-md-6 col-lg-4">
                <div class="card menu-card p-4 h-100">
                    <div class="d-flex justify-content-between align-items-start">
                        <h5 class="fw-semibold">${p.name}</h5>
                        <span class="price-badge">₹${p.price}</span>
                    </div>
                    <p class="text-muted mt-2">${p.description}</p>

                    <div class="mt-auto text-end">
                        <button class="btn btn-primary cart-btn" 
                            onclick="addToCart(${p.id}, '${p.name}', ${p.price})">
                            <i class="bi bi-cart-plus"></i> Add to Cart
                        </button>
                    </div>
                </div>
            </div>
        `
    })
}

function addToCart(id, name, price) {
    let cart = JSON.parse(localStorage.getItem("cart") || "[]")

    const existing = cart.find(item => item.id === id)
    if (existing) {
        existing.quantity++
    } else {
        cart.push({ id, name, price, quantity: 1 })
    }

    localStorage.setItem("cart", JSON.stringify(cart))
    alert("✅ Added to cart")
}

loadProducts()
</script>

</body>
</html>
