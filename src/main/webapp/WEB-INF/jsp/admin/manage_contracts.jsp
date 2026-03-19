<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Manage Contracts - Admin Control Center</title>
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
                    }
                </style>
            </head>

            <body class="bg-light pb-5">

                <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                    <div class="container-fluid px-4">
                        <a class="navbar-brand fw-bold d-flex align-items-center" href="/admin/dashboard">
                            <div class="bg-dark p-2 rounded-3 me-2 d-flex shadow-sm">
                                <i class="bi bi-shield-lock-fill fs-5 text-warning m-0 lh-1"></i>
                            </div>
                            <span class="text-dark">Admin Control Center</span>
                        </a>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav ms-auto fw-semibold">
                                <li class="nav-item">
                                    <a class="nav-link px-3" href="/admin/dashboard"><i
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
                            <div class="d-flex align-items-center gap-3">
                                <div
                                    class="bg-success bg-opacity-10 text-success p-3 rounded-circle border border-success border-opacity-25">
                                    <i class="bi bi-file-earmark-check-fill fs-2"></i>
                                </div>
                                <div>
                                    <h1 class="fw-bold text-dark display-6 mb-1">System Contracts Overview</h1>
                                    <p class="text-muted fs-5 mb-0">Global audit view of all pipeline agreements across
                                        the platform.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="glass-card border-0 shadow-sm overflow-hidden">
                        <div class="table-responsive">
                            <table class="table table-custom align-middle mb-0 text-nowrap">
                                <thead class="table-custom-header">
                                    <tr>
                                        <th class="py-4 px-4 ps-5">Ref #</th>
                                        <th class="py-4 px-4">Farmer</th>
                                        <th class="py-4 px-4">Buyer</th>
                                        <th class="py-4 px-4">Asset Details</th>
                                        <th class="py-4 px-4 text-end">Escrow Value</th>
                                        <th class="py-4 px-4 pe-5 text-center">Lifecycle Status</th>
                                    </tr>
                                </thead>
                                <tbody class="border-top-0 bg-white bg-opacity-50">
                                    <c:choose>
                                        <c:when test="${not empty contractDetailsList}">
                                            <c:forEach var="detail" items="${contractDetailsList}">
                                                <tr class="border-bottom border-light">
                                                    <td class="px-4 ps-5 fw-bold text-slate-400">#${detail.contract.id}
                                                    </td>
                                                    <td class="px-4 fw-bold text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <div
                                                                class="bg-success bg-opacity-10 text-success rounded-circle p-2 me-2 shadow-sm d-flex">
                                                                <i class="bi bi-tractor"></i></div>
                                                            ${detail.farmer.username}
                                                        </div>
                                                    </td>
                                                    <td class="px-4 fw-bold text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <div
                                                                class="bg-primary bg-opacity-10 text-primary rounded-circle p-2 me-2 shadow-sm d-flex">
                                                                <i class="bi bi-building"></i></div>
                                                            ${detail.buyer.username}
                                                        </div>
                                                    </td>
                                                    <td class="px-4">
                                                        <span
                                                            class="fw-bold d-block text-dark mb-1">${detail.crop.cropName}</span>
                                                        <span class="text-muted small border rounded px-2 py-1"><i
                                                                class="bi bi-boxes me-1"></i> ${detail.crop.quantity}
                                                            Metric Tons</span>
                                                    </td>
                                                    <td class="px-4 text-end">
                                                        <div
                                                            class="fs-5 fw-bold text-success bg-success bg-opacity-10 px-3 py-1 rounded-pill d-inline-flex border border-success border-opacity-25">
                                                            ₹${detail.contract.finalPrice}</div>
                                                    </td>
                                                    <td class="px-4 pe-5 text-center">
                                                        <c:choose>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'pending'}">
                                                                <span
                                                                    class="badge rounded-pill bg-warning text-dark px-3 py-2 shadow-sm border border-warning"><i
                                                                        class="bi bi-hourglass-split me-1"></i> Under
                                                                    Review</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'accepted'}">
                                                                <span
                                                                    class="badge rounded-pill bg-primary px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-shield-lock-fill me-1"></i>
                                                                    Locked</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'completed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-success px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-check-circle-fill me-1"></i>
                                                                    Executed</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'disputed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-danger px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-exclamation-octagon-fill me-1"></i>
                                                                    Escalated</span></c:when>
                                                            <c:otherwise><span
                                                                    class="badge rounded-pill bg-secondary px-3 py-2 shadow-sm">${detail.contract.contractStatus}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="6" class="text-center py-5">
                                                    <div class="py-4">
                                                        <div
                                                            class="bg-secondary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                                            <i class="bi bi-file-earmark-x text-secondary"
                                                                style="font-size: 3rem;"></i>
                                                        </div>
                                                        <h3 class="fw-bold text-dark mb-2">No Platform Contracts</h3>
                                                        <p class="text-secondary fs-5 mb-0">System contract data will
                                                            appear here once agreements are formed.</p>
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