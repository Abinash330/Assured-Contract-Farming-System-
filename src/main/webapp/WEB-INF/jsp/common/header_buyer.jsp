<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    /* Premium Header Styles - Buyer Edition */
    .premium-buyer-nav {
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border-bottom: 1px solid rgba(13, 110, 253, 0.15);
        box-shadow: 0 4px 24px -6px rgba(13, 110, 253, 0.1);
        transition: all 0.3s ease;
    }
    
    .brand-logo-container-buyer {
        background: linear-gradient(135deg, #0d6efd 0%, #084298 100%);
        padding: 0.6rem;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(13, 110, 253, 0.3);
        transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }
    
    .navbar-brand:hover .brand-logo-container-buyer {
        transform: scale(1.05) rotate(-3deg);
    }
    
    .nav-item-premium .nav-link {
        color: #475569;
        font-weight: 600;
        padding: 0.5rem 1rem;
        border-radius: 8px;
        transition: all 0.2s ease;
        position: relative;
    }
    
    .nav-item-premium .nav-link:hover {
        color: #0d6efd;
        background: rgba(13, 110, 253, 0.05);
    }
    
    .nav-item-premium .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background: #0d6efd;
        transition: width 0.3s ease;
        border-radius: 2px;
    }
    
    .nav-item-premium .nav-link:hover::after {
        width: 60%;
    }

    .dropdown-menu-glass {
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(12px);
        border: 1px solid rgba(13, 110, 253, 0.1);
        box-shadow: 0 10px 30px -5px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        padding: 0.5rem;
    }

    .dropdown-item-premium {
        border-radius: 6px;
        transition: all 0.2s;
        font-weight: 500;
        color: #475569;
    }

    .dropdown-item-premium:hover {
        background: rgba(13, 110, 253, 0.1);
        color: #0d6efd;
        transform: translateX(4px);
    }
</style>

<nav class="navbar navbar-expand-lg premium-buyer-nav py-3 sticky-top mb-4">
    <div class="container">
        <!-- Premium Brand Logo -->
        <a class="navbar-brand fw-bold d-flex align-items-center gap-3" href="/dashboard">
            <div class="brand-logo-container-buyer d-flex align-items-center justify-content-center">
                <i class="bi bi-briefcase-fill fs-4 text-white m-0 lh-1"></i>
            </div>
            <div class="d-flex flex-column lh-sm">
                <span class="text-dark fs-5 tracking-tight" style="letter-spacing: -0.5px;">AgriTrust</span>
                <span class="text-primary small fw-bold text-uppercase" style="font-size: 0.65rem; letter-spacing: 1px;">Corporate Buyer</span>
            </div>
        </a>

        <button class="navbar-toggler border-0 shadow-none bg-light rounded-circle p-2" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
            <i class="bi bi-list fs-4 text-primary"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center gap-1">
                <li class="nav-item nav-item-premium">
                    <a class="nav-link" href="/dashboard"><i class="bi bi-pie-chart-fill me-1 opacity-75"></i> Reporting</a>
                </li>
                <li class="nav-item nav-item-premium">
                    <a class="nav-link" href="/crop/browse"><i class="bi bi-basket3-fill me-1 opacity-75"></i> Exchange</a>
                </li>
                <li class="nav-item nav-item-premium">
                    <a class="nav-link" href="/buyer/insights"><i class="bi bi-graph-up-arrow me-1 opacity-75"></i> Market Analytics</a>
                </li>
                <li class="nav-item nav-item-premium pe-3 border-end border-primary border-opacity-10 d-none d-lg-block">
                    <a class="nav-link" href="/contracts"><i class="bi bi-file-earmark-lock-fill me-1 opacity-75"></i> Active Procurements</a>
                </li>
                
                <!-- Native Translator -->
                <li class="nav-item d-flex align-items-center ms-lg-2 mt-3 mt-lg-0 border px-3 py-1 rounded-pill bg-white shadow-sm" style="border-color: rgba(13,110,253,0.1) !important;">
                    <i class="bi bi-translate text-primary me-2"></i>
                    <div id="google_translate_element" class="fw-bold" style="transform: scale(0.9); transform-origin: left center;"></div>
                </li>
                
                <!-- Profile Dropdown -->
                <li class="nav-item dropdown ms-lg-2 mt-3 mt-lg-0">
                    <a class="nav-link dropdown-toggle d-flex align-items-center gap-2 p-1 pe-3 border rounded-pill bg-white shadow-sm hover-elevate transition text-dark fw-bold" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="border-color: rgba(13,110,253,0.2) !important;">
                        <img src="/images/avatar_buyer.svg" alt="Avatar" class="rounded-circle" width="32" height="32">
                        My Enterprise
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-glass mt-2 animate__animated animate__fadeIn animate__faster" aria-labelledby="profileDropdown">
                        <li><h6 class="dropdown-header text-primary fw-bold"><i class="bi bi-building-check me-1"></i> KYC Compliant</h6></li>
                        <li><hr class="dropdown-divider opacity-10"></li>
                        <li><a class="dropdown-item dropdown-item-premium py-2" href="/profile"><i class="bi bi-person-badge me-2 text-primary opacity-75"></i> Enterprise Settings</a></li>
                        <li><hr class="dropdown-divider opacity-10"></li>
                        <li><a class="dropdown-item dropdown-item-premium py-2 text-danger fw-bold" href="/logout"><i class="bi bi-power me-2 opacity-75"></i> End Session</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Global Context Translator Script -->
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
