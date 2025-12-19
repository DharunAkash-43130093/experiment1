<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Account</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(135deg, #20c997, #198754);
            min-height: 100vh;
            display: flex;
            align-items: center;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .signup-card {
            border-radius: 16px;
            border: none;
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
        }

        .signup-title {
            font-weight: 700;
            color: #198754;
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

        .btn-signup {
            border-radius: 30px;
            font-size: 18px;
            padding: 10px;
        }

        .login-link {
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-4">

            <div class="card signup-card p-4">
                <div class="text-center mb-4">
                    <i class="bi bi-person-plus-fill fs-1 text-success"></i>
                    <h3 class="signup-title mt-2">Create Account</h3>
                    <p class="text-muted">Join our cafe community</p>
                </div>

                <!-- Name -->
                <div class="position-relative mb-3">
                    <i class="bi bi-person input-icon"></i>
                    <input id="name" class="form-control" placeholder="Full Name">
                </div>

                <!-- Email -->
                <div class="position-relative mb-3">
                    <i class="bi bi-envelope input-icon"></i>
                    <input id="email" type="email" class="form-control" placeholder="Email">
                </div>

                <!-- Password -->
                <div class="position-relative mb-4">
                    <i class="bi bi-lock input-icon"></i>
                    <input id="password" type="password" class="form-control" placeholder="Password">
                </div>

                <button id="signupBtn" class="btn btn-success w-100 btn-signup" onclick="signup()">
                    <i class="bi bi-check-circle"></i> Signup
                </button>

                <div class="text-center mt-3 login-link">
                    Already have an account?
                    <a href="login.jsp" class="text-success fw-semibold">Login</a>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
async function signup() {
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;

    const res = await fetch("/api/auth/signup", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email, password })
    });

    if (res.ok) {
        alert("Signup successful! Redirecting to login...");
        window.location.replace("/");   // 👈 force redirect to login
    } else {
        const msg = await res.text();
        alert("Signup failed: " + msg);
    }
	if (res.ok) {
	    alert("Signup successful");
	    window.location.href = "/";   // 👈 go to login controller
	}

}
</script>


</body>
</html>
