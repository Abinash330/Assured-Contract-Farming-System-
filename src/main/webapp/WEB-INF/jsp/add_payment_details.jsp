<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Payment Details - Assured Contract Farming</title>
            <link rel="website icon" type="png" href="/images/logo.png">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link rel="stylesheet" href="/global-theme.css">
        </head>

        <body class="bg-light pb-5 d-flex flex-column min-vh-100">

            <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                <div class="container">
                    <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                        <div class="bg-success p-2 rounded-circle me-2 d-flex shadow-sm">
                            <i class="bi bi-seedling fs-5 text-white m-0 lh-1"></i>
                        </div>
                        <span class="text-dark">CFS Platform</span>
                    </a>
                    <div class="collapse navbar-collapse">
                        <ul class="navbar-nav ms-auto fw-semibold">
                            <li class="nav-item">
                                <a class="nav-link px-3" href="/dashboard"><i
                                        class="bi bi-house border-end border-secondary border-opacity-25 pe-2 me-2"></i>
                                    Dashboard</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container py-2 flex-grow-1">
                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6">

                        <div class="glass-card mb-4 p-4 p-lg-5 border-0 hover-elevate">
                            <div class="text-center mb-4">
                                <div
                                    class="bg-primary bg-opacity-10 d-inline-flex p-3 rounded-circle text-primary border border-primary border-opacity-25 mb-3 shadow-sm">
                                    <i class="bi bi-bank2 fs-2"></i>
                                </div>
                                <h2 class="fw-bold text-dark mb-1">Bank routing details</h2>
                                <p class="text-muted small">Manage your settlement account parameters to receive
                                    automated escrow payouts.</p>
                            </div>

                            <c:if test="${not empty message}">
                                <div class="alert alert-success alert-dismissible fade show shadow-sm border-0 bg-success bg-opacity-10 text-success fw-bold px-4 py-3 rounded-4"
                                    role="alert">
                                    <i class="bi bi-check-circle-fill me-2 fs-5 pt-1"></i> ${message}
                                    <button type="button" class="btn-close pb-1 pt-3" data-bs-dismiss="alert"
                                        aria-label="Close"></button>
                                </div>
                            </c:if>

                            <c:choose>
                                <c:when test="${hasDetails && not isEditing}">
                                    <div class="p-4 bg-white bg-opacity-50 rounded-4 border shadow-sm mb-4">
                                        <h4 class="fw-bold text-dark mb-4 border-bottom pb-3"><i
                                                class="bi bi-wallet2 text-success me-2"></i> Active Settlement Route
                                        </h4>

                                        <div class="row mb-3">
                                            <div class="col-5 fw-bold text-muted small text-uppercase tracking-wider">
                                                UPI Identity</div>
                                            <div
                                                class="col-7 fw-bold text-dark font-monospace bg-light rounded px-2 py-1">
                                                ${user.upi_id != null ? user.upi_id : '<span
                                                    class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-5 fw-bold text-muted small text-uppercase tracking-wider">
                                                Account #</div>
                                            <div
                                                class="col-7 fw-bold text-dark font-monospace bg-light rounded px-2 py-1">
                                                ${user.account_number != null ? user.account_number : '<span
                                                    class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="col-5 fw-bold text-muted small text-uppercase tracking-wider">
                                                IFSC Routing Note</div>
                                            <div
                                                class="col-7 fw-bold text-dark font-monospace bg-light rounded px-2 py-1">
                                                ${user.ifsc_code != null ? user.ifsc_code : '<span
                                                    class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                        </div>
                                    </div>

                                    <form action="/payment/add-details" method="get" class="mb-3">
                                        <input type="hidden" name="edit" value="true">
                                        <button type="submit"
                                            class="btn btn-outline-primary w-100 rounded-pill fw-bold py-3 shadow-sm bg-white hover-elevate text-primary"><i
                                                class="bi bi-pencil-square me-2"></i> Edit Payout Configuration</button>
                                    </form>
                                </c:when>

                                <c:otherwise>
                                    <form action="/payment/add-details" method="post"
                                        class="p-4 bg-white bg-opacity-50 rounded-4 border shadow-sm mb-4">
                                        <h4 class="fw-bold text-dark mb-4 border-bottom pb-3">
                                            <i
                                                class="bi bi-${hasDetails ? 'pencil-square text-primary' : 'plus-circle text-success'} me-2"></i>
                                            ${hasDetails ? 'Edit Settlement Route' : 'Configure New Route'}
                                        </h4>

                                        <div class="mb-3">
                                            <label
                                                class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">UPI
                                                Identity string</label>
                                            <div class="input-group shadow-sm"
                                                style="border-radius: 1rem; overflow:hidden;">
                                                <span class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                        class="bi bi-upc-scan"></i></span>
                                                <input type="text" name="upi_id"
                                                    class="form-control form-control-lg border-0 bg-white"
                                                    placeholder="e.g. validname@upi" value="${user.upi_id}" required>
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label
                                                class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Bank
                                                Account Node</label>
                                            <div class="input-group shadow-sm"
                                                style="border-radius: 1rem; overflow:hidden;">
                                                <span class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                        class="bi bi-hash"></i></span>
                                                <input type="text" name="account_number"
                                                    class="form-control form-control-lg border-0 bg-white font-monospace"
                                                    placeholder="Primary Account #" value="${user.account_number}"
                                                    required>
                                            </div>
                                        </div>

                                        <div class="mb-4">
                                            <label
                                                class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">IFSC
                                                Routing ID</label>
                                            <div class="input-group shadow-sm"
                                                style="border-radius: 1rem; overflow:hidden;">
                                                <span class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                        class="bi bi-building"></i></span>
                                                <input type="text" name="ifsc_code"
                                                    class="form-control form-control-lg border-0 bg-white font-monospace text-uppercase"
                                                    placeholder="e.g. SBIN0001234" value="${user.ifsc_code}" required>
                                            </div>
                                        </div>

                                        <button type="submit"
                                            class="btn btn-premium w-100 rounded-pill fw-bold py-3 shadow-sm text-white fs-5"><i
                                                class="bi bi-cloud-arrow-up-fill me-2"></i> Save Configuration</button>
                                    </form>
                                </c:otherwise>
                            </c:choose>

                            <div class="text-center mt-3">
                                <a href="/dashboard"
                                    class="text-decoration-none text-secondary fw-bold hover-success transition"><i
                                        class="bi bi-arrow-left-circle me-1"></i> Return to Dashboard</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>