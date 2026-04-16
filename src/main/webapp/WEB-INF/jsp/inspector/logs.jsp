<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Certification Logs - Quality Auditing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <style>
        .logs-hero {
            background: linear-gradient(135deg, rgba(8, 121, 144, 0.85) 0%, rgba(15, 23, 42, 0.95) 100%), url('/images/quality_assurance.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            padding: 80px 0 100px;
            position: relative;
            z-index: 1;
            box-shadow: 0 10px 40px rgba(8, 121, 144, 0.2);
        }
        .log-card {
            background: rgba(255, 255, 255, 0.98);
            border: 1px solid rgba(13, 202, 240, 0.1);
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.03);
            transition: all 0.3s ease;
        }
        .log-card:hover {
            box-shadow: 0 10px 25px rgba(13, 202, 240, 0.15);
            transform: translateY(-3px);
        }
    </style>
</head>
<body class="bg-light pb-5">

    <jsp:include page="/WEB-INF/jsp/common/header_inspector.jsp" />

    <section class="logs-hero text-center mb-5 border-bottom border-info border-4">
        <div class="container position-relative z-1">
            <h1 class="display-5 fw-bolder mb-3"><i class="bi bi-journal-medical text-info me-2"></i> Certification Registry</h1>
            <p class="lead text-white-50 w-75 mx-auto fs-5">View immutable records of your extensive Quality Assurance audits across the marketplace.</p>
        </div>
    </section>

    <div class="container position-relative" style="margin-top: -60px; z-index: 10;">
        <div class="row g-4">
            <c:forEach var="log" items="${auditLogs}">
                <div class="col-lg-6">
                    <div class="log-card p-4 h-100 position-relative overflow-hidden">
                        <c:choose>
                            <c:when test="${log.inspectionResult == 'PASSED'}">
                                <div class="position-absolute top-0 end-0 p-3 opacity-10">
                                    <i class="bi bi-shield-check text-success" style="font-size: 5rem;"></i>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="position-absolute top-0 end-0 p-3 opacity-10">
                                    <i class="bi bi-shield-x text-danger" style="font-size: 5rem;"></i>
                                </div>
                            </c:otherwise>
                        </c:choose>

                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="badge bg-dark bg-opacity-10 text-dark border px-3 py-2 font-monospace fw-bold">CNT-${log.contractId}</span>
                            <span class="badge ${log.inspectionResult == 'PASSED' ? 'bg-success' : 'bg-danger'} px-3 py-2 rounded-pill fw-bold">
                                <i class="bi ${log.inspectionResult == 'PASSED' ? 'bi-check-circle-fill' : 'bi-x-circle-fill'} me-1"></i> ${log.inspectionResult}
                            </span>
                        </div>
                        
                        <h4 class="fw-bold text-dark mb-1">${log.cropName}</h4>
                        <div class="text-muted small mb-3 fw-semibold">
                            <span><i class="bi bi-boxes text-info me-1"></i> ${log.quantity} MT</span> 
                            <span class="mx-2 text-info opacity-25">|</span>
                            <span><i class="bi bi-person-fill text-info me-1"></i> Submitter: ${log.farmerName}</span>
                        </div>

                        <div class="bg-light p-3 rounded-3 border font-monospace small text-dark mb-0">
                            <i class="bi bi-quote fs-5 text-info opacity-50"></i>
                            <span style="white-space: pre-wrap;">${log.terms}</span>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty auditLogs}">
                <div class="col-12 py-5 text-center">
                    <div class="glass-card py-5 border-0 shadow-sm" style="background: linear-gradient(145deg, #ffffff 0%, #f1f5f9 100%); border-radius: 20px;">
                        <div class="bg-info bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 shadow-sm">
                            <i class="bi bi-journal-x text-info" style="font-size: 3rem;"></i>
                        </div>
                        <h2 class="fw-bold text-dark mb-2">No Audits Recorded</h2>
                        <p class="text-secondary fs-5 mb-4">You have not completed any Quality Assurance lab audits yet.</p>
                        <a href="/contracts" class="btn btn-info text-white rounded-pill px-5 py-3 fw-bold fs-5 shadow-lg hover-elevate transition">View Active Assignments</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer_inspector.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
