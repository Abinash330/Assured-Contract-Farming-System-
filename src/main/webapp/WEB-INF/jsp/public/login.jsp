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
        <main class="w-100 min-vh-100 d-flex align-items-center bg-light">
            <div class="container-fluid p-0 h-100">
                <div class="row g-0 h-100 align-items-center">
                    
                    <!-- Left Promo Column -->
                    <div class="col-lg-6 d-none d-lg-flex flex-column justify-content-between text-white position-relative min-vh-100 p-5 overflow-hidden" style="background: linear-gradient(135deg, rgba(16,185,129,0.85) 0%, rgba(6,78,59,0.95) 100%), url('/images/growing-organic-ecological-plants-fields-background.jpg') center/cover no-repeat;">
                        <!-- Decorative Circles -->
                        <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 500px; height: 500px; top: -150px; left: -100px; filter: blur(60px);"></div>
                        <div class="position-absolute bg-black rounded-circle opacity-25" style="width: 400px; height: 400px; bottom: -50px; right: -150px; filter: blur(50px);"></div>
                        
                        <div class="position-relative z-1 mb-5">
                            <h2 class="fw-bold fs-3 d-flex align-items-center">
                                <i class="bi bi-bezier2 me-2 fs-2"></i> Agri<span class="text-white opacity-75">Trust</span>
                            </h2>
                        </div>
                        
                        <div class="position-relative z-1 my-auto">
                            <span class="badge bg-white bg-opacity-25 text-white border border-white border-opacity-50 px-3 py-2 rounded-pill mb-4 d-inline-flex align-items-center shadow-sm">
                                <i class="bi bi-shield-lock-fill me-2 text-warning"></i> Secure Trading Network
                            </span>
                            <h1 class="display-4 fw-bold mb-4 let-spacing-tight">Welcome to the Future of Contract Farming.</h1>
                            <p class="fs-5 text-white opacity-75 mb-5 lh-base w-75">Connect directly with verified corporate buyers and establish rigid, legally bound, digitally escrowed agricultural contracts.</p>
                            
                            <div class="d-flex gap-4">
                                <div class="d-flex align-items-center text-white">
                                    <div class="bg-white bg-opacity-10 p-3 rounded-circle me-3 border border-white border-opacity-25">
                                        <i class="bi bi-graph-up-arrow fs-4"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-0 fw-bold">100%</h4>
                                        <small class="opacity-75">Price Assurance</small>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center text-white">
                                    <div class="bg-white bg-opacity-10 p-3 rounded-circle me-3 border border-white border-opacity-25">
                                        <i class="bi bi-wallet2 fs-4"></i>
                                    </div>
                                    <div>
                                        <h4 class="mb-0 fw-bold">Zero</h4>
                                        <small class="opacity-75">Middlemen</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="position-relative z-1 mt-5 pt-5 border-top border-white border-opacity-25 d-flex justify-content-between align-items-center">
                            <p class="small mb-0 opacity-75">&copy; 2026 Assured Contract Farming Platform</p>
                            <div class="d-flex gap-3">
                                <span class="bg-dark bg-opacity-25 px-2 py-1 rounded small border border-secondary shadow-sm text-white" style="transform: scale(0.9); transform-origin: left center;">
                                    <div id="google_translate_element"></div>
                                </span>
                                <a href="#" class="text-white opacity-75 hover-white mt-1"><i class="bi bi-twitter-x"></i></a>
                                <a href="#" class="text-white opacity-75 hover-white mt-1"><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Right Form Column -->
                    <div class="col-lg-6 d-flex align-items-center justify-content-center p-4 p-md-5">
                        <div class="w-100" style="max-width: 480px;">
                            
                            <!-- Mobile Logo -->
                            <div class="text-center d-lg-none mb-5">
                                <div class="d-inline-flex bg-success bg-opacity-10 p-3 rounded-circle mb-3 border border-success border-opacity-25 shadow-sm">
                                    <i class="bi bi-bezier2 text-success" style="font-size: 2.5rem;"></i>
                                </div>
                            </div>

                            <div class="mb-5">
                                <h2 class="fw-bold text-dark mb-2 display-6">Sign In</h2>
                                <p class="text-muted fs-5">Access your decentralized agricultural portoflio.</p>
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
                                <div class="mb-4">
                                    <label for="floatingInput" class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Account Endpoint</label>
                                    <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                        <span class="input-group-text bg-white border-end-0 px-4 text-secondary"><i class="bi bi-envelope"></i></span>
                                        <input type="email" class="form-control form-control-lg border-start-0 bg-white focus-ring-success py-3" id="floatingInput" name="email" placeholder="name@domain.com" required>
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <label for="floatingPassword" class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1 mb-0">Cryptographic Key</label>
                                        <a href="/forgot_password" class="text-decoration-none text-success small fw-bold hover-dark transition">Forgot Key?</a>
                                    </div>
                                    <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                        <span class="input-group-text bg-white border-end-0 px-4 text-secondary"><i class="bi bi-key"></i></span>
                                        <input type="password" class="form-control form-control-lg border-start-0 bg-white focus-ring-success py-3" id="floatingPassword" name="password" placeholder="••••••••" required>
                                    </div>
                                </div>

                                <div class="mb-4 d-flex align-items-center ms-1">
                                    <input type="checkbox" class="form-check-input border-secondary border-opacity-50 mt-0 me-2 cursor-pointer shadow-sm" id="rememberMe">
                                    <label class="form-check-label text-muted small cursor-pointer" for="rememberMe">Maintain authorized session</label>
                                </div>

                                <button class="btn btn-premium w-100 py-3 mb-4 rounded-pill fs-5 shadow-lg group hover-elevate transition" type="submit">
                                    Authenticate Node <i class="bi bi-arrow-right-short ms-1 transition group-hover-translate-x fs-4 vertical-align-middle"></i>
                                </button>

                                <div class="text-center mt-4">
                                    <p class="text-muted mb-3">Don't have a network identity?</p>
                                    <a href="/register" class="btn btn-outline-dark w-100 rounded-pill py-3 fw-bold transition hover-bg-light">Create Trading Account</a>
                                </div>

                                <div class="text-center mt-5">
                                    <a href="/" class="text-muted text-decoration-none small hover-success transition"><i class="bi bi-arrow-left me-1"></i> Return to Public Sector</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
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