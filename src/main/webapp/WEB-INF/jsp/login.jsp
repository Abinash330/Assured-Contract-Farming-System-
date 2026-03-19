<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login - Assured Contract Farming</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="d-flex align-items-center py-4">
        <main class="form-signin w-100 m-auto" style="max-width: 450px;">
            <div class="glass-card p-5 hover-elevate">
                <div class="text-center mb-4">
                    <div class="d-inline-flex bg-success bg-opacity-10 p-3 rounded-circle mb-3">
                        <i class="bi bi-seedling text-success form-icon" style="font-size: 2.5rem;"></i>
                    </div>
                    <h2 class="fw-bold text-dark mb-1">Welcome Back</h2>
                    <p class="text-muted small">Sign in to manage your contracts securely.</p>
                </div>

                <% if (request.getAttribute("error") !=null) { %>
                    <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>
                        <%= request.getAttribute("error") %>
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                    <% } %>

                        <% if (request.getAttribute("message") !=null) { %>
                            <div class="alert alert-success alert-dismissible fade show rounded-3" role="alert">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                <%= request.getAttribute("message") %>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                            </div>
                            <% } %>

                                <form action="/login" method="post">
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control" id="floatingInput" name="email"
                                            placeholder="name@example.com" required>
                                        <label for="floatingInput" class="text-muted">Email address</label>
                                    </div>
                                    <div class="form-floating mb-4">
                                        <input type="password" class="form-control" id="floatingPassword"
                                            name="password" placeholder="Password" required>
                                        <label for="floatingPassword" class="text-muted">Password</label>
                                    </div>

                                    <button class="btn btn-premium w-100 py-3 mb-4 rounded-pill fs-5 shadow-sm"
                                        type="submit">Sign In</button>

                                    <div class="d-flex justify-content-between mb-4 small fw-medium">
                                        <a href="/forgot_password" class="text-decoration-none text-muted">Forgot
                                            password?</a>
                                        <a href="/register" class="text-decoration-none text-success">Create account</a>
                                    </div>

                                    <div class="text-center mt-3 border-top pt-4">
                                        <a href="/" class="text-muted text-decoration-none small"><i
                                                class="bi bi-arrow-left me-1"></i> Back to Home</a>
                                    </div>
                                </form>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>