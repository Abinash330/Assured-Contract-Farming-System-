<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quality Assurance Dashboard - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <style>
        .inspector-hero {
            background: linear-gradient(135deg, rgba(8, 121, 144, 0.85) 0%, rgba(15, 23, 42, 0.95) 100%), url('/images/quality_assurance.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            padding: 120px 0 100px;
            border-radius: 0 0 40px 40px;
            margin-bottom: -50px;
            box-shadow: 0 10px 40px rgba(8, 121, 144, 0.2);
            position: relative;
            z-index: 1;
        }
        .stats-icon {
            font-size: 2.8rem;
            opacity: 0.85;
            transition: transform 0.3s ease;
        }
        .hover-elevate:hover .stats-icon {
            transform: scale(1.1) rotate(-5deg);
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
    </style>
</head>
<body class="bg-light">

    <!-- Premium Inspector Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_inspector.jsp" />

    <section class="inspector-hero text-center">
        <div class="container">
            <h1 class="display-4 fw-bold">Quality Certification Hub</h1>
            <p class="lead">Maintaining rigorous standards and transparent traceability for every harvest.</p>
        </div>
    </section>

    <main class="container py-5 mt-5">
        <div class="row g-4 mb-5">
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #f59e0b;">
                    <div class="text-warning mb-3"><i class="bi bi-clipboard-check stats-icon"></i></div>
                    <h3 class="fw-bold">${fn:length(pendingInspections)}</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Pending Audits</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #10b981;">
                    <div class="text-success mb-3"><i class="bi bi-patch-check stats-icon"></i></div>
                    <h3 class="fw-bold">0</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Certified This Month</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card p-4 text-center hover-elevate" style="border-bottom: 4px solid #3b82f6;">
                    <div class="text-primary mb-3"><i class="bi bi-clock-history stats-icon"></i></div>
                    <h3 class="fw-bold">2.4h</h3>
                    <p class="text-secondary text-uppercase small fw-bold">Avg. Audit Time</p>
                </div>
            </div>
        </div>

        <div class="d-flex align-items-center justify-content-between mb-4 mt-2">
            <h3 class="fw-bold text-dark mb-0"><i class="bi bi-clipboard2-pulse-fill text-warning me-2"></i> Quality Assurance Queue</h3>
        </div>

        <div class="row row-cols-1 row-cols-lg-2 g-4">
            <c:forEach var="ins" items="${pendingInspections}">
                <div class="col">
                    <div class="glass-card p-4 h-100 border-0 shadow-sm transition hover-elevate">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="bg-warning bg-opacity-10 p-3 rounded-circle text-warning fs-3 lh-1">
                                    <i class="bi bi-box-seam"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold text-dark mb-1">Contract CNT-${ins.id}</h5>
                                    <span class="badge bg-light text-dark border px-2">Pending Inspection</span>
                                </div>
                            </div>
                            <span class="badge bg-danger bg-opacity-10 text-danger px-3 py-2 rounded-pill"><i class="bi bi-exclamation-triangle-fill me-1"></i> PRIORITY 1</span>
                        </div>
                        <hr class="opacity-10 my-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <p class="small text-muted mb-1 fw-semibold text-uppercase">Deadline</p>
                                <p class="fw-bold text-dark mb-0"><i class="bi bi-calendar-event me-1"></i> ${ins.deliveryDeadline}</p>
                            </div>
                            <a href="/contracts" class="btn btn-warning rounded-pill px-4 fw-bold hover-elevate shadow-sm"><i class="bi bi-search me-2"></i> Begin Audit</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <c:if test="${empty pendingInspections}">
                <div class="col-12 text-center py-5">
                    <div class="bg-success bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                        <i class="bi bi-check-all text-success fs-1"></i>
                    </div>
                    <h3 class="fw-bold">Queue Fully Cleared</h3>
                    <p class="text-secondary fs-5">All active contracts have been formally inspected.</p>
                </div>
            </c:if>
        </div>
    </main>

    <!-- Premium Inspector Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_inspector.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
