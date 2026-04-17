<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Farmer Dashboard - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <style>
        .farmer-hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('/images/farmer-banner.png');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 100px 0;
            border-radius: 0 0 50px 50px;
            margin-bottom: -50px;
        }
        .stats-icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="bg-light">

    <!-- Premium Farmer Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_farmer.jsp" />

    <section class="farmer-hero text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Welcome back, ${sessionScope.username}!</h1>
            <p class="lead">Optimizing your harvest yields and securing your financial future.</p>
        </div>
    </section>

    <main class="container py-5 mt-5">
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate">
                    <div class="text-success mb-3"><i class="bi bi-boxes stats-icon"></i></div>
                    <h3 class="fw-bold">${fn:length(listedCrops)}</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Active Listings</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate">
                    <div class="text-primary mb-3"><i class="bi bi-file-earmark-check stats-icon"></i></div>
                    <h3 class="fw-bold">${pendingContractsCount != null ? pendingContractsCount : 0}</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Pending Contracts</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate">
                    <div class="text-warning mb-3"><i class="bi bi-wallet2 stats-icon"></i></div>
                    <h3 class="fw-bold">₹${walletBalance != null ? walletBalance : '0.00'}</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Wallet Balance</p>
                </div>
            </div>
        </div>

        <!-- Agritech Integrations Row -->
        <div class="row g-4 mb-4">
            <!-- Weather API Integration -->
            <div class="col-lg-4">
                <div class="glass-card p-4 h-100 border-0 shadow-sm position-relative overflow-hidden" style="background: linear-gradient(135deg, #e0f2fe 0%, #bae6fd 100%);">
                    <h5 class="fw-bold text-dark text-uppercase mb-3" style="letter-spacing: 1px; font-size: 0.85rem;"><i class="bi bi-cloud-sun text-primary me-2 fs-5"></i>Regional Weather</h5>
                    <div id="weather-widget" class="text-center py-2 position-relative z-1">
                        <div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div>
                    </div>
                </div>
            </div>
            
            <!-- IoT Soil Analytics -->
            <div class="col-lg-8">
                <div class="glass-card p-4 h-100 border-0 shadow-sm">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <h5 class="fw-bold text-dark text-uppercase mb-0" style="letter-spacing: 1px; font-size: 0.85rem;"><i class="bi bi-cpu text-success me-2 fs-5"></i>IoT Field Telemetry</h5>
                        <span class="badge bg-success bg-opacity-25 text-success rounded-pill border border-success border-opacity-25 px-2 py-1 pulse"><i class="bi bi-broadcast me-1"></i> Live</span>
                    </div>
                    <div style="height: 180px; position: relative; width: 100%;">
                        <canvas id="soilHealthChart"></canvas>
                    </div>
                </div>
            </div>
        </div>

        <div class="d-flex align-items-center justify-content-between mb-4">
            <h3 class="fw-bold text-dark mb-0">Your Harvest Portfolio</h3>
            <a href="/crop/add" class="btn btn-success rounded-pill px-4 fw-bold shadow-sm"><i class="bi bi-plus-circle me-1"></i> Add New Crop</a>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:forEach var="crop" items="${listedCrops}">
                <div class="col">
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden hover-elevate">
                        <c:choose>
                            <c:when test="${not empty crop.imageUrl}">
                                <img src="${crop.imageUrl}" class="card-img-top" alt="${crop.cropName}" style="height: 200px; object-fit: cover;">
                            </c:when>
                            <c:otherwise>
                                <img src="/images/wheat.jpg" class="card-img-top" alt="${crop.cropName}" style="height: 200px; object-fit: cover;">
                            </c:otherwise>
                        </c:choose>
                        
                        <div class="card-body p-4 position-relative">
                            <span class="badge ${crop.productCategory == 'Wastage/Byproduct' ? 'bg-warning text-dark' : 'bg-primary'} position-absolute top-0 end-0 m-3 shadow-sm" style="font-size: 0.75rem;">${crop.productCategory}</span>
                            
                            <span class="badge bg-success rounded-pill mb-2">${crop.status}</span>
                            <h4 class="fw-bold">${crop.cropName}</h4>
                            <p class="text-muted small mb-1"><i class="bi bi-geo-alt-fill me-1"></i> ${crop.location}</p>
                            <c:if test="${not empty crop.facilities}">
                                <p class="text-info small fw-bold mb-0"><i class="bi bi-truck me-1"></i> ${crop.facilities}</p>
                            </c:if>

                            <div class="d-flex justify-content-between border-top pt-3 mt-3">
                                <div><span class="d-block small text-muted">Quantity</span><span class="fw-bold">${crop.quantity} MT</span></div>
                                <div><span class="d-block small text-muted">Price/MT</span><span class="fw-bold text-success">₹${crop.pricePerUnit}</span></div>
                            </div>
                            <div class="mt-3">
                                <a href="${not empty crop.imageUrl ? crop.imageUrl : '/images/wheat.jpg'}" download="crop_image_${crop.id}.jpg" class="btn btn-outline-primary btn-sm w-100 rounded-pill"><i class="bi bi-download me-1"></i> Download Product Image</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty listedCrops}">
                <div class="col-12 text-center py-5">
                    <i class="bi bi-basket fs-1 text-muted"></i>
                    <p class="fs-5 text-secondary mt-3">No active listings yet.</p>
                </div>
            </c:if>
        </div>
    </main>

    <!-- Premium Farmer Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_farmer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Weather Fetch
            fetch('https://api.open-meteo.com/v1/forecast?latitude=20.5937&longitude=78.9629&current_weather=true')
            .then(r => r.json()).then(data => {
                const w = data.current_weather;
                document.getElementById('weather-widget').innerHTML = `
                    <h2 class="display-4 fw-bold mb-0">` + w.temperature + `&deg;C</h2>
                    <span class="fw-bold text-primary">` + w.windspeed + ` km/h Wind</span>
                `;
            });

            // Soil Chart
            const ctx = document.getElementById('soilHealthChart');
            if(ctx) {
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['12 AM', '4 AM', '8 AM', '12 PM', '4 PM', '8 PM'],
                        datasets: [{ label: 'Moisture %', data: [65, 66, 60, 50, 45, 55], borderColor: '#3b82f6', tension: 0.4 }]
                    },
                    options: { responsive: true, maintainAspectRatio: false }
                });
            }
        });
    </script>
</body>
</html>
