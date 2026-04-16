<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enterprise Procurement - AgriTrust</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/style.css">
</head>
<body class="bg-light">
    <!-- Buyer Header -->
    <jsp:include page="/WEB-INF/jsp/common/header_buyer.jsp" />

    <div class="container py-5">
        <div class="glass-card p-5 mb-5 border-0">
            <h1 class="display-6 fw-bold">Procurement Contracts</h1>
            <p class="text-muted fs-5">Track your agricultural intake and manage digital escrow funds.</p>
        </div>

        <div class="glass-card border-0 overflow-hidden">
            <div class="table-responsive p-2">
                <table class="table align-middle table-hover mb-0">
                    <thead style="background-color: #f8fafc;">
                        <tr class="text-uppercase small fw-bold text-secondary" style="letter-spacing: 0.5px;">
                            <th class="py-4 ps-4 border-bottom-0 rounded-start-4">Ref #</th>
                            <th class="py-4 border-bottom-0">Source Farmer</th>
                            <th class="py-4 border-bottom-0">Commodity Asset</th>
                            <th class="py-4 border-bottom-0">Escrow Value</th>
                            <th class="py-4 border-bottom-0">Status</th>
                            <th class="py-4 pe-4 text-end border-bottom-0 rounded-end-4">Action Center</th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0">
                        <c:forEach var="c" items="${contracts}">
                            <tr class="bg-white transition" style="box-shadow: 0 2px 8px rgba(0,0,0,0.02);">
                                <td class="ps-4 fw-bold font-monospace text-muted py-4">#${c.contractId}</td>
                                <td class="fw-bold text-dark"><i class="bi bi-person-circle text-primary opacity-75 fs-5 me-2 align-middle"></i> ${c.farmerName}</td>
                                <td>
                                    <div class="d-flex flex-column">
                                        <span class="fw-bold text-dark">${c.cropName}</span>
                                        <span class="small text-muted"><i class="bi bi-boxes me-1"></i>${c.quantity} MT</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="fs-6 fw-bold text-success bg-success bg-opacity-10 px-3 py-2 rounded-3 d-inline-flex border border-success border-opacity-25 shadow-sm">
                                        ₹${c.finalPrice}
                                    </div>
                                </td>
                                <td>
                                    <span class="badge rounded-pill 
                                        ${c.contractStatus == 'Pending' ? 'bg-warning text-dark' : 
                                          c.contractStatus == 'Accepted' ? 'bg-primary' : 
                                          c.contractStatus == 'Completed' ? 'bg-success' : 'bg-secondary'} px-3 py-2">
                                        ${c.contractStatus}
                                    </span>
                                </td>
                                <td class="pe-4 text-end">
                                    <form action="/contract/delete" method="post" class="d-inline">
                                        <input type="hidden" name="contract_id" value="${c.contractId}">
                                        <button type="submit" class="btn btn-outline-danger btn-sm rounded-pill px-3 fw-bold" 
                                            <c:if test="${c.paymentStatus == 'Paid'}">disabled</c:if>>
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                    <c:if test="${c.contractStatus == 'Accepted' && c.paymentStatus != 'Paid'}">
                                        <form action="/payment/form" method="post" class="d-inline ms-2">
                                            <input type="hidden" name="contract_id" value="${c.contractId}">
                                            <button type="submit" class="btn btn-warning btn-sm rounded-pill px-4 fw-bold text-dark shadow-sm">Fund Escrow</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${c.paymentStatus == 'Paid'}">
                                        <span class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25 px-3 py-2 rounded-pill ms-2 fw-bold">Escrow Funded</span>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Buyer Footer -->
    <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>