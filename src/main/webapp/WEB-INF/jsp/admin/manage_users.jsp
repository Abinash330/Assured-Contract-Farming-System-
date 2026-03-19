<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Manage Users - Admin Control Center</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
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
                                class="bg-primary bg-opacity-10 text-primary p-3 rounded-circle border border-primary border-opacity-25">
                                <i class="bi bi-people-fill fs-2"></i>
                            </div>
                            <div>
                                <h1 class="fw-bold text-dark display-6 mb-1">User Management & KYC</h1>
                                <p class="text-muted fs-5 mb-0">Review identity documents and verify user accounts.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="glass-card border-0 shadow-sm overflow-hidden">
                    <div class="table-responsive">
                        <table class="table table-custom align-middle mb-0 text-nowrap">
                            <thead class="table-custom-header">
                                <tr>
                                    <th class="py-4 px-4 ps-5">ID</th>
                                    <th class="py-4 px-4">Username</th>
                                    <th class="py-4 px-4">Email</th>
                                    <th class="py-4 px-4">Role / Type</th>
                                    <th class="py-4 px-4">Aadhaar (ID)</th>
                                    <th class="py-4 px-4">PAN (Tax)</th>
                                    <th class="py-4 px-4 text-center">KYC Verification</th>
                                    <th class="py-4 px-4 pe-5 text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="border-top-0 bg-white bg-opacity-50">
                                <c:forEach var="user" items="${users}">
                                    <tr class="border-bottom border-light">
                                        <td class="px-4 ps-5 fw-bold text-slate-400">#${user.id}</td>
                                        <td class="px-4 fw-bold text-dark">${user.username}</td>
                                        <td class="px-4 text-muted">${user.email}</td>
                                        <td class="px-4">
                                            <span class="badge rounded-pill border py-2 px-3 
                                        bg-${user.role == 'admin' ? 'dark text-white' : 
                                            (user.role == 'farmer' ? 'success bg-opacity-10 text-success border-success' : 
                                            (user.role == 'buyer' ? 'primary bg-opacity-10 text-primary border-primary' : 
                                            'info bg-opacity-10 text-info border-info'))}">
                                                <i
                                                    class="bi bi-${user.role == 'admin' ? 'star-fill' : (user.role == 'farmer' ? 'tractor' : (user.role == 'buyer' ? 'briefcase' : 'search'))} me-1"></i>
                                                ${fn:toUpperCase(fn:substring(user.role, 0,
                                                1))}${fn:substring(user.role, 1, fn:length(user.role))}
                                            </span>
                                        </td>
                                        <td class="px-4 text-muted font-monospace bg-light rounded">${not empty
                                            user.aadhaarNumber ? user.aadhaarNumber : 'N/A'}</td>
                                        <td class="px-4 text-muted font-monospace bg-light rounded mx-2">${not empty
                                            user.panNumber ? user.panNumber : 'N/A'}</td>
                                        <td class="px-4 text-center">
                                            <c:choose>
                                                <c:when test="${user.kycStatus == 'APPROVED'}"><span
                                                        class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 mt-1 d-inline-flex px-3 py-1 rounded-pill"><i
                                                            class="bi bi-shield-check me-1 fs-6"></i> Verified</span>
                                                </c:when>
                                                <c:when test="${user.kycStatus == 'REJECTED'}"><span
                                                        class="badge bg-danger bg-opacity-25 text-danger border border-danger border-opacity-50 mt-1 d-inline-flex px-3 py-1 rounded-pill"><i
                                                            class="bi bi-shield-x me-1 fs-6"></i> Rejected</span>
                                                </c:when>
                                                <c:otherwise><span
                                                        class="badge bg-warning bg-opacity-25 text-dark border border-warning border-opacity-50 mt-1 d-inline-flex px-3 py-1 rounded-pill"><i
                                                            class="bi bi-hourglass-split me-1 fs-6"></i> Pending</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="px-4 pe-5 text-center">
                                            <div class="d-flex justify-content-center gap-2 align-items-center">
                                                <c:if test="${user.role != 'admin' && user.kycStatus == 'PENDING'}">
                                                    <form action="/admin/users/approve-kyc" method="post" class="mb-0">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit"
                                                            class="btn btn-success btn-sm rounded-pill fw-bold shadow-sm px-3"
                                                            title="Approve KYC">Approve</button>
                                                    </form>
                                                    <form action="/admin/users/reject-kyc" method="post" class="mb-0">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit"
                                                            class="btn btn-warning btn-sm rounded-pill fw-bold shadow-sm px-3 text-dark"
                                                            title="Reject KYC">Reject</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${user.role != 'admin'}">
                                                    <form action="/admin/users/delete" method="post" class="mb-0"
                                                        onsubmit="return confirm('Are you sure you want to permanently delete this user?');">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit"
                                                            class="btn btn-outline-danger btn-sm rounded-circle fw-bold shadow-sm ms-2"
                                                            title="Delete User"
                                                            style="width:32px; height:32px; padding:0;"><i
                                                                class="bi bi-trash"></i></button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>