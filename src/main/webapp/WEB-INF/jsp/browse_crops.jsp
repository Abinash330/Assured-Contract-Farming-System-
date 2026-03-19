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
                <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                    <div class="container">
                        <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                            <div class="bg-primary p-2 rounded-circle me-2 d-flex shadow-sm">
                                <i class="bi bi-shop fs-5 text-white m-0 lh-1"></i>
                            </div>
                            <span class="text-dark">CFS Marketplace</span>
                        </a>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav ms-auto fw-semibold">
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="/dashboard"><i
                                            class="bi bi-house me-1 border-end pe-2 me-2 border-secondary border-opacity-25"></i>
                                        Back to Dashboard</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container">
                    <!-- Header & Search in a beautiful glass card -->
                    <div class="glass-card p-4 p-md-5 mb-5 border-0">
                        <div class="row align-items-center">
                            <div class="col-lg-6 mb-4 mb-lg-0">
                                <h1 class="fw-bold text-dark display-5 mb-2">Available Commodities</h1>
                                <p class="text-muted fs-5 mb-0">Discover and procure high-quality yields directly from
                                    verified farmers.</p>
                            </div>
                            <div class="col-lg-6">
                                <form action="/crop/browse" method="get"
                                    class="d-flex bg-white p-2 border rounded-pill shadow-sm align-items-center transition"
                                    style="transition: box-shadow 0.3s ease;">
                                    <span class="bg-transparent border-0 text-muted ps-3 pe-2 fs-5"><i
                                            class="bi bi-search"></i></span>
                                    <input type="text" name="search"
                                        class="form-control border-0 bg-transparent shadow-none fs-5 py-2"
                                        placeholder="Search by crop or location..." value="${search}">
                                    <button class="btn btn-premium rounded-pill px-4 py-2 fs-5 ms-2"
                                        type="submit">Search</button>
                                </form>
                            </div>
                        </div>
                    </div>

                    <!-- Filters / Results Count -->
                    <div class="d-flex justify-content-between align-items-center mb-4 pb-2 border-bottom">
                        <span class="text-muted fs-5 fw-semibold"><i class="bi bi-funnel"></i> Showing Available
                            Lots</span>
                        <span
                            class="badge bg-primary bg-opacity-10 text-primary border border-primary px-3 py-2 rounded-pill fs-6">${fn:length(crops)}
                            Results</span>
                    </div>

                    <!-- Grid -->
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                        <c:choose>
                            <c:when test="${not empty crops}">
                                <c:forEach var="crop" items="${crops}">

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
                                        <div
                                            class="glass-card hover-elevate h-100 position-relative d-flex flex-column">
                                            <span
                                                class="badge bg-success position-absolute top-0 start-0 m-3 px-3 py-2 rounded-pill shadow-sm"><i
                                                    class="bi bi-check-circle me-1"></i> Available Now</span>

                                            <img src="${imagePath}" class="card-img-top border-bottom"
                                                alt="${crop.cropName}" style="height: 240px; object-fit: cover;">

                                            <div class="card-body p-4 d-flex flex-column flex-grow-1">
                                                <div class="d-flex justify-content-between align-items-start mb-1">
                                                    <h3 class="card-title fw-bold text-dark mb-0">${crop.cropName}</h3>
                                                    <h4 class="text-success fw-bold mb-0">₹${crop.pricePerUnit}</h4>
                                                </div>
                                                <div class="d-flex justify-content-between mb-4">
                                                    <span class="badge bg-light text-dark border">Premium Grade</span>
                                                    <span class="text-muted small">per metric ton</span>
                                                </div>

                                                <div class="d-flex text-secondary mb-3 pb-3 border-bottom border-light">
                                                    <i class="bi bi-boxes me-3 text-primary fs-5 mt-n1"></i>
                                                    <div>
                                                        <span
                                                            class="d-block small text-muted text-uppercase fw-bold tracking-wider lh-1 mb-1">Quantity
                                                            Available</span>
                                                        <span class="fw-bold text-dark fs-5 lh-1">${crop.quantity}
                                                            Metric Tons</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex text-secondary mb-3 pb-3 border-bottom border-light">
                                                    <i class="bi bi-geo-alt-fill me-3 text-danger fs-5 mt-n1"></i>
                                                    <div>
                                                        <span
                                                            class="d-block small text-muted text-uppercase fw-bold tracking-wider lh-1 mb-1">Origin
                                                            Location</span>
                                                        <span
                                                            class="fw-semibold text-dark lh-sm">${crop.location}</span>
                                                    </div>
                                                </div>

                                                <div class="d-flex text-secondary mb-4">
                                                    <i class="bi bi-calendar-check me-3 text-warning fs-5 mt-n1"></i>
                                                    <div>
                                                        <span
                                                            class="d-block small text-muted text-uppercase fw-bold tracking-wider lh-1 mb-1">Est.
                                                            Harvest Date</span>
                                                        <span class="fw-bold text-dark">${crop.harvestDate}</span>
                                                    </div>
                                                </div>

                                                <form action="/contract/create" method="post" class="mt-auto pt-2">
                                                    <input type="hidden" name="crop_id" value="${crop.id}">
                                                    <button type="submit"
                                                        class="btn btn-premium w-100 rounded-pill fw-bold py-3 shadow-sm fs-5"><i
                                                            class="bi bi-file-earmark-check me-2"></i> Propose
                                                        Contract</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="col-12 py-5 text-center">
                                    <div class="glass-card py-5 border-0">
                                        <img src="https://cdn-icons-png.flaticon.com/512/7486/7486798.png" width="120"
                                            class="mb-4 opacity-50" style="filter: grayscale(1);">
                                        <h2 class="fw-bold text-dark mb-2">No Commodities Found</h2>
                                        <p class="text-secondary fs-5 mb-4">There are no crops matching your search
                                            criteria at the moment.</p>
                                        <a href="/crop/browse"
                                            class="btn btn-outline-premium rounded-pill px-5 py-3 fw-bold fs-5 shadow-sm">Clear
                                            Active Filters</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>