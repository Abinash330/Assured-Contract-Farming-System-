<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Forgot Password - Assured Contract Farming</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link rel="stylesheet" href="/global-theme.css">
        </head>

        <body class="d-flex align-items-center py-5">
            <main class="form-signin w-100 m-auto" style="max-width: 450px;">
                <div class="glass-card hover-elevate p-5 text-center">

                    <div class="d-inline-flex bg-primary bg-opacity-10 p-3 rounded-circle mb-4">
                        <i class="bi bi-key-fill text-primary" style="font-size: 2.5rem;"></i>
                    </div>

                    <h2 class="fw-bold mb-2 text-dark">Password Recovery</h2>
                    <p class="text-muted small mb-4">Enter your registered email address to receive a temporary
                        password.</p>

                    <c:if test="${not empty message}">
                        <div class="alert alert-info alert-dismissible fade show text-start rounded-3 shadow-sm"
                            role="alert">
                            <i class="bi bi-info-circle-fill me-2"></i>${message}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>

                    <form action="/forgot_password" method="post" class="text-start">
                        <div class="form-floating mb-4">
                            <input type="email" class="form-control" id="floatingInput" name="email"
                                placeholder="name@example.com" required>
                            <label for="floatingInput" class="text-muted">Email address</label>
                        </div>

                        <button class="btn btn-premium w-100 py-3 mb-4 rounded-pill fw-bold shadow-sm"
                            type="submit">Reset Password</button>

                        <div class="text-center mt-2 border-top pt-4">
                            <a href="/login" class="text-muted text-decoration-none small"><i
                                    class="bi bi-arrow-left me-1"></i> Back to Login</a>
                        </div>
                    </form>
                </div>
            </main>

            <script>
                <c:if test="${not empty email and not empty tempPassword}">
                    window.onload = function() {
            var email = "${email}";
                    var tempPassword = "${tempPassword}";
                    alert("Recovery generated for:\\nEmail: " + email + "\\nTemporary Password: " + tempPassword + "\\n(For demo purposes only)");
        }
                </c:if>
            </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>