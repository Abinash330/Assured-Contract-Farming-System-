<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Browse Marketplace - Assured Contract Farming</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <link rel="stylesheet" href="/global-theme.css">
            </head>

            <body class="pb-5">

                <!-- Navigation -->
                <jsp:include page="/WEB-INF/jsp/common/header_buyer.jsp" />

                <div class="container-fluid px-xl-5 py-4">
                    <!-- Premium Header & Search Banner -->
                    <div class="glass-card p-4 p-md-5 mb-4 border-0 shadow-sm" style="background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%); position: relative; overflow: hidden;">
                        <div class="position-absolute top-0 end-0 opacity-25" style="width: 50%; height: 100%; background: radial-gradient(circle, rgba(56,189,248,0.4) 0%, transparent 70%);"></div>
                        <div class="row align-items-center position-relative z-1">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <span class="badge bg-primary bg-opacity-25 text-info border border-info border-opacity-25 px-3 py-2 rounded-pill mb-3 fw-bold" style="letter-spacing: 1px;"><i class="bi bi-globe-americas me-2"></i> GLOBAL COMMODITY MARKET</span>
                                <h1 class="fw-bold text-white display-5 mb-2" style="letter-spacing: -1px;">Procure Premium Yields</h1>
                                <p class="text-secondary fs-5 mb-0 text-white-50">Direct access to verified farmers. Escrow protected. Quality assured.</p>
                            </div>
                            <div class="col-lg-6">
                                <form action="/crop/browse" method="get" class="d-flex bg-white p-2 border-0 rounded-pill shadow-lg align-items-center">
                                    <span class="bg-transparent border-0 text-primary ps-4 pe-2 fs-4"><i class="bi bi-search"></i></span>
                                    <input type="text" name="search" class="form-control border-0 bg-transparent shadow-none fs-5 py-3 fw-medium text-dark" placeholder="Search by crop, variety, or region..." value="${search}">
                                    <button class="btn btn-primary rounded-pill px-5 py-3 fs-5 fw-bold shadow-sm ms-2 hover-elevate transition" type="submit">Search Market</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="row g-4">
                        <!-- Advanced Filter Sidebar -->
                        <div class="col-lg-3">
                            <form action="/crop/browse" method="get" class="glass-card p-4 border-0 shadow-sm sticky-top" style="top: 2rem; background: rgba(255,255,255,0.95);">
                                <!-- Persist the main search if present -->
                                <c:if test="${not empty param.search}">
                                    <input type="hidden" name="search" value="${param.search}">
                                </c:if>

                                <div class="d-flex align-items-center justify-content-between mb-4 pb-3 border-bottom">
                                    <h5 class="fw-bold text-dark mb-0"><i class="bi bi-sliders text-primary me-2"></i> Filters</h5>
                                    <a href="/crop/browse" class="text-muted small text-decoration-none hover-primary">Clear All</a>
                                </div>
                                
                                <div class="mb-4">
                                    <label class="fw-bold small text-uppercase text-secondary mb-3 d-block" style="letter-spacing: 1px;">Commodity Category</label>
                                    <select name="category" class="form-select form-select-sm border-primary shadow-none py-2 px-3 fw-semibold rounded-pill text-primary">
                                        <option value="" ${empty param.category ? 'selected' : ''}>All Categories</option>
                                        <option value="cereals" ${param.category == 'cereals' ? 'selected' : ''}>Cereals</option>
                                        <option value="pulses" ${param.category == 'pulses' ? 'selected' : ''}>Pulses</option>
                                        <option value="fibers" ${param.category == 'fibers' ? 'selected' : ''}>Fibers</option>
                                        <option value="waste" ${param.category == 'waste' ? 'selected' : ''}>Wastage / Biomass</option>
                                        <option value="fertilizer" ${param.category == 'fertilizer' ? 'selected' : ''}>Organic Fertilizer</option>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label class="fw-bold small text-uppercase text-secondary mb-3 d-block" style="letter-spacing: 1px;">Max Price Range / MT</label>
                                    <input type="range" name="maxPrice" class="form-range" min="1000" max="50000" step="1000" id="priceRange" value="${not empty param.maxPrice ? param.maxPrice : '50000'}" oninput="document.getElementById('priceVal').innerText = '₹' + this.value;">
                                    <div class="d-flex justify-content-between text-muted small fw-semibold mt-2">
                                        <span>₹1k</span>
                                        <span class="text-primary fw-bold" id="priceVal">₹${not empty param.maxPrice ? param.maxPrice : '50000'}</span>
                                        <span>₹50k+</span>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="fw-bold small text-uppercase text-secondary mb-3 d-block" style="letter-spacing: 1px;">Trust & Security</label>
                                    <div class="form-check form-switch mb-2">
                                        <input class="form-check-input bg-success border-success" type="checkbox" role="switch" name="verifiedOnly" id="verifiedOnly" value="true" ${param.verifiedOnly == 'true' ? 'checked' : ''}>
                                        <label class="form-check-label fw-semibold text-dark" for="verifiedOnly">Verified Sellers Only</label>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input bg-primary border-primary" type="checkbox" role="switch" id="escrowOnly" checked disabled>
                                        <label class="form-check-label fw-semibold text-dark" for="escrowOnly">Escrow Supported</label>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary shadow-sm w-100 rounded-pill fw-bold py-2 mt-2">Apply Filters</button>
                            </form>
                        </div>

                        <!-- Main Results Grid -->
                        <div class="col-lg-9">
                            <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border">
                                <span class="text-dark fs-5 fw-bold"><span class="text-primary">${fn:length(crops)}</span> Premium Listings Found</span>
                                <div class="d-flex align-items-center gap-3">
                                    <span class="text-muted small fw-semibold">Sort By:</span>
                                    <select class="form-select form-select-sm border-0 bg-light rounded-pill fw-semibold shadow-none px-3" style="width: 140px;">
                                        <option>Recommended</option>
                                        <option>Price: Low to High</option>
                                        <option>Harvest Date (Soon)</option>
                                    </select>
                                    <div class="d-none d-md-flex bg-light rounded-pill p-1 border">
                                        <button class="btn btn-sm btn-white rounded-circle shadow-sm text-primary"><i class="bi bi-grid-fill"></i></button>
                                        <button class="btn btn-sm btn-transparent rounded-circle text-muted"><i class="bi bi-list-ul"></i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="row row-cols-1 row-cols-md-2 row-cols-xl-3 g-4">
                                <c:choose>
                                    <c:when test="${not empty crops}">
                                        <c:forEach var="crop" items="${crops}">

                                            <c:set var="imagePath" value="/images/default.jpg" />
                                            <c:choose>
                                                <c:when test="${not empty crop.imageUrl}">
                                                    <c:set var="imagePath" value="${crop.imageUrl}" />
                                                </c:when>
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
                                                    <c:set var="imagePath" value="/images/wheat.jpg" />
                                                </c:otherwise>
                                            </c:choose>

                                            <div class="col">
                                                <div class="card border-0 shadow-sm transition hover-elevate rounded-4 overflow-hidden h-100 d-flex flex-column" style="background: rgba(255,255,255,0.98);">
                                                    
                                                    <div class="position-relative">
                                                        <span class="badge ${crop.productCategory == 'Wastage/Byproduct' ? 'bg-warning text-dark' : 'bg-primary'} position-absolute top-0 end-0 m-3 shadow-sm px-3 py-2 rounded-pill fw-bold" style="z-index: 2;">${crop.productCategory}</span>
                                                        <span class="badge bg-success position-absolute top-0 start-0 m-3 px-3 py-2 rounded-pill shadow-sm fw-bold border border-white" style="z-index: 2;"><i class="bi bi-patch-check-fill me-1"></i> VERIFIED SELLER</span>
                                                        <span class="badge bg-dark bg-opacity-75 position-absolute bottom-0 end-0 m-2 px-2 py-1 rounded shadow-sm small" style="z-index: 2; backdrop-filter: blur(5px);"><i class="bi bi-shield-lock-fill text-info me-1"></i> Escrow</span>
                                                        <img src="${imagePath}" class="card-img-top" alt="${crop.cropName}" style="height: 220px; object-fit: cover; transition: transform 0.5s;" onmouseover="this.style.transform='scale(1.05)'" onmouseout="this.style.transform='scale(1)'">
                                                    </div>

                                                    <div class="card-body p-4 d-flex flex-column flex-grow-1">
                                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                                            <h4 class="card-title fw-bold text-dark mb-0" style="letter-spacing: -0.5px;">${crop.cropName}</h4>
                                                            <div class="text-end">
                                                                <h4 class="text-primary fw-bold mb-0 lh-1">₹${crop.pricePerUnit}</h4>
                                                                <span class="text-muted small" style="font-size: 0.7rem; letter-spacing: 0.5px;">PER TON</span>
                                                            </div>
                                                        </div>

                                                        <div class="d-flex align-items-center text-muted small mb-1">
                                                            <i class="bi bi-geo-alt-fill text-danger me-1"></i> ${crop.location}
                                                        </div>
                                                        <c:if test="${not empty crop.facilities}">
                                                            <div class="d-flex align-items-center text-primary fw-bold small mb-3">
                                                                <i class="bi bi-truck me-1"></i> ${crop.facilities}
                                                            </div>
                                                        </c:if>

                                                        <div class="bg-light bg-opacity-50 p-3 rounded-3 border mb-4 mt-auto">
                                                            <div class="row text-center g-2">
                                                                <div class="col-6 border-end">
                                                                    <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Available Vol</span>
                                                                    <span class="fw-bold text-dark"><i class="bi bi-boxes text-primary me-1"></i> ${crop.quantity} MT</span>
                                                                </div>
                                                                <div class="col-6">
                                                                    <span class="d-block small text-muted text-uppercase fw-semibold" style="font-size: 0.65rem; letter-spacing: 1px;">Est. Harvest</span>
                                                                    <span class="fw-bold text-dark"><i class="bi bi-calendar-event text-warning me-1"></i> ${crop.harvestDate}</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <button type="button" class="btn btn-primary w-100 rounded-pill fw-bold py-3 shadow-sm hover-elevate transition d-flex justify-content-center align-items-center gap-2 mt-auto" 
                                                            data-bs-toggle="modal" data-bs-target="#contractModal" 
                                                            onclick="document.getElementById('modalCropId').value='${crop.id}'; document.getElementById('modalCropName').innerText='${crop.cropName}';">
                                                            <i class="bi bi-file-earmark-check fs-5"></i> Secure Contract
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="col-12 py-5 text-center">
                                            <div class="glass-card py-5 border-0 shadow-sm" style="background: linear-gradient(145deg, #ffffff 0%, #f1f5f9 100%);">
                                                <div class="bg-primary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 shadow-sm">
                                                    <i class="bi bi-search text-primary" style="font-size: 3rem;"></i>
                                                </div>
                                                <h2 class="fw-bold text-dark mb-2" style="letter-spacing: -1px;">No Commodities Found</h2>
                                                <p class="text-secondary fs-5 mb-4 w-50 mx-auto">We couldn't find any premium listings matching your advanced criteria.</p>
                                                <a href="/crop/browse" class="btn btn-primary rounded-pill px-5 py-3 fw-bold fs-5 shadow-lg hover-elevate transition">Clear Active Filters</a>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Contract Negotiation Modal -->
                <div class="modal fade" id="contractModal" tabindex="-1" aria-labelledby="contractModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                            <div class="modal-header bg-primary text-white border-0 p-4">
                                <h5 class="modal-title fw-bold" id="contractModalLabel"><i class="bi bi-file-earmark-text me-2"></i> Negotiate Terms for <span id="modalCropName" class="text-warning"></span></h5>
                                <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/contract/create" method="post">
                                <div class="modal-body p-4 bg-light">
                                    <input type="hidden" name="crop_id" id="modalCropId">
                                    
                                    <div class="mb-3">
                                        <label for="final_price" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Proposed Price (Total ₹)</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-white border-end-0 text-success fw-bold">₹</span>
                                            <input type="number" step="0.01" class="form-control border-start-0 shadow-none ps-0 fw-bold text-dark fs-5" id="final_price" name="final_price" placeholder="e.g. 50000" required>
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="delivery_deadline" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Delivery Deadline</label>
                                        <input type="date" class="form-control shadow-none" id="delivery_deadline" name="delivery_deadline" required>
                                    </div>
                                    
                                    <div class="mb-3">
                                        <label for="terms" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Custom Terms & Conditions</label>
                                        <textarea class="form-control shadow-none" id="terms" name="terms" rows="3" placeholder="Enter special quality requirements, logistics terms, etc." required></textarea>
                                    </div>
                                    
                                    <div class="alert alert-warning py-2 mb-0 d-flex align-items-center">
                                        <i class="bi bi-shield-lock-fill fs-4 me-3"></i>
                                        <small class="fw-semibold">Submitting this contract will attempt to lock the proposed funds in Escrow immediately.</small>
                                    </div>
                                </div>
                                <div class="modal-footer bg-white border-0 p-3 d-flex justify-content-between">
                                    <button type="button" class="btn btn-light rounded-pill fw-bold px-4" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary rounded-pill fw-bold px-5 shadow-sm hover-elevate transition">Initiate Escrow</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>