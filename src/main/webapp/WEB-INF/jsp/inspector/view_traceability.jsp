<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Supply Chain Traceability - AgriTrust OS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <!-- QR Code Generator JS -->
    <script src="https://cdn.jsdelivr.net/npm/qrcodejs@1.0.0/qrcode.min.js"></script>
    <style>
        .timeline-with-icons {
            border-left: 2px solid #10b981;
            position: relative;
            list-style: none;
            padding-left: 0;
        }
        .timeline-with-icons .timeline-item {
            position: relative;
            padding-left: 2rem;
            margin-bottom: 2rem;
        }
        .timeline-with-icons .timeline-icon {
            position: absolute;
            left: -17px;
            background-color: #10b981;
            color: #fff;
            border-radius: 50%;
            height: 32px;
            width: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 0 0 4px #fff;
        }
    </style>
</head>
<body class="bg-light pb-5">
    <jsp:include page="/WEB-INF/jsp/common/header_inspector.jsp" />

    <div class="container-fluid px-4 px-lg-5 mt-4">
        <div class="row g-4">
            <!-- Left Column: Contract Details & QR -->
            <div class="col-lg-4">
                <div class="glass-card p-4 border-0 shadow-sm bg-white text-center">
                    <h5 class="fw-bold mb-3"><i class="bi bi-upc-scan text-primary me-2"></i> Product Traceability</h5>
                    <div id="qrcode" class="d-inline-block border p-3 rounded bg-light shadow-sm mb-3"></div>
                    <p class="text-muted small">Scan this code to verify the immutable blockchain history of Contract #${contract.id}.</p>
                    <hr>
                    <div class="text-start">
                        <p class="mb-1"><span class="text-muted fw-bold">Contract Ref:</span> <span class="fw-bold text-dark">#${contract.id}</span></p>
                        <p class="mb-1"><span class="text-muted fw-bold">Current Status:</span> 
                            <span class="badge bg-primary rounded-pill px-2 py-1">${contract.contractStatus}</span>
                        </p>
                        <p class="mb-1"><span class="text-muted fw-bold">Final Price (Escrow):</span> <span class="text-success fw-bold">₹${contract.finalPrice}</span></p>
                        <c:if test="${contract.penaltyAmount > 0}">
                             <p class="mb-1"><span class="text-muted fw-bold">Penalty Applied:</span> <span class="text-danger fw-bold">-₹${contract.penaltyAmount}</span></p>
                        </c:if>
                        <p class="mb-1"><span class="text-muted fw-bold">Delivery Deadline:</span> ${contract.deliveryDeadline}</p>
                        <c:if test="${not empty contract.actualDeliveryDate}">
                             <p class="mb-1"><span class="text-muted fw-bold">Actual Delivery:</span> ${contract.actualDeliveryDate}</p>
                        </c:if>
                        <c:if test="${not empty contract.qualityRating}">
                             <p class="mb-0"><span class="text-muted fw-bold">Quality Scored:</span> <span class="badge ${contract.qualityRating >= 90 ? 'bg-success' : 'bg-danger'}">${contract.qualityRating}/100</span></p>
                        </c:if>
                    </div>
                </div>
            </div>

            <!-- Right Column: Timeline -->
            <div class="col-lg-8">
                <div class="glass-card p-4 p-md-5 border-0 shadow-sm bg-white h-100">
                    <h4 class="fw-bold mb-4 text-dark"><i class="bi bi-clock-history text-success me-2"></i> Immutable Ledger History</h4>
                    
                    <c:choose>
                        <c:when test="${empty traceabilityLogs}">
                            <div class="text-center py-5 text-muted">
                                <i class="bi bi-inbox fs-1"></i>
                                <p class="mt-3">No event logs recorded on the ledger yet.</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <ul class="timeline-with-icons">
                                <c:forEach var="log" items="${traceabilityLogs}">
                                    <li class="timeline-item">
                                        <span class="timeline-icon">
                                            <i class="bi bi-check-lg"></i>
                                        </span>
                                        <h6 class="fw-bold text-dark mb-1">${log.stage}</h6>
                                        <p class="text-muted small mb-2"><i class="bi bi-calendar3 me-1"></i> ${log.timestamp}</p>
                                        <div class="bg-light p-3 rounded border">
                                            <p class="mb-1 text-secondary">${log.details}</p>
                                            <span class="font-monospace small text-primary bg-primary bg-opacity-10 px-2 py-1 rounded d-inline-flex align-items-center"><i class="bi bi-link-45deg me-1"></i> ${log.blockchainHash}</span>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            var url = window.location.href;
            new QRCode(document.getElementById("qrcode"), {
                text: url,
                width: 150,
                height: 150,
                colorDark : "#0f172a",
                colorLight : "#ffffff",
                correctLevel : QRCode.CorrectLevel.L
            });
        });
    </script>
    <jsp:include page="/WEB-INF/jsp/common/footer_inspector.jsp" />
</body>
</html>
