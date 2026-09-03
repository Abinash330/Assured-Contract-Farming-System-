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
                            <button type="button" class="btn btn-warning rounded-pill px-4 fw-bold hover-elevate shadow-sm" data-bs-toggle="modal" data-bs-target="#diagnosticModal${ins.id}" onclick="startDiagnostic('${ins.id}')"><i class="bi bi-radar me-2"></i> Run IoT Diagnostic</button>
                        </div>
                    </div>
                    
                    <!-- IoT Diagnostic Simulation Modal -->
                    <div class="modal fade" id="diagnosticModal${ins.id}" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                                <div class="modal-header bg-dark text-white border-0 p-4">
                                    <h5 class="modal-title fw-bold"><i class="bi bi-cpu text-warning me-2"></i> IoT Sensor Telemetry Analysis</h5>
                                    <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body p-5 bg-light text-center" id="diagnosticBody${ins.id}">
                                    <i class="bi bi-broadcast pulse text-warning mb-3 d-inline-block" style="font-size: 3rem;"></i>
                                    <h4 class="fw-bold mb-3 text-dark transition" id="diagnosticText${ins.id}">Initializing Drone Scan...</h4>
                                    <div class="progress mb-4 bg-secondary bg-opacity-25" style="height: 10px;">
                                        <div id="diagnosticProgress${ins.id}" class="progress-bar progress-bar-striped progress-bar-animated bg-warning transition" style="width: 0%"></div>
                                    </div>
                                    <div id="diagnosticResult${ins.id}" class="d-none mt-4 transition">
                                        <div class="alert alert-success border-0 shadow-sm text-start rounded-4">
                                            <p class="mb-2 fw-bold text-success"><i class="bi bi-check-circle-fill me-2"></i> Nitrogen Levels: Optimal (84%)</p>
                                            <p class="mb-2 fw-bold text-success"><i class="bi bi-check-circle-fill me-2"></i> Moisture Content: 12.4%</p>
                                            <p class="mb-0 fw-bold text-success"><i class="bi bi-check-circle-fill me-2"></i> Pesticide Traces: < 0.01ppm (Passed)</p>
                                        </div>
                                        <form action="/certify" method="post" class="mt-4">
                                            <input type="hidden" name="contract_id" value="${ins.id}">
                                            <button type="submit" class="btn btn-success rounded-pill fw-bold w-100 shadow-sm hover-elevate py-3"><i class="bi bi-patch-check-fill me-2 fs-5"></i> Certify & Digitally Sign Ledger</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
    <script>
        function startDiagnostic(id) {
            const text = document.getElementById('diagnosticText' + id);
            const prog = document.getElementById('diagnosticProgress' + id);
            const res = document.getElementById('diagnosticResult' + id);
            
            // Reset state
            text.innerText = "Initializing Drone Scan...";
            text.className = "fw-bold mb-3 text-dark transition";
            prog.style.width = "0%";
            prog.className = "progress-bar progress-bar-striped progress-bar-animated bg-warning transition";
            res.classList.add('d-none');
            
            // Progression simulation
            setTimeout(() => { text.innerText = "Scanning Soil Composition..."; prog.style.width = "30%"; }, 1000);
            setTimeout(() => { text.innerText = "Analyzing Thermal Imagery..."; prog.style.width = "60%"; }, 2500);
            setTimeout(() => { text.innerText = "Verifying Escrow Requirements..."; prog.style.width = "85%"; }, 4000);
            setTimeout(() => { 
                text.innerText = "Audit Completed Successfully!"; 
                text.classList.remove('text-dark');
                text.classList.add('text-success');
                prog.style.width = "100%"; 
                prog.className = "progress-bar progress-bar-striped progress-bar-animated bg-success transition";
                res.classList.remove('d-none');
            }, 5500);
        }
    </script>
</body>
</html>
