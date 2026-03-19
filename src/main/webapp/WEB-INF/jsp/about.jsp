<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us - Assured Contract Farming</title>
        <link rel="website icon" type="png" href="/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="d-flex flex-column min-vh-100 bg-light">

        <!-- Header -->
        <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top">
            <div class="container">
                <a class="navbar-brand fw-bold d-flex align-items-center" href="/">
                    <div class="bg-success p-2 rounded-circle me-2 d-flex shadow-sm">
                        <i class="bi bi-seedling fs-5 text-white m-0 lh-1"></i>
                    </div>
                    <span class="text-dark">CFS</span>
                </a>
                <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navAbout">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navAbout">
                    <ul class="navbar-nav ms-auto fw-semibold">
                        <li class="nav-item"><a class="nav-link px-3" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-3 active text-success" href="/about">About Us</a>
                        </li>
                        <li class="nav-item"><a class="nav-link px-3" href="/privacy">Privacy Policy</a></li>
                        <li class="nav-item"><a class="nav-link px-3" href="/contact">Contact</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container py-5 flex-grow-1">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="glass-card mb-5 p-4 p-md-5 text-center border-0">
                        <div class="d-inline-flex bg-success bg-opacity-10 p-4 rounded-circle mb-4 shadow-sm">
                            <i class="bi bi-people-fill text-success" style="font-size: 3.5rem;"></i>
                        </div>
                        <h1 class="fw-bold text-dark display-5 mb-3">Who We Are</h1>
                        <p class="text-muted fs-5 mx-auto lh-lg" style="max-width: 800px;">
                            Assured Contract Farming System is a premier digital platform designed to bridge the trust
                            gap between ambitious farmers and reliable corporate buyers. We ensure fair, transparent,
                            and legally binding farming contracts. Our ultimate goal is to architect a resilient
                            ecosystem where farmers can secure a stable income, and buyers can guarantee an
                            uninterrupted supply of high-grade commodities.
                        </p>
                    </div>

                    <div class="row mb-5 align-items-center">
                        <div class="col-md-12">
                            <div
                                class="glass-card border-0 hover-elevate p-4 p-md-5 d-flex align-items-sm-center flex-column flex-sm-row gap-4">
                                <div class="bg-primary bg-opacity-10 text-primary p-4 rounded-4 shadow-sm">
                                    <i class="bi bi-bullseye fs-1"></i>
                                </div>
                                <div>
                                    <h3 class="fw-bold text-dark mb-3">Our Core Mission</h3>
                                    <p class="text-muted fs-5 mb-0 lh-lg">
                                        To empower the agricultural backbone of our economy through innovative
                                        technology, establishing unwavering trust, eliminating middlemen, and creating
                                        enduring stability in the supply chain sector.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div>
                        <h3 class="fw-bold text-dark display-6 mb-4 text-center">Platform Capabilities</h3>
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div
                                    class="glass-card hover-elevate h-100 p-4 p-lg-5 text-center border-0 border-top border-4 border-primary">
                                    <i class="bi bi-file-earmark-text text-primary fs-1 mb-3"></i>
                                    <h4 class="fw-bold text-dark">Smart Contracts</h4>
                                    <p class="text-muted mb-0">Legally sound, immutable digital agreements that
                                        safeguard both parties from market volatility and defaults.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div
                                    class="glass-card hover-elevate h-100 p-4 p-lg-5 text-center border-0 border-top border-4 border-success">
                                    <i class="bi bi-shield-check text-success fs-1 mb-3"></i>
                                    <h4 class="fw-bold text-dark">Escrow Payments</h4>
                                    <p class="text-muted mb-0">Secure financial gateways with escrow-backed protection,
                                        guaranteeing swift payouts upon successful SLA delivery.</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div
                                    class="glass-card hover-elevate h-100 p-4 p-lg-5 text-center border-0 border-top border-4 border-warning">
                                    <i class="bi bi-graph-up text-warning fs-1 mb-3"></i>
                                    <h4 class="fw-bold text-dark">Transparent Pricing</h4>
                                    <p class="text-muted mb-0">Market-driven, transparent negotiations ensuring fair
                                        procurement rates without hidden intermediary commission layers.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-white border-top py-4 mt-auto">
            <div class="container text-center">
                <p class="mb-0 text-muted fw-semibold">&copy; 2024 Assured Contract Farming System. All rights reserved.
                </p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>