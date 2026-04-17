<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Farmer Contracts - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/global-theme.css">
    <style>
        /* On-Chain Traceability Timeline UI */
        .trace-timeline { position: relative; padding-left: 2rem; }
        .trace-timeline::before {
            content: ''; position: absolute; left: 0.75rem; top: 0; bottom: 0;
            width: 4px; background: #e2e8f0; border-radius: 4px;
        }
        .trace-step { position: relative; margin-bottom: 2rem; opacity: 0.4; transition: all 0.5s ease; }
        .trace-step.active { opacity: 1; }
        .trace-step.active ~ .trace-step::before { content: none; }
        .trace-icon {
            position: absolute; left: -2.35rem; width: 40px; height: 40px;
            border-radius: 50%; display: flex; align-items: center; justify-content: center;
            border: 4px solid #fff; box-shadow: 0 4px 6px rgba(0,0,0,0.1); z-index: 2;
            transition: transform 0.3s;
        }
        .trace-step.active .trace-icon { transform: scale(1.1); }
        .trace-content {
            background: #fff; padding: 1.25rem; border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05); border: 1px solid #f1f5f9;
        }
        .chain-hash { font-family: monospace; font-size: 0.75rem; background: #1e293b; color: #38bdf8; padding: 2px 6px; border-radius: 4px; }
    </style>
</head>
<body class="bg-light">
    <!-- Farmer Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_farmer.jsp" />

    <div class="container py-5">
        <div class="glass-card p-5 mb-5 border-0">
            <h1 class="display-6 fw-bold">My Active Contracts</h1>
            <p class="text-muted fs-5">Manage and approve incoming contract requests from buyers.</p>
        </div>

        <div class="glass-card border-0 overflow-hidden">
            <div class="table-responsive">
                <table class="table align-middle mb-0">
                    <thead class="bg-white">
                        <tr class="text-uppercase small fw-bold text-muted">
                            <th class="py-4 ps-4">Ref #</th>
                            <th class="py-4">Commodity</th>
                            <th class="py-4">Buyer Entity</th>
                            <th class="py-4">Escrow Value</th>
                            <th class="py-4">Deadline</th>
                            <th class="py-4">Status</th>
                            <th class="py-4 pe-4 text-end">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="c" items="${contracts}">
                            <tr class="bg-white border-bottom">
                                <td class="ps-4 fw-bold">#${c.contractId}</td>
                                <td>${c.cropName} (${c.quantity} MT)</td>
                                <td class="fw-bold text-primary">${c.buyerName}</td>
                                <td class="text-success fw-bold">₹${c.finalPrice}</td>
                                <td class="text-danger fw-bold">${c.deliveryDeadline}</td>
                                <td>
                                    <span class="badge rounded-pill 
                                        ${c.contractStatus == 'Pending' ? 'bg-warning text-dark' : 
                                          c.contractStatus == 'Accepted' ? 'bg-primary' : 
                                          c.contractStatus == 'Completed' ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                                        ${c.contractStatus}
                                    </span>
                                </td>
                                <td class="pe-4 text-end">
                                    <c:if test="${c.contractStatus == 'Pending'}">
                                        <form action="/contract/approve" method="post" class="d-inline">
                                            <input type="hidden" name="contract_id" value="${c.contractId}">
                                            <button type="submit" class="btn btn-success btn-sm rounded-pill px-3 fw-bold">Accept</button>
                                        </form>
                                        <form action="/contract/reject" method="post" class="d-inline">
                                            <input type="hidden" name="contract_id" value="${c.contractId}">
                                            <button type="submit" class="btn btn-outline-danger btn-sm rounded-pill px-3 fw-bold">Reject</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${c.contractStatus == 'Accepted'}">
                                        <form action="/delivery/update" method="post" class="d-inline">
                                            <input type="hidden" name="contract_id" value="${c.contractId}">
                                            <select name="status" class="form-select form-select-sm d-inline-block w-auto border-0 bg-light rounded-pill px-3">
                                                <option value="IN_TRANSIT">In Transit</option>
                                                <option value="DELIVERED">Delivered</option>
                                            </select>
                                            <button type="submit" class="btn btn-primary btn-sm rounded-pill px-3 fw-bold">Update</button>
                                        </form>
                                    </c:if>
                                    
                                    <!-- Dynamic Traceability Button -->
                                    <button class="btn btn-dark btn-sm rounded-pill px-3 fw-bold ms-1" data-bs-toggle="modal" data-bs-target="#traceModal${c.contractId}">
                                        <i class="bi bi-link-45deg me-1"></i> Trace
                                    </button>
                                </td>
                            </tr>
                            
                            <!-- Traceability Timeline Modal -->
                            <div class="modal fade" id="traceModal${c.contractId}" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content border-0 shadow-lg rounded-4 overflow-hidden">
                                        <div class="modal-header bg-dark text-white border-0 p-4 align-items-center">
                                            <h5 class="modal-title fw-bold mb-0"><i class="bi bi-bounding-box-circles me-2 text-info"></i> Blockchain Origin Trace </h5>
                                            <span class="ms-3 chain-hash user-select-all">0x${fn:substring(c.contractId * 987654321, 0, 12)}...a9f</span>
                                            <button type="button" class="btn-close btn-close-white shadow-none ms-auto" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body p-4 p-md-5 bg-light" style="background: url('https://www.transparenttextures.com/patterns/cubes.png');">
                                            
                                            <!-- Determining active states -->
                                            <c:set var="isAccepted" value="${c.contractStatus == 'Accepted' || c.contractStatus == 'IN_TRANSIT' || c.contractStatus == 'DELIVERED' || c.contractStatus == 'Completed'}" />
                                            <c:set var="isInTransit" value="${c.contractStatus == 'IN_TRANSIT' || c.contractStatus == 'DELIVERED' || c.contractStatus == 'Completed'}" />
                                            <c:set var="isDelivered" value="${c.contractStatus == 'DELIVERED' || c.contractStatus == 'Completed'}" />
                                            
                                            <div class="trace-timeline ms-3">
                                                <!-- Step 1 -->
                                                <div class="trace-step active">
                                                     <div class="trace-icon bg-success pulse"><i class="bi bi-file-earmark-lock text-white"></i></div>
                                                     <div class="trace-content border-success border-opacity-50 border-start-0 border-end-0 border-top-0 border-4">
                                                        <div class="d-flex justify-content-between">
                                                            <h6 class="fw-bold mb-1 text-success">Escrow Smart Contract Generated</h6>
                                                            <span class="badge bg-success bg-opacity-25 text-success rounded-pill px-2">VALIDATED</span>
                                                        </div>
                                                        <small class="text-secondary d-block mt-2">Funds cryptographically locked by ${c.buyerName}. Waiting for node acceptance.</small>
                                                     </div>
                                                </div>
                                                
                                                <!-- Step 2 -->
                                                <div class="trace-step ${isAccepted ? 'active' : ''}">
                                                    <div class="trace-icon ${isAccepted ? 'bg-primary pulse' : 'bg-secondary'}"><i class="bi bi-check2-circle text-white"></i></div>
                                                    <div class="trace-content ${isAccepted ? 'border-primary border-opacity-50 border-start-0 border-end-0 border-top-0 border-4' : ''}">
                                                        <h6 class="fw-bold mb-1 ${isAccepted ? 'text-primary' : 'text-muted'}">Node Approved & Yield Secured</h6>
                                                        <small class="text-secondary d-block mt-2">Contract accepted by Farmer. Fulfillment window initiated based on terms.</small>
                                                    </div>
                                                </div>
                                                
                                                <!-- Step 3 -->
                                                <div class="trace-step ${isInTransit ? 'active' : ''}">
                                                    <div class="trace-icon ${isInTransit ? 'bg-warning pulse' : 'bg-secondary'}"><i class="bi bi-truck text-dark"></i></div>
                                                    <div class="trace-content ${isInTransit ? 'border-warning border-opacity-50 border-start-0 border-end-0 border-top-0 border-4' : ''}">
                                                        <h6 class="fw-bold mb-1 ${isInTransit ? 'text-dark' : 'text-muted'}">Logistics: In Transit</h6>
                                                        <small class="text-secondary d-block mt-2">Commodity dispatched. Geofencing active. IoT telemetrics recording.</small>
                                                    </div>
                                                </div>
                                                
                                                <!-- Step 4 -->
                                                <div class="trace-step ${isDelivered ? 'active' : ''}">
                                                    <div class="trace-icon ${isDelivered ? 'bg-success pulse' : 'bg-secondary'}"><i class="bi bi-box-seam-fill text-white"></i></div>
                                                    <div class="trace-content ${isDelivered ? 'border-success border-opacity-50 border-start-0 border-end-0 border-top-0 border-4 bg-success bg-opacity-10' : ''}">
                                                        <h6 class="fw-bold mb-1 ${isDelivered ? 'text-success' : 'text-muted'}">Settlement & Delivery</h6>
                                                        <small class="text-secondary d-block mt-2">Quality audit passed. Asset transferred to buyer node. Escrow funds released instantly.</small>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Farmer Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_farmer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
