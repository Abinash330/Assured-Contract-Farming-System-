<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Privacy Policy - Assured Contract Farming</title>
        <link rel="website icon" type="png" href="/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="d-flex flex-column min-vh-100 bg-light">

        <!-- Header -->
        <jsp:include page="common/header_public.jsp" />

        <!-- Main Content -->
        <main class="container py-5 flex-grow-1">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-xl-9">

                    <div class="glass-card mb-5 p-4 p-md-5 text-center border-0 border-top border-4 border-success">
                        <i class="bi bi-shield-lock-fill text-success mb-3 d-block" style="font-size: 3.5rem;"></i>
                        <h1 class="fw-bold text-dark display-5 mb-3">Privacy & Data Security Policy</h1>
                        <p class="text-muted fs-5 mx-auto lh-lg" style="max-width: 800px;">
                            Your digital privacy and asset security are our highest mandates. This governance policy
                            documents the explicit types of personal, financial, and logistical information we process,
                            and the enterprise-grade protocols we employ to protect your data.
                        </p>
                    </div>

                    <div class="row g-4">
                        <div class="col-12">
                            <div class="glass-card p-4 p-md-5 border-0 mb-4 hover-elevate">
                                <div class="d-flex align-items-start gap-4">
                                    <div
                                        class="bg-primary bg-opacity-10 text-primary p-3 rounded-4 shadow-sm border border-primary border-opacity-25 d-none d-sm-block">
                                        <i class="bi bi-clipboard-data fs-2"></i>
                                    </div>
                                    <div>
                                        <h3 class="fw-bold text-dark mb-3"><i
                                                class="bi bi-clipboard-data text-primary me-2 d-sm-none"></i> Data
                                            Collection Governance</h3>
                                        <p class="text-muted mb-3 fs-5">We securely log the following required
                                            operational data sets:</p>
                                        <ul class="text-muted fs-5 lh-lg mb-0 list-unstyled">
                                            <li><i class="bi bi-check-circle-fill text-success me-2"></i><strong>KYC
                                                    Identity Vectors:</strong> Government ID traces (Aadhaar/PAN),
                                                verified names, and encrypted contact endpoints.</li>
                                            <li><i class="bi bi-check-circle-fill text-success me-2"></i><strong>Contract
                                                    Telemetry:</strong> Binding SLA configurations, yield metrics,
                                                pricing frameworks, and dispute audit trails.</li>
                                            <li><i class="bi bi-check-circle-fill text-success me-2"></i><strong>Financial
                                                    Nodes:</strong> Tokenized payment routes, escrow clearance logs, and
                                                withdrawal channels.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="glass-card p-4 p-md-5 border-0 mb-4 hover-elevate">
                                <div class="d-flex align-items-start gap-4">
                                    <div
                                        class="bg-success bg-opacity-10 text-success p-3 rounded-4 shadow-sm border border-success border-opacity-25 d-none d-sm-block">
                                        <i class="bi bi-gear-fill fs-2"></i>
                                    </div>
                                    <div>
                                        <h3 class="fw-bold text-dark mb-3"><i
                                                class="bi bi-gear-fill text-success me-2 d-sm-none"></i> Processing
                                            Directives</h3>
                                        <p class="text-muted mb-0 fs-5 lh-lg">
                                            Your encrypted payload is actively utilized exclusively to facilitate
                                            transparent contract farming agreements, enforce SLA performance algorithms,
                                            validate escrow clearances, and optimize the algorithmic efficiency of our
                                            central marketplace routing.
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <div class="glass-card p-4 p-md-5 border-0 mb-4 hover-elevate">
                                <div class="d-flex align-items-start gap-4">
                                    <div
                                        class="bg-warning bg-opacity-10 text-dark p-3 rounded-4 shadow-sm border border-warning border-opacity-25 d-none d-sm-block">
                                        <i class="bi bi-shield-slash-fill fs-2 text-warning"></i>
                                    </div>
                                    <div>
                                        <h3 class="fw-bold text-dark mb-3"><i
                                                class="bi bi-shield-slash-fill text-warning me-2 d-sm-none"></i>
                                            Distribution & Zero-Trust</h3>
                                        <p class="text-muted mb-0 fs-5 lh-lg">
                                            We operate under strict zero-trust principles. We absolutely forbid the sale
                                            or external distribution of your proprietary data. Access is strictly
                                            confined to executing counterparties (Farmer to Buyer) on active contracts,
                                            judicial dispute moderators, and compulsory regulatory compliance bodies.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <jsp:include page="common/footer.jsp" />

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>