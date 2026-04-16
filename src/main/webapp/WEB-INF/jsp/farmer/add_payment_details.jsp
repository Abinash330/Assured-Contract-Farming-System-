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

            <jsp:include page="common/header_user.jsp" />

            <div class="container py-2 flex-grow-1">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-lg-7 col-xl-6">

                        <div class="glass-card rounded-4 border-0 hover-elevate overflow-hidden shadow-lg mb-5">
                            
                            <!-- Premium Header Area -->
                            <div class="bg-primary text-white pt-5 pb-4 px-4 text-center position-relative overflow-hidden" style="background: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);">
                                <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 200px; height: 200px; top: -50px; left: -50px; filter: blur(30px);"></div>
                                <div class="position-absolute bg-info rounded-circle opacity-25" style="width: 250px; height: 250px; bottom: -80px; right: -80px; filter: blur(40px);"></div>
                                
                                <div class="d-inline-flex bg-white bg-opacity-10 p-3 rounded-circle border border-white border-opacity-25 mb-3 shadow-sm position-relative z-1">
                                    <i class="bi bi-bank2 text-white" style="font-size: 2.5rem;"></i>
                                </div>
                                <h2 class="fw-bold mb-1 position-relative z-1 let-spacing-tight">Financial Routing</h2>
                                <p class="text-white opacity-75 small w-75 mx-auto position-relative z-1 lh-base">Configure your settlement parameters to ensure rapid, automated dispersion of escrowed contract funds.</p>
                            </div>

                            <div class="p-4 p-lg-5 bg-white bg-opacity-75">
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success alert-dismissible fade show shadow-sm border-0 bg-success bg-opacity-10 text-success fw-bold px-4 py-3 rounded-4 mb-4" role="alert">
                                        <i class="bi bi-check-circle-fill me-2 fs-5 pt-1 vertical-align-middle d-inline-block"></i> ${message}
                                        <button type="button" class="btn-close pb-1 pt-3" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <c:choose>
                                    <c:when test="${hasDetails && not isEditing}">
                                        <div class="p-4 bg-white rounded-4 border shadow-sm mb-4">
                                            <h4 class="fw-bold text-dark mb-4 border-bottom pb-3 d-flex align-items-center"><i class="bi bi-shield-check text-success fs-3 me-2"></i> Active Settlement Node</h4>

                                            <div class="row align-items-center mb-3 p-2 bg-light rounded-3">
                                                <div class="col-sm-5 fw-bold text-muted small text-uppercase tracking-wider">UPI Identity</div>
                                                <div class="col-sm-7 fw-bold text-primary font-monospace fs-6 text-end text-sm-start">${user.upi_id != null ? user.upi_id : '<span class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                            </div>
                                            <div class="row align-items-center mb-3 p-2 border-bottom border-light">
                                                <div class="col-sm-5 fw-bold text-muted small text-uppercase tracking-wider">Account Node</div>
                                                <div class="col-sm-7 fw-bold text-dark font-monospace fs-6 text-end text-sm-start">${user.account_number != null ? user.account_number : '<span class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                            </div>
                                            <div class="row align-items-center p-2 mb-2">
                                                <div class="col-sm-5 fw-bold text-muted small text-uppercase tracking-wider">IFSC Routing</div>
                                                <div class="col-sm-7 fw-bold text-dark font-monospace fs-6 text-end text-sm-start">${user.ifsc_code != null ? user.ifsc_code : '<span class="text-secondary fst-italic fw-normal">Null</span>'}</div>
                                            </div>
                                        </div>

                                        <form action="/payment/add-details" method="get" class="mb-3 mt-4">
                                            <input type="hidden" name="edit" value="true">
                                            <button type="submit" class="btn btn-outline-primary w-100 rounded-pill fw-bold py-3 shadow-sm bg-white hover-elevate transition"><i class="bi bi-sliders me-2"></i> Reconfigure Node Parameters</button>
                                        </form>
                                    </c:when>

                                    <c:otherwise>
                                        <form action="/payment/add-details" method="post" class="p-4 bg-white rounded-4 border shadow-sm mb-4">
                                            <h4 class="fw-bold text-dark mb-4 border-bottom pb-3 d-flex align-items-center">
                                                <i class="bi bi-${hasDetails ? 'pencil-square text-primary' : 'plug-fill text-success'} fs-3 me-2"></i> 
                                                ${hasDetails ? 'Edit Settlement Route' : 'Initialize Routing Link'}
                                            </h4>

                                            <div class="mb-4">
                                                <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Virtual Payment Address (UPI)</label>
                                                <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                                    <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-upc-scan"></i></span>
                                                    <input type="text" name="upi_id" class="form-control form-control-lg border-0 bg-light focus-ring-success py-3 text-dark fw-bold" placeholder="e.g. business@upi" value="${user.upi_id}" required>
                                                </div>
                                            </div>

                                            <div class="mb-4">
                                                <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Bank Account Identifier</label>
                                                <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                                    <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-hash"></i></span>
                                                    <input type="text" name="account_number" class="form-control form-control-lg border-0 bg-light focus-ring-success py-3 font-monospace text-dark fw-bold" placeholder="Primary Account #" value="${user.account_number}" required>
                                                </div>
                                            </div>

                                            <div class="mb-5">
                                                <label class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Institution IFSC Code</label>
                                                <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                                    <span class="input-group-text bg-light border-0 px-3 text-secondary"><i class="bi bi-building-check"></i></span>
                                                    <input type="text" name="ifsc_code" class="form-control form-control-lg border-0 bg-light focus-ring-success py-3 font-monospace text-uppercase text-dark fw-bold" placeholder="e.g. SBIN0001234" value="${user.ifsc_code}" required>
                                                </div>
                                            </div>

                                            <button type="submit" class="btn btn-premium w-100 rounded-pill fw-bold py-3 shadow-lg text-white fs-5 group hover-elevate transition"><i class="bi bi-cloud-arrow-up-fill me-2 transition group-hover-translate-y d-inline-block"></i> Commit Secure Configuration</button>
                                        </form>
                                    </c:otherwise>
                                </c:choose>

                                <div class="text-center mt-4 border-top pt-4">
                                    <a href="/dashboard" class="text-decoration-none text-muted fw-bold hover-dark transition"><i class="bi bi-arrow-left me-2"></i> Cancel & Return Home</a>
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