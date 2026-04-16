<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Make Escrow Payment - Assured Contract Farming</title>
            <link rel="website icon" type="png" href="/images/logo.png">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
            <link rel="stylesheet" href="/global-theme.css">
            <script>
                function displayPaymentDetails() {
                    const paymentMethod = document.getElementById("payment_method").value;
                    const upiSection = document.getElementById("upi-details");
                    const bankSection = document.getElementById("bank-details");

                    // Animation classes
                    upiSection.classList.remove('d-none');
                    bankSection.classList.remove('d-none');
                    upiSection.style.display = 'none';
                    bankSection.style.display = 'none';

                    if (paymentMethod === "UPI") {
                        upiSection.style.display = "block";
                    } else if (paymentMethod === "Net Banking") {
                        bankSection.style.display = "block";
                    }
                }
            </script>
        </head>

        <body class="bg-light pb-5 d-flex flex-column min-vh-100">

            <jsp:include page="/WEB-INF/jsp/common/header_buyer.jsp" />

            <div class="container py-4 flex-grow-1">
                <div class="row justify-content-center">
                    <div class="col-lg-10 col-xl-9">
                        <div class="row g-0 glass-card border-0 overflow-hidden shadow-lg" style="border-radius: 1.5rem;">
                            
                            <!-- Left: Invoice Summary -->
                            <div class="col-md-5 bg-gradient-premium p-4 p-md-5 text-white d-flex flex-column justify-content-between position-relative overflow-hidden" style="background: linear-gradient(135deg, var(--primary-green) 0%, #047857 100%);">
                                <div class="position-absolute bg-white rounded-circle opacity-10" style="width: 300px; height: 300px; top: -100px; left: -100px; pointer-events: none; filter: blur(40px);"></div>
                                
                                <div class="position-relative z-1 mb-5">
                                    <div class="d-inline-flex bg-white bg-opacity-25 p-3 rounded-circle text-white mb-4 shadow-sm border border-white border-opacity-25">
                                        <i class="bi bi-receipt-cutoff fs-2"></i>
                                    </div>
                                    <h2 class="fw-bold mb-2 text-white">Escrow Invoice</h2>
                                    <p class="text-white text-opacity-75 small lh-lg">Secure your contract by funding the platform escrow. Assets are crypto-locked until delivery is verified.</p>
                                </div>
                                
                                <div class="position-relative z-1 border-top border-white border-opacity-25 pt-4 mt-auto">
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-white text-opacity-75 small text-uppercase tracking-wider">Platform Fee</span>
                                        <span class="fw-bold fs-6 text-white">₹0.00</span>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center mb-2">
                                        <span class="text-white text-opacity-75 small text-uppercase tracking-wider">Escrow Protection</span>
                                        <span class="badge bg-white bg-opacity-25 text-white border border-white border-opacity-50"><i class="bi bi-shield-check me-1"></i> Covered</span>
                                    </div>
                                    <div class="text-center mt-4">
                                        <i class="bi bi-shield-lock text-white opacity-50 fs-1"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Right: Payment Interface -->
                            <div class="col-md-7 p-4 p-md-5 bg-white position-relative">
                                <div class="text-center d-md-none mb-4">
                                    <h2 class="fw-bold text-dark mb-1">Fund Contract Escrow</h2>
                                    <p class="text-muted small">Digitally lock financial tokens against the target contract.</p>
                                </div>
                                <h3 class="fw-bold text-dark mb-4 d-none d-md-block">Payment <span class="text-success">Initialization</span></h3>

                                <form action="/payment/process" method="post">
                                    <div class="mb-4">
                                        <label for="contract" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-1">Target Contract</label>
                                        <select id="contract" name="contract_id" class="form-select form-select-lg shadow-sm border focus-ring-success bg-light text-dark fw-bold" required style="border-radius: 0.75rem;">
                                            <option value="" class="text-muted fw-normal">-- Select Verified Payload --</option>
                                            <c:forEach var="c" items="${contractsToPay}">
                                                <option value="${c.contractId}" ${c.contractId==selectedContractId ? 'selected' : '' } data-upi="${c.upiId}" data-ifsc="${c.ifscCode}" data-account="${c.accountNumber}">
                                                    [REF #${c.contractId}] : ${c.cropName} — ₹${c.totalPrice}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="mb-4">
                                        <label for="payment_method" class="form-label fw-bold small text-muted text-uppercase letter-spacing-wide ms-1">Transmission Mode</label>
                                        <select id="payment_method" name="payment_method" class="form-select form-select-lg shadow-sm border focus-ring-success bg-light" required onchange="displayPaymentDetails()" style="border-radius: 0.75rem;">
                                            <option value="">-- Choose settlement mechanism --</option>
                                            <option value="UPI">UPI Protocol (Instant)</option>
                                            <option value="Net Banking">Legacy Bank Wire (NEFT/RTGS)</option>
                                        </select>
                                    </div>

                                    <!-- Data Cards -->
                                    <div id="upi-details" style="display: none;" class="mb-4 slide-down">
                                        <div class="bg-success bg-opacity-10 border border-success border-opacity-25 rounded-4 p-3 ps-4 shadow-sm position-relative overflow-hidden">
                                            <div class="position-absolute top-0 end-0 p-2 opacity-25">
                                                <i class="bi bi-qr-code-scan fs-1 text-success"></i>
                                            </div>
                                            <h6 class="fw-bold text-success mb-2 text-uppercase small letter-spacing-wide"><i class="bi bi-upc-scan me-1"></i> Dest. UPI Identity</h6>
                                            <p class="mb-0 fs-5 font-monospace text-dark fw-bold position-relative z-1" id="upi-id">Null</p>
                                        </div>
                                    </div>

                                    <div id="bank-details" style="display: none;" class="mb-4 slide-down">
                                        <div class="bg-primary bg-opacity-10 border border-primary border-opacity-25 rounded-4 p-3 ps-4 shadow-sm position-relative overflow-hidden">
                                            <div class="position-absolute top-0 end-0 p-2 opacity-25">
                                                <i class="bi bi-bank2 fs-1 text-primary"></i>
                                            </div>
                                            <h6 class="fw-bold text-primary mb-3 text-uppercase small letter-spacing-wide position-relative z-1"><i class="bi bi-bank2 me-1"></i> Bank Node Resolution</h6>
                                            <div class="row position-relative z-1">
                                                <div class="col-6 border-end border-primary border-opacity-25">
                                                    <p class="mb-0 small text-primary opacity-75">Account Route</p>
                                                    <p class="mb-0 font-monospace text-dark fw-bold fs-6" id="account-number">Null</p>
                                                </div>
                                                <div class="col-6 ps-3">
                                                    <p class="mb-0 small text-primary opacity-75">IFSC Code</p>
                                                    <p class="mb-0 font-monospace text-dark fw-bold fs-6" id="ifsc-code">Null</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mb-5 border-top border-light pt-4 mt-2">
                                        <label for="transaction_id" class="form-label fw-bold small text-dark text-uppercase letter-spacing-wide ms-1">Immutable Verification Hash (TxID)</label>
                                        <div class="input-group shadow-sm border" style="border-radius: 0.75rem; overflow:hidden;">
                                            <span class="input-group-text bg-light border-0 px-4 text-muted"><i class="bi bi-hash fs-5"></i></span>
                                            <input type="text" id="transaction_id" name="transaction_id" class="form-control form-control-lg border-0 bg-white font-monospace focus-ring-success" placeholder="Paste bank transaction hash..." required>
                                        </div>
                                        <div class="form-text small mt-2 ms-1 text-muted"><i class="bi bi-info-circle me-1"></i> Required for cryptographic reconciliation.</div>
                                    </div>

                                    <button type="submit" class="btn btn-premium w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm text-white group hover-elevate transition mb-3">
                                        <i class="bi bi-shield-lock-fill me-2 transition group-hover-translate-x"></i> Lock Funds In Escrow
                                    </button>
                                    
                                    <div class="text-center">
                                        <a href="/contracts" class="text-decoration-none text-muted small fw-bold hover-dark transition"><i class="bi bi-arrow-left me-1"></i> Audit Dashboard</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                function updateDetails() {
                    const select = document.getElementById("contract");
                    if (select.selectedIndex > 0) {
                        const selectedOption = select.options[select.selectedIndex];
                        document.getElementById("upi-id").textContent = selectedOption.dataset.upi || "Null";
                        document.getElementById("ifsc-code").textContent = selectedOption.dataset.ifsc || "Null";
                        document.getElementById("account-number").textContent = selectedOption.dataset.account || "Null";
                    }
                }

                document.getElementById("contract").addEventListener("change", function () {
                    const selectedOption = this.options[this.selectedIndex];
                    document.getElementById("upi-id").textContent = selectedOption.dataset.upi || "Null";
                    document.getElementById("ifsc-code").textContent = selectedOption.dataset.ifsc || "Null";
                    document.getElementById("account-number").textContent = selectedOption.dataset.account || "Null";
                });

                // Initialize on load
                updateDetails();
            </script>
            <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>