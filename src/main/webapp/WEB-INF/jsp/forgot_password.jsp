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
        <main class="w-100 min-vh-100 d-flex bg-light">
            <div class="container-fluid p-0 h-100">
                <div class="row g-0 align-items-stretch min-vh-100">
                    
                    <!-- Left Promo Column -->
                    <div class="col-lg-5 col-xl-4 d-none d-lg-flex flex-column justify-content-between text-white position-relative p-5 overflow-hidden position-fixed h-100" style="background: linear-gradient(135deg, var(--primary-green) 0%, #064e3b 100%);">
                        <!-- Decorative Shapes -->
                        <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 400px; height: 400px; top: -100px; right: -150px; filter: blur(50px);"></div>
                        
                        <div class="position-relative z-1 mb-5">
                            <h2 class="fw-bold fs-3 d-flex align-items-center">
                                <i class="bi bi-bezier2 me-2 fs-2"></i> Agri<span class="text-white opacity-75">Trust</span>
                            </h2>
                        </div>
                        
                        <div class="position-relative z-1 my-auto">
                            <span class="badge bg-white bg-opacity-25 text-white border border-white border-opacity-50 px-3 py-2 rounded-pill mb-4 d-inline-flex align-items-center shadow-sm">
                                <i class="bi bi-shield-lock-fill me-2 text-warning"></i> Access Recovery
                            </span>
                            <h1 class="display-5 fw-bold mb-4 let-spacing-tight">Lost your Key?</h1>
                            <p class="fs-6 text-white opacity-75 mb-4 lh-base w-75">No worries. Our decentralized identity protocol allows verified nodes to securely recover access pathways.</p>
                            
                            <div class="d-flex align-items-center bg-white bg-opacity-10 p-3 rounded-4 mt-5 border border-white border-opacity-25 w-75">
                                <i class="bi bi-info-circle-fill text-warning me-3 fs-3"></i>
                                <span class="small opacity-75 fw-medium">Recovery emails are dispatched instantly via an encrypted 256-bit secure tunnel protocol.</span>
                            </div>
                        </div>
                        
                        <div class="position-relative z-1 mt-5">
                            <p class="small mb-0 opacity-50">&copy; 2026 Core Infrastructure</p>
                        </div>
                    </div>

                    <!-- Right Form Column -->
                    <div class="col-lg-7 col-xl-8 offset-lg-5 offset-xl-4 d-flex align-items-center justify-content-center p-4 p-md-5 py-lg-5" style="min-height: 100vh;">
                        <div class="w-100" style="max-width: 500px;">
                            
                            <!-- Mobile Logo -->
                            <div class="text-center d-lg-none mb-4">
                                <div class="d-inline-flex bg-primary bg-opacity-10 p-3 rounded-circle mb-2 border border-primary border-opacity-25 shadow-sm">
                                    <i class="bi bi-key-fill text-primary" style="font-size: 2rem;"></i>
                                </div>
                            </div>

                            <div class="mb-5 text-center text-lg-start">
                                <h2 class="fw-bold text-dark mb-2 display-6">Password Recovery</h2>
                                <p class="text-muted fs-5">Identify your authorized communication endpoint.</p>
                            </div>

                            <c:if test="${not empty message}">
                                <div class="alert alert-info alert-dismissible fade show rounded-4 border-0 shadow-sm px-4 py-3 bg-info bg-opacity-10 text-primary mb-4" role="alert">
                                    <i class="bi bi-info-circle-fill me-2"></i>
                                    <span class="fw-bold">${message}</span>
                                    <button type="button" class="btn-close mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            </c:if>

                            <form action="/forgot_password" method="post" class="bg-white p-4 p-md-5 rounded-4 border shadow-sm">
                                <div class="mb-4">
                                    <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Account Endpoint</label>
                                    <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                        <span class="input-group-text bg-light border-0 px-4 text-secondary"><i class="bi bi-envelope"></i></span>
                                        <input type="email" class="form-control form-control-lg border-0 bg-light focus-ring-primary py-3" name="email" placeholder="name@domain.com" required>
                                    </div>
                                    <div class="form-text mt-3 ms-1 text-muted small"><i class="bi bi-check2-circle text-success me-1"></i> A temporary recovery key will be dispatched securely.</div>
                                </div>

                                <button class="btn btn-primary w-100 py-3 mt-4 rounded-pill fs-5 shadow-lg fw-bold transition hover-elevate group" type="submit">
                                    Initialize Recovery Sequence <i class="bi bi-unlock-fill ms-2 transition group-hover-translate-x fs-5 vertical-align-middle d-inline-block"></i>
                                </button>
                            </form>
                            
                            <div class="text-center mt-5 mb-4">
                                <a href="/login" class="text-muted text-decoration-none fw-bold hover-dark transition"><i class="bi bi-arrow-left me-2"></i> Abort & Return to Login</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <script>
            <c:if test="${not empty email and not empty tempPassword}">
                window.onload = function() {
                    var email = "${email}";
                    var tempPassword = "${tempPassword}";
                    // Display highly styled alert rather than native
                    alert("DEMO RECOVERY\\n───────────────\\nEndpoint: " + email + "\\nTemp Key: " + tempPassword);
                }
            </c:if>
        </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>