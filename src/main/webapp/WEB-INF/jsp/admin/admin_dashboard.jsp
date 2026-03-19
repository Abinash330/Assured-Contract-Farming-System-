<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Admin Dashboard - Assured Contract Farming</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link rel="stylesheet" href="/global-theme.css">
        </head>

        <body class="bg-light pb-5">

            <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                <div class="container">
                    <a class="navbar-brand fw-bold d-flex align-items-center" href="/admin/dashboard">
                        <div class="bg-dark p-2 rounded-3 me-2 d-flex shadow-sm">
                            <i class="bi bi-shield-lock-fill fs-5 text-warning m-0 lh-1"></i>
                        </div>
                        <span class="text-dark">Admin Control Center</span>
                    </a>
                    <div class="collapse navbar-collapse">
                        <ul class="navbar-nav ms-auto fw-semibold align-items-center">
                            <li class="nav-item">
                                <span class="nav-link text-slate-600 px-3"><i class="bi bi-person-circle me-1"></i>
                                    ${sessionScope.email}</span>
                            </li>
                            <li class="nav-item ms-3">
                                <a class="btn btn-outline-danger btn-sm mt-1 rounded-pill fw-bold px-4 shadow-sm"
                                    href="/logout"><i class="bi bi-box-arrow-right me-1"></i> Secure Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container py-2">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-lg-8">

                        <div class="glass-card mb-4 p-4 p-lg-5 text-center border-0">
                            <div class="d-inline-flex bg-dark bg-opacity-10 p-3 rounded-circle mb-3 shadow-sm">
                                <i class="bi bi-shield-shaded text-dark" style="font-size: 2.5rem;"></i>
                            </div>
                            <h1 class="fw-bold text-dark display-6 mb-2">System Administration</h1>
                            <p class="text-muted fs-5 mb-0 px-4">Manage the centralized platform operations including
                                user KYC verifications, contract monitoring, and dispute resolutions.</p>
                        </div>

                        <div class="row g-4 mt-2">
                            <div class="col-md-6 col-lg-4">
                                <a href="/admin/users" class="text-decoration-none">
                                    <div class="glass-card hover-elevate h-100 p-4 text-center border-0">
                                        <div
                                            class="bg-primary bg-opacity-10 text-primary rounded-circle p-3 d-inline-flex mb-3 shadow-sm border border-primary border-opacity-25">
                                            <i class="bi bi-people-fill fs-2"></i>
                                        </div>
                                        <h4 class="fw-bold text-dark mb-2">Manage Users</h4>
                                        <p class="text-muted small mb-0">Verify KYC, manage roles, and review new
                                            accounts.</p>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-6 col-lg-4">
                                <a href="/admin/contracts" class="text-decoration-none">
                                    <div class="glass-card hover-elevate h-100 p-4 text-center border-0">
                                        <div
                                            class="bg-success bg-opacity-10 text-success rounded-circle p-3 d-inline-flex mb-3 shadow-sm border border-success border-opacity-25">
                                            <i class="bi bi-file-earmark-check-fill fs-2"></i>
                                        </div>
                                        <h4 class="fw-bold text-dark mb-2">Monitor Contracts</h4>
                                        <p class="text-muted small mb-0">Audit contract lifecycle and ensure SLA
                                            compliance.</p>
                                    </div>
                                </a>
                            </div>

                            <div class="col-md-6 col-lg-4 mx-auto">
                                <a href="/admin/disputes" class="text-decoration-none">
                                    <div class="glass-card hover-elevate h-100 p-4 text-center border-0">
                                        <div
                                            class="bg-danger bg-opacity-10 text-danger rounded-circle p-3 d-inline-flex mb-3 shadow-sm border border-danger border-opacity-25">
                                            <i class="bi bi-exclamation-octagon-fill fs-2"></i>
                                        </div>
                                        <h4 class="fw-bold text-dark mb-2">Resolve Disputes</h4>
                                        <p class="text-muted small mb-0">Mediate and resolve escalated contract
                                            disputes.</p>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </body>

        </html>