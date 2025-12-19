<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Products</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: #f4f6f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .page-header {
            background: linear-gradient(135deg, #198754, #157347);
            color: white;
            padding: 20px;
            border-radius: 12px;
        }

        .admin-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }

        .form-control, .form-select {
            border-radius: 30px;
            padding-left: 45px;
        }

        .input-icon {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: #6c757d;
        }

        .add-btn {
            border-radius: 30px;
            font-size: 16px;
        }

        .product-card {
            transition: all 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.12);
        }

        .price-badge {
            background: #198754;
            color: white;
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 14px;
        }

        .empty-text {
            color: #6c757d;
            text-align: center;
            padding: 30px;
        }
    </style>
</head>

<body>

<div class="container my-5">

    <!-- Header -->
    <div class="page-header mb-4 text-center">
        <h2 class="fw-bold"><i class="bi bi-box-seam-fill"></i> Manage Products</h2>
        <p class="mb-0">Add and manage cafe products</p>
    </div>

    <!-- Add Product -->
    <div class="card admin-card p-4 mb-5">
        <h5 class="fw-semibold mb-3">Add New Product</h5>

        <div class="row g-3">
            <div class="col-md-6 position-relative">
                <i class="bi bi-cup-straw input-icon"></i>
                <input id="name" class="form-control" placeholder="Product Name">
            </div>

            <div class="col-md-6 position-relative">
                <i class="bi bi-card-text input-icon"></i>
                <input id="description" class="form-control" placeholder="Description">
            </div>

            <div class="col-md-6 position-relative">
                <i class="bi bi-currency-rupee input-icon"></i>
                <input id="price" type="number" class="form-control" placeholder="Price">
            </div>

            <div class="col-md-6 position-relative">
                <i class="bi bi-tags-fill input-icon"></i>
                <select id="categoryId" class="form-select">
                    <option value="">Select Category</option>
                </select>
            </div>
        </div>

        <div class="text-end mt-4">
            <button class="btn btn-success add-btn px-4" onclick="addProduct()">
                <i class="bi bi-plus-circle"></i> Add Product
            </button>
        </div>
    </div>

    <!-- Product List -->
    <div id="productList" class="row g-3"></div>

</div>

<script>
async function loadCategories() {
    const res = await fetch("/api/categories")
    const categories = await res.json()

    const select = document.getElementById("categoryId")
    categories.forEach(c => {
        select.innerHTML += `<option value="${c.id}">${c.name}</option>`
    })
}

async function addProduct() {
    const token = localStorage.getItem("token")
    const name = document.getElementById("name").value
    const description = document.getElementById("description").value
    const price = document.getElementById("price").value
    const categoryId = document.getElementById("categoryId").value

    if (!name || !description || !price || !categoryId) {
        alert("Please fill all fields")
        return
    }

    const product = { name, description, price }

    const res = await fetch(`/api/products/admin/create?categoryId=${categoryId}`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify(product)
    })

    if (res.ok) {
        alert("✅ Product added successfully")
        document.getElementById("name").value = ""
        document.getElementById("description").value = ""
        document.getElementById("price").value = ""
        document.getElementById("categoryId").value = ""
        loadProducts()
    } else {
        alert("❌ Failed to add product")
    }
}

async function loadProducts() {
    const res = await fetch("/api/products")
    const products = await res.json()

    const div = document.getElementById("productList")
    div.innerHTML = ""

    if (products.length === 0) {
        div.innerHTML = `
            <div class="col-12 empty-text">
                <i class="bi bi-box fs-1"></i>
                <p>No products available</p>
            </div>
        `
        return
    }

    products.forEach(p => {
        div.innerHTML += `
            <div class="col-md-6 col-lg-4">
                <div class="card admin-card product-card p-3">
                    <h5 class="fw-semibold">${p.name}</h5>
                    <p class="text-muted">${p.description}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="price-badge">₹${p.price}</span>
                        <i class="bi bi-box"></i>
                    </div>
                </div>
            </div>
        `
    })
}

loadCategories()
loadProducts()
</script>

</body>
</html>
