<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Categories</title>

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
            background: linear-gradient(135deg, #0d6efd, #0a58ca);
            color: white;
            padding: 20px;
            border-radius: 12px;
        }

        .admin-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 10px 20px rgba(0,0,0,0.08);
        }

        .form-control {
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

        .category-card {
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .category-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.12);
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
        <h2 class="fw-bold"><i class="bi bi-tags-fill"></i> Manage Categories</h2>
        <p class="mb-0">Add and organize cafe categories</p>
    </div>

    <!-- Add Category -->
    <div class="card admin-card p-4 mb-5">
        <h5 class="fw-semibold mb-3">Add New Category</h5>

        <div class="row g-3">
            <div class="col-md-6 position-relative">
                <i class="bi bi-bookmark-fill input-icon"></i>
                <input id="name" class="form-control" placeholder="Category Name">
            </div>

            <div class="col-md-6 position-relative">
                <i class="bi bi-card-text input-icon"></i>
                <input id="description" class="form-control" placeholder="Description">
            </div>
        </div>

        <div class="text-end mt-4">
            <button class="btn btn-success add-btn px-4" onclick="addCategory()">
                <i class="bi bi-plus-circle"></i> Add Category
            </button>
        </div>
    </div>

    <!-- Category List -->
    <div id="categoryList" class="row g-3"></div>

</div>

<script>
async function addCategory() {
    const token = localStorage.getItem("token")
    const name = document.getElementById("name").value
    const description = document.getElementById("description").value

    if (!name || !description) {
        alert("Please fill all fields")
        return
    }

    const category = { name, description }

    const res = await fetch("/api/categories/admin/create", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify(category)
    })

    if (res.ok) {
        alert("✅ Category added successfully")
        document.getElementById("name").value = ""
        document.getElementById("description").value = ""
        loadCategories()
    } else {
        alert("❌ Failed to add category")
    }
}

async function loadCategories() {
    const res = await fetch("/api/categories")
    const categories = await res.json()

    const div = document.getElementById("categoryList")
    div.innerHTML = ""

    if (categories.length === 0) {
        div.innerHTML = `
            <div class="col-12 empty-text">
                <i class="bi bi-folder-x fs-1"></i>
                <p>No categories available</p>
            </div>
        `
        return
    }

    categories.forEach(c => {
        div.innerHTML += `
            <div class="col-md-6 col-lg-4">
                <div class="card admin-card category-card p-3">
                    <h5 class="fw-semibold">${c.name}</h5>
                    <p class="text-muted mb-0">${c.description}</p>
                </div>
            </div>
        `
    })
}

loadCategories()
</script>

</body>
</html>
