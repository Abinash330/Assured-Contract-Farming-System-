<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Dashboard - Assured Contract Farming</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <link rel="website icon" type="png" href="/images/logo.png">
                <link rel="stylesheet" href="/global-theme.css">
            </head>

            <body>

                <!-- Navigation -->
                <jsp:include page="common/header_user.jsp" />

                <!-- Main Content -->
                <main class="container py-5">
                    <div class="glass-card mb-5 p-0 overflow-hidden border-0 shadow-sm" style="background: linear-gradient(145deg, #ffffff 0%, #f8fafc 100%);">
                        <div class="row g-0 align-items-center">
                            <div class="col-lg-8 p-4 p-md-5">
                                <div class="d-flex align-items-center gap-3 mb-3">
                                    <span class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25 px-3 py-2 rounded-pill fw-bold" style="letter-spacing: 0.5px;">
                                        <i class="bi bi-shield-check me-1"></i> VERIFIED ${fn:toUpperCase(fn:substring(sessionScope.role, 0, 1))}${fn:substring(sessionScope.role, 1, fn:length(sessionScope.role))}
                                    </span>
                                    <span class="text-muted small fw-semibold"><i class="bi bi-geo-alt-fill text-danger opacity-75 me-1"></i> Registered Partner</span>
                                </div>
                                <h1 class="fw-bold text-dark display-5 mb-3" style="letter-spacing: -1px;">Welcome back, <span class="text-success">${sessionScope.username}</span>! 👋</h1>
                                <p class="text-secondary fs-5 mb-0" style="max-width: 600px;">
                                    ${sessionScope.role == 'farmer' ? 'Manage your live crop listings, track incoming contracts, and optimize your sales pipeline.' : (sessionScope.role == 'buyer' ? 'Oversee your procured inventory and track active agricultural purchases.' : 'Monitor global contract parameters and execute mandatory quality control certifications.')}
                                </p>
                            </div>
                            <div class="col-lg-4 p-4 p-md-5 bg-success bg-opacity-10 h-100 d-flex flex-column justify-content-center align-items-lg-end border-start border-success border-opacity-10" style="min-height: 100%;">
                                <c:if test="${sessionScope.role == 'farmer'}">
                                    <p class="text-success fw-bold mb-3 small text-uppercase" style="letter-spacing: 1px;">Quick Actions</p>
                                    <a href="/crop/add" class="btn btn-success rounded-pill fs-6 shadow-sm px-4 py-3 fw-bold d-inline-flex align-items-center gap-2 transition hover-elevate w-100 justify-content-center">
                                        <i class="bi bi-plus-circle-fill fs-5"></i> New Crop Listing
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.role == 'buyer'}">
                                    <p class="text-primary fw-bold mb-3 small text-uppercase" style="letter-spacing: 1px;">Quick Actions</p>
                                    <a href="/crop/browse" class="btn btn-primary rounded-pill fs-6 shadow-sm px-4 py-3 fw-bold d-inline-flex align-items-center gap-2 transition hover-elevate w-100 justify-content-center">
                                        <i class="bi bi-search fs-5"></i> Browse Market
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.role == 'inspector'}">
                                    <p class="text-info fw-bold mb-3 small text-uppercase" style="letter-spacing: 1px;">Quick Actions</p>
                                    <a href="/contracts" class="btn btn-info rounded-pill fs-6 shadow-sm text-white px-4 py-3 fw-bold d-inline-flex align-items-center gap-2 transition hover-elevate w-100 justify-content-center">
                                        <i class="bi bi-clipboard-check fs-5"></i> Audit Contracts
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <c:if test="${sessionScope.role == 'farmer'}">
                        <!-- Language Translator -->
                        <div class="glass-card mb-4 p-3 d-flex flex-wrap align-items-center justify-content-between border-0 shadow-sm" style="background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                            <div class="d-flex align-items-center gap-3 mb-2 mb-md-0">
                                <div class="bg-primary bg-opacity-10 p-2 rounded-circle text-primary">
                                    <i class="bi bi-translate fs-4"></i>
                                </div>
                                <div>
                                    <h6 class="mb-0 fw-bold text-dark">Page Language</h6>
                                    <small class="text-muted">Translate the dashboard into your preferred language.</small>
                                </div>
                            </div>
                            <div id="google_translate_element" class="mt-1"></div>
                        </div>
                        <style>
                            /* Tweak Google Translate widget to fit the premium design */
                            .goog-te-gadget-simple {
                                background-color: #f8fafc !important;
                                border: 1px solid #e2e8f0 !important;
                                border-radius: 50rem !important;
                                padding: 6px 12px !important;
                                font-family: inherit !important;
                                font-size: 0.9rem !important;
                            }
                            .goog-te-gadget-icon { display: none; }
                            .goog-te-menu-value span { color: #1e293b !important; font-weight: 500; }
                            body { top: 0 !important; } /* override google translate bar pushing body down */
                            .skiptranslate iframe { display: none !important; }
                        </style>
                        <script type="text/javascript">
                            function googleTranslateElementInit() {
                              new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages: 'en,hi,mr,gu,ta,te,kn,ml,pa,bn,or', layout: google.translate.TranslateElement.InlineLayout.SIMPLE}, 'google_translate_element');
                            }
                        </script>
                        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

                        <!-- Agritech Integrations Row (Phase 6) -->
                        <div class="row g-4 mb-2 mt-1">
                            <!-- Weather API Integration -->
                            <div class="col-lg-4">
                                <div class="glass-card p-4 h-100 border-0 shadow-sm position-relative overflow-hidden" style="background: linear-gradient(135deg, #e0f2fe 0%, #bae6fd 100%);">
                                    <h5 class="fw-bold text-dark text-uppercase mb-3" style="letter-spacing: 1px; font-size: 0.85rem;"><i class="bi bi-cloud-sun text-primary me-2 fs-5"></i>Regional Weather Array</h5>
                                    <div id="weather-widget" class="text-center py-2 position-relative z-1">
                                        <div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>
                                    </div>
                                    <div class="position-absolute opacity-10" style="bottom: -15px; right: -15px; pointer-events: none;">
                                        <i class="bi bi-clouds-fill text-primary" style="font-size: 9rem;"></i>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Simulated IoT Soil Analytics -->
                            <div class="col-lg-8">
                                <div class="glass-card p-4 h-100 border-0 shadow-sm" style="background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <h5 class="fw-bold text-dark text-uppercase mb-0" style="letter-spacing: 1px; font-size: 0.85rem;"><i class="bi bi-cpu text-success me-2 fs-5"></i>IoT Field Telemetry (Live Sync)</h5>
                                        <span class="badge bg-success bg-opacity-25 text-success rounded-pill border border-success border-opacity-25 px-2 py-1 pulse"><i class="bi bi-broadcast me-1"></i> Sensor Feed</span>
                                    </div>
                                    <div style="height: 180px; position: relative; width: 100%;">
                                        <canvas id="soilHealthChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center justify-content-between mb-4 mt-2">
                            <div>
                                <h3 class="fw-bold text-dark mb-1" style="letter-spacing: -0.5px;"><i class="bi bi-graph-up-arrow text-success me-2"></i> Your Harvest Portfolio</h3>
                                <p class="text-muted small mb-0">Active listings currently available to buyers on the market.</p>
                            </div>
                            <div class="bg-success bg-opacity-10 border border-success border-opacity-25 rounded-pill px-4 py-2 text-success fw-bold shadow-sm d-flex align-items-center gap-2">
                                <span class="fs-5">${fn:length(listedCrops)}</span>
                                <span class="small text-uppercase" style="letter-spacing: 0.5px;">Active Items</span>
                            </div>
                        </div>

                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                            <c:forEach var="crop" items="${listedCrops}">

                                <c:set var="imagePath" value="/images/default.jpg" />
                                <!-- Image Selection logic omitted for brevity in design overhaul, assuming static covers or server-side mapping in a real app, keeping existing logic -->
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'paddy'}">
                                        <c:set var="imagePath" value="/images/paddy.jpg" />
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(crop.cropName, 'wheat')}">
                                        <c:set var="imagePath" value="/images/wheat.jpg" />
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(crop.cropName, 'maize')}">
                                        <c:set var="imagePath" value="/images/maize.jpg" />
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'cotton'}">
                                        <c:set var="imagePath" value="/images/cotton.avif" />
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'sugarcane'}">
                                        <c:set var="imagePath" value="/images/sugarcane.jpg" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="imagePath"
                                            value="https://images.unsplash.com/photo-1595856728362-7f7cd71d18f5?w=500&auto=format&fit=crop" />
                                    </c:otherwise>
                                </c:choose>

                                <c:set var="soldClass"
                                    value="${fn:toLowerCase(crop.status) == 'sold' ? 'opacity-75' : 'hover-elevate'}" />
                                <c:set var="badgeClass"
                                    value="${fn:toLowerCase(crop.status) == 'sold' ? 'bg-secondary' : 'bg-success'}" />

                                <div class="col">
                                    <div class="card h-100 border-0 shadow-sm transition hover-elevate rounded-4 overflow-hidden ${soldClass}" style="background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                                        <div class="position-relative">
                                            <span class="badge ${badgeClass} position-absolute top-0 end-0 m-3 px-3 py-2 rounded-pill shadow fw-bold text-uppercase" style="letter-spacing: 0.5px; z-index: 2;">${crop.status}</span>
                                            <div class="position-absolute top-0 start-0 w-100 h-100 bg-dark bg-opacity-10 transition hover-opacity-0" style="z-index: 1; opacity: 0;"></div>
                                            <img src="${imagePath}" class="card-img-top" alt="${crop.cropName}" style="height: 240px; object-fit: cover;">
                                        </div>

                                        <div class="card-body p-4 d-flex flex-column">
                                            <div class="d-flex justify-content-between align-items-start mb-3">
                                                <h4 class="card-title fw-bold text-dark mb-0" style="letter-spacing: -0.5px;">${crop.cropName}</h4>
                                                <div class="bg-light rounded p-2 text-center border">
                                                    <span class="d-block text-success fw-bold fs-5 lh-1">₹${crop.pricePerUnit}</span>
                                                    <span class="text-muted small" style="font-size: 0.65rem; letter-spacing: 0.5px;">PER TON</span>
                                                </div>
                                            </div>
                                            
                                            <div class="d-flex flex-column gap-2 mb-4 bg-light bg-opacity-50 p-3 rounded-3 border">
                                                <div class="d-flex align-items-center text-secondary">
                                                    <div class="bg-primary bg-opacity-10 p-2 rounded me-3 text-primary"><i class="bi bi-boxes"></i></div>
                                                    <div>
                                                        <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Available Volume</span>
                                                        <span class="fw-bold text-dark">${crop.quantity} Metric Tons</span>
                                                    </div>
                                                </div>
                                                <hr class="my-1 opacity-10">
                                                <div class="d-flex align-items-center text-secondary">
                                                    <div class="bg-danger bg-opacity-10 p-2 rounded me-3 text-danger"><i class="bi bi-geo-alt-fill"></i></div>
                                                    <div class="text-truncate">
                                                        <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Harvest Location</span>
                                                        <span class="fw-bold text-dark text-truncate d-block" title="${crop.location}">${crop.location}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <c:if test="${fn:toLowerCase(crop.status) != 'sold'}">
                                                <div class="d-flex gap-2 mt-auto">
                                                    <form action="/crop/update" method="get" class="w-50">
                                                        <input type="hidden" name="crop_id" value="${crop.id}">
                                                        <button type="submit" class="btn btn-light border-success border-opacity-25 text-success w-100 py-2 fw-bold transition align-items-center d-flex justify-content-center gap-1" onmouseover="this.classList.add('bg-success', 'text-white');" onmouseout="this.classList.remove('bg-success', 'text-white');">
                                                            <i class="bi bi-pencil-square"></i> Edit
                                                        </button>
                                                    </form>
                                                    <form action="/crop/delete" method="post" class="w-50">
                                                        <input type="hidden" name="crop_id" value="${crop.id}">
                                                        <button type="submit" class="btn btn-light border-danger border-opacity-25 text-danger w-100 py-2 fw-bold transition align-items-center d-flex justify-content-center gap-1" onmouseover="this.classList.add('bg-danger', 'text-white');" onmouseout="this.classList.remove('bg-danger', 'text-white');">
                                                            <i class="bi bi-trash3"></i> Remove
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty listedCrops}">
                                <div class="col-12">
                                    <div class="glass-card py-5 text-center">
                                        <div class="bg-success bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                            <i class="bi bi-basket text-success" style="font-size: 3rem;"></i>
                                        </div>
                                        <h3 class="fw-bold text-dark mb-2">No Active Listings</h3>
                                        <p class="text-secondary mb-4 fs-5">Start listing your harvest to reach buyers
                                            instantly.</p>
                                        <a href="/crop/add" class="btn btn-premium rounded-pill shadow px-4 py-2"><i
                                                class="bi bi-plus text-white"></i> Create First Listing</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:if>

                    <c:if test="${sessionScope.role == 'buyer'}">
                        <!-- Procurement Analytics Chart Section -->
                        <div class="row mb-5 g-4">
                            <div class="col-lg-8">
                                <div class="glass-card p-4 h-100 border-0 shadow-sm" style="background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                                    <h4 class="fw-bold text-dark mb-4" style="letter-spacing: -0.5px;"><i class="bi bi-bar-chart-fill text-primary me-2"></i> Procurement Analytics</h4>
                                    <div style="height: 300px; position: relative;">
                                        <canvas id="procurementChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="glass-card p-4 h-100 border-0 shadow-sm bg-primary bg-opacity-10 d-flex flex-column justify-content-center">
                                    <h5 class="text-primary fw-bold mb-3 text-uppercase" style="letter-spacing: 1px;">YTD Investment</h5>
                                    <h1 class="display-4 fw-bold text-dark mb-1">₹${ytdSpend} <span class="fs-5 text-muted">Lakhs</span></h1>
                                    <p class="text-secondary small mb-4">Total capital deployed across ${fn:length(purchasedCrops)} active contracts.</p>
                                    
                                    <div class="d-flex align-items-center justify-content-between mb-2">
                                        <span class="small fw-semibold text-secondary">Fulfillment Goal</span>
                                        <span class="small fw-bold text-primary">78%</span>
                                    </div>
                                    <div class="progress mb-4" style="height: 8px;">
                                        <div class="progress-bar bg-primary rounded-pill" role="progressbar" style="width: 78%" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    
                                    <a href="/crop/browse" class="btn btn-primary rounded-pill fw-bold py-2 shadow-sm mt-auto"><i class="bi bi-search me-1"></i> Expand Portfolio</a>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex align-items-center justify-content-between mb-4 border-bottom pb-3">
                            <h3 class="fw-bold text-dark mb-0" style="letter-spacing: -0.5px;"><i class="bi bi-box-seam-fill text-primary me-2"></i> Procured Assets Inventory</h3>
                        </div>

                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                            <c:forEach var="crop" items="${purchasedCrops}">
                                <!-- Image Selection Logic -->
                                <c:set var="imagePath" value="/images/default.jpg" />
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'paddy'}">
                                        <c:set var="imagePath" value="/images/paddy.jpg" />
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(crop.cropName, 'wheat')}">
                                        <c:set var="imagePath" value="/images/wheat.jpg" />
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(crop.cropName, 'maize')}">
                                        <c:set var="imagePath" value="/images/maize.jpg" />
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'cotton'}">
                                        <c:set var="imagePath" value="/images/cotton.avif" />
                                    </c:when>
                                    <c:when test="${fn:toLowerCase(crop.cropName) == 'sugarcane'}">
                                        <c:set var="imagePath" value="/images/sugarcane.jpg" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="imagePath"
                                            value="https://images.unsplash.com/photo-1595856728362-7f7cd71d18f5?w=500&auto=format&fit=crop" />
                                    </c:otherwise>
                                </c:choose>

                                <div class="col">
                                    <div class="card border-0 shadow-sm transition hover-elevate rounded-4 overflow-hidden h-100" style="background: rgba(255,255,255,0.95); backdrop-filter: blur(10px);">
                                        <div class="position-relative">
                                            <span class="badge bg-primary bg-opacity-75 position-absolute top-0 end-0 m-3 px-3 py-2 rounded-pill shadow-sm fw-bold border border-white" style="letter-spacing: 0.5px; z-index: 2;"><i class="bi bi-check-circle-fill me-1"></i> SECURED</span>
                                            <img src="${imagePath}" class="card-img-top" alt="${crop.cropName}" style="height: 200px; object-fit: cover;">
                                        </div>

                                        <div class="card-body p-4 d-flex flex-column">
                                            <h4 class="card-title fw-bold text-dark mb-1" style="letter-spacing: -0.5px;">${crop.cropName}</h4>
                                            <p class="small text-muted mb-3"><i class="bi bi-geo-alt-fill text-danger opacity-75 me-1"></i> ${crop.location}</p>
                                            
                                            <div class="bg-light bg-opacity-50 p-3 rounded-3 border mb-4">
                                                <div class="row text-center g-2">
                                                    <div class="col-6 border-end">
                                                        <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Volume</span>
                                                        <span class="fw-bold text-dark fs-5">${crop.quantity} <span class="fs-6 text-muted fw-normal">MT</span></span>
                                                    </div>
                                                    <div class="col-6">
                                                        <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Price/MT</span>
                                                        <span class="fw-bold text-success fs-5">₹${crop.pricePerUnit}</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mt-auto">
                                                <div class="d-flex justify-content-between align-items-center mb-1">
                                                    <span class="small fw-semibold text-secondary">Contract Fulfillment</span>
                                                    <span class="small fw-bold text-primary">In Progress</span>
                                                </div>
                                                <div class="progress" style="height: 6px;">
                                                    <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 45%"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty purchasedCrops}">
                                <div class="col-12">
                                    <div class="glass-card py-5 text-center border-0 shadow-sm" style="background: linear-gradient(145deg, rgba(255,255,255,0.9) 0%, rgba(248,250,252,0.9) 100%);">
                                        <div class="bg-primary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 shadow-sm hover-elevate transition">
                                            <i class="bi bi-cart-x text-primary" style="font-size: 3rem;"></i>
                                        </div>
                                        <h3 class="fw-bold text-dark mb-2" style="letter-spacing: -0.5px;">Inventory Pipeline Empty</h3>
                                        <p class="text-secondary mb-4 fs-5 w-75 mx-auto">You have not secured any forward contracts yet. Head to the marketplace to begin procuring premium agricultural raw materials.</p>
                                        <a href="/crop/browse" class="btn btn-primary rounded-pill shadow-lg px-5 py-3 fw-bold hover-elevate transition"><i class="bi bi-search text-white me-2"></i> Access Global Market</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                        
                        <!-- Chart.js Injection removed from here, elevated to global scope -->
                        <script>
                            document.addEventListener('DOMContentLoaded', function() {
                                const ctx = document.getElementById('procurementChart');
                                if(ctx) {
                                    new Chart(ctx, {
                                        type: 'line',
                                        data: {
                                            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                                            datasets: [{
                                                label: 'Procurement Spend (₹ Lakhs)',
                                                data: ${chartData != null ? chartData : '[0,0,0,0,0,0]'},
                                                borderColor: '#0d6efd',
                                                backgroundColor: 'rgba(13, 110, 253, 0.1)',
                                                borderWidth: 3,
                                                tension: 0.4,
                                                fill: true,
                                                pointBackgroundColor: '#ffffff',
                                                pointBorderColor: '#0d6efd',
                                                pointRadius: 4,
                                                pointHoverRadius: 6
                                            }]
                                        },
                                        options: {
                                            responsive: true,
                                            maintainAspectRatio: false,
                                            plugins: {
                                                legend: { display: false }
                                            },
                                            scales: {
                                                y: {
                                                    beginAtZero: true,
                                                    grid: { borderDash: [4, 4], color: '#e2e8f0' },
                                                    border: { display: false }
                                                },
                                                x: {
                                                    grid: { display: false },
                                                    border: { display: false }
                                                }
                                            }
                                        }
                                    });
                                }
                            });
                        </script>
                    </c:if>

                    <c:if test="${sessionScope.role == 'inspector'}">
                        <div class="d-flex align-items-center justify-content-between mb-4 mt-2">
                            <div>
                                <h3 class="fw-bold text-dark mb-1" style="letter-spacing: -0.5px;"><i class="bi bi-clipboard2-check-fill text-info me-2"></i> Quality Assurance Queue</h3>
                                <p class="text-muted small mb-0">High-priority contracts pending your official certification before final escrow release.</p>
                            </div>
                            <div class="bg-info bg-opacity-10 border border-info border-opacity-25 rounded-pill px-4 py-2 text-info fw-bold shadow-sm d-flex align-items-center gap-2">
                                <span class="fs-5">${fn:length(pendingInspections)}</span>
                                <span class="small text-uppercase text-dark" style="letter-spacing: 0.5px;">Pending Checks</span>
                            </div>
                        </div>

                        <div class="row row-cols-1 row-cols-lg-2 g-4">
                            <c:forEach var="ins" items="${pendingInspections}">
                                <div class="col">
                                    <div class="glass-card h-100 p-4 border-0 shadow-sm transition hover-elevate">
                                        <div class="d-flex justify-content-between align-items-start mb-3">
                                            <div class="d-flex align-items-center gap-3">
                                                <div class="bg-info bg-opacity-10 p-3 rounded-circle text-info fs-3 lh-1">
                                                    <i class="bi bi-box-seam"></i>
                                                </div>
                                                <div>
                                                    <h5 class="fw-bold text-dark mb-1">Active Transport</h5>
                                                    <span class="badge bg-light text-dark border font-monospace px-2">CNT-${ins.id}</span>
                                                </div>
                                            </div>
                                            <span class="badge bg-warning text-dark px-3 py-2 rounded-pill shadow-sm"><i class="bi bi-hourglass-split me-1"></i> Awaiting Audit</span>
                                        </div>
                                        <hr class="opacity-10 my-3">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div>
                                                <p class="small text-muted mb-1 fw-semibold text-uppercase" style="letter-spacing: 1px;">Deadline</p>
                                                <p class="fw-bold text-danger mb-0"><i class="bi bi-calendar-x-fill me-1"></i> ${ins.deliveryDeadline}</p>
                                            </div>
                                            <a href="/contracts" class="btn btn-outline-info rounded-pill px-4 fw-bold hover-elevate shadow-sm"><i class="bi bi-arrow-right-circle-fill me-2"></i> Process File</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <c:if test="${empty pendingInspections}">
                                <div class="col-12 w-100">
                                    <div class="glass-card py-5 text-center px-4">
                                        <div class="bg-success bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 shadow-sm text-success transition hover-elevate">
                                            <i class="bi bi-check-all" style="font-size: 3rem;"></i>
                                        </div>
                                        <h3 class="fw-bold text-dark mb-2">Zero Pending Operations</h3>
                                        <p class="text-secondary mb-4 fs-5 mx-auto w-75">All locked contracts have been formally inspected and certified. The pipeline is fully clear.</p>
                                        <a href="/contracts" class="btn btn-info text-white rounded-pill px-5 py-3 fw-bold shadow-lg hover-elevate transition">Review Master Ledger</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:if>
                </main>

                <jsp:include page="common/footer.jsp" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                
                <!-- Global Chart.js Injection (Required for both Buyer & Farmer Dashboards) -->
                <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
                
                <c:if test="${sessionScope.role == 'farmer'}">
                <script>
                    document.addEventListener('DOMContentLoaded', function() {
                        // 1. Open-Meteo Free Weather API Fetch
                        fetch('https://api.open-meteo.com/v1/forecast?latitude=20.5937&longitude=78.9629&current_weather=true')
                        .then(response => response.json())
                        .then(data => {
                            const w = data.current_weather;
                            let icon = 'bi-cloud-sun';
                            if(w.weathercode === 0 || w.weathercode === 1) icon = 'bi-sun';
                            else if(w.weathercode >= 51 && w.weathercode <= 65) icon = 'bi-cloud-rain';
                            else if(w.weathercode >= 95) icon = 'bi-cloud-lightning-rain';
                            
                            document.getElementById('weather-widget').innerHTML = `
                                <div class="d-flex justify-content-center align-items-center gap-3 mb-2 mt-1">
                                    <i class="bi ` + icon + ` text-primary" style="font-size: 3.2rem; transform: translateY(-5px);"></i>
                                    <div class="text-start">
                                        <h1 class="display-3 fw-bold text-dark mb-0 lh-1" style="letter-spacing: -2px;">` + w.temperature + `&deg;<span class="fs-4 text-muted">C</span></h1>
                                        <span class="fw-bold text-primary text-uppercase small" style="letter-spacing: 1px;">Live Atmosphere</span>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-around mt-3 border-top border-primary border-opacity-25 pt-3 w-100 mx-auto">
                                    <div class="text-center"><span class="d-block text-muted fw-bold" style="font-size: 0.65rem; letter-spacing: 1px;">AGRI-WIND</span><span class="fw-bold text-dark fs-6">` + w.windspeed + ` <small>km/h</small></span></div>
                                    <div class="text-center"><span class="d-block text-muted fw-bold" style="font-size: 0.65rem; letter-spacing: 1px;">DIRECTION</span><span class="fw-bold text-dark fs-6">` + w.winddirection + `&deg;</span></div>
                                </div>
                            `;
                        })
                        .catch(err => {
                            document.getElementById('weather-widget').innerHTML = '<span class="text-danger small fw-bold">Unable to sync agrometeorological data.</span>';
                        });

                        // 2. Simulated IoT Soil Health Sensor Chart
                        const soilCtx = document.getElementById('soilHealthChart');
                        if(soilCtx) {
                            new Chart(soilCtx, {
                                type: 'line',
                                data: {
                                    labels: ['12 AM', '4 AM', '8 AM', '12 PM', '4 PM', '8 PM'],
                                    datasets: [
                                        {
                                            label: 'Nitrogen (N) Content',
                                            data: [45, 46, 43, 40, 42, 45],
                                            borderColor: '#10b981',
                                            backgroundColor: 'rgba(16, 185, 129, 0.1)',
                                            borderWidth: 2,
                                            tension: 0.4,
                                            fill: true
                                        },
                                        {
                                            label: 'Soil Moisture (%)',
                                            data: [65, 66, 60, 50, 45, 55],
                                            borderColor: '#3b82f6',
                                            backgroundColor: 'rgba(59, 130, 246, 0.1)',
                                            borderWidth: 2,
                                            tension: 0.4,
                                            fill: true
                                        }
                                    ]
                                },
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    plugins: {
                                        legend: { 
                                            position: 'bottom',
                                            labels: { usePointStyle: true, boxWidth: 6, font: {size: 10} }
                                        }
                                    },
                                    scales: {
                                        y: {
                                            beginAtZero: false,
                                            min: 20, max: 80,
                                            grid: { borderDash: [4, 4], color: '#e2e8f0' },
                                            border: { display: false }
                                        },
                                        x: {
                                            grid: { display: false },
                                            border: { display: false }
                                        }
                                    }
                                }
                            });
                        }
                    });
                </script>
                </c:if>
                
            </body>

            </html>