<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quality Audit Queue - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body class="bg-light">
    <!-- Inspector Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_inspector.jsp" />

    <div class="container py-5">
        <div class="glass-card p-5 mb-5 border-0">
            <h1 class="display-6 fw-bold">Inspection Audit Queue</h1>
            <p class="text-muted fs-5">Verify commodity quality and certify contracts for payment release.</p>
        </div>

        <div class="glass-card border-0 overflow-hidden">
            <div class="table-responsive">
                <table class="table align-middle mb-0">
                    <thead class="bg-white">
                        <tr class="text-uppercase small fw-bold text-muted">
                            <th class="py-4 ps-4">Ref #</th>
                            <th class="py-4">Farmer</th>
                            <th class="py-4">Commodity</th>
                            <th class="py-4">Status</th>
                            <th class="py-4 pe-4 text-end">Audit Controls</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${contracts}">
                            <tr class="bg-white border-bottom">
                                <td class="ps-4 fw-bold">#${c.contractId}</td>
                                <td class="fw-bold text-dark"><i class="bi bi-tractor text-success me-2"></i> ${c.farmerName}</td>
                                <td>${c.cropName} (${c.quantity} MT)</td>
                                <td>
                                    <span class="badge rounded-pill 
                                        ${c.contractStatus == 'Pending' ? 'bg-warning text-dark' : 
                                          c.contractStatus == 'Accepted' ? 'bg-primary' : 
                                          c.contractStatus == 'Completed' ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                                        ${c.contractStatus}
                                    </span>
                                </td>
                                <td class="pe-4 text-end">
                                    <c:if test="${c.contractStatus == 'Accepted'}">
                                        <button type="button" class="btn btn-warning btn-sm rounded-pill px-4 py-1 fw-bold shadow-sm" 
                                                data-bs-toggle="modal" data-bs-target="#auditLabModal"
                                                onclick="document.getElementById('modalContractId').value='${c.contractId}'; document.getElementById('modalRef').innerText='CNT-${c.contractId}';">
                                            <i class="bi bi-clipboard-data text-dark me-1"></i> Audit Lab
                                        </button>
                                        <a href="/traceability/contract/${c.contractId}" class="btn btn-sm btn-outline-primary rounded-pill shadow-sm ms-2 py-1 fw-bold">
                                            <i class="bi bi-upc-scan me-1"></i> Traceability
                                        </a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Audit Lab Modal -->
    <div class="modal fade" id="auditLabModal" tabindex="-1" aria-labelledby="auditLabModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="modal-header text-white border-0 p-4" style="background: linear-gradient(135deg, #0dcaf0 0%, #087990 100%);">
                    <h5 class="modal-title fw-bold" id="auditLabModalLabel"><i class="bi bi-shield-check me-2"></i> Quality Assurance Lab | <span id="modalRef" class="text-light"></span></h5>
                    <button type="button" class="btn-close btn-close-white shadow-none" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/inspection/submit" method="post">
                    <div class="modal-body p-4 bg-light">
                        <input type="hidden" name="contract_id" id="modalContractId">
                        
                        <div class="row g-3 mb-3">
                            <div class="col-6">
                                <label for="moisture" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Moisture Index (%)</label>
                                <div class="input-group">
                                    <input type="number" step="0.1" class="form-control shadow-none border-end-0 fw-bold fs-6" id="moisture" name="moisture" placeholder="e.g. 12.5" required>
                                    <span class="input-group-text bg-white text-info fw-bold">%</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <label for="defects" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Defect Rating (%)</label>
                                <div class="input-group">
                                    <input type="number" step="0.1" class="form-control shadow-none border-end-0 fw-bold fs-6 text-danger" id="defects" name="defects" placeholder="e.g. 1.2" required>
                                    <span class="input-group-text bg-white text-danger fw-bold">%</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="result" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Final Certification</label>
                            <select name="result" id="result" class="form-select form-select-lg shadow-sm font-monospace fw-bold" required style="border-radius: 0.75rem;">
                                <option value="PASSED" class="text-success">✅ CERTIFICATE GRANTED (PASSED)</option>
                                <option value="FAILED" class="text-danger">❌ REJECT PAYLOAD (FAILED)</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="comments" class="form-label fw-bold text-dark small text-uppercase letter-spacing-wide">Extensive Audit Remarks</label>
                            <textarea class="form-control shadow-sm border focus-ring-info" id="comments" name="comments" rows="3" placeholder="Append visual references, discoloration notes, pathogen checks..." required style="border-radius: 0.75rem;"></textarea>
                        </div>
                        
                        <div class="alert alert-info py-2 mb-0 d-flex align-items-center">
                            <i class="bi bi-info-circle-fill fs-4 me-3"></i>
                            <small class="fw-semibold">This data is immutably written into the contract traceability ledger.</small>
                        </div>
                    </div>
                    <div class="modal-footer bg-white border-0 p-3 d-flex justify-content-between">
                        <button type="button" class="btn btn-light rounded-pill fw-bold px-4" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-info text-white rounded-pill fw-bold px-5 shadow-sm hover-elevate transition">Seal Audit Report</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Inspector Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_inspector.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
