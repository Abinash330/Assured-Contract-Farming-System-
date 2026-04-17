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
        <main class="w-100 min-vh-100 d-flex align-items-center justify-content-center py-5 position-relative" style="background: url('https://images.unsplash.com/photo-1592982537447-6f23f03bdf81?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80') center/cover no-repeat; overflow-x: hidden;">
            <!-- Dark Overlay -->
            <div class="position-absolute top-0 start-0 w-100 h-100" style="background-color: rgba(0, 0, 0, 0.45); z-index: 1;"></div>
            
            <!-- Animated Glowing Elements -->
            <div class="position-absolute bg-warning rounded-circle opacity-25 pulse" style="width: 50vh; height: 50vh; top: 5%; left: 15%; filter: blur(100px); z-index: 1;"></div>
            <div class="position-absolute bg-success rounded-circle opacity-50 pulse" style="width: 60vh; height: 60vh; bottom: 5%; right: 10%; filter: blur(120px); animation-delay: 2s; z-index: 1;"></div>

            <!-- Floating Logo -->
            <div class="position-absolute d-none d-xl-block" style="top: 3rem; right: 4rem; mix-blend-mode: screen; opacity: 0.85; z-index: 5; animation: float 6s ease-in-out infinite;">
                <img src="/images/agritrust_logo.png" alt="AgriTrust System" style="width: 320px; filter: drop-shadow(0 0 15px rgba(16,185,129,0.5));">
            </div>

            <!-- Glass Registration Card -->
            <div class="position-relative z-2 w-100 mt-4 mt-lg-0" style="max-width: 850px; margin: 0 1.5rem;">
                
                <!-- Decorative Top Icon Avatar -->
                <div class="text-center mb-4 position-relative z-3" style="margin-top: -50px;">
                    <div class="d-inline-flex border border-4 border-success border-opacity-50 shadow-lg rounded-circle overflow-hidden bg-black align-items-center justify-content-center" style="animation: pulse 3s infinite; width: 110px; height: 110px;">
                        <img src="/images/premium_circle_icon.png" alt="Registration Avatar" style="width: 140%; height: 140%; object-fit: cover; object-position: center;">
                    </div>
                </div>

                <div class="p-4 p-md-5 w-100 position-relative" style="backdrop-filter: blur(20px) saturate(200%); -webkit-backdrop-filter: blur(20px) saturate(200%); background-color: rgba(255, 255, 255, 0.9); border-radius: 28px; border: 1px solid rgba(255, 255, 255, 0.6); box-shadow: 0 30px 60px -15px rgba(0, 0, 0, 0.5);">
                    <div class="text-center mb-5">
                        <h2 class="fw-bolder text-dark mb-2 display-6 tracking-tight">Node Registration</h2>
                        <p class="text-secondary fs-6">Initialize your secure marketplace identity.</p>
                    </div>

                    <% if (request.getAttribute("error") !=null) { %>
                        <div class="alert alert-danger alert-dismissible fade show rounded-4 border-0 shadow-sm px-4 py-3 bg-danger bg-opacity-10 text-danger mb-4" role="alert">
                            <i class="bi bi-exclamation-octagon-fill me-2"></i>
                            <span class="fw-bold"><%= request.getAttribute("error") %></span>
                            <button type="button" class="btn-close mt-1" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                    <form action="/register" method="post">
                        <h5 class="fw-bold text-dark mb-4 border-bottom border-secondary border-opacity-25 pb-3">
                            <span class="bg-success bg-opacity-10 text-success rounded-circle d-inline-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px;"><i class="bi bi-person-lines-fill"></i></span> 
                            Core Identity
                        </h5>
                        
                        <div class="row g-4 mb-5">
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="text" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="regDisplay" name="username" placeholder="Company Name" required style="padding-left: 3.5rem;">
                                    <label for="regDisplay" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Public Display Name</label>
                                    <i class="bi bi-person-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="email" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="regEmail" name="email" placeholder="Email Address" required style="padding-left: 3.5rem;">
                                    <label for="regEmail" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Email Address</label>
                                    <i class="bi bi-envelope-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="password" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="regKey" name="password" placeholder="Key" required style="padding-left: 3.5rem;">
                                    <label for="regKey" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Cryptographic Key</label>
                                    <i class="bi bi-key-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="text" class="form-control form-control-lg border border-light-subtle shadow-sm bg-white focus-ring-success rounded-4 fw-medium" id="regGeo" name="address" placeholder="Physical Address" required style="padding-left: 3.5rem;">
                                    <label for="regGeo" class="fw-bold text-muted small" style="margin-left: 2.2rem; margin-top: -2px;">Geographical Node</label>
                                    <i class="bi bi-geo-alt-fill position-absolute text-success fs-5 opacity-75" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-bold text-dark mb-4 border-bottom border-secondary border-opacity-25 pb-3">
                            <span class="bg-success bg-opacity-10 text-success rounded-circle d-inline-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px;"><i class="bi bi-shield-lock"></i></span> 
                            Institutional KYC
                        </h5>
                        
                        <div class="row g-4 mb-5">
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="text" class="form-control form-control-lg border border-success border-opacity-50 shadow-sm bg-success bg-opacity-10 text-dark fw-bold font-monospace focus-ring-success rounded-4" id="regAadhaar" name="aadhaarNumber" placeholder="Aadhaar" required style="padding-left: 3.5rem;">
                                    <label for="regAadhaar" class="fw-bold text-success small" style="margin-left: 2.2rem; margin-top: -2px;">Aadhaar Hash</label>
                                    <i class="bi bi-fingerprint position-absolute text-success fs-5" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-floating position-relative">
                                    <input type="text" class="form-control form-control-lg border border-success border-opacity-50 shadow-sm bg-success bg-opacity-10 text-dark fw-bold font-monospace focus-ring-success rounded-4 text-uppercase" id="regPan" name="panNumber" placeholder="PAN" required style="padding-left: 3.5rem;">
                                    <label for="regPan" class="fw-bold text-success small" style="margin-left: 2.2rem; margin-top: -2px;">Taxation PAN</label>
                                    <i class="bi bi-calculator position-absolute text-success fs-5" style="top: 15px; left: 20px;"></i>
                                </div>
                            </div>
                        </div>

                        <h5 class="fw-bold text-dark mb-4 border-bottom border-secondary border-opacity-25 pb-3">
                            <span class="bg-success bg-opacity-10 text-success rounded-circle d-inline-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px;"><i class="bi bi-diagram-3"></i></span> 
                            Network Role Assignment
                        </h5>
                        
                        <div class="mb-5">
                            <div class="row g-3">
                                <div class="col-md-4">
                                    <input type="radio" class="btn-check" name="role" id="roleFarmer" value="farmer" required>
                                    <label class="btn btn-outline-success w-100 py-4 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-3 border-2 shadow-sm transition hover-elevate bg-white" for="roleFarmer">
                                        <i class="bi bi-tractor-fill display-5"></i>
                                        <span class="fw-bolder tracking-wide">Farmer Node</span>
                                    </label>
                                </div>
                                <div class="col-md-4">
                                    <input type="radio" class="btn-check" name="role" id="roleBuyer" value="buyer" required>
                                    <label class="btn btn-outline-primary w-100 py-4 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-3 border-2 shadow-sm transition hover-elevate bg-white" for="roleBuyer">
                                        <i class="bi bi-buildings-fill display-5"></i>
                                        <span class="fw-bolder tracking-wide">Corporate Buyer</span>
                                    </label>
                                </div>
                                <div class="col-md-4">
                                    <input type="radio" class="btn-check" name="role" id="roleInspector" value="inspector" required>
                                    <label class="btn btn-outline-dark w-100 py-4 rounded-4 d-flex flex-column align-items-center justify-content-center h-100 gap-3 border-2 shadow-sm transition hover-elevate bg-white" for="roleInspector">
                                        <i class="bi bi-clipboard2-data-fill display-5"></i>
                                        <span class="fw-bolder tracking-wide">Inspector Node</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <button class="btn btn-success w-100 py-3 mt-4 rounded-pill fs-5 shadow group hover-elevate transition fw-bolder d-flex justify-content-center align-items-center border-0" style="background: linear-gradient(135deg, #10b981 0%, #059669 100%);" type="submit">
                            Finalize Registration <i class="bi bi-arrow-right-circle-fill ms-2 fs-4 transition group-hover-translate-x"></i>
                        </button>
                        
                        <div class="text-center mt-5 pt-3 border-top border-secondary border-opacity-10 d-flex justify-content-between align-items-center">
                            <span class="text-muted fw-medium small">Already deployed? <a href="/login" class="text-success text-decoration-none fw-bold ms-1 hover-dark transition">Authenticate Here</a></span>
                            <span class="bg-light px-2 py-1 rounded small border border-secondary border-opacity-25 shadow-sm text-dark d-inline-block" style="transform: scale(0.85); transform-origin: right center;">
                                <div id="google_translate_element"></div>
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <style>
                @keyframes float {
                    0% { transform: translateY(0px) rotate(0deg); }
                    50% { transform: translateY(-15px) rotate(2deg); }
                    100% { transform: translateY(0px) rotate(0deg); }
                }
                
                /* Custom styles to prevent zoom-in overflow on small screens */
                @media (max-width: 768px) {
                    main {
                        padding-top: 2rem !important;
                        padding-bottom: 2rem !important;
                        height: auto !important;
                    }
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