<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Admin Dashboard - Assured Contract Farming</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link rel="stylesheet" href="/global-theme.css">
        </head>

        <body class="bg-light pb-5">

            <jsp:include page="../common/header_admin.jsp" />

            <div class="container-fluid px-xl-5 py-4">
                
                <!-- Premium Admin Welcome -->
                <div class="glass-card mb-4 p-4 p-lg-5 border-0 shadow-sm" style="background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);">
                    <div class="row align-items-center">
                        <div class="col-lg-8">
                            <div class="d-inline-flex bg-white bg-opacity-10 p-3 rounded-circle mb-3 shadow-sm border border-light border-opacity-25">
                                <i class="bi bi-shield-shaded text-white" style="font-size: 2rem;"></i>
                            </div>
                            <h1 class="fw-bold text-white display-5 mb-2" style="letter-spacing: -1px;">System Administration Center</h1>
                            <p class="text-white-50 fs-5 mb-0">Centralized command overhead for KYC verifications, Escrow monitoring, and dispute resolution.</p>
                        </div>
                        <div class="col-lg-4 text-lg-end mt-4 mt-lg-0">
                            <div class="bg-white bg-opacity-10 p-3 rounded-4 border border-light border-opacity-10 d-inline-block text-start shadow-sm">
                                <span class="d-block small text-white-50 text-uppercase fw-bold mb-1" style="letter-spacing: 1px;">System Status</span>
                                <div class="d-flex align-items-center gap-2">
                                    <span class="spinner-grow spinner-grow-sm text-success" role="status" aria-hidden="true"></span>
                                    <span class="text-white fw-bold fs-5">All Systems Operational</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Top Metric Cards -->
                <div class="row g-4 mb-4">
                    <div class="col-md-6 col-lg-3">
                        <div class="glass-card p-4 border-0 shadow-sm h-100 position-relative overflow-hidden bg-white hover-elevate transition">
                            <div class="position-absolute top-0 end-0 opacity-10" style="transform: translate(20%, -20%);">
                                <i class="bi bi-people-fill text-primary" style="font-size: 8rem;"></i>
                            </div>
                            <h5 class="fw-bold text-secondary text-uppercase mb-3" style="letter-spacing: 1px;">Total Users</h5>
                            <h2 class="display-5 fw-bold text-dark mb-0">${totalUsers}</h2>
                            <p class="text-success small fw-bold mt-2 mb-0"><i class="bi bi-person-check-fill"></i> Verified Data</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="glass-card p-4 border-0 shadow-sm h-100 position-relative overflow-hidden bg-white hover-elevate transition">
                            <div class="position-absolute top-0 end-0 opacity-10" style="transform: translate(20%, -20%);">
                                <i class="bi bi-file-earmark-check-fill text-success" style="font-size: 8rem;"></i>
                            </div>
                            <h5 class="fw-bold text-secondary text-uppercase mb-3" style="letter-spacing: 1px;">Active Contracts</h5>
                            <h2 class="display-5 fw-bold text-dark mb-0">${activeContracts}</h2>
                            <p class="text-success small fw-bold mt-2 mb-0"><i class="bi bi-shield-check"></i> Escrow Secured</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="glass-card p-4 border-0 shadow-sm h-100 position-relative overflow-hidden bg-white hover-elevate transition">
                            <div class="position-absolute top-0 end-0 opacity-10" style="transform: translate(20%, -20%);">
                                <i class="bi bi-currency-rupee text-warning" style="font-size: 8rem;"></i>
                            </div>
                            <h5 class="fw-bold text-secondary text-uppercase mb-3" style="letter-spacing: 1px;">Escrow Volume</h5>
                            <h2 class="display-5 fw-bold text-dark mb-0">₹${totalEscrowVolume}</h2>
                            <p class="text-success small fw-bold mt-2 mb-0"><i class="bi bi-graph-up-arrow"></i> Capital Managed</p>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-3">
                        <div class="glass-card p-4 border-0 shadow-sm h-100 position-relative overflow-hidden hover-elevate transition" style="background: linear-gradient(135deg, #fef2f2 0%, #fff 100%); border-left: 4px solid #dc3545 !important;">
                            <div class="position-absolute top-0 end-0 opacity-10" style="transform: translate(20%, -20%);">
                                <i class="bi bi-exclamation-octagon-fill text-danger" style="font-size: 8rem;"></i>
                            </div>
                            <h5 class="fw-bold text-danger text-uppercase mb-3" style="letter-spacing: 1px;">Active Disputes</h5>
                            <h2 class="display-5 fw-bold text-dark mb-0">${activeDisputes}</h2>
                            <p class="text-danger small fw-bold mt-2 mb-0"><i class="bi bi-exclamation-circle-fill"></i> Requires Attention</p>
                        </div>
                    </div>
                </div>

                <!-- Quick Admin Controls -->
                <div class="row g-4 mb-4">
                    <div class="col-12">
                        <div class="glass-card p-4 border-0 shadow-sm bg-white d-flex flex-wrap gap-3 align-items-center justify-content-between">
                            <div class="d-flex align-items-center gap-3">
                                <i class="bi bi-lightning-charge-fill text-warning fs-3"></i>
                                <div>
                                    <h5 class="fw-bold mb-0">Command Interface</h5>
                                    <span class="text-muted small">Execute administrative overrides manually.</span>
                                </div>
                            </div>
                            <div class="d-flex gap-2 flex-wrap">
                                <a href="/admin/users" class="btn btn-primary rounded-pill px-4 shadow-sm fw-bold hover-elevate"><i class="bi bi-people-fill me-2"></i> Manage Users</a>
                                <a href="/admin/contracts" class="btn btn-success rounded-pill px-4 shadow-sm fw-bold hover-elevate"><i class="bi bi-file-earmark-text-fill me-2"></i> Contracts DB</a>
                                <a href="/admin/disputes" class="btn btn-danger rounded-pill px-4 shadow-sm fw-bold hover-elevate"><i class="bi bi-exclamation-triangle-fill me-2"></i> Dispute Queue</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Charts & Action Panels -->
                <div class="row g-4 mb-4">
                    <!-- Platform Growth Chart -->
                    <div class="col-lg-8">
                        <div class="glass-card p-4 h-100 border-0 shadow-sm bg-white hover-elevate transition">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="fw-bold text-dark mb-0"><i class="bi bi-graph-up text-primary me-2"></i> Platform Trajectory</h5>
                            </div>
                            <div style="height: 300px; position: relative;">
                                <canvas id="growthChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Contract Distribution Pie Chart -->
                    <div class="col-lg-4">
                        <div class="glass-card p-4 h-100 border-0 shadow-sm bg-white hover-elevate transition d-flex flex-column">
                            <h5 class="fw-bold text-dark mb-4"><i class="bi bi-pie-chart-fill text-warning me-2"></i> Contract Distribution</h5>
                            <div style="height: 250px; position: relative; margin: auto;">
                                <canvas id="statusPieChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Activity Timeline Base -->
                <div class="glass-card p-4 border-0 shadow-sm bg-white">
                    <h5 class="fw-bold text-dark mb-4"><i class="bi bi-clock-history text-secondary me-2"></i> Live Ecosystem Feed</h5>
                    <div class="position-relative ms-3 border-start border-2 border-primary border-opacity-25 py-2">
                        <!-- Timeline Items -->
                        <div class="position-relative ps-4 mb-4">
                            <span class="position-absolute top-0 start-0 translate-middle bg-primary rounded-circle shadow border border-white border-2" style="width: 16px; height: 16px;"></span>
                            <div class="d-flex justify-content-between align-items-start mb-1">
                                <h6 class="fw-bold text-dark mb-0">New Contract Generated</h6>
                                <span class="badge bg-light text-muted border">2 mins ago</span>
                            </div>
                            <p class="text-secondary small mb-0">Contract <span class="fw-bold">#CNT-8911</span> initiated between Farmer <i>Ramesh</i> and Buyer <i>AgriCorp</i> for 50MT Wheat.</p>
                        </div>
                        <div class="position-relative ps-4 mb-4">
                            <span class="position-absolute top-0 start-0 translate-middle bg-warning rounded-circle shadow border border-white border-2" style="width: 16px; height: 16px;"></span>
                            <div class="d-flex justify-content-between align-items-start mb-1">
                                <h6 class="fw-bold text-dark mb-0">KYC Verification Pending</h6>
                                <span class="badge bg-light text-muted border">15 mins ago</span>
                            </div>
                            <p class="text-secondary small mb-0">Inspector <span class="fw-bold">INSP-04</span> uploaded field documents for farm plot in Punjab.</p>
                        </div>
                        <div class="position-relative ps-4">
                            <span class="position-absolute top-0 start-0 translate-middle bg-success rounded-circle shadow border border-white border-2" style="width: 16px; height: 16px;"></span>
                            <div class="d-flex justify-content-between align-items-start mb-1">
                                <h6 class="fw-bold text-dark mb-0">Escrow Milestone Released</h6>
                                <span class="badge bg-light text-muted border">1 hour ago</span>
                            </div>
                            <p class="text-secondary small mb-0">Milestone 2 payment of ₹2.5M authorized for Contract <span class="fw-bold">#CNT-7720</span>.</p>
                        </div>
                    </div>
                </div>

            </div>

            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const ctxGrowth = document.getElementById('growthChart');
                    if(ctxGrowth) {
                        new Chart(ctxGrowth, {
                            type: 'line',
                            data: {
                                labels: ['Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec', 'Jan'],
                                datasets: [
                                    {
                                        label: 'New Users',
                                        data: [65, 59, 80, 81, 56, 120, ${totalUsers}],
                                        borderColor: '#0d6efd',
                                        backgroundColor: 'rgba(13, 110, 253, 0.1)',
                                        tension: 0.4,
                                        fill: true
                                    },
                                    {
                                        label: 'Contracts Formed',
                                        data: [28, 48, 40, 19, 86, 92, ${activeContracts + completedContracts}],
                                        borderColor: '#198754',
                                        backgroundColor: 'rgba(25, 135, 84, 0.1)',
                                        tension: 0.4,
                                        fill: true
                                    }
                                ]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: { legend: { position: 'top' } },
                                scales: {
                                    y: { beginAtZero: true, grid: { borderDash: [4, 4], color: '#e2e8f0' } },
                                    x: { grid: { display: false } }
                                }
                            }
                        });
                    }

                    const ctxPie = document.getElementById('statusPieChart');
                    if(ctxPie) {
                        new Chart(ctxPie, {
                            type: 'doughnut',
                            data: {
                                labels: ['Active', 'Completed', 'Disputed'],
                                datasets: [{
                                    data: [${activeContracts}, ${completedContracts}, ${disputedContracts}],
                                    backgroundColor: ['#0d6efd', '#198754', '#dc3545'],
                                    hoverOffset: 4
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: { position: 'bottom' }
                                }
                            }
                        });
                    }
                });
            </script>
            <jsp:include page="../common/footer.jsp" />
        </body>

        </html>