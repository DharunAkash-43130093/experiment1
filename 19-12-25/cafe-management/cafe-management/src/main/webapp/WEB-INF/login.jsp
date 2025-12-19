<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cafe Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #6f42c1, #4e73df);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .login-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        }

        .login-title {
            font-weight: 700;
            color: #4e73df;
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

        .btn-login {
            border-radius: 30px;
            font-size: 18px;
            padding: 10px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">

            <div class="card login-card p-4">
                <div class="text-center mb-4">
                    <i class="bi bi-cup-hot-fill fs-1 text-primary"></i>
                    <h3 class="login-title mt-2">DA Cafe Login</h3>
                    <p class="text-muted">Welcome back! Please sign in</p>
                </div>

                <!-- Email -->
                <div class="position-relative mb-3">
                    <i class="bi bi-envelope input-icon"></i>
                    <input id="email" type="email" class="form-control" placeholder="Email" required>
                </div>

                <!-- Password -->
                <div class="position-relative mb-4">
                    <i class="bi bi-lock input-icon"></i>
                    <input id="password" type="password" class="form-control" placeholder="Password" required>
                </div>

                <button id="loginBtn" class="btn btn-primary w-100 btn-login" onclick="login()">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </button>
            </div>

        </div>
    </div>
</div>

<script>
async function login() {
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const btn = document.getElementById("loginBtn");

    if (!email || !password) {
        alert("Please enter email and password");
        return;
    }

    btn.disabled = true;
    btn.innerHTML = "Logging in...";

    try {
        const res = await fetch("/api/auth/login", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ email, password })
        });

        if (!res.ok) throw new Error();

        const data = await res.json();
        localStorage.setItem("token", data.token);

        alert("✅ Login successful");

        // 👉 redirect to admin dashboard
        window.location.href = "/dashboard";

    } catch (e) {
        alert("❌ Invalid email or password");
        btn.disabled = false;
        btn.innerHTML = "Login";
    }
}
</script>


</body>
</html>
