<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-inspector-footer {
        background: linear-gradient(to bottom, #ffffff, #f0fdf4);
        border-top: 1px solid rgba(13, 202, 240, 0.1);
        padding-top: 4rem;
        padding-bottom: 2rem;
        margin-top: auto;
    }
    
    .footer-brand-logo-inspector {
        background: linear-gradient(135deg, #0dcaf0 0%, #087990 100%);
        padding: 0.5rem;
        border-radius: 10px;
        display: inline-flex;
        box-shadow: 0 4px 10px rgba(13, 202, 240, 0.2);
    }
</style>

<footer class="premium-inspector-footer font-sans">
    <div class="container gap-4">
        <div class="row gy-4 mb-4">
            <!-- Brand Column -->
            <div class="col-lg-6 col-md-6 pe-lg-5">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="footer-brand-logo-inspector">
                        <i class="bi bi-search fs-5 text-white lh-1"></i>
                    </div>
                    <span class="fs-4 fw-bold text-dark" style="letter-spacing: -0.5px;">AgriTrust Inspector</span>
                </div>
                <p class="text-muted small lh-lg pe-lg-4 mb-4">Authorized quality assurance and regulatory oversight portal. Ensuring trust and compliance across all decentralized agricultural contracts.</p>
            </div>

            <!-- Links -->
            <div class="col-lg-6 col-md-6 text-lg-end">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Assigned Duties</h6>
                <div class="d-flex flex-column align-items-lg-end">
                    <a href="/dashboard" class="text-muted text-decoration-none mb-2 hover-info"><i class="bi bi-diagram-3 me-2 opacity-50 d-lg-none"></i> Field Assignments</a>
                    <a href="/contracts" class="text-muted text-decoration-none hover-info"><i class="bi bi-file-earmark-check me-2 opacity-50 d-lg-none"></i> Active Resolutions</a>
                </div>
            </div>
        </div>

        <div class="pt-4 border-top border-info border-opacity-10 d-flex justify-content-between align-items-center">
            <p class="mb-0 text-muted fw-semibold small">&copy; 2026 AgriTrust Compliance Division.</p>
        </div>
    </div>
</footer>
