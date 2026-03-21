<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Profile Hub - Assured Contract Farming</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <link rel="stylesheet" href="/global-theme.css">
            </head>

            <body class="bg-light pb-5 d-flex flex-column min-vh-100">

                <!-- Navigation -->
                <jsp:include page="common/header_user.jsp" />

                <div class="container pb-5 flex-grow-1">
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="glass-card border-0 rounded-4 overflow-hidden p-0">
                                <div class="row g-0">
                                    <!-- Left Panel: Avatar & Title -->
                                    <div
                                        class="col-md-4 bg-dark text-white p-5 d-flex flex-column align-items-center justify-content-center text-center position-relative overflow-hidden">
                                        <!-- Background blob -->
                                        <div class="position-absolute rounded-circle bg-success shadow-sm blur opacity-25"
                                            style="width: 300px; height: 300px; top: -100px; left: -100px; filter: blur(50px);">
                                        </div>
                                        <div class="position-absolute rounded-circle bg-primary shadow-sm blur opacity-25"
                                            style="width: 200px; height: 200px; bottom: -50px; right: -50px; filter: blur(40px);">
                                        </div>

                                        <c:set var="imagePath" value="/images/default.jpg" />
                                        <c:if test="${fn:toLowerCase(user.role) == 'farmer'}">
                                            <c:set var="imagePath"
                                                value="https://cdn-icons-png.flaticon.com/512/11559/11559869.png" />
                                        </c:if>
                                        <c:if test="${fn:toLowerCase(user.role) == 'buyer'}">
                                            <c:set var="imagePath"
                                                value="https://cdn-icons-png.flaticon.com/512/4140/4140061.png" />
                                        </c:if>
                                        <c:if test="${fn:toLowerCase(user.role) == 'inspector'}">
                                            <c:set var="imagePath"
                                                value="https://cdn-icons-png.flaticon.com/512/6009/6009315.png" />
                                        </c:if>

                                        <img src="${imagePath}" alt="Profile Avatar"
                                            class="img-fluid rounded-circle border border-4 border-light mb-4 bg-white p-2 shadow-sm position-relative z-1"
                                            style="width: 180px; height: 180px; object-fit: cover;">

                                        <h3 class="fw-bold mb-1 position-relative z-1">${user.username}</h3>
                                        <span
                                            class="badge bg-success bg-gradient fs-6 px-4 py-2 rounded-pill shadow-sm mb-3 position-relative z-1">
                                            ${fn:toUpperCase(fn:substring(user.role, 0, 1))}${fn:substring(user.role, 1,
                                            -1)}
                                        </span>

                                        <c:choose>
                                            <c:when test="${user.verified}">
                                                <div
                                                    class="text-success fw-bold bg-white bg-opacity-10 px-4 py-2 rounded-pill mt-2 position-relative z-1 border border-success border-opacity-25 shadow-sm">
                                                    <i class="bi bi-patch-check-fill me-1"></i> Formally Verified
                                                    Identity
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    class="text-warning fw-bold bg-white bg-opacity-10 px-4 py-2 rounded-pill mt-2 position-relative z-1 border border-warning border-opacity-25 shadow-sm">
                                                    <i class="bi bi-hourglass-split me-1"></i> Identity Review Pending
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                    <!-- Right Panel: Info & Forms -->
                                    <div class="col-md-8 p-5 bg-white bg-opacity-75">
                                        <h2 class="fw-bold text-dark mb-4 border-bottom pb-3">
                                            <i class="bi bi-person-lines-fill me-2 text-primary"></i> Identity Core
                                            Parameters
                                        </h2>

                                        <c:if test="${not empty message}">
                                            <div class="alert alert-success alert-dismissible fade show shadow-sm border-0 bg-success bg-opacity-10 text-success fw-bold px-4 rounded-4"
                                                role="alert">
                                                <i class="bi bi-check-circle-fill me-2"></i> ${message}
                                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                    aria-label="Close"></button>
                                            </div>
                                        </c:if>

                                        <c:choose>
                                            <c:when test="${not isEditing}">
                                                <!-- View Mode -->
                                                <div class="row align-items-center mb-4 px-2">
                                                    <div
                                                        class="col-sm-4 text-muted fw-bold small text-uppercase tracking-wider">
                                                        Operational Identity</div>
                                                    <div class="col-sm-8 fw-semibold text-dark fs-5">${user.username}
                                                    </div>
                                                </div>
                                                <div class="row align-items-center mb-4 px-2">
                                                    <div
                                                        class="col-sm-4 text-muted fw-bold small text-uppercase tracking-wider">
                                                        Comm Endpoint</div>
                                                    <div class="col-sm-8 fw-semibold text-dark font-monospace">
                                                        ${user.email}</div>
                                                </div>
                                                <div class="row align-items-center mb-4 px-2">
                                                    <div
                                                        class="col-sm-4 text-muted fw-bold small text-uppercase tracking-wider">
                                                        Geographic Node</div>
                                                    <div class="col-sm-8 fw-semibold text-dark">${user.address != null ?
                                                        user.address : '<span
                                                            class="text-secondary fst-italic fw-normal text-muted">Awaiting
                                                            sync...</span>'}</div>
                                                </div>
                                                <div class="row align-items-center mb-4 px-2 border-bottom pb-4">
                                                    <div
                                                        class="col-sm-4 text-muted fw-bold small text-uppercase tracking-wider">
                                                        Trust Reputation Metric</div>
                                                    <div class="col-sm-8 fw-semibold text-success fs-5 bg-success bg-opacity-10 d-inline-flex align-items-center px-3 py-1 rounded-pill"
                                                        style="width: max-content;">
                                                        <i class="bi bi-star-fill text-warning me-2"></i>
                                                        ${user.creditScore != null ? user.creditScore : 'Processing
                                                        Null'}
                                                    </div>
                                                </div>

                                                <!-- Wallet Section -->
                                                <div class="mt-4 p-4 bg-light rounded-4 border shadow-sm">
                                                    <h4 class="fw-bold text-dark mb-4"><i
                                                            class="bi bi-wallet2 text-primary me-2"></i> Digital Wealth
                                                        Node</h4>
                                                    <div class="row text-center mb-4 g-3">
                                                        <div class="col-sm-6">
                                                            <div class="bg-white border rounded-4 p-3 shadow-sm h-100">
                                                                <p
                                                                    class="text-muted mb-2 fw-bold text-uppercase small tracking-wider">
                                                                    Liquid Capital</p>
                                                                <h3 class="text-success fw-bold mb-0 font-monospace">
                                                                    ₹${wallet != null ? wallet.balance : '0.00'}</h3>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="bg-white border rounded-4 p-3 shadow-sm h-100">
                                                                <p
                                                                    class="text-muted mb-2 fw-bold text-uppercase small tracking-wider">
                                                                    Escrow Anchored</p>
                                                                <h3 class="text-warning fw-bold mb-0 font-monospace">
                                                                    ₹${wallet != null ? wallet.lockedAmount : '0.00'}
                                                                </h3>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <form action="/profile/add-funds" method="post" class="mt-2">
                                                        <div class="input-group shadow-sm border-0 bg-white"
                                                            style="border-radius: 1rem; overflow:hidden;">
                                                            <span
                                                                class="input-group-text bg-transparent border-0 text-success fw-bold ps-4">₹</span>
                                                            <input type="number" step="0.01" min="1" name="amount"
                                                                class="form-control form-control-lg border-0 bg-transparent shadow-none"
                                                                placeholder="Target deposit amount..." required>
                                                            <button class="btn btn-premium fw-bold px-4 fs-6"
                                                                type="submit"><i
                                                                    class="bi bi-cloud-arrow-down-fill me-1"></i> Credit
                                                                Node</button>
                                                        </div>
                                                    </form>
                                                </div>

                                                <div class="d-flex flex-column flex-sm-row gap-3 mt-5">
                                                    <form action="/profile" method="get" class="w-100">
                                                        <input type="hidden" name="action" value="edit">
                                                        <button type="submit"
                                                            class="btn btn-outline-primary w-100 rounded-pill fw-bold py-3 shadow-sm bg-white border-2"><i
                                                                class="bi bi-pencil-square me-2"></i> Recalibrate
                                                            Parameters</button>
                                                    </form>
                                                    <a href="/dashboard"
                                                        class="btn btn-secondary w-100 rounded-pill fw-bold py-3 shadow-sm bg-slate-600 border-0 d-inline-flex justify-content-center align-items-center"><i
                                                            class="bi bi-arrow-left me-2"></i> Return to Hub</a>
                                                </div>
                                            </c:when>

                                            <c:otherwise>
                                                <!-- Edit Mode -->
                                                <form action="/profile" method="post" class="mt-4">
                                                    <div class="mb-4">
                                                        <label
                                                            class="form-label text-muted fw-bold small text-uppercase tracking-wider ms-1">Update
                                                            Operational Identity</label>
                                                        <div class="input-group shadow-sm"
                                                            style="border-radius: 1rem; overflow:hidden;">
                                                            <span
                                                                class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                                    class="bi bi-person-fill"></i></span>
                                                            <input type="text"
                                                                class="form-control form-control-lg border-0 bg-white"
                                                                name="username" value="${user.username}" required>
                                                        </div>
                                                    </div>
                                                    <div class="mb-4">
                                                        <label
                                                            class="form-label text-muted fw-bold small text-uppercase tracking-wider ms-1">Comm
                                                            Endpoint <span
                                                                class="text-secondary opacity-50 fst-italic text-lowercase fw-normal">(Immutable)</span></label>
                                                        <div class="input-group shadow-sm opacity-75"
                                                            style="border-radius: 1rem; overflow:hidden;">
                                                            <span
                                                                class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                                    class="bi bi-envelope-fill"></i></span>
                                                            <input type="email"
                                                                class="form-control form-control-lg border-0 bg-white shadow-none text-muted font-monospace"
                                                                value="${user.email}" readonly disabled>
                                                        </div>
                                                    </div>
                                                    <div class="mb-5 pb-3 border-bottom border-light">
                                                        <label
                                                            class="form-label text-muted fw-bold small text-uppercase tracking-wider ms-1">Update
                                                            Geographic Node</label>
                                                        <div class="input-group shadow-sm"
                                                            style="border-radius: 1rem; overflow:hidden;">
                                                            <span
                                                                class="input-group-text bg-light border-0 px-3 text-secondary"><i
                                                                    class="bi bi-geo-alt-fill"></i></span>
                                                            <input type="text"
                                                                class="form-control form-control-lg border-0 bg-white"
                                                                name="address" value="${user.address}" required>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex flex-column flex-sm-row gap-3">
                                                        <button type="submit"
                                                            class="btn btn-premium w-100 rounded-pill fw-bold py-3 shadow-sm text-white"><i
                                                                class="bi bi-cloud-arrow-up-fill me-2"></i> Commit
                                                            Topology</button>
                                                        <a href="/profile"
                                                            class="btn btn-outline-secondary w-100 rounded-pill fw-bold py-3 bg-white d-inline-flex justify-content-center align-items-center"><i
                                                                class="bi bi-x-circle me-2"></i> Revert</a>
                                                    </div>
                                                </form>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <jsp:include page="common/footer.jsp" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>