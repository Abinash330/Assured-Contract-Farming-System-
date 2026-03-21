<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-admin-footer {
        background: linear-gradient(to bottom, #ffffff, #f8fafc);
        border-top: 1px solid rgba(15, 23, 42, 0.1);
        padding-top: 4rem;
        padding-bottom: 2rem;
        margin-top: auto;
    }
    
    .footer-brand-logo-admin {
        background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
        padding: 0.5rem;
        border-radius: 10px;
        display: inline-flex;
        box-shadow: 0 4px 10px rgba(15, 23, 42, 0.2);
    }
</style>

<footer class="premium-admin-footer font-sans">
    <div class="container gap-4">
        <div class="row gy-4 mb-5">
            <!-- Brand Column -->
            <div class="col-lg-5 col-md-6 pe-lg-5">
                <div class="d-flex align-items-center gap-2 mb-3">
                    <div class="footer-brand-logo-admin">
                        <i class="bi bi-shield-lock fs-5 text-warning lh-1"></i>
                    </div>
                    <span class="fs-4 fw-bold text-dark" style="letter-spacing: -0.5px;">AgriTrust OS</span>
                </div>
                <p class="text-muted small lh-lg pe-lg-4 mb-4">Secure systemic oversight and regulatory management architecture. Access strictly monitored and heavily encrypted.</p>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-3 col-md-6">
                <h6 class="fw-bold text-dark text-uppercase mb-4" style="letter-spacing: 1px; font-size: 0.85rem;">Module Links</h6>
                <a href="/admin/dashboard" class="d-block text-muted text-decoration-none mb-2 hover-dark"><i class="bi bi-grid-fill me-2 opacity-50"></i> Dashboard Matrix</a>
                <a href="/admin/users" class="d-block text-muted text-decoration-none mb-2 hover-dark"><i class="bi bi-people-fill me-2 opacity-50"></i> Identity Registry</a>
                <a href="/admin/contracts" class="d-block text-muted text-decoration-none hover-dark"><i class="bi bi-file-earmark-lock me-2 opacity-50"></i> Global Ledger</a>
            </div>

            <!-- System Node Status -->
            <div class="col-lg-4 col-md-6">
                <div class="bg-white border border-secondary border-opacity-25 rounded-4 p-3 shadow-sm border-start border-warning border-4">
                    <h6 class="fw-bold text-dark text-uppercase mb-3" style="letter-spacing: 1px; font-size: 0.8rem;"><i class="bi bi-activity text-warning me-1"></i> Node Telemetry</h6>
                    <div class="d-flex align-items-center mb-2">
                        <span class="spinner-grow spinner-grow-sm text-success me-3" role="status"></span>
                        <div>
                            <p class="mb-0 fw-bold text-dark" style="font-size: 0.9rem;">All Systems Operational</p>
                            <p class="mb-0 text-muted font-monospace" style="font-size: 0.75rem;">Latency: 12ms</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="pt-4 border-top d-flex justify-content-between align-items-center gap-3">
            <p class="mb-0 text-muted font-monospace small">SYS_VER 4.2.0 | Core Admin Access</p>
        </div>
    </div>
</footer>
