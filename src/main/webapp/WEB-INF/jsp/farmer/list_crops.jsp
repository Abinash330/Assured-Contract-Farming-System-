<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>List Crop - Assured Contract Farming</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="pb-5">

        <!-- Navigation -->
        <jsp:include page="/WEB-INF/jsp/common/header_farmer.jsp" />

        <div class="container py-2">
            <div class="row justify-content-center">
                <div class="col-md-9 col-lg-7">
                    <div class="glass-card border-0 hover-elevate">

                        <div class="bg-success text-white pt-5 pb-4 text-center rounded-top-4 position-relative overflow-hidden" style="background: linear-gradient(135deg, var(--primary-green) 0%, #064e3b 100%);">
                            <!-- Background blobs -->
                            <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 200px; height: 200px; top: -50px; left: -50px; filter: blur(30px);"></div>
                            <div class="position-absolute bg-warning rounded-circle opacity-25" style="width: 200px; height: 200px; bottom: -50px; right: -50px; filter: blur(40px);"></div>
                            
                            <div class="d-inline-flex bg-white bg-opacity-10 p-3 rounded-circle mb-3 shadow-sm border border-white border-opacity-25 position-relative z-1">
                                <i class="bi bi-clipboard-data-fill text-white" style="font-size: 2.5rem;"></i>
                            </div>
                            <h2 class="fw-bold mb-1 position-relative z-1">Create Exchange Listing</h2>
                            <p class="text-white opacity-75 small w-75 mx-auto position-relative z-1">Publish your upcoming harvest to the master exchange to attract formal contracts from verified corporate entities.</p>
                        </div>

                        <div class="p-4 p-md-5 bg-white rounded-bottom-4 shadow-sm">
                            <form action="/crop/add" method="post" enctype="multipart/form-data">
                                <div class="row g-4 mb-4">
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Product Category</label>
                                        <select class="form-select form-select-lg border-0 bg-light focus-ring-success py-3 px-3 fw-bold text-dark" name="productCategory" required>
                                            <option value="Primary Crop" selected>Primary Crop / Harvest</option>
                                            <option value="Wastage/Byproduct">Agricultural Wastage (Biomass, Stubs)</option>
                                            <option value="Fertilizer">Organic Fertilizer (Gobar, Compost)</option>
                                            <option value="Dairy Component">Dairy / Poultry Component</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Commodity / Waste Specification</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-3 text-success"><i class="bi bi-diagram-3-fill"></i></span>
                                            <select class="form-select form-select-lg border-0 bg-light focus-ring-success py-3 px-2 fw-bold text-dark" name="crop_name" required>
                                                <optgroup label="Primary Organic Crops">
                                                    <option value="Chickpea">Chickpea / Pulses</option>
                                                    <option value="Cotton">Cotton - Long Staple</option>
                                                    <option value="Maize">Maize (Mokkajonna)</option>
                                                    <option value="Paddy">Paddy / Wheat</option>
                                                    <option value="Spices">Turmeric / Garlic / Ginger</option>
                                                </optgroup>
                                                <optgroup label="Wastage & Circular Economy">
                                                    <option value="Cow Dung (Gobar)">Cow Dung (Gobar) - Raw</option>
                                                    <option value="Organic Compost (Khat)">Organic Compost (Khat)</option>
                                                    <option value="Banana Stalk Waste">Banana Stalk Waste</option>
                                                    <option value="Crop Stubble / Biomass">Crop Stubble / Biomass</option>
                                                </optgroup>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-4 mb-5">
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Aggregated Volume</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-primary"><i class="bi bi-boxes"></i></span>
                                            <input type="number" class="form-control form-control-lg border-0 bg-light focus-ring-primary py-3 fw-bold text-dark font-monospace" name="quantity" min="1" placeholder="00.00" required>
                                            <span class="input-group-text bg-light border-0 px-4 text-muted fw-bold">MT</span>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Total Volume measured in Metric Tons</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Target Settlement Price</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-success fw-bold">₹</span>
                                            <input type="number" step="0.01" min="1" class="form-control form-control-lg border-0 bg-light focus-ring-success py-3 fw-bold text-dark font-monospace" name="price_per_unit" placeholder="0.00" required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Fixed contractual price per Metric Ton</div>
                                    </div>
                                </div>

                                <div class="row g-4 mb-4 border-top pt-3 border-light">
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Origin Location</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-danger"><i class="bi bi-geo-alt-fill"></i></span>
                                            <input type="text" class="form-control form-control-lg border-0 bg-light focus-ring-danger py-3 fw-bold text-dark" name="location" placeholder="e.g. District, State" required>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Facilities Offered</label>
                                        <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-info"><i class="bi bi-truck"></i></span>
                                            <input type="text" class="form-control form-control-lg border-0 bg-light focus-ring-info py-3 fw-bold text-dark" name="facilities" placeholder="e.g. Self-delivery, Cold Storage">
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Product Visual Imagery</label>
                                    <input type="file" class="form-control form-control-lg border-0 bg-light shadow-sm" name="image" accept="image/*" style="border-radius: 1rem;">
                                    <div class="form-text small mt-2 ms-1 text-muted">Upload high-quality images of the harvest or wastage pile. Helps negotiate better contract rates.</div>
                                </div>

                                <div class="mb-5">
                                    <label class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Quality Description</label>
                                    <textarea class="form-control border-0 bg-light shadow-sm py-3 px-4 fw-bold" name="productDescription" rows="3" style="border-radius: 1rem;" placeholder="e.g. Organic, Non-GMO, Moisture Content 12%..."></textarea>
                                </div>

                                <div class="mb-5 bg-primary bg-opacity-10 p-4 rounded-4 border border-primary border-opacity-25">
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="bg-primary text-white p-2 rounded-circle me-3"><i class="bi bi-calendar-check-fill fs-5"></i></div>
                                        <label class="form-label mb-0 fw-bold fs-6 text-primary text-uppercase tracking-wider">Projected Delivery Schedule</label>
                                    </div>
                                    <div class="input-group shadow-sm bg-white" style="border-radius: 1rem; overflow:hidden;">
                                        <input type="date" class="form-control form-control-lg border-0 py-3 fw-bold text-primary focus-ring-primary px-4 bg-transparent" name="harvest_date" required>
                                    </div>
                                    <div class="form-text mt-3 ms-1 fw-bold text-dark opacity-75"><i class="bi bi-info-circle-fill text-primary me-2"></i>This timeline dictates the rigid SLAs applied to any resulting contractual agreement. Accuracy is mandatory.</div>
                                </div>

                                <button class="btn btn-premium w-100 py-3 rounded-pill fw-bold fs-5 shadow-lg group hover-elevate transition mb-4" type="submit">
                                    Transmit to Marketplace <i class="bi bi-cloud-arrow-up-fill ms-2 transition pt-1 group-hover-translate-y fs-5 vertical-align-middle"></i>
                                </button>
                                <div class="text-center">
                                    <a href="/dashboard"
                                        class="text-decoration-none text-muted fw-bold d-inline-flex align-items-center hover-success transition"><i
                                            class="bi bi-arrow-left-circle me-2 fs-5"></i> Cancel & Return Home</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="/WEB-INF/jsp/common/footer_farmer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>