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
        <main class="w-100 min-vh-100 d-flex align-items-center justify-content-center position-relative" style="background: url('https://images.unsplash.com/photo-1592982537447-6f23f03bdf81?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat; overflow: hidden;">
            <!-- Dark Overlay -->
            <div class="position-absolute top-0 start-0 w-100 h-100" style="background-color: rgba(0, 0, 0, 0.45); z-index: 1;"></div>
            
            <!-- Animated Glowing Elements -->
            <div class="position-absolute bg-warning rounded-circle opacity-25 pulse" style="width: 50vh; height: 50vh; top: 10%; right: 15%; filter: blur(100px); z-index: 1;"></div>
            <div class="position-absolute bg-success rounded-circle opacity-50 pulse" style="width: 60vh; height: 60vh; bottom: 5%; left: 10%; filter: blur(120px); animation-delay: 2s; z-index: 1;"></div>

            <!-- Floating Logo -->
            <div class="position-absolute" style="top: 2rem; left: 2rem; mix-blend-mode: screen; opacity: 0.85; z-index: 5; animation: float 6s ease-in-out infinite;">
                <img src="/images/agritrust_logo.png" alt="AgriTrust System" style="width: 250px; filter: drop-shadow(0 0 15px rgba(16,185,129,0.5));">
            </div>

            <!-- Login Glass Card -->
            <div class="position-relative z-2 w-100" style="max-width: 500px; margin: 0 1.5rem;">
                <!-- Decorative Top Icon Avatar -->
                <div class="text-center mb-4 position-relative z-3" style="margin-top: -50px;">
                    <div class="d-inline-flex border border-4 border-success border-opacity-50 shadow-lg rounded-circle overflow-hidden bg-black align-items-center justify-content-center" style="animation: pulse 3s infinite; width: 110px; height: 110px;">
                        <img src="/images/premium_circle_icon.png" alt="System Avatar" style="width: 140%; height: 140%; object-fit: cover; object-position: center;">
                    </div>
                </div>

                <div class="p-4 p-md-5 w-100 position-relative" style="backdrop-filter: blur(20px) saturate(200%); -webkit-backdrop-filter: blur(20px) saturate(200%); background-color: rgba(255, 255, 255, 0.9); border-radius: 28px; border: 1px solid rgba(255, 255, 255, 0.6); box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.5);">
                    <div class="text-center mb-5">
                        <h2 class="fw-bolder text-dark mb-2 display-6 tracking-tight">Welcome Back</h2>
                        <p class="text-secondary fs-6">Access your decentralized agriculture portfolio.</p>
                    </div>

                    <% if (request.getAttribute("error") !=null) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-4 border-0 shadow-sm px-4 py-3 bg-danger bg-opacity-10 text-danger" role="alert">
                            <i class="bi bi-exclamation-octagon-fill me-2"></i>
                            <span class="fw-bold"><%= request.getAttribute("error") %></span>
                            <button type="button" class="btn-close mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <% if (request.getAttribute("message") !=null) { %>
                        <div class="alert alert-success alert-dismissible fade show rounded-4 border-0 shadow-sm px-4 py-3 bg-success bg-opacity-10 text-success" role="alert">
                            <i class="bi bi-check-circle-fill me-2"></i>
                            <span class="fw-bold"><%= request.getAttribute("message") %></span>
                            <button type="button" class="btn-close mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="/login" method="post" class="mt-4">
                        <div class="mb-4 form-floating">
                            <input type="email" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="floatingInput" name="email" placeholder="name@domain.com" required style="padding-left: 3.5rem;">
                            <label for="floatingInput" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Email / Account Endpoint</label>
                            <i class="bi bi-envelope-at-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                        </div>
                        
                        <div class="mb-4 form-floating position-relative">
                            <input type="password" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="floatingPassword" name="password" placeholder="Password" required style="padding-left: 3.5rem;">
                            <label for="floatingPassword" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Cryptographic Password</label>
                            <i class="bi bi-shield-lock-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mt-2 mb-4 px-2">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input border-secondary border-opacity-50 mt-1 me-2 cursor-pointer shadow-sm" id="rememberMe">
                                <label class="form-check-label text-muted small fw-bold cursor-pointer" for="rememberMe">Remember me</label>
                            </div>
                            <a href="/forgot_password" class="text-decoration-none text-success small fw-bold hover-dark transition"><i class="bi bi-question-circle me-1"></i> Forgot Password?</a>
                        </div>

                        <button class="btn btn-success w-100 py-3 mb-4 rounded-pill fs-5 shadow-lg group hover-elevate transition fw-bold d-flex justify-content-center align-items-center border-0" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);" type="submit">
                            Sign In securely <i class="bi bi-arrow-right-circle-fill ms-2 fs-4 transition group-hover-translate-x"></i>
                        </button>

                        <div class="text-center mt-4">
                            <p class="text-muted small mb-2">Don't have a network identity?</p>
                            <a href="/register" class="btn btn-outline-dark w-100 rounded-pill py-3 fw-bold transition hover-bg-light shadow-sm">Create Trading Account</a>
                        </div>

                        <div class="text-center mt-4 pt-3 border-top border-secondary border-opacity-10 d-flex justify-content-between align-items-center">
                            <a href="/" class="text-muted text-decoration-none small hover-success transition"><i class="bi bi-arrow-left me-1"></i> Return</a>
                            <span class="bg-light px-2 py-1 rounded small border border-secondary border-opacity-25 shadow-sm text-dark d-inline-block" style="transform: scale(0.85); transform-origin: right center;">
                                <div id="google_translate_element"></div>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <style>
                @keyframes float {
                    0% { transform: translateY(0px); }
                    50% { transform: translateY(-15px); }
                    100% { transform: translateY(0px); }
                }
            </style>
        </main>
        <script type="text/javascript">
            function googleTranslateElementInit() {
                new google.translate.TranslateElement({
                    pageLanguage: 'en',
                    includedLanguages: 'hi,mr,bn,te,ta,gu,kn,ml,pa,or',
                    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
                }, 'google_translate_element');
            }
        </script>
        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>