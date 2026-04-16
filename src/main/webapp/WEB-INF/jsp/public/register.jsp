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
        <main class="w-100 min-vh-100 d-flex bg-light">
            <div class="container-fluid p-0 h-100">
                <div class="row g-0 align-items-stretch min-vh-100">
                    
                    <!-- Left Promo Column -->
                    <div class="col-lg-5 col-xl-4 d-none d-lg-flex flex-column justify-content-between text-white position-relative p-5 overflow-hidden position-fixed h-100" style="background: linear-gradient(135deg, rgba(16,185,129,0.85) 0%, rgba(6,78,59,0.95) 100%), url('/images/hero-bg.png') center/cover no-repeat;">
                        <!-- Decorative Shapes -->
                        <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 400px; height: 400px; top: -100px; right: -150px; filter: blur(50px);"></div>
                        
                        <div class="position-relative z-1 mb-5">
                            <h2 class="fw-bold fs-3 d-flex align-items-center">
                                <i class="bi bi-bezier2 me-2 fs-2"></i> Agri<span class="text-white opacity-75">Trust</span>
                            </h2>
                        </div>
                        
                        <div class="position-relative z-1 my-auto">
                            <span class="badge bg-white bg-opacity-25 text-white border border-white border-opacity-50 px-3 py-2 rounded-pill mb-4 d-inline-flex align-items-center shadow-sm">
                                <i class="bi bi-person-badge-fill me-2 text-warning"></i> Identity Verification
                            </span>
                            <h1 class="display-5 fw-bold mb-4 let-spacing-tight">Join the Network</h1>
                            <p class="fs-6 text-white opacity-75 mb-4 lh-base">Establish your on-chain identity to participate in zero-trust agricultural trading.</p>
                            
                            <ul class="list-unstyled text-white opacity-75 mb-0 fs-6">
                                <li class="mb-3 d-flex align-items-center"><i class="bi bi-check-circle-fill text-success bg-white rounded-circle me-3 fs-5"></i> 100% Verified Corporate Buyers</li>
                                <li class="mb-3 d-flex align-items-center"><i class="bi bi-check-circle-fill text-success bg-white rounded-circle me-3 fs-5"></i> Decentralized Escrow Protection</li>
                                <li class="mb-3 d-flex align-items-center"><i class="bi bi-check-circle-fill text-success bg-white rounded-circle me-3 fs-5"></i> Institutional KYC/AML Audits</li>
                            </ul>
                        </div>
                        
                        <div class="position-relative z-1 mt-5">
                            <p class="small mb-2 opacity-50">&copy; 2026 Core Infrastructure</p>
                            <span class="bg-dark bg-opacity-25 px-2 py-1 rounded small border border-secondary shadow-sm text-white d-inline-block" style="transform: scale(0.9); transform-origin: left center;">
                                <div id="google_translate_element"></div>
                            </span>
                        </div>
                    </div>

                    <!-- Right Form Column -->
                    <div class="col-lg-7 col-xl-8 offset-lg-5 offset-xl-4 d-flex align-items-center justify-content-center p-4 p-md-5 py-lg-5" style="min-height: 100vh;">
                        <div class="w-100" style="max-width: 700px;">
                            
                            <!-- Mobile Logo -->
                            <div class="text-center d-lg-none mb-4">
                                <div class="d-inline-flex bg-success bg-opacity-10 p-3 rounded-circle mb-2 border border-success border-opacity-25 shadow-sm">
                                    <i class="bi bi-bezier2 text-success" style="font-size: 2rem;"></i>
                                </div>
                            </div>

                            <div class="mb-5 text-center text-lg-start">
                                <h2 class="fw-bold text-dark mb-2 display-6">Node Registration</h2>
                                <p class="text-muted fs-5">Initialize your secure marketplace identity.</p>
                            </div>

                            <% if (request.getAttribute("error") !=null) { %>
                                <div class="alert alert-danger alert-dismissible fade show rounded-4 border-0 shadow-sm px-4 py-3 bg-danger bg-opacity-10 text-danger mb-4" role="alert">
                                    <i class="bi bi-exclamation-octagon-fill me-2"></i>
                                    <span class="fw-bold"><%= request.getAttribute("error") %></span>
                                    <button type="button" class="btn-close mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                                </div>
                            <% } %>

                            <form action="/register" method="post" class="bg-white p-4 p-md-5 rounded-4 border shadow-sm">
                                <h5 class="fw-bold text-dark mb-4 border-bottom pb-3"><i class="bi bi-1-circle text-primary me-2"></i> Core Identity</h5>
                                
                                <div class="row g-4 mb-5">
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Public Display Name</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-person"></i></span>
                                            <input type="text" class="form-control form-control-lg border-0 bg-light focus-ring-success" name="username" placeholder="e.g. AgriCorp Ltd" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Communication Channel</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-envelope"></i></span>
                                            <input type="email" class="form-control form-control-lg border-0 bg-light focus-ring-success" name="email" placeholder="Email Address" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Cryptographic Key</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-key"></i></span>
                                            <input type="password" class="form-control form-control-lg border-0 bg-light focus-ring-success" name="password" placeholder="Strong Password" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Geographical Node</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-geo-alt"></i></span>
                                            <input type="text" class="form-control form-control-lg border-0 bg-light focus-ring-success" name="address" placeholder="Physical Address" required>
                                        </div>
                                    </div>
                                </div>

                                <h5 class="fw-bold text-dark mb-4 border-bottom pb-3"><i class="bi bi-2-circle text-primary me-2"></i> Institutional KYC</h5>
                                
                                <div class="row g-4 mb-5">
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-success text-uppercase tracking-wider ms-1"><i class="bi bi-shield-check me-1"></i> Aadhaar Hash</label>
                                        <input type="text" class="form-control form-control-lg border border-success border-opacity-25 bg-success bg-opacity-10 text-dark fw-bold font-monospace focus-ring-success" style="border-radius: 0.75rem;" name="aadhaarNumber" placeholder="xxxx-xxxx-xxxx" required>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-success text-uppercase tracking-wider ms-1"><i class="bi bi-shield-check me-1"></i> Taxation PAN</label>
                                        <input type="text" class="form-control form-control-lg border border-success border-opacity-25 bg-success bg-opacity-10 text-dark fw-bold font-monospace focus-ring-success text-uppercase" style="border-radius: 0.75rem;" name="panNumber" placeholder="ABCDE1234F" required>
                                    </div>
                                </div>

                                <h5 class="fw-bold text-dark mb-4 border-bottom pb-3"><i class="bi bi-3-circle text-primary me-2"></i> Network Role Assignment</h5>
                                
                                <div class="mb-5">
                                    <div class="row g-3">
                                        <div class="col-sm-4">
                                            <input type="radio" class="btn-check" name="role" id="roleFarmer" value="farmer" required>
                                            <label class="btn btn-outline-success w-100 py-3 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-2 border-2" for="roleFarmer">
                                                <i class="bi bi-tractor display-6"></i>
                                                <span class="fw-bold">Farmer Node</span>
                                            </label>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="radio" class="btn-check" name="role" id="roleBuyer" value="buyer" required>
                                            <label class="btn btn-outline-primary w-100 py-3 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-2 border-2" for="roleBuyer">
                                                <i class="bi bi-building display-6"></i>
                                                <span class="fw-bold">Corporate Buyer</span>
                                            </label>
                                        </div>
                                        <div class="col-sm-4">
                                            <input type="radio" class="btn-check" name="role" id="roleInspector" value="inspector" required>
                                            <label class="btn btn-outline-dark w-100 py-3 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-2 border-2" for="roleInspector">
                                                <i class="bi bi-clipboard-check display-6"></i>
                                                <span class="fw-bold">Inspector Node</span>
                                            </label>
                                        </div>
                                    </div>
                                </div>

                                <button class="btn btn-premium w-100 py-3 mt-2 rounded-pill shadow-lg fw-bold fs-5 group hover-elevate transition" type="submit">
                                    Finalize Registration <i class="bi bi-patch-check-fill ms-2 transition group-hover-translate-x fs-5 vertical-align-middle"></i>
                                </button>
                            </form>
                            
                            <div class="text-center mt-5 mb-4">
                                <p class="text-muted fw-medium">Already deployed on network? <a href="/login" class="text-success text-decoration-none fw-bold ms-1 hover-dark transition">Authenticate Here</a></p>
                            </div>
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