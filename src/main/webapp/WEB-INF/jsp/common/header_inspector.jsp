<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .premium-inspector-nav {
        background: rgba(255, 255, 255, 0.85);
        backdrop-filter: blur(16px);
        -webkit-backdrop-filter: blur(16px);
        border-bottom: 1px solid rgba(13, 202, 240, 0.2);
        box-shadow: 0 4px 24px -6px rgba(13, 202, 240, 0.1);
        transition: all 0.3s ease;
    }
    
    .brand-logo-container-inspector {
        background: linear-gradient(135deg, #0dcaf0 0%, #087990 100%);
        padding: 0.6rem;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(13, 202, 240, 0.25);
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
        color: #087990;
        background: rgba(13, 202, 240, 0.1);
    }
    
    .nav-item-premium .nav-link::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 2px;
        background: #0dcaf0;
        transition: width 0.3s ease;
        border-radius: 2px;
    }
    
    .nav-item-premium .nav-link:hover::after {
        width: 60%;
    }
</style>

<nav class="navbar navbar-expand-lg premium-inspector-nav py-3 sticky-top mb-4">
    <div class="container">
        <!-- Premium Brand Logo -->
        <a class="navbar-brand fw-bold d-flex align-items-center gap-3" href="/dashboard">
            <div class="brand-logo-container-inspector d-flex align-items-center justify-content-center">
                <i class="bi bi-search fs-4 text-white m-0 lh-1"></i>
            </div>
            <div class="d-flex flex-column lh-sm">
                <span class="text-dark fs-5 tracking-tight" style="letter-spacing: -0.5px;">AgriTrust</span>
                <span class="text-info small fw-bold text-uppercase" style="font-size: 0.65rem; letter-spacing: 1px;">Quality Auditing</span>
            </div>
        </a>

        <button class="navbar-toggler border-0 shadow-none bg-light rounded-circle p-2" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarNav">
            <i class="bi bi-list fs-4 text-info"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-center gap-1">
                <li class="nav-item nav-item-premium">
                    <a class="nav-link" href="/dashboard"><i class="bi bi-grid-fill me-1 opacity-75"></i> Assignments</a>
                </li>
                <li class="nav-item nav-item-premium pe-3 border-end border-info border-opacity-25 d-none d-lg-block">
                    <a class="nav-link" href="/contracts"><i class="bi bi-clipboard-check-fill me-1 opacity-75"></i> Active Case Files</a>
                </li>
                
                <li class="nav-item pe-2 ps-3 border-end border-info border-opacity-25 d-none d-lg-block">
                    <a class="nav-link text-dark fw-bold" href="/profile"><i class="bi bi-person-badge-fill text-info me-1"></i> Inspector Portal</a>
                </li>
                
                <li class="nav-item ms-lg-3 mt-3 mt-lg-0">
                    <a class="btn btn-outline-danger btn-sm rounded-pill px-4 fw-bold shadow-sm py-2 transition hover-elevate" href="/logout"><i class="bi bi-shield-lock me-1"></i> Terminate Shift</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
