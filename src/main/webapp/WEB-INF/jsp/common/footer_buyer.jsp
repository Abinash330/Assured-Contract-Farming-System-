<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-buyer-footer {
        background: linear-gradient(to bottom, #ffffff, #eff6ff);
        border-top: 1px solid rgba(13, 110, 253, 0.1);
        padding-top: 4rem;
        padding-bottom: 2rem;
        margin-top: auto;
    }
    
    .footer-brand-logo-buyer {
        background: linear-gradient(135deg, #0d6efd 0%, #084298 100%);
        padding: 0.5rem;
        border-radius: 10px;
        display: inline-flex;
        box-shadow: 0 4px 10px rgba(13, 110, 253, 0.2);
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
        color: #0d6efd;
        transform: translateX(4px);
    }
</style>

<footer class="premium-buyer-footer font-sans">
    <div class="container gap-4">
        <div class="row gy-4 mb-5">
            <!-- Brand Column -->
            <div class="col-lg-4 col-md-6 pe-lg-5">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="footer-brand-logo-buyer">
                        <i class="bi bi-bezier2 fs-5 text-white lh-1"></i>
                    </div>
                    <span class="fs-4 fw-bold text-dark" style="letter-spacing: -0.5px;">AgriTrust</span>
                </div>
                <p class="text-muted small lh-lg pe-lg-4 mb-4">Empowering corporate buyers with verified agricultural supply chains, predictive escrow mechanisms, and premium enterprise tooling.</p>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Platform Links</h6>
                <a href="/dashboard" class="footer-link"><i class="bi bi-chevron-right small text-primary opacity-50 me-1"></i> Dashboard</a>
                <a href="/contracts" class="footer-link"><i class="bi bi-chevron-right small text-primary opacity-50 me-1"></i> Active Procurements</a>
                <a href="/browse_crops" class="footer-link"><i class="bi bi-chevron-right small text-primary opacity-50 me-1"></i> Live Exchange</a>
                <a href="/profile" class="footer-link"><i class="bi bi-chevron-right small text-primary opacity-50 me-1"></i> Enterprise Settings</a>
            </div>

            <!-- Support -->
            <div class="col-lg-2 col-md-6">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Compliance Desk</h6>
                <a href="/contact" class="footer-link"><i class="bi bi-headset small text-primary opacity-50 me-1"></i> Contact Agent</a>
                <a href="/privacy" class="footer-link"><i class="bi bi-shield-check small text-primary opacity-50 me-1"></i> Security Protocol</a>
            </div>

            <!-- Trust Badges -->
            <div class="col-lg-4 col-md-6">
                <div class="bg-white border rounded-4 p-3 shadow-sm">
                    <h6 class="fw-bold text-dark text-uppercase mb-3 text-center" style="letter-spacing: 1px; font-size: 0.8rem;"><i class="bi bi-shield-lock text-primary me-1"></i> Enterprise Guarantee</h6>
                    <div class="d-flex align-items-center mb-2 px-2">
                        <i class="bi bi-bank2 text-primary fs-3 me-3"></i>
                        <div>
                            <p class="mb-0 fw-bold text-dark" style="font-size: 0.9rem;">Escrow Protected</p>
                            <p class="mb-0 text-muted" style="font-size: 0.75rem;">Capital safely routed</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pt-4 border-top border-primary border-opacity-10 d-flex flex-column flex-md-row justify-content-between align-items-center gap-3">
            <p class="mb-0 text-muted fw-semibold small">&copy; 2026 AgriTrust Command. All Rights Reserved.</p>
        </div>
    </div>
</footer>
