<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Register - Assured Contract Farming</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="py-5">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-md-9 col-lg-7">
                    <div class="glass-card hover-elevate">
                        <div class="p-4 p-md-5">
                            <div class="text-center mb-5">
                                <div class="d-inline-flex bg-success bg-opacity-10 p-3 rounded-circle mb-3">
                                    <i class="bi bi-person-plus-fill text-success" style="font-size: 2.5rem;"></i>
                                </div>
                                <h2 class="fw-bold text-dark mb-2">Create an Account</h2>
                                <p class="text-muted">Join our trusted cooperative farming platform.</p>
                            </div>

                            <% if (request.getAttribute("error") !=null) { %>
                                <div class="alert alert-danger alert-dismissible fade show rounded-3" role="alert">
                                    <i class="bi bi-exclamation-triangle-fill me-2"></i>
                                    <%= request.getAttribute("error") %>
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                </div>
                                <% } %>

                                    <form action="/register" method="post">
                                        <div class="row g-4">
                                            <div class="col-sm-6">
                                                <label
                                                    class="form-label fw-semibold text-muted small ms-1">Username</label>
                                                <input type="text" class="form-control px-4 py-2" name="username"
                                                    placeholder="JohnDoe" required>
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="form-label fw-semibold text-muted small ms-1">Email
                                                    Address</label>
                                                <input type="email" class="form-control px-4 py-2" name="email"
                                                    placeholder="john@example.com" required>
                                            </div>

                                            <div class="col-sm-6">
                                                <label
                                                    class="form-label fw-semibold text-muted small ms-1">Password</label>
                                                <input type="password" class="form-control px-4 py-2" name="password"
                                                    placeholder="Create a strong password" required>
                                            </div>

                                            <div class="col-sm-6">
                                                <label class="form-label fw-semibold text-muted small ms-1">Location /
                                                    Address</label>
                                                <input type="text" class="form-control px-4 py-2" name="address"
                                                    placeholder="123 Farm Lane, District" required>
                                            </div>

                                            <div class="col-sm-6">
                                                <label class="form-label fw-bold small text-success ms-1"><i
                                                        class="bi bi-shield-check me-1"></i>Aadhaar Number (KYC)</label>
                                                <input type="text" class="form-control border-success px-4 py-2"
                                                    name="aadhaarNumber" placeholder="12-digit format" required>
                                            </div>
                                            <div class="col-sm-6">
                                                <label class="form-label fw-bold small text-success ms-1"><i
                                                        class="bi bi-shield-check me-1"></i>PAN Number (KYC)</label>
                                                <input type="text" class="form-control border-success px-4 py-2"
                                                    name="panNumber" placeholder="10-digit format" required>
                                            </div>

                                            <div class="col-12 mt-4">
                                                <label class="form-label fw-semibold text-muted small ms-1">Account
                                                    Type</label>
                                                <select class="form-select px-4 py-3 bg-light text-secondary"
                                                    name="role" required>
                                                    <option value="" disabled selected>Select your Role...</option>
                                                    <option value="farmer">🚜 Farmer (Seller)</option>
                                                    <option value="buyer">💼 Buyer (Corporate/Retail)</option>
                                                    <option value="inspector">🔍 Inspector (Quality Control)</option>
                                                </select>
                                            </div>
                                        </div>

                                        <button class="btn btn-premium w-100 py-3 mt-5 shadow-sm fw-bold fs-5"
                                            type="submit">Complete Registration</button>

                                        <div class="text-center mt-4 border-top pt-4">
                                            <p class="text-muted small">Already have an account? <a href="/login"
                                                    class="text-success text-decoration-none fw-bold ms-1">Sign In
                                                    here</a></p>
                                        </div>
                                    </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>