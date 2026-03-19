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
                <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top">
                    <div class="container">
                        <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                            <div class="bg-success p-2 rounded-circle me-2 d-flex shadow-sm">
                                <i class="bi bi-seedling fs-5 text-white m-0 lh-1"></i>
                            </div>
                            <span class="text-dark">CFS Dashboard</span>
                        </a>
                        <button class="navbar-toggler border-0 shadow-none" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 fw-semibold align-items-center">
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="/profile"><i class="bi bi-person-circle me-1"></i>
                                        Profile</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="/contracts"><i
                                            class="bi bi-file-earmark-text me-1"></i> Contracts</a>
                                </li>
                                <c:if test="${sessionScope.role == 'farmer'}">
                                    <li class="nav-item">
                                        <a class="nav-link px-3" href="/payment/add-details"><i
                                                class="bi bi-bank me-1"></i> Add Bank</a>
                                    </li>
                                </c:if>
                                <li class="nav-item ms-lg-3 mt-3 mt-lg-0">
                                    <a class="btn btn-outline-danger btn-sm rounded-pill px-4 fw-bold shadow-sm py-2"
                                        href="/logout"><i class="bi bi-box-arrow-right me-1"></i> Logout</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- Main Content -->
                <main class="container py-5">
                    <div class="glass-card mb-5 p-4 p-md-5">
                        <div class="row align-items-center">
                            <div class="col-lg-8 mb-4 mb-lg-0">
                                <span
                                    class="badge bg-success bg-opacity-10 text-success border-success px-3 py-2 rounded-pill mb-3 fw-semibold">
                                    <i class="bi bi-shield-check me-1"></i> Verified
                                    ${fn:toUpperCase(fn:substring(sessionScope.role, 0,
                                    1))}${fn:substring(sessionScope.role, 1, fn:length(sessionScope.role))} Account
                                </span>
                                <h1 class="fw-bold text-dark display-5 mb-2">Welcome back, ${sessionScope.username}! 👋
                                </h1>
                                <p class="text-muted fs-5 mb-0">Manage your ${sessionScope.role == 'farmer' ? 'live
                                    listings and sales pipeline' : 'procured crops and active purchases'}.</p>
                            </div>
                            <div class="col-lg-4 text-lg-end">
                                <c:if test="${sessionScope.role == 'farmer'}">
                                    <a href="/crop/add" class="btn btn-premium rounded-pill fs-5 shadow px-4 py-3">
                                        <i class="bi bi-plus-circle me-2"></i> List New Crop
                                    </a>
                                </c:if>
                                <c:if test="${sessionScope.role == 'buyer'}">
                                    <a href="/crop/browse" class="btn btn-premium rounded-pill fs-5 shadow px-4 py-3">
                                        <i class="bi bi-search me-2"></i> Browse Market
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <c:if test="${sessionScope.role == 'farmer'}">
                        <div class="d-flex align-items-center justify-content-between mb-4 border-bottom pb-3">
                            <h3 class="fw-bold text-dark mb-0"><i class="bi bi-graph-up-arrow text-success me-2"></i>
                                Your Active Listings</h3>
                            <span class="badge bg-primary rounded-pill px-3 py-2">${fn:length(listedCrops)}
                                Active</span>
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
                                    <div class="glass-card h-100 ${soldClass} position-relative">
                                        <span
                                            class="badge ${badgeClass} position-absolute top-0 end-0 m-3 px-3 py-2 rounded-pill shadow-sm">${crop.status}</span>
                                        <img src="${imagePath}" class="card-img-top border-bottom"
                                            alt="${crop.cropName}" style="height: 220px; object-fit: cover;">

                                        <div class="card-body p-4">
                                            <h4 class="card-title fw-bold text-dark mb-3">${crop.cropName}</h4>
                                            <div class="d-flex text-secondary mb-2">
                                                <i class="bi bi-boxes me-2 text-primary"></i>
                                                <span class="fw-semibold">${crop.quantity} Metric Tons</span>
                                            </div>
                                            <div class="d-flex text-secondary mb-2">
                                                <i class="bi bi-tag me-2 text-success"></i>
                                                <span class="fw-bold text-dark">₹${crop.pricePerUnit}</span> <span
                                                    class="ms-1 small">/ Ton</span>
                                            </div>
                                            <div class="d-flex text-secondary mb-4">
                                                <i class="bi bi-geo-alt-fill me-2 text-danger"></i>
                                                <span class="small text-truncate">${crop.location}</span>
                                            </div>

                                            <c:if test="${fn:toLowerCase(crop.status) != 'sold'}">
                                                <div class="d-flex gap-2 mt-auto border-top pt-3">
                                                    <form action="/crop/update" method="get" class="w-50">
                                                        <input type="hidden" name="crop_id" value="${crop.id}">
                                                        <button type="submit"
                                                            class="btn btn-outline-premium w-100 btn-sm">Update</button>
                                                    </form>
                                                    <form action="/crop/delete" method="post" class="w-50">
                                                        <input type="hidden" name="crop_id" value="${crop.id}">
                                                        <button type="submit"
                                                            class="btn btn-outline-danger w-100 rounded-pill btn-sm fw-bold">Delete</button>
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
                        <div class="d-flex align-items-center justify-content-between mb-4 border-bottom pb-3">
                            <h3 class="fw-bold text-dark mb-0"><i class="bi bi-box-seam text-primary me-2"></i> Procured
                                Inventory</h3>
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
                                    <div class="glass-card hover-elevate h-100 position-relative">
                                        <span
                                            class="badge bg-primary position-absolute top-0 end-0 m-3 px-3 py-2 rounded-pill shadow-sm">Procured</span>
                                        <img src="${imagePath}" class="card-img-top border-bottom"
                                            alt="${crop.cropName}" style="height: 220px; object-fit: cover;">

                                        <div class="card-body p-4">
                                            <h4 class="card-title fw-bold text-dark mb-3">${crop.cropName}</h4>
                                            <div class="d-flex text-secondary mb-2">
                                                <i class="bi bi-boxes me-2 text-primary"></i>
                                                <span class="fw-semibold">${crop.quantity} Metric Tons</span>
                                            </div>
                                            <div class="d-flex text-secondary mb-2">
                                                <i class="bi bi-tag me-2 text-success"></i>
                                                <span class="fw-bold text-dark">₹${crop.pricePerUnit}</span> <span
                                                    class="ms-1 small">/ Ton</span>
                                            </div>
                                            <div class="d-flex text-secondary mb-0 border-top pt-3 mt-3">
                                                <i class="bi bi-geo-alt-fill me-2 text-danger mt-1"></i>
                                                <span class="small text-muted lh-sm">${crop.location}</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                            <c:if test="${empty purchasedCrops}">
                                <div class="col-12">
                                    <div class="glass-card py-5 text-center">
                                        <div class="bg-primary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                            <i class="bi bi-cart-x text-primary" style="font-size: 3rem;"></i>
                                        </div>
                                        <h3 class="fw-bold text-dark mb-2">Inventory Pipeline Empty</h3>
                                        <p class="text-secondary mb-4 fs-5">Head to the marketplace to secure your raw
                                            materials.</p>
                                        <a href="/crop/browse" class="btn btn-premium rounded-pill shadow px-4 py-2"><i
                                                class="bi bi-search text-white me-1"></i> Browse Marketplace</a>
                                    </div>
                                </div>
                            </c:if>
                        </div>
                    </c:if>
                </main>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>