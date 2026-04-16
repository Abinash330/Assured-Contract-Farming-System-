<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Update Crop - Assured Contract Farming</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="pb-5">

        <jsp:include page="/WEB-INF/jsp/common/header_farmer.jsp" />

        <div class="container py-2">
            <div class="row justify-content-center">
                <div class="col-md-9 col-lg-7">
                    <div class="glass-card border-0 hover-elevate">

                        <div class="bg-success bg-opacity-10 border-bottom border-success border-opacity-10 pt-5 pb-4 text-center rounded-top-4" style="background: linear-gradient(135deg, rgba(22, 163, 74, 0.05) 0%, rgba(22, 163, 74, 0.15) 100%);">
                            <div class="d-inline-flex bg-success bg-opacity-25 p-3 rounded-circle mb-3 shadow-sm transform hover-elevate transition">
                                <i class="bi bi-pencil-square text-success" style="font-size: 2.5rem;"></i>
                            </div>
                            <h2 class="fw-bold text-dark mb-1" style="letter-spacing: -0.5px;">Update Harvest Listing</h2>
                            <p class="text-success text-opacity-75 fw-semibold small w-75 mx-auto">Keep your agricultural portfolio accurate and competitive.</p>
                        </div>

                        <div class="p-4 p-md-5 bg-white bg-opacity-25 rounded-bottom-4">
                            <div
                                class="d-flex align-items-center mb-4 p-3 bg-white bg-opacity-75 rounded-4 border shadow-sm">
                                <i class="bi bi-tag-fill text-success fs-2 me-3"></i>
                                <div>
                                    <h4 class="fw-bold text-dark mb-0">${crop.cropName}</h4>
                                    <span
                                        class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 px-2 py-1 mt-1 rounded-pill"><i
                                            class="bi bi-broadcast me-1"></i> Live Listing</span>
                                </div>
                            </div>

                            <form action="/crop/update" method="post">
                                <input type="hidden" name="crop_id" value="${crop.id}">

                                <div class="row g-4 mb-4">
                                    <div class="col-sm-6">
                                        <label
                                            class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Update
                                            Quantity</label>
                                        <div class="input-group shadow-sm"
                                            style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-success"><i
                                                    class="bi bi-boxes"></i></span>
                                            <input type="number" class="form-control form-control-lg border-0 bg-white"
                                                name="quantity" value="${crop.quantity}" required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Volume in Metric Tons</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label
                                            class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Update
                                            Price</label>
                                        <div class="input-group shadow-sm"
                                            style="border-radius: 1rem; overflow:hidden;">
                                            <span
                                                class="input-group-text bg-light border-0 px-4 text-success fw-bold">₹</span>
                                            <input type="number" step="0.01"
                                                class="form-control form-control-lg border-0 bg-white"
                                                name="price_per_unit" value="${crop.pricePerUnit}" required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Fixed price per Metric Ton
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label
                                        class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Origin
                                        Location</label>
                                    <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                        <span class="input-group-text bg-light border-0 px-4 text-danger"><i
                                                class="bi bi-geo-alt-fill"></i></span>
                                        <input type="text" class="form-control form-control-lg border-0 bg-white"
                                            name="location" value="${crop.location}" required>
                                    </div>
                                </div>

                                <div class="mb-5 pb-3 border-bottom border-success border-opacity-10">
                                    <label
                                        class="form-label fw-bold small text-success ms-1 text-uppercase tracking-wider">Expected
                                        Harvest Date</label>
                                    <div class="input-group shadow-sm border border-success border-opacity-25"
                                        style="border-radius: 1rem; overflow:hidden;">
                                        <span
                                            class="input-group-text bg-success bg-opacity-10 border-0 px-4 text-success"><i
                                                class="bi bi-calendar-event"></i></span>
                                        <input type="date" class="form-control form-control-lg border-0 bg-white"
                                            name="harvest_date" value="${crop.harvestDate}" required>
                                    </div>
                                </div>

                                <div class="d-flex flex-column flex-sm-row gap-3">
                                    <button type="submit"
                                        class="btn btn-success w-100 rounded-pill fw-bold py-3 shadow-lg text-white flex-grow-1 hover-elevate transition"><i
                                            class="bi bi-save2 me-2"></i> Save Harvest Adjustments</button>
                                    <a href="/dashboard"
                                        class="btn btn-outline-secondary w-100 rounded-pill fw-bold py-3 bg-white flex-grow-1 d-inline-flex justify-content-center align-items-center"><i
                                            class="bi bi-x-circle me-2"></i> Cancel</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/WEB-INF/jsp/common/footer_farmer.jsp" />
    </body>

    </html>