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
        <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
            <div class="container">
                <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                    <div class="bg-success py-1 px-2 rounded-3 me-2 d-flex shadow-sm">
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

        <div class="container py-2">
            <div class="row justify-content-center">
                <div class="col-md-9 col-lg-7">
                    <div class="glass-card border-0 hover-elevate">

                        <div class="bg-white bg-opacity-50 border-bottom pt-5 pb-4 text-center rounded-top-4">
                            <div class="d-inline-flex bg-success bg-opacity-10 p-3 rounded-circle mb-3 shadow-sm">
                                <i class="bi bi-clipboard-data text-success" style="font-size: 2.5rem;"></i>
                            </div>
                            <h2 class="fw-bold text-dark mb-1">Create Listing</h2>
                            <p class="text-muted small w-75 mx-auto">Publish your upcoming harvest to the marketplace to
                                attract formal contracts from verified corporate buyers.</p>
                        </div>

                        <div class="p-4 p-md-5 bg-white bg-opacity-25 rounded-bottom-4">
                            <form action="/crop/add" method="post">
                                <div class="mb-4">
                                    <label
                                        class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Crop
                                        Commodity</label>
                                    <select class="form-select form-select-lg px-4 border shadow-sm" name="crop_name"
                                        required style="border-radius: 1rem;">
                                        <option value="" disabled selected>Select Commodity Type...</option>
                                        <option value="Chickpea(Shanagalu)">Chickpea (Shanagalu)</option>
                                        <option value="Cotton">Cotton</option>
                                        <option value="Maize(Mokkajonna)">Maize (Mokkajonna)</option>
                                        <option value="Mustard(Avalu)">Mustard (Avalu)</option>
                                        <option value="Onion">Onion</option>
                                        <option value="Paddy">Paddy</option>
                                        <option value="Pigeon Pea(Kandulu)">Pigeon Pea (Kandulu)</option>
                                        <option value="Potato">Potato</option>
                                        <option value="Red Chilly">Red Chilly</option>
                                        <option value="Sugarcane">Sugarcane</option>
                                        <option value="Wheat(Godhumalu)">Wheat (Godhumalu)</option>
                                    </select>
                                </div>

                                <div class="row g-4 mb-4">
                                    <div class="col-sm-6">
                                        <label
                                            class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Total
                                            Quantity</label>
                                        <div class="input-group shadow-sm"
                                            style="border-radius: 1rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-primary"><i
                                                    class="bi bi-boxes"></i></span>
                                            <input type="number" class="form-control form-control-lg border-0 bg-white"
                                                name="quantity" min="1" placeholder="Metric Tons" required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Volume in Metric Tons</div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label
                                            class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Target
                                            Price</label>
                                        <div class="input-group shadow-sm"
                                            style="border-radius: 1rem; overflow:hidden;">
                                            <span
                                                class="input-group-text bg-light border-0 px-4 text-success fw-bold">₹</span>
                                            <input type="number" step="0.01" min="1"
                                                class="form-control form-control-lg border-0 bg-white"
                                                name="price_per_unit" placeholder="Price per Ton" required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted">Fixed price per Metric Ton
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label
                                        class="form-label fw-bold small text-muted ms-1 text-uppercase tracking-wider">Origin
                                        Farm Location</label>
                                    <div class="input-group shadow-sm" style="border-radius: 1rem; overflow:hidden;">
                                        <span class="input-group-text bg-light border-0 px-4 text-danger"><i
                                                class="bi bi-geo-alt-fill"></i></span>
                                        <input type="text" class="form-control form-control-lg border-0 bg-white"
                                            name="location" placeholder="Sub-district, District, State" required>
                                    </div>
                                </div>

                                <div class="mb-5 pb-3 border-bottom">
                                    <label
                                        class="form-label fw-bold small text-primary ms-1 text-uppercase tracking-wider">Expected
                                        Harvest Date</label>
                                    <div class="input-group shadow-sm border border-primary border-opacity-25"
                                        style="border-radius: 1rem; overflow:hidden;">
                                        <span
                                            class="input-group-text bg-primary bg-opacity-10 border-0 px-4 text-primary"><i
                                                class="bi bi-calendar-check-fill"></i></span>
                                        <input type="date" class="form-control form-control-lg border-0 bg-white"
                                            name="harvest_date" required>
                                    </div>
                                    <div class="form-text mt-2 ms-1 fw-medium text-warning"><i
                                            class="bi bi-info-circle me-1 text-warning"></i> Dictates contract delivery
                                        SLA deadlines.</div>
                                </div>

                                <button class="btn btn-premium w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm mb-4"
                                    type="submit">Publish to Marketplace</button>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>