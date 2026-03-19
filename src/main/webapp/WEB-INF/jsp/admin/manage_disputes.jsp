<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Manage Disputes - Admin Control Center</title>
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

                    <div
                        class="glass-card mb-4 p-4 p-lg-5 border-0 bg-danger bg-opacity-10 border border-danger border-opacity-10">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="bg-danger text-white p-3 rounded-circle shadow">
                                    <i class="bi bi-exclamation-octagon-fill fs-2"></i>
                                </div>
                                <div>
                                    <h1 class="fw-bold text-dark display-6 mb-1">Dispute Resolution Center</h1>
                                    <p class="text-danger fs-5 mb-0 fw-medium">Critical queue demanding immediate
                                        administrative mediation.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="glass-card border-0 shadow-sm overflow-hidden">
                        <div class="table-responsive">
                            <table class="table table-custom align-middle mb-0 text-nowrap">
                                <thead class="table-custom-header">
                                    <tr>
                                        <th class="py-4 px-4 ps-5">Dispute Case #</th>
                                        <th class="py-4 px-4">Contract Ref</th>
                                        <th class="py-4 px-4">Plaintiff (UID)</th>
                                        <th class="py-4 px-4">Claim / Reported Reason</th>
                                        <th class="py-4 px-4 text-center">Case Status</th>
                                        <th class="py-4 px-4 pe-5 text-end">Judicial Action</th>
                                    </tr>
                                </thead>
                                <tbody class="border-top-0 bg-white bg-opacity-50">
                                    <c:choose>
                                        <c:when test="${not empty disputes}">
                                            <c:forEach var="d" items="${disputes}">
                                                <tr class="border-bottom border-light">
                                                    <td class="px-4 ps-5 fw-bold text-slate-400">#${d.id}</td>
                                                    <td class="px-4 fw-bold text-primary">Con #${d.contractId}</td>
                                                    <td class="px-4 text-muted"><i
                                                            class="bi bi-person-exclamation fs-5 me-1 text-danger"></i>
                                                        User #${d.raisedBy}</td>
                                                    <td class="px-4">
                                                        <div class="bg-danger bg-opacity-10 text-danger border border-danger border-opacity-25 rounded p-2 fw-semibold d-inline-block text-wrap"
                                                            style="max-width: 250px;">
                                                            <i class="bi bi-quote opacity-50 pe-1"></i>${d.reason}
                                                        </div>
                                                    </td>
                                                    <td class="px-4 text-center">
                                                        <c:choose>
                                                            <c:when test="${d.status == 'OPEN'}">
                                                                <span
                                                                    class="badge bg-danger text-white px-3 py-2 rounded-pill shadow-sm"><i
                                                                        class="bi bi-fire me-1"></i> ACTION REQ</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                    class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 px-3 py-2 rounded-pill"><i
                                                                        class="bi bi-shield-check me-1"></i>
                                                                    RESOLVED</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-4 pe-5 text-end">
                                                        <c:choose>
                                                            <c:when test="${d.status == 'OPEN'}">
                                                                <div class="d-flex justify-content-end gap-2 flex-wrap"
                                                                    style="max-width: 240px; float: right;">
                                                                    <form action="/dispute/resolve" method="post"
                                                                        class="w-100 mb-1">
                                                                        <input type="hidden" name="dispute_id"
                                                                            value="${d.id}">
                                                                        <input type="hidden" name="resolution"
                                                                            value="PAY_FARMER">
                                                                        <button type="submit"
                                                                            class="btn btn-success btn-sm w-100 rounded-pill fw-bold shadow-sm py-2"
                                                                            title="Favor Farmer & Release Escrow"><i
                                                                                class="bi bi-cash-stack me-1"></i>
                                                                            Release to Farmer</button>
                                                                    </form>
                                                                    <form action="/dispute/resolve" method="post"
                                                                        class="w-100">
                                                                        <input type="hidden" name="dispute_id"
                                                                            value="${d.id}">
                                                                        <input type="hidden" name="resolution"
                                                                            value="REFUND_BUYER">
                                                                        <button type="submit"
                                                                            class="btn btn-danger btn-sm w-100 rounded-pill fw-bold shadow-sm py-2"
                                                                            title="Favor Buyer & Refund Escrow"><i
                                                                                class="bi bi-arrow-return-left me-1"></i>
                                                                            Refund Buyer</button>
                                                                    </form>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                    class="text-success fw-bold d-inline-flex align-items-center bg-success bg-opacity-10 px-3 py-2 border border-success shadow-sm rounded-pill"><i
                                                                        class="bi bi-bookmark-check-fill me-2 fs-5"></i>
                                                                    Case Closed</span>
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
                                                            class="bg-success bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 border border-success">
                                                            <i class="bi bi-shield-check text-success"
                                                                style="font-size: 3rem;"></i>
                                                        </div>
                                                        <h3 class="fw-bold text-dark mb-2">No Active Disputes</h3>
                                                        <p class="text-secondary fs-5 mb-0">The platform ecosystem is
                                                            operating smoothly without escalations.</p>
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