<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Contact & Support - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <jsp:include page="/WEB-INF/jsp/common/header_public.jsp" />

    <!-- Main Content -->
    <main class="flex-grow-1 position-relative overflow-hidden py-5">
            <!-- Decorative Backdrops -->
            <div class="position-absolute top-0 start-0 w-100 h-100" style="background: linear-gradient(to bottom, rgba(20, 184, 166, 0.05) 0%, transparent 100%); z-index: -1;"></div>
            <div class="position-absolute bg-primary rounded-circle custom-glow" style="width: 300px; height: 300px; top: -100px; right: -100px; opacity: 0.05; filter: blur(60px); z-index: -1;"></div>
            
            <div class="container py-4">
                <div class="row justify-content-center mb-5">
                    <div class="col-lg-8 text-center text-md-center">
                        <span class="badge bg-primary bg-opacity-10 text-primary border border-primary border-opacity-25 rounded-pill px-3 py-2 mb-3 fw-bold letter-spacing-wide">SUPPORT & INQUIRIES</span>
                        <h1 class="display-4 fw-bold text-dark mb-3">Let's start a <span class="text-primary">conversation.</span></h1>
                        <p class="text-muted fs-5 mx-auto lh-lg" style="max-width: 650px;">
                            Have questions about our smart contracts, KYC process, or want to register as an enterprise buyer? Our dedicated support team is ready to assist you.
                        </p>
                    </div>
                </div>

                <div class="row g-5 align-items-center justify-content-center">
                    <!-- Contact Information Cards -->
                    <div class="col-lg-4 order-2 order-lg-1">
                        <div class="d-flex flex-column gap-4">
                            <!-- Card 1 -->
                            <div class="glass-card border-0 p-4 d-flex align-items-center gap-4 hover-elevate transition align-items-stretch" style="border-left: 4px solid #10b981 !important;">
                                <div class="bg-success bg-opacity-10 text-success p-3 rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                    <i class="bi bi-headset fs-3"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1 text-dark">Technical Support</h5>
                                    <p class="text-muted small mb-1">Available 24/7 for critical issues</p>
                                    <a href="tel:18005551234" class="text-success fw-bold text-decoration-none hover-primary transition">1-800-AGRI-SYS</a>
                                </div>
                            </div>

                            <!-- Card 2 -->
                            <div class="glass-card border-0 p-4 d-flex align-items-center gap-4 hover-elevate transition align-items-stretch" style="border-left: 4px solid #3b82f6 !important;">
                                <div class="bg-primary bg-opacity-10 text-primary p-3 rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                    <i class="bi bi-envelope-paper fs-3"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1 text-dark">General Inquiries</h5>
                                    <p class="text-muted small mb-1">Response within 2 hours</p>
                                    <a href="mailto:hello@cfs.com" class="text-primary fw-bold text-decoration-none hover-dark transition">hello@agritrust.com</a>
                                </div>
                            </div>

                            <!-- Card 3 -->
                            <div class="glass-card border-0 p-4 d-flex align-items-center gap-4 hover-elevate transition align-items-stretch" style="border-left: 4px solid #f59e0b !important;">
                                <div class="bg-warning bg-opacity-10 text-warning p-3 rounded-circle d-flex align-items-center justify-content-center" style="width: 60px; height: 60px;">
                                    <i class="bi bi-buildings fs-3"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1 text-dark">Corporate HQ</h5>
                                    <p class="text-muted small mb-0 lh-sm">
                                        Innovation Hub, Sector 45<br>
                                        Agri-Tech Park, 10001
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form Form -->
                    <div class="col-lg-7 order-1 order-lg-2">
                        <div class="glass-card p-4 p-md-5 border-0 shadow-lg position-relative overflow-hidden bg-white">
                            <!-- Subtle decorative blob inside form -->
                            <div class="position-absolute top-0 end-0 bg-primary opacity-10 rounded-circle w-50 h-50 blur-3xl" style="transform: translate(30%, -30%); pointer-events: none;"></div>
                            
                            <h3 class="fw-bold text-dark mb-4 position-relative z-1">Send a Message</h3>
                            
                            <form action="https://api.web3forms.com/submit" method="post" class="position-relative z-1">
                                <!-- Replace with your actual Web3Forms access key if keeping this -->
                                <input type="hidden" name="access_key" value="93ef86da-f425-4fa7-945b-9f54801adb49" />

                                <div class="row g-4 mb-4">
                                    <div class="col-md-6 form-floating-custom">
                                        <label for="name" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-2 mb-2">Full Name</label>
                                        <input type="text" id="name" name="name" class="form-control form-control-lg bg-light bg-opacity-50 border border-light focus-ring-primary px-4 py-3" placeholder="Jane Doe" required style="border-radius: 0.75rem;">
                                    </div>
                                    <div class="col-md-6 form-floating-custom">
                                        <label for="email" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-2 mb-2">Email Address</label>
                                        <input type="email" id="email" name="email" class="form-control form-control-lg bg-light bg-opacity-50 border border-light focus-ring-primary px-4 py-3" placeholder="jane@example.com" required style="border-radius: 0.75rem;">
                                    </div>
                                </div>
                                
                                <div class="mb-4 form-floating-custom">
                                    <label for="subject" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-2 mb-2">Inquiry Type</label>
                                    <select id="subject" name="subject" class="form-select form-select-lg bg-light bg-opacity-50 border border-light focus-ring-primary px-4 py-3" required style="border-radius: 0.75rem;">
                                        <option value="" disabled selected>Select a topic...</option>
                                        <option value="farmer_registration">Farmer Registration Help</option>
                                        <option value="buyer_inquiry">Enterprise Buyer Interest</option>
                                        <option value="dispute">Escalation / Dispute</option>
                                        <option value="other">Other / General</option>
                                    </select>
                                </div>

                                <div class="mb-5 form-floating-custom">
                                    <label for="message" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-2 mb-2">Detailed Message</label>
                                    <textarea id="message" name="message" rows="5" class="form-control form-control-lg bg-light bg-opacity-50 border border-light focus-ring-primary px-4 py-3 shadow-none" placeholder="Provide details about how we can assist you..." required style="border-radius: 0.75rem; resize: vertical; min-height: 120px;"></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm hover-elevate transition d-flex align-items-center justify-content-center gap-2 group">
                                    Send Transmission <i class="bi bi-send-fill fs-5 transition group-hover-translate-x"></i>
                                </button>
                                
                                <p class="text-center text-muted small mt-4 mb-0"><i class="bi bi-shield-lock me-1 text-success"></i> Your information is end-to-end encrypted.</p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/jsp/common/footer_public.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>