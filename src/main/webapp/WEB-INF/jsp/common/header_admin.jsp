<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<script>document.body.classList.add('admin-body');</script>

<!-- Sidebar -->
<div class="admin-sidebar shadow-lg" id="adminSidebar">
    <div class="admin-sidebar-header d-flex justify-content-between align-items-center">
        <a href="/admin/dashboard" class="d-flex align-items-center gap-2 text-decoration-none">
            <i class="bi bi-shield-lock-fill fs-4 text-warning"></i>
            <span class="text-white fs-5 fw-bold tracking-tight">AgriTrust <span class="text-white-50 fw-normal">OS</span></span>
        </a>
        <button class="btn btn-sm btn-link text-white-50 d-lg-none border-0" onclick="document.getElementById('adminSidebar').classList.toggle('show')">
            <i class="bi bi-x-lg fs-5"></i>
        </button>
    </div>
    
    <div class="py-4 overflow-y-auto" style="height: calc(100vh - 80px);">
        <div class="px-4 mb-2 small text-uppercase text-white-50 fw-bold" style="letter-spacing: 1px; font-size: 0.75rem;">Core Modules</div>
        
        <a href="/admin/dashboard" class="admin-nav-link ${pageContext.request.requestURI.endsWith('admin_dashboard.jsp') ? 'active' : ''}">
            <i class="bi bi-grid-1x2-fill"></i> Command Matrix
        </a>
        <a href="/admin/users" class="admin-nav-link ${pageContext.request.requestURI.endsWith('manage_users.jsp') ? 'active' : ''}">
            <i class="bi bi-people-fill"></i> Identity & KYC
        </a>
        <a href="/admin/contracts" class="admin-nav-link ${pageContext.request.requestURI.endsWith('manage_contracts.jsp') ? 'active' : ''}">
            <i class="bi bi-file-earmark-check-fill"></i> Escrow Ledger
        </a>
        <a href="/admin/disputes" class="admin-nav-link ${pageContext.request.requestURI.endsWith('manage_disputes.jsp') ? 'active' : ''}">
            <i class="bi bi-exclamation-octagon-fill"></i> Dispute Resolution
        </a>
        
        <div class="px-4 mt-5 mb-2 small text-uppercase text-white-50 fw-bold" style="letter-spacing: 1px; font-size: 0.75rem;">System</div>
        <a href="/admin/settings" class="admin-nav-link ${pageContext.request.requestURI.endsWith('system_settings.jsp') ? 'active' : ''}">
            <i class="bi bi-gear-fill"></i> Platform Settings
        </a>
        <a href="/logout" class="admin-nav-link text-danger mt-1 hover-elevate transition">
            <i class="bi bi-power"></i> Override Session
        </a>
    </div>
</div>

<!-- Topbar -->
<div class="admin-topbar mb-4">
    <div class="d-flex align-items-center gap-3">
        <button class="btn btn-white d-lg-none shadow-sm border rounded-3 p-2" onclick="document.getElementById('adminSidebar').classList.toggle('show')">
            <i class="bi bi-list fs-5"></i>
        </button>
        <div class="d-none d-md-flex align-items-center gap-3">
            <span class="fw-bold text-dark fs-5 tracking-tight"><i class="bi bi-hdd-network text-primary me-2"></i> System Administration</span>
            <div class="vr mx-2" style="height: 20px;"></div>
            <div class="d-flex align-items-center gap-2 px-3 py-1 bg-success bg-opacity-10 text-success rounded-pill fw-bold" style="font-size: 0.75rem;">
                <div class="pulse-ring"></div>
                System Health: Optimal
            </div>
            <span class="text-secondary fw-semibold font-monospace ms-1" id="systemLiveClock" style="font-size: 0.85rem;"><i class="bi bi-clock mx-1"></i> --:--:--</span>
        </div>
    </div>
    
    <div class="d-flex align-items-center gap-4">
        <!-- Native Translator -->
        <div class="d-none d-lg-flex align-items-center bg-white px-2 py-1 rounded shadow-sm border" style="transform: scale(0.9);">
            <i class="bi bi-translate text-primary me-2 ms-1"></i>
            <div id="google_translate_element" class="fw-bold" style="transform: scale(0.9); transform-origin: left center;"></div>
        </div>
        
        <!-- Mock Notifications -->
        <div class="position-relative hover-elevate transition" style="cursor: pointer;">
            <i class="bi bi-bell-fill fs-5 text-secondary"></i>
            <span class="position-absolute top-0 start-100 translate-middle p-1 bg-danger border border-light rounded-circle">
                <span class="visually-hidden">New alerts</span>
            </span>
        </div>
        
        <!-- User Profile Dropdown Simulator -->
        <div class="d-flex align-items-center gap-3 border-start ps-4">
            <div class="d-none d-md-flex flex-column lh-1 text-end">
                <span class="text-dark fw-bold text-sm">${sessionScope.email}</span>
                <span class="text-success fw-bold mt-1 tracking-wider" style="font-size: 0.65rem;">SEC: OMEGA <i class="bi bi-fingerprint"></i></span>
            </div>
            <div class="bg-primary bg-opacity-10 text-primary border border-primary border-opacity-25 rounded-circle d-flex align-items-center justify-content-center fw-bold shadow-sm" style="width: 40px; height: 40px;">
                <i class="bi bi-person-fill fs-5"></i>
            </div>
        </div>
    </div>
</div>

<!-- Global Toast Container -->
<div id="cfsToastContainer" class="cfs-toast-container d-flex flex-column gap-2"></div>
<script>
    function updateSystemClock() {
        const clockEl = document.getElementById('systemLiveClock');
        if (clockEl) {
            const now = new Date();
            const tz = Intl.DateTimeFormat().resolvedOptions().timeZone.split('/')[1] || 'Local';
            clockEl.innerHTML = `<i class="bi bi-clock mx-1"></i> ${now.toLocaleTimeString('en-US', {hour12: false})} <span class="text-muted ms-1">${tz}</span>`;
        }
    }
    setInterval(updateSystemClock, 1000);
    updateSystemClock();

    function showToast(title, message, type='success') {
        const container = document.getElementById('cfsToastContainer');
        if(!container) return;
        
        const root = document.createElement('div');
        root.className = 'cfs-toast';
        
        const bgColor = type === 'success' ? '#10b981' : type === 'danger' ? '#ef4444' : '#3b82f6';
        const icon = type === 'success' ? 'bi-check-circle-fill' : type === 'danger' ? 'bi-exclamation-octagon-fill' : 'bi-info-circle-fill';
        
        root.innerHTML = `
            <div class="cfs-toast-header shadow-sm" style="background-color: ${bgColor}">
                <i class="bi ${icon} me-2 fs-5"></i>
                <strong class="me-auto fs-6 tracking-wide">${title}</strong>
                <button type="button" class="btn-close btn-close-white btn-sm" onclick="this.parentElement.parentElement.remove()" style="opacity: 0.8"></button>
            </div>
            <div class="cfs-toast-body fw-medium">
                ${message}
            </div>
        `;
        
        container.appendChild(root);
        
        // Trigger reflow & animate
        void root.offsetWidth; 
        root.classList.add('show');
        
        setTimeout(() => {
            root.classList.remove('show');
            setTimeout(() => root.remove(), 400);
        }, 4500);
    }
</script>

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
