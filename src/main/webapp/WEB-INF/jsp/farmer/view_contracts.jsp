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
    <link rel="stylesheet" href="/style.css">
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
                                </td>
                            </tr>
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
