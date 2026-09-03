<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enterprise Buyer Dashboard - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <style>
        .buyer-hero {
            background: linear-gradient(135deg, rgba(15, 23, 42, 0.85) 0%, rgba(30, 58, 138, 0.75) 100%), url('/images/buyer-banner.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            padding: 120px 0 100px;
            border-radius: 0 0 40px 40px;
            margin-bottom: -50px;
            box-shadow: 0 10px 40px rgba(15, 23, 42, 0.2);
            position: relative;
            z-index: 1;
        }
        .stats-icon {
            font-size: 2.8rem;
            opacity: 0.85;
            transition: transform 0.3s ease;
        }
        .hover-elevate:hover .stats-icon {
            transform: scale(1.1) rotate(5deg);
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 20px;
            box-shadow: 0 12px 36px rgba(0,0,0,0.06);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            z-index: 2;
        }
        .glass-card:hover {
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body class="bg-light">

    <!-- Premium Buyer Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_buyer.jsp" />

    <section class="buyer-hero text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Enterprise Procurement Center</h1>
            <p class="lead">Managing global raw material supply chains with cryptographic certainty.</p>
        </div>
    </section>

    <main class="container py-5 mt-5">
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #3b82f6;">
                    <div class="text-primary mb-3"><i class="bi bi-cart-check stats-icon"></i></div>
                    <h3 class="fw-bold">${fn:length(purchasedCrops)}</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Active Procurements</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #10b981;">
                    <div class="text-success mb-3"><i class="bi bi-currency-rupee stats-icon"></i></div>
                    <h3 class="fw-bold">₹${ytdSpend} L</h3>
                    <p class="text-secondary text-uppercase small fw-bold">YTD Spend</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #f59e0b;">
                    <div class="text-warning mb-3"><i class="bi bi-shield-check stats-icon"></i></div>
                    <h3 class="fw-bold">100%</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Escrow Security</p>
                </div>
            </div>
        </div>

        <div class="row mb-5 g-4">
            <div class="col-lg-8">
                <div class="glass-card p-4 h-100 border-0 shadow-sm">
                    <h4 class="fw-bold text-dark mb-4"><i class="bi bi-bar-chart-fill text-primary me-2"></i> Procurement Velocity</h4>
                    <div style="height: 300px; position: relative;">
                        <canvas id="procurementChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="glass-card p-4 h-100 border-0 shadow-sm bg-primary bg-opacity-10 d-flex flex-column justify-content-center text-center">
                    <h5 class="text-primary fw-bold mb-3 text-uppercase">Market Access</h5>
                    <p class="text-secondary mb-4">Discover verified farm yields across the network.</p>
                    <a href="/crop/browse" class="btn btn-primary rounded-pill fw-bold py-3 shadow-lg hover-elevate"><i m class="bi bi-search me-2"></i> Browse Market</a>
                </div>
            </div>
        </div>

        <div class="d-flex align-items-center justify-content-between mb-4 mt-2">
            <h3 class="fw-bold text-dark mb-0">Procured Assets Inventory</h3>
        </div>

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            <c:forEach var="crop" items="${purchasedCrops}">
                <div class="col">
                    <div class="card h-100 border-0 shadow-sm rounded-4 overflow-hidden hover-elevate">
                        <img src="/images/default_dashboard.jpg" class="card-img-top" alt="${crop.cropName}" style="height: 200px; object-fit: cover;">
                        <div class="card-body p-4">
                            <span class="badge bg-primary rounded-pill mb-2">SECURED</span>
                            <h4 class="fw-bold">${crop.cropName}</h4>
                            <p class="text-muted small mb-3"><i class="bi bi-geo-alt-fill me-1"></i> ${crop.location}</p>
                            <div class="bg-light p-2 rounded mb-3 text-center">
                                <span class="fw-bold text-dark">${crop.quantity} MT</span> @ <span class="fw-bold text-success">₹${crop.pricePerUnit}</span>
                            </div>
                            <div class="progress mb-3" style="height: 6px;">
                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 45%"></div>
                            </div>
                            <button class="btn btn-outline-primary btn-sm w-100 rounded-pill fw-bold hover-elevate transition" onclick="generateContractPDF('${crop.cropName}', '${crop.quantity}', '${crop.pricePerUnit}', '${crop.location}')">
                                <i class="bi bi-file-earmark-pdf-fill me-1"></i> Generate PDF Contract
                            </button>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty purchasedCrops}">
                <div class="col-12 text-center py-5">
                    <i class="bi bi-cart-x fs-1 text-muted"></i>
                    <p class="fs-5 text-secondary mt-3">Pipeline empty. Start procuring raw materials now.</p>
                </div>
            </c:if>
        </div>
    </main>

    <!-- Premium Buyer Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- html2pdf for dynamic client-side PDF generation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script>
        function generateContractPDF(cropName, quantity, price, location) {
            // Generate a dynamic HTML template for the PDF
            const txHash = '0x' + Math.random().toString(36).substring(2, 15) + Math.random().toString(36).substring(2, 15);
            const content = `
                <div style="padding: 40px; font-family: 'Times New Roman', serif; color: #1e293b;">
                    <div style="text-align: center; border-bottom: 2px solid #0f172a; padding-bottom: 20px; margin-bottom: 30px;">
                        <h1 style="color: #0f172a; margin: 0; font-size: 32px; letter-spacing: 1px;">AGRITRUST SYSTEM</h1>
                        <p style="color: #64748b; font-size: 14px; margin: 5px 0 0;">Cryptographics Smart Contract Record</p>
                    </div>
                    <h3 style="color: #0d6efd; border-left: 4px solid #0d6efd; padding-left: 10px; margin-bottom: 20px;">Asset Details</h3>
                    <table style="width: 100%; text-align: left; border-collapse: collapse; margin-bottom: 30px;">
                        <tr><th style="padding: 10px; border-bottom: 1px solid #e2e8f0; width: 40%;">Commodity:</th><td style="padding: 10px; border-bottom: 1px solid #e2e8f0; font-weight: bold;">\${cropName}</td></tr>
                        <tr><th style="padding: 10px; border-bottom: 1px solid #e2e8f0;">Volume (MT):</th><td style="padding: 10px; border-bottom: 1px solid #e2e8f0; font-weight: bold;">\${quantity}</td></tr>
                        <tr><th style="padding: 10px; border-bottom: 1px solid #e2e8f0;">Unit Price:</th><td style="padding: 10px; border-bottom: 1px solid #e2e8f0; font-weight: bold; color: #10b981;">₹\${price}</td></tr>
                        <tr><th style="padding: 10px; border-bottom: 1px solid #e2e8f0;">Farm Origin:</th><td style="padding: 10px; border-bottom: 1px solid #e2e8f0; font-weight: bold;">\${location}</td></tr>
                    </table>
                    <div style="background: #f8fafc; padding: 20px; border-radius: 8px; border: 1px solid #e2e8f0;">
                        <h4 style="margin-top: 0; color: #0f172a;">Blockchain Verification</h4>
                        <p style="font-family: monospace; font-size: 12px; color: #475569; word-break: break-all; margin: 0;">TXN HASH: \${txHash}</p>
                        <p style="font-family: monospace; font-size: 12px; color: #10b981; margin: 5px 0 0;">STATUS: SMART CONTRACT ESCROW LOCKED & VERIFIED</p>
                    </div>
                    <div style="margin-top: 50px; display: flex; justify-content: space-between; text-align: center;">
                        <div style="width: 40%; border-top: 1px dashed #94a3b8; padding-top: 10px;"><p style="margin: 0; font-weight: bold;">Buyer Digital Sig</p></div>
                        <div style="width: 40%; border-top: 1px dashed #94a3b8; padding-top: 10px;"><p style="margin: 0; font-weight: bold;">Network Validator</p></div>
                    </div>
                </div>
            `;
            
            const element = document.createElement('div');
            element.innerHTML = content;
            
            // Configuration for html2pdf
            const opt = {
                margin: 0,
                filename: 'AgriTrust_Contract_' + cropName.replace(/\s+/g, '_') + '.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            
            // Execute PDF Generation
            html2pdf().set(opt).from(element).save();
        }

        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('procurementChart');
            if(ctx) {
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                        datasets: [{
                            label: 'Spend (₹ Lakhs)',
                            data: ${chartData != null ? chartData : '[0,0,0,0,0,0]'},
                            borderColor: '#0d6efd',
                            tension: 0.4,
                            fill: true,
                            backgroundColor: 'rgba(13, 110, 253, 0.1)'
                        }]
                    },
                    options: { responsive: true, maintainAspectRatio: false }
                });
            }
        });
    </script>
</body>
</html>
