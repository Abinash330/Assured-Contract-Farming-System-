<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-farmer-footer {
        background: linear-gradient(to bottom, #ffffff, #f0fdf4);
        border-top: 1px solid rgba(22, 163, 74, 0.1);
        padding-top: 4rem;
        padding-bottom: 2rem;
        margin-top: auto;
    }
    
    .footer-brand-logo {
        background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
        padding: 0.5rem;
        border-radius: 10px;
        display: inline-flex;
        box-shadow: 0 4px 10px rgba(22, 163, 74, 0.2);
    }

    .footer-link {
        color: #64748b;
        text-decoration: none;
        transition: all 0.2s;
        display: block;
        margin-bottom: 0.75rem;
        font-weight: 500;
        font-size: 0.95rem;
    }

    .footer-link:hover {
        color: #16a34a;
        transform: translateX(4px);
    }

    .trust-badge-container {
        background: white;
        border: 1px solid rgba(22,163,74,0.1);
        border-radius: 12px;
        padding: 1rem;
        box-shadow: 0 4px 15px -5px rgba(0,0,0,0.05);
    }
</style>

<footer class="premium-farmer-footer font-sans">
    <div class="container gap-4">
        <div class="row gy-4 mb-5">
            <!-- Brand Column -->
            <div class="col-lg-4 col-md-6 pe-lg-5">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="footer-brand-logo">
                        <i class="bi bi-tree-fill fs-5 text-white lh-1"></i>
                    </div>
                    <span class="fs-4 fw-bold text-dark" style="letter-spacing: -0.5px;">AgriTrust</span>
                </div>
                <p class="text-muted small lh-lg pe-lg-4 mb-4">Empowering agricultural producers with secure contracts, guaranteed payouts, and transparent market access. Cultivating a better future.</p>
                <div class="d-flex gap-2">
                    <a href="#" class="btn btn-light rounded-circle shadow-sm text-success" style="width: 40px; height: 40px; display: inline-flex; align-items:center; justify-content:center;"><i class="bi bi-twitter-x"></i></a>
                    <a href="#" class="btn btn-light rounded-circle shadow-sm text-success" style="width: 40px; height: 40px; display: inline-flex; align-items:center; justify-content:center;"><i class="bi bi-linkedin"></i></a>
                    <a href="#" class="btn btn-light rounded-circle shadow-sm text-success" style="width: 40px; height: 40px; display: inline-flex; align-items:center; justify-content:center;"><i class="bi bi-whatsapp"></i></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Platform Links</h6>
                <a href="/dashboard" class="footer-link"><i class="bi bi-chevron-right small text-success opacity-50 me-1"></i> Dashboard</a>
                <a href="/contracts" class="footer-link"><i class="bi bi-chevron-right small text-success opacity-50 me-1"></i> My Contracts</a>
                <a href="/profile" class="footer-link"><i class="bi bi-chevron-right small text-success opacity-50 me-1"></i> Profile Settings</a>
                <a href="/payment/add-details" class="footer-link"><i class="bi bi-chevron-right small text-success opacity-50 me-1"></i> Bank Details</a>
            </div>

            <!-- Support -->
            <div class="col-lg-2 col-md-6">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Support Desk</h6>
                <a href="/contact" class="footer-link"><i class="bi bi-headset small text-primary opacity-50 me-1"></i> Contact Agent</a>
                <a href="#" class="footer-link"><i class="bi bi-journals small text-primary opacity-50 me-1"></i> Farming Guides</a>
                <a href="#" class="footer-link"><i class="bi bi-shield-exclamation small text-primary opacity-50 me-1"></i> Report Issue</a>
            </div>

            <!-- Trust Badges -->
            <div class="col-lg-4 col-md-6">
                <div class="trust-badge-container">
                    <h6 class="fw-bold text-dark text-uppercase mb-3 text-center" style="letter-spacing: 1px; font-size: 0.8rem;"><i class="bi bi-shield-lock text-success me-1"></i> Security Guarantee</h6>
                    <div class="d-flex align-items-center mb-2 px-2">
                        <i class="bi bi-bank2 text-primary fs-3 me-3"></i>
                        <div>
                            <p class="mb-0 fw-bold text-dark" style="font-size: 0.9rem;">Escrow Protected</p>
                            <p class="mb-0 text-muted" style="font-size: 0.75rem;">Funds locked via RBI guidelines</p>
                        </div>
                    </div>
                    <hr class="opacity-10 my-2">
                    <div class="d-flex align-items-center px-2">
                        <i class="bi bi-shield-check text-success fs-3 me-3"></i>
                        <div>
                            <p class="mb-0 fw-bold text-dark" style="font-size: 0.9rem;">256-Bit Encrypted</p>
                            <p class="mb-0 text-muted" style="font-size: 0.75rem;">Enterprise grade security</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pt-4 border-top border-success border-opacity-10 d-flex flex-column flex-md-row justify-content-between align-items-center gap-3">
            <p class="mb-0 text-muted fw-semibold small">&copy; 2024 AgriTrust Contract Farming. All Rights Reserved.</p>
            <div class="d-flex gap-3">
                <a href="/privacy" class="text-secondary text-decoration-none small hover-success transition">Privacy Policy</a>
                <span class="text-muted opacity-50">|</span>
                <a href="#" class="text-secondary text-decoration-none small hover-success transition">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>
