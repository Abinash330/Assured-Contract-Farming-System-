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

            <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top mb-5">
                <div class="container">
                    <a class="navbar-brand fw-bold d-flex align-items-center" href="/dashboard">
                        <div class="bg-primary p-2 rounded-circle me-2 d-flex shadow-sm">
                            <i class="bi bi-shield-lock-fill fs-5 text-white m-0 lh-1"></i>
                        </div>
                        <span class="text-dark">CFS Escrow Gateway</span>
                    </a>
                    <div class="collapse navbar-collapse">
                        <ul class="navbar-nav ms-auto fw-semibold">
                            <li class="nav-item">
                                <a class="nav-link px-3" href="/contracts"><i
                                        class="bi bi-file-earmark-text border-end border-secondary border-opacity-25 pe-2 me-2"></i>
                                    All Contracts</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <div class="container py-2 flex-grow-1">
                <div class="row justify-content-center">
                    <div class="col-md-9 col-lg-7">

                        <div
                            class="glass-card mb-4 p-4 p-lg-5 border-0 hover-elevate border-top border-4 border-primary">
                            <div class="text-center mb-4">
                                <div
                                    class="bg-primary bg-opacity-10 d-inline-flex p-3 rounded-circle text-primary border border-primary border-opacity-25 mb-3 shadow-sm">
                                    <i class="bi bi-lock-fill fs-1"></i>
                                </div>
                                <h2 class="fw-bold text-dark mb-1">Fund Contract Escrow</h2>
                                <p class="text-muted small w-75 mx-auto">Digitally lock financial tokens against the
                                    target contract. Assets will only be cleared upon physical delivery milestone
                                    verification.</p>
                            </div>

                            <form action="/payment/process" method="post"
                                class="p-4 bg-white bg-opacity-50 rounded-4 border shadow-sm">

                                <div class="mb-4">
                                    <label for="contract"
                                        class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Target
                                        Contract Identification</label>
                                    <select id="contract" name="contract_id"
                                        class="form-select form-select-lg shadow-sm border" required
                                        style="border-radius: 1rem;">
                                        <option value="">-- Choose verified contract payload --</option>
                                        <c:forEach var="c" items="${contractsToPay}">
                                            <option value="${c.contractId}" ${c.contractId==selectedContractId
                                                ? 'selected' : '' } data-upi="${c.upiId}" data-ifsc="${c.ifscCode}"
                                                data-account="${c.accountNumber}">
                                                [REF #${c.contractId}] : ${c.cropName} - Escrow Requirement
                                                ₹${c.totalPrice}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <div class="mb-4">
                                    <label for="payment_method"
                                        class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Transmission
                                        Pipeline</label>
                                    <select id="payment_method" name="payment_method"
                                        class="form-select form-select-lg shadow-sm border" required
                                        onchange="displayPaymentDetails()" style="border-radius: 1rem;">
                                        <option value="">-- Choose settlement mechanism --</option>
                                        <option value="UPI">UPI Protocol</option>
                                        <option value="Net Banking">Legacy Bank Wire</option>
                                    </select>
                                </div>

                                <!-- Data Cards -->
                                <div id="upi-details" style="display: none;" class="mb-4">
                                    <div
                                        class="bg-light border rounded-4 p-3 ps-4 shadow-sm border-start border-4 border-success">
                                        <h6 class="fw-bold text-success mb-2 text-uppercase small tracking-wider"><i
                                                class="bi bi-upc-scan me-1"></i> Dest. UPI Identity</h6>
                                        <p class="mb-0 fs-5 font-monospace text-dark fw-bold" id="upi-id">Null</p>
                                    </div>
                                </div>

                                <div id="bank-details" style="display: none;" class="mb-4">
                                    <div
                                        class="bg-light border rounded-4 p-3 ps-4 shadow-sm border-start border-4 border-primary">
                                        <h6 class="fw-bold text-primary mb-2 text-uppercase small tracking-wider"><i
                                                class="bi bi-bank2 me-1"></i> Bank Node Resolution</h6>
                                        <div class="row">
                                            <div class="col-6">
                                                <p class="mb-0 small text-muted">Account Route</p>
                                                <p class="mb-0 font-monospace text-dark fw-bold" id="account-number">
                                                    Null</p>
                                            </div>
                                            <div class="col-6">
                                                <p class="mb-0 small text-muted">IFSC Code</p>
                                                <p class="mb-0 font-monospace text-dark fw-bold" id="ifsc-code">Null</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-5 pb-3 border-bottom border-light">
                                    <label for="transaction_id"
                                        class="form-label fw-bold small text-primary text-uppercase tracking-wider ms-1">Immutable
                                        Verification Hash (TxID)</label>
                                    <div class="input-group shadow-sm border border-primary border-opacity-25"
                                        style="border-radius: 1rem; overflow:hidden;">
                                        <span
                                            class="input-group-text bg-primary bg-opacity-10 border-0 px-4 text-primary"><i
                                                class="bi bi-hash"></i></span>
                                        <input type="text" id="transaction_id" name="transaction_id"
                                            class="form-control form-control-lg border-0 bg-white font-monospace"
                                            placeholder="Enter bank tx string..." required>
                                    </div>
                                </div>

                                <button type="submit"
                                    class="btn btn-premium w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm text-white"><i
                                        class="bi bi-shield-lock-fill me-2"></i> Lock Funds In Escrow</button>
                            </form>

                            <div class="text-center mt-4">
                                <a href="/contracts"
                                    class="text-decoration-none text-muted fw-bold hover-primary transition"><i
                                        class="bi bi-arrow-left-circle me-1"></i> Return to Audit Dashboard</a>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>