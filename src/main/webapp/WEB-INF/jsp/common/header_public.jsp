<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-public-nav {
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border-bottom: 1px solid rgba(22, 163, 74, 0.15);
        box-shadow: 0 4px 24px -6px rgba(22, 163, 74, 0.1);
        transition: all 0.3s ease;
    }
    
    .brand-logo-container-public {
        background: linear-gradient(135deg, #16a34a 0%, #15803d 100%);
        padding: 0.6rem;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(22, 163, 74, 0.3);
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
        color: #16a34a;
        background: rgba(22, 163, 74, 0.05);
    }
    
    .nav-item-premium .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background: #16a34a;
        transition: width 0.3s ease;
        border-radius: 2px;
    }
    
    .nav-item-premium .nav-link:hover::after {
        width: 60%;
    }
</style>

<nav class="navbar navbar-expand-lg premium-public-nav py-3 sticky-top">
    <div class="container">
        <!-- Premium Brand Logo -->
        <a class="navbar-brand fw-bold d-flex align-items-center gap-3" href="/">
            <div class="brand-logo-container-public d-flex align-items-center justify-content-center">
                <i class="bi bi-bezier2 fs-4 text-white m-0 lh-1"></i>
            </div>
            <div class="d-flex flex-column lh-sm mt-1">
                <span class="text-dark fs-4 tracking-tight" style="letter-spacing: -0.5px;">AgriTrust</span>
            </div>
        </a>

        <button class="navbar-toggler border-0 shadow-none bg-light rounded-circle p-2" type="button" data-bs-toggle="collapse"
            data-bs-target="#navPublic">
            <i class="bi bi-list fs-4 text-success"></i>
        </button>

        <div class="collapse navbar-collapse" id="navPublic">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center gap-2">
                <li class="nav-item nav-item-premium"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item nav-item-premium"><a class="nav-link" href="/about">Protocol</a></li>
                <li class="nav-item nav-item-premium"><a class="nav-link" href="/privacy">Security</a></li>
                <li class="nav-item nav-item-premium"><a class="nav-link" href="/contact">Support</a></li>
                
                <!-- Native Translator -->
                <li class="nav-item d-flex align-items-center ms-lg-2 mt-3 mt-lg-0 border px-3 py-1 rounded-pill bg-white shadow-sm" style="border-color: rgba(22,163,74,0.1) !important;">
                    <i class="bi bi-translate text-success me-2"></i>
                    <div id="google_translate_element" class="fw-bold" style="transform: scale(0.9); transform-origin: left center;"></div>
                </li>
                
                <li class="nav-item ms-lg-3 mt-3 mt-lg-0 d-flex gap-2">
                    <a class="btn btn-outline-success rounded-pill px-4 fw-bold shadow-sm py-2 transition hover-elevate" href="/login"><i class="bi bi-box-arrow-in-right me-1"></i> Portal Access</a>
                    <a class="btn btn-premium rounded-pill px-4 fw-bold shadow-lg py-2 transition hover-elevate text-white" href="/register"><i class="bi bi-person-plus-fill me-1"></i> Join Network</a>
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
