<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>View Contracts - Assured Contract Farming</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <link rel="stylesheet" href="/global-theme.css">
                <style>
                    .table-custom-header th {
                        background-color: transparent;
                        color: #64748b;
                        font-weight: 700;
                        border-bottom: 2px solid #e2e8f0;
                        text-transform: uppercase;
                        font-size: 0.8rem;
                        letter-spacing: 0.5px;
                    }

                    .table-custom tbody tr {
                        transition: all 0.2s ease;
                    }

                    .table-custom tbody tr:hover {
                        background-color: #f8fafc;
                        transform: scale(1.002);
                        box-shadow: inset 4px 0 0 var(--primary-green);
                    }

                    .action-form {
                        display: inline-block;
                        margin: 2px;
                    }
                </style>
            </head>

            <body class="pb-5">

                <!-- Navigation -->
                <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                    <div class="container">
                        <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                            <div class="bg-primary p-2 rounded-circle me-2 d-flex shadow-sm">
                                <i class="bi bi-file-earmark-text fs-5 text-white m-0 lh-1"></i>
                            </div>
                            <span class="text-dark">CFS Platform</span>
                        </a>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav ms-auto fw-semibold">
                                <li class="nav-item">
                                    <a class="nav-link px-3 d-flex align-items-center" href="/dashboard"><i
                                            class="bi bi-house border-end border-secondary border-opacity-25 pe-2 me-2"></i>
                                        Dashboard</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <div class="container-fluid px-4 px-lg-5">
                    <div class="glass-card mb-4 p-4 p-lg-5 border-0">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div>
                                <h1 class="fw-bold text-dark display-6 mb-2">Active Contracts Dashboard</h1>
                                <p class="text-muted fs-5 mb-0">Monitor and manage all your formal agreements, escrow
                                    payments, and logistical tracking in one unified view.</p>
                            </div>
                            <c:if test="${not empty param.success}">
                                <div class="alert alert-success alert-dismissible fade show mb-0 shadow-sm py-3 px-4 rounded-4 border-0"
                                    role="alert" style="background: rgba(34,197,94,0.1);">
                                    <i class="bi bi-check-circle-fill text-success me-2 fs-5 pt-1"></i> <span
                                        class="fw-medium text-dark">${param.success}</span>
                                    <button type="button" class="btn-close pb-1 pt-3" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                            </c:if>
                        </div>
                    </div>

                    <div class="glass-card border-0 overflow-hidden">
                        <div class="table-responsive">
                            <table class="table table-custom align-middle mb-0 text-nowrap">
                                <thead class="table-custom-header">
                                    <tr>
                                        <th class="py-4 px-4 ps-5">Ref #</th>
                                        <th class="py-4 px-4">Farmer</th>
                                        <th class="py-4 px-4">Buyer</th>
                                        <th class="py-4 px-4">Commodity Asset</th>
                                        <th class="py-4 px-4">Escrow Value</th>
                                        <th class="py-4 px-4">Delivery SLA</th>
                                        <th class="py-4 px-4">Live Status & Quality</th>
                                        <th class="py-4 px-4 pe-5 text-end">Action Center</th>
                                    </tr>
                                </thead>
                                <tbody class="border-top-0 bg-white bg-opacity-75">
                                    <c:choose>
                                        <c:when test="${not empty contracts}">
                                            <c:forEach var="c" items="${contracts}">
                                                <tr class="border-bottom border-light">
                                                    <td class="px-4 ps-5 fw-bold text-slate-400">#${c.contractId}</td>
                                                    <td class="px-4 fw-bold text-dark"><i
                                                            class="bi bi-person-badge text-success me-2 bg-success bg-opacity-10 p-1 rounded"></i>
                                                        ${c.farmerName}</td>
                                                    <td class="px-4 fw-bold text-dark"><i
                                                            class="bi bi-building text-primary me-2 bg-primary bg-opacity-10 p-1 rounded"></i>
                                                        ${c.buyerName}</td>
                                                    <td class="px-4 py-3">
                                                        <span
                                                            class="fw-bold fs-6 text-dark d-block mb-1">${c.cropName}</span>
                                                        <span
                                                            class="badge bg-slate-100 text-slate-600 border px-2 py-1"><i
                                                                class="bi bi-boxes disabled"></i> ${c.quantity} MT
                                                            Volume</span>
                                                    </td>
                                                    <td class="px-4">
                                                        <div
                                                            class="fs-5 fw-bold text-success bg-success bg-opacity-10 px-3 py-1 rounded-pill d-inline-flex border border-success border-opacity-25">
                                                            ₹${c.finalPrice}</div>
                                                    </td>
                                                    <td class="px-4">
                                                        <div
                                                            class="d-flex align-items-center text-danger fw-bold bg-danger bg-opacity-10 px-3 py-1 rounded-pill border border-danger border-opacity-25 d-inline-flex">
                                                            <i class="bi bi-calendar-x-fill me-2 fs-6"></i>
                                                            ${c.deliveryDeadline}
                                                        </div>
                                                    </td>
                                                    <td class="px-4 py-3">
                                                        <!-- Main Status Badge -->
                                                        <c:choose>
                                                            <c:when
                                                                test="${fn:toLowerCase(c.contractStatus) == 'pending'}">
                                                                <span
                                                                    class="badge rounded-pill bg-warning text-dark px-3 py-2 shadow-sm d-inline-flex align-items-center mb-2 border border-warning"><i
                                                                        class="bi bi-hourglass-split me-1"></i> Under
                                                                    Review</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(c.contractStatus) == 'accepted'}">
                                                                <span
                                                                    class="badge rounded-pill bg-primary px-3 py-2 shadow-sm d-inline-flex align-items-center mb-2"><i
                                                                        class="bi bi-shield-lock-fill me-1"></i>
                                                                    Contract Locked</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(c.contractStatus) == 'completed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-success px-3 py-2 shadow-sm d-inline-flex align-items-center mb-2"><i
                                                                        class="bi bi-check-circle-fill me-1"></i>
                                                                    Executed / Paid</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(c.contractStatus) == 'disputed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-danger px-3 py-2 shadow-sm d-inline-flex align-items-center mb-2"><i
                                                                        class="bi bi-exclamation-octagon-fill me-1"></i>
                                                                    Escalated</span></c:when>
                                                            <c:otherwise><span
                                                                    class="badge rounded-pill bg-secondary px-3 py-2 shadow-sm d-inline-flex align-items-center mb-2">${c.contractStatus}</span>
                                                            </c:otherwise>
                                                        </c:choose>

                                                        <div class="d-flex gap-2 mt-1">
                                                            <span
                                                                class="badge bg-light border text-slate-600 rounded-pill px-2 py-1"
                                                                style="font-size:0.7rem;">
                                                                <i class="bi bi-truck me-1"></i> <span
                                                                    class="text-${c.deliveryStatus == 'DELIVERED' ? 'success' : (c.deliveryStatus == 'IN_TRANSIT' ? 'primary' : 'secondary')}">${c.deliveryStatus
                                                                    != null ? c.deliveryStatus : 'PENDING'}</span>
                                                            </span>
                                                            <span
                                                                class="badge bg-light border text-slate-600 rounded-pill px-2 py-1"
                                                                style="font-size:0.7rem;">
                                                                <i class="bi bi-search me-1"></i> <span
                                                                    class="text-${c.inspectionResult == 'PASSED' ? 'success' : (c.inspectionResult == 'FAILED' ? 'danger' : 'secondary')}">${c.inspectionResult
                                                                    != null ? c.inspectionResult : 'PENDING'}</span>
                                                            </span>
                                                        </div>
                                                    </td>
                                                    <td class="px-4 pe-5 text-end">
                                                        <div class="d-flex flex-wrap justify-content-end gap-2"
                                                            style="max-width: 320px; float:right;">

                                                            <!-- Farmer Approval Logic -->
                                                            <c:if
                                                                test="${role == 'farmer' && fn:toLowerCase(c.contractStatus) == 'pending'}">
                                                                <form action="/contract/approve" method="post"
                                                                    class="action-form">
                                                                    <input type="hidden" name="contract_id"
                                                                        value="${c.contractId}">
                                                                    <button type="submit"
                                                                        class="btn btn-premium btn-sm fw-bold rounded-pill px-4 shadow-sm py-2">Accept
                                                                        Deal</button>
                                                                </form>
                                                                <form action="/contract/reject" method="post"
                                                                    class="action-form">
                                                                    <input type="hidden" name="contract_id"
                                                                        value="${c.contractId}">
                                                                    <button type="submit"
                                                                        class="btn btn-outline-danger btn-sm fw-bold rounded-pill px-4 shadow-sm py-2 bg-white">Decline</button>
                                                                </form>
                                                            </c:if>

                                                            <!-- Farmer Logistics Update -->
                                                            <c:if
                                                                test="${role == 'farmer' && fn:toLowerCase(c.contractStatus) == 'accepted'}">
                                                                <form action="/delivery/update" method="post"
                                                                    class="action-form d-flex bg-white p-1 rounded-pill border shadow-sm align-items-center group hover-elevate transition">
                                                                    <input type="hidden" name="contract_id"
                                                                        value="${c.contractId}">
                                                                    <select name="status"
                                                                        class="form-select border-0 form-select-sm bg-transparent fw-bold text-primary pe-4 py-1"
                                                                        required
                                                                        style="width: auto; outline:none; box-shadow:none;">
                                                                        <option value="IN_TRANSIT">🚚 In Transit
                                                                        </option>
                                                                        <option value="DELIVERED">📍 Delivered</option>
                                                                    </select>
                                                                    <button type="submit"
                                                                        class="btn btn-primary btn-sm rounded-pill ms-1 px-3 py-1 fw-bold">Update</button>
                                                                </form>
                                                            </c:if>

                                                            <!-- Inspector Logic -->
                                                            <c:if
                                                                test="${role == 'inspector' && fn:toLowerCase(c.contractStatus) == 'accepted'}">
                                                                <form action="/inspection/submit" method="post"
                                                                    class="action-form d-flex align-items-center bg-white p-1 rounded-pill border shadow-sm">
                                                                    <input type="hidden" name="contract_id"
                                                                        value="${c.contractId}">
                                                                    <select name="result"
                                                                        class="form-select border-0 form-select-sm bg-transparent fw-bold pe-4 py-1"
                                                                        required
                                                                        style="width: auto; outline:none; box-shadow:none;">
                                                                        <option value="PASSED" class="text-success">✅
                                                                            CERTIFY PASS</option>
                                                                        <option value="FAILED" class="text-danger">❌
                                                                            FLAG FAIL</option>
                                                                    </select>
                                                                    <input type="text" name="comments"
                                                                        class="form-control form-control-sm bg-slate-50 border rounded-pill py-1 px-3 mx-1"
                                                                        placeholder="Inspector remarks..." required
                                                                        style="width: 140px; font-size: 0.8rem;">
                                                                    <button type="submit"
                                                                        class="btn btn-dark btn-sm rounded-pill px-3 py-1 fw-bold">Report</button>
                                                                </form>
                                                            </c:if>

                                                            <!-- Buyer Action Center -->
                                                            <c:if test="${role == 'buyer'}">
                                                                <form action="/contract/delete" method="post"
                                                                    class="action-form mt-1">
                                                                    <input type="hidden" name="contract_id"
                                                                        value="${c.contractId}">
                                                                    <button type="submit"
                                                                        class="btn btn-outline-danger btn-sm rounded-pill px-3 fw-bold bg-white"
                                                                        ${fn:toLowerCase(c.paymentStatus)=='paid'
                                                                        ? 'disabled' : '' }><i
                                                                            class="bi bi-trash"></i></button>
                                                                </form>

                                                                <c:if
                                                                    test="${fn:toLowerCase(c.contractStatus) == 'accepted'}">
                                                                    <c:choose>
                                                                        <c:when
                                                                            test="${fn:toLowerCase(c.paymentStatus) == 'paid'}">
                                                                            <span
                                                                                class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 ms-1 px-3 py-2 rounded-pill mt-1 d-inline-flex align-items-center fw-bold"><i
                                                                                    class="bi bi-shield-lock-fill me-2 fs-6"></i>
                                                                                Escrow Funded</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <form action="/payment/form" method="post"
                                                                                class="action-form mt-1">
                                                                                <input type="hidden" name="contract_id"
                                                                                    value="${c.contractId}">
                                                                                <button type="submit"
                                                                                    class="btn btn-warning btn-sm rounded-pill px-4 fw-bold text-dark shadow py-1 fs-6 d-inline-flex align-items-center gap-2"><i
                                                                                        class="bi bi-shield-fill-check"></i>
                                                                                    Fund Escrow</button>
                                                                            </form>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </c:if>
                                                            </c:if>

                                                            <!-- Shared Risk Management Forms (Buyer & Farmer) -->
                                                            <c:if test="${role == 'buyer' || role == 'farmer'}">
                                                                <c:if
                                                                    test="${fn:toLowerCase(c.contractStatus) == 'accepted'}">
                                                                    <div
                                                                        class="w-100 d-flex justify-content-end gap-2 mt-2 pt-2 border-top border-light">
                                                                        <!-- Raise Dispute -->
                                                                        <form action="/dispute/raise" method="post"
                                                                            class="action-form d-flex bg-white px-1 py-1 rounded-pill border border-danger shadow-sm">
                                                                            <input type="hidden" name="contract_id"
                                                                                value="${c.contractId}">
                                                                            <input type="text" name="reason"
                                                                                class="form-control form-control-sm border-0 bg-transparent text-danger px-3 py-0"
                                                                                placeholder="State reason..." required
                                                                                style="width: 120px; font-size: 0.75rem;">
                                                                            <button type="submit"
                                                                                class="btn btn-danger btn-sm rounded-pill px-3 py-0 text-white fw-bold shadow-sm">Raise
                                                                                Dispute</button>
                                                                        </form>

                                                                        <!-- Buy Insurance -->
                                                                        <form action="/insurance/buy" method="post"
                                                                            class="action-form">
                                                                            <input type="hidden" name="contract_id"
                                                                                value="${c.contractId}">
                                                                            <button type="submit"
                                                                                class="btn btn-outline-info btn-sm rounded-pill fw-bold bg-white text-info px-3 shadow-sm py-1"><i
                                                                                    class="bi bi-shield-plus me-1"></i>
                                                                                Insure Asset</button>
                                                                        </form>

                                                                        <!-- File Claim -->
                                                                        <form action="/insurance/claim" method="post"
                                                                            class="action-form d-flex bg-white p-1 rounded-pill border border-info shadow-sm">
                                                                            <input type="hidden" name="contract_id"
                                                                                value="${c.contractId}">
                                                                            <input type="text" name="reason"
                                                                                class="form-control form-control-sm border-0 bg-transparent text-info px-3 py-0"
                                                                                placeholder="Claim details..." required
                                                                                style="width: 120px; font-size: 0.75rem;">
                                                                            <button type="submit"
                                                                                class="btn btn-info btn-sm rounded-pill px-3 py-0 text-white fw-bold shadow-sm">File
                                                                                Claim</button>
                                                                        </form>
                                                                    </div>
                                                                </c:if>

                                                                <c:if
                                                                    test="${fn:toLowerCase(c.contractStatus) == 'completed'}">
                                                                    <div
                                                                        class="w-100 d-flex justify-content-end mt-2 pt-3 border-top border-light">
                                                                        <!-- Review -->
                                                                        <form action="/review/submit" method="post"
                                                                            class="action-form d-flex bg-white p-1 rounded-pill border shadow-sm">
                                                                            <input type="hidden" name="contract_id"
                                                                                value="${c.contractId}">
                                                                            <select name="rating"
                                                                                class="form-select border-0 form-select-sm bg-transparent text-warning fw-bold ps-3 pe-4 py-1"
                                                                                required
                                                                                style="width: auto; outline:none; box-shadow:none;">
                                                                                <option value="5">⭐⭐⭐⭐⭐</option>
                                                                                <option value="4">⭐⭐⭐⭐</option>
                                                                                <option value="3">⭐⭐⭐</option>
                                                                                <option value="2">⭐⭐</option>
                                                                                <option value="1">⭐</option>
                                                                            </select>
                                                                            <input type="text" name="comments"
                                                                                class="form-control form-control-sm bg-slate-50 border rounded-pill py-1 px-3 mx-1"
                                                                                placeholder="Write a review..." required
                                                                                style="width: 160px; font-size: 0.8rem;">
                                                                            <button type="submit"
                                                                                class="btn btn-warning btn-sm rounded-pill px-4 py-1 fw-bold shadow-sm text-dark">Submit
                                                                                Rating</button>
                                                                        </form>
                                                                    </div>
                                                                </c:if>
                                                            </c:if>

                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="8" class="text-center py-5">
                                                    <div class="py-4">
                                                        <div
                                                            class="bg-secondary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                                            <i class="bi bi-file-earmark-x text-secondary"
                                                                style="font-size: 3rem;"></i>
                                                        </div>
                                                        <h3 class="fw-bold text-dark mb-2">No Active Contracts Found
                                                        </h3>
                                                        <p class="text-secondary fs-5 mb-0">You don't have any ongoing
                                                            pipeline agreements at the moment.</p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>