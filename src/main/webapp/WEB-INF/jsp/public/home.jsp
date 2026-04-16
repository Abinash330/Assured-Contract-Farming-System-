<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AgriTrust - Assured Contract Farming</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/style.css">
    <style>
        :root {
            --primary-green: #2d6a4f;
            --accent-green: #52b788;
            --soft-white: #f8fafc;
        }
        .hero-section {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('/images/hero-bg.png');
            background-size: cover;
            background-position: center;
            height: 90vh;
            display: flex;
            align-items: center;
            color: white;
            border-radius: 0 0 100px 100px;
        }
        .glass-nav {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(0,0,0,0.05);
        }
        .premium-card {
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }
        .premium-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .stat-banner {
            margin-top: -80px;
            position: relative;
            z-index: 10;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Premium Public Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_public.jsp" />

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-3 fw-bold mb-4 animate__animated animate__fadeInDown">Digitizing Trust in <span class="text-success">Agriculture</span></h1>
            <p class="lead mb-5 fs-4 animate__animated animate__fadeInUp">The most secure, transparent, and direct marketplace for farmers and industrial buyers.</p>
            <div class="d-flex justify-content-center gap-3 animate__animated animate__zoomIn">
                <a href="/register" class="btn btn-success btn-lg rounded-pill px-5 py-3 fw-bold shadow">Start Farming</a>
                <a href="/login" class="btn btn-outline-light btn-lg rounded-pill px-5 py-3 fw-bold">Enterprise Login</a>
            </div>
        </div>
    </section>

    <!-- Stats Banner -->
    <div class="container stat-banner">
        <div class="row g-4 d-flex justify-content-center">
            <div class="col-md-3">
                <div class="premium-card p-4 text-center bg-white">
                    <h2 class="fw-bold text-success mb-1 counter">${totalFarmers}</h2>
                    <p class="text-muted text-uppercase small fw-bold mb-0">Active Farmers</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="premium-card p-4 text-center bg-white">
                    <h2 class="fw-bold text-primary mb-1 counter">${totalContracts}</h2>
                    <p class="text-muted text-uppercase small fw-bold mb-0">Smart Contracts</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="premium-card p-4 text-center bg-white">
                    <h2 class="fw-bold text-warning mb-1 counter">${totalCrops}</h2>
                    <p class="text-muted text-uppercase small fw-bold mb-0">Crop Listings</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <section class="py-5 mt-5">
        <div class="container">
            <div class="text-center mb-5">
                <span class="badge bg-success bg-opacity-10 text-success px-3 py-2 rounded-pill fw-bold mb-3">WHY AGRITRUST</span>
                <h2 class="display-5 fw-bold text-dark">Empowering Both Sides of the Market</h2>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="premium-card p-5 h-100 bg-white">
                        <div class="bg-success bg-opacity-10 p-3 d-inline-block rounded-circle mb-4">
                            <i class="bi bi-shield-lock text-success fs-2"></i>
                        </div>
                        <h4 class="fw-bold">Escrow Guarantee</h4>
                        <p class="text-secondary">Funds are locked cryptographically the moment a contract is signed, ensuring farmers are always paid.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="premium-card p-5 h-100 bg-white">
                        <div class="bg-primary bg-opacity-10 p-3 d-inline-block rounded-circle mb-4">
                            <i class="bi bi-graph-up-arrow text-primary fs-2"></i>
                        </div>
                        <h4 class="fw-bold">Transparency</h4>
                        <p class="text-secondary">Every stage of production—from sowing to delivery—is logged on the blockchain for immutable proof.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="premium-card p-5 h-100 bg-white">
                        <div class="bg-warning bg-opacity-10 p-3 d-inline-block rounded-circle mb-4">
                            <i class="bi bi-patch-check text-warning fs-2"></i>
                        </div>
                        <h4 class="fw-bold">Quality Control</h4>
                        <p class="text-secondary">Independent inspectors certify crop quality before final payment release, protecting buyers.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section with Image -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <img src="/images/about-agri.png" alt="About AgriTrust" class="img-fluid rounded-5 shadow-lg">
                </div>
                <div class="col-lg-6">
                    <h2 class="display-6 fw-bold mb-4">Rooted in <span class="text-success">Sustainability</span></h2>
                    <p class="text-secondary fs-5 mb-4">AgriTrust was born from the need to eliminate middle-men and provide farmers with guaranteed markets and buyers with guaranteed quality.</p>
                    <ul class="list-unstyled">
                        <li class="mb-3 d-flex align-items-center gap-2"><i class="bi bi-check-circle-fill text-success"></i> Direct Farmer-to-Factory interaction</li>
                        <li class="mb-3 d-flex align-items-center gap-2"><i class="bi bi-check-circle-fill text-success"></i> Real-time market commodity tracking</li>
                        <li class="mb-3 d-flex align-items-center gap-2"><i class="bi bi-check-circle-fill text-success"></i> Comprehensive dispute resolution framework</li>
                    </ul>
                    <a href="/about" class="btn btn-success rounded-pill px-4 mt-3">Learn More</a>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="py-5 bg-light" id="faq">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="fw-bold display-6">Frequently Asked Questions</h2>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="accordion accordion-flush premium-card p-3 shadow-sm" id="faqAccordion">
                        <div class="accordion-item bg-transparent">
                            <h2 class="accordion-header">
                                <button class="accordion-button fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                                    How does the Escrow system work?
                                </button>
                            </h2>
                            <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">
                                    When a buyer initiates a contract, they deposit the final amount into our secure escrow. These funds are held by the system and only released to the farmer after successful quality inspection and delivery.
                                </div>
                            </div>
                        </div>
                        <div class="accordion-item bg-transparent">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed fw-bold" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                                    Is my harvest data private?
                                </button>
                            </h2>
                            <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">
                                    Yes, AgriTrust uses advanced encryption to protect your harvest data. Only verified buyers can view detailed crop listings, and your personal contact details are never shared without your consent.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Premium Public Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_public.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
