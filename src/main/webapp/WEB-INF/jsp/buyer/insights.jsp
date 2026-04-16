<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Market Analytics - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .analytics-hero {
            background: linear-gradient(135deg, rgba(8, 66, 152, 0.8) 0%, rgba(15, 23, 42, 0.95) 100%), url('/images/market_analytics.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            padding: 80px 0 120px;
            position: relative;
            z-index: 1;
        }
        .analytics-card {
            background: rgba(255, 255, 255, 0.98);
            border: 1px solid rgba(13, 110, 253, 0.1);
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: all 0.3s ease;
        }
        .analytics-card:hover {
            box-shadow: 0 15px 40px rgba(13, 110, 253, 0.1);
            transform: translateY(-5px);
        }
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
        }
    </style>
</head>
<body class="bg-light pb-5">

    <jsp:include page="/WEB-INF/jsp/common/header_buyer.jsp" />

    <section class="analytics-hero text-center mb-5 border-bottom border-primary border-4 shadow-lg">
        <div class="container position-relative z-1">
            <span class="badge bg-primary bg-opacity-25 px-4 py-2 rounded-pill mb-4 border border-primary border-opacity-50 fs-6"><i class="bi bi-graph-up-arrow me-2 text-info"></i> INTELLIGENCE DASHBOARD</span>
            <h1 class="display-4 fw-bolder mb-3" style="letter-spacing: -1px;">Global Market Analytics</h1>
            <p class="lead text-white-50 w-75 mx-auto fs-5">Identify supply trends, verify asset distribution, and forecast procurement strategies using real-time cryptographic commodity data.</p>
        </div>
    </section>

    <div class="container position-relative" style="margin-top: -80px; z-index: 10;">
        <div class="row g-4 mb-5">
            <div class="col-md-3">
                <div class="analytics-card p-4 h-100 text-center">
                    <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-boxes fs-1 text-primary"></i>
                    </div>
                    <h2 class="fw-bold text-dark mb-1">${totalVolume} <span class="fs-6 text-muted">MT</span></h2>
                    <p class="small text-uppercase fw-bold text-secondary mb-0 letter-spacing-wide">Total Network Supply</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="analytics-card p-4 h-100 text-center">
                    <div class="bg-success bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-tags fs-1 text-success"></i>
                    </div>
                    <h2 class="fw-bold text-dark mb-1">₹${avgPrice} <span class="fs-6 text-muted">/ MT</span></h2>
                    <p class="small text-uppercase fw-bold text-secondary mb-0 letter-spacing-wide">Global Avg Spot Price</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="analytics-card p-4 h-100 text-center">
                    <div class="bg-warning bg-opacity-10 rounded-circle d-inline-flex p-3 mb-3">
                        <i class="bi bi-recycle fs-1 text-warning"></i>
                    </div>
                    <h2 class="fw-bold text-dark mb-1">${totalBiomass} <span class="fs-6 text-muted">Lots</span></h2>
                    <p class="small text-uppercase fw-bold text-secondary mb-0 letter-spacing-wide">Available Biomass</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="analytics-card p-4 h-100 text-center bg-primary" style="background: linear-gradient(135deg, #0d6efd, #084298);">
                    <div class="bg-white bg-opacity-25 rounded-circle d-inline-flex p-3 mb-3 text-white">
                        <i class="bi bi-file-earmark-bar-graph fs-1"></i>
                    </div>
                    <h2 class="fw-bold text-white mb-1">+14%</h2>
                    <p class="small text-uppercase fw-bold text-white-50 mb-0 letter-spacing-wide">Exchange Volatility</p>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-7">
                <div class="analytics-card p-4 p-md-5 h-100">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div>
                            <h4 class="fw-bold text-dark mb-1"><i class="bi bi-pie-chart-fill text-primary me-2"></i> Asset Distribution Map</h4>
                            <p class="small text-muted mb-0">Breakdown of available commodity classes</p>
                        </div>
                    </div>
                    <div class="chart-container d-flex justify-content-center">
                        <canvas id="categoryChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="analytics-card p-4 p-md-5 h-100">
                    <h4 class="fw-bold text-dark mb-4"><i class="bi bi-lightning-charge-fill text-warning me-2"></i> Actionable Insights</h4>
                    
                    <div class="d-flex mb-4">
                        <div class="flex-shrink-0">
                            <div class="bg-success bg-opacity-10 p-2 rounded-circle border border-success border-opacity-25">
                                <i class="bi bi-arrow-up-right text-success fw-bold"></i>
                            </div>
                        </div>
                        <div class="ms-3">
                            <h6 class="fw-bold text-dark mb-1">Cereal Surge Detected</h6>
                            <p class="small text-muted">A ${totalCereals} lot surplus of Cereals is currently logged. Favorable to secure long contracts now.</p>
                        </div>
                    </div>
                    
                    <div class="d-flex mb-4">
                        <div class="flex-shrink-0">
                            <div class="bg-danger bg-opacity-10 p-2 rounded-circle border border-danger border-opacity-25">
                                <i class="bi bi-arrow-down-right text-danger fw-bold"></i>
                            </div>
                        </div>
                        <div class="ms-3">
                            <h6 class="fw-bold text-dark mb-1">Pulse Shortage Imminent</h6>
                            <p class="small text-muted">Only ${totalPulses} lots of Pulses available. Expected price hike of ~12% in next quarter.</p>
                        </div>
                    </div>

                    <div class="d-flex">
                        <div class="flex-shrink-0">
                            <div class="bg-info bg-opacity-10 p-2 rounded-circle border border-info border-opacity-25">
                                <i class="bi bi-info-circle text-info fw-bold"></i>
                            </div>
                        </div>
                        <div class="ms-3">
                            <h6 class="fw-bold text-dark mb-1">Biomass Opportunity</h6>
                            <p class="small text-muted">Biomass and wastage listings are rising. Great opportunity for organic fertilizer procurement.</p>
                        </div>
                    </div>
                    
                    <div class="mt-4 pt-4 border-top">
                        <a href="/crop/browse" class="btn btn-outline-primary w-100 rounded-pill fw-bold py-2 hover-elevate transition"><i class="bi bi-search me-2"></i> Explore Marketplace</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctxPie = document.getElementById('categoryChart').getContext('2d');
            
            new Chart(ctxPie, {
                type: 'doughnut',
                data: {
                    labels: ['Cereals', 'Pulses', 'Wastage/Biomass'],
                    datasets: [{
                        data: [${totalCereals}, ${totalPulses}, ${totalBiomass}],
                        backgroundColor: [
                            'rgba(13, 110, 253, 0.8)',
                            'rgba(25, 135, 84, 0.8)',
                            'rgba(255, 193, 7, 0.8)'
                        ],
                        borderColor: [
                            '#ffffff',
                            '#ffffff',
                            '#ffffff'
                        ],
                        borderWidth: 4,
                        hoverOffset: 15
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                padding: 20,
                                font: {
                                    family: "'Inter', sans-serif",
                                    weight: 'bold'
                                }
                            }
                        }
                    },
                    cutout: '70%'
                }
            });
        });
    </script>
    
    <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
