<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Manage Contracts - Admin Control Center</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
                <link rel="stylesheet" href="/global-theme.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
                            <div class="input-group shadow-sm" style="max-width: 250px; width: 100%;">
                                <div
                                    class="bg-success bg-opacity-10 text-success p-3 rounded-circle border border-success border-opacity-25">
                                    <i class="bi bi-file-earmark-check-fill fs-2"></i>
                                </div>
                                    <p class="text-muted fs-5 mb-0">Global audit view of all pipeline agreements across
                                        the platform.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="glass-card border-0 shadow-sm overflow-hidden bg-white">
                        <div class="d-flex flex-wrap justify-content-between align-items-center p-4 border-bottom bg-light bg-opacity-50 gap-3">
                            <h5 class="fw-bold text-dark mb-0 m-0"><i class="bi bi-file-earmark-text text-success me-2"></i> Contract Ledger</h5>
                            <div class="d-flex gap-2 align-items-center ms-auto">
                                <div class="input-group shadow-sm" style="max-width: 250px;">
                                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                                    <input type="text" id="datagridSearch" class="form-control border-start-0 ps-0" placeholder="Search contracts..." onkeyup="filterDatagrid()">
                                </div>
                                <button class="btn btn-outline-danger shadow-sm hover-elevate transition hide-on-pdf text-nowrap me-2" onclick="exportTableToPDF('Active Contract Ledger')"><i class="bi bi-file-earmark-pdf me-1"></i> Export PDF</button>
                                <button class="btn btn-outline-secondary shadow-sm hover-elevate transition hide-on-pdf text-nowrap" onclick="exportTableToCSV('cfs_contracts.csv')"><i class="bi bi-download me-1"></i> Export CSV</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-custom align-middle mb-0 text-nowrap">
                                <thead class="table-custom-header">
                                    <tr>
                                        <th class="py-4 px-4 ps-5">Ref #</th>
                                        <th class="py-4 px-4">Farmer</th>
                                        <th class="py-4 px-4">Buyer</th>
                                        <th class="py-4 px-4">Asset Details</th>
                                        <th class="py-4 px-4 pe-5 text-center">Lifecycle Status</th>
                                        <th class="py-4 px-4 text-end">Traceability & Actions</th>
                                    </tr>

                                </thead>
                                <tbody class="border-top-0 bg-white bg-opacity-50" id="datagridBody">
                                    <c:choose>
                                        <c:when test="${not empty contractDetailsList}">
                                            <c:forEach var="detail" items="${contractDetailsList}">
                                                <tr class="border-bottom border-light">
                                                    <td class="px-4 ps-5 fw-bold text-slate-400">#${detail.contract.id}
                                                    </td>
                                                    <td class="px-4 fw-bold text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <div
                                                                class="bg-success bg-opacity-10 text-success rounded-circle p-2 me-2 shadow-sm d-flex">
                                                                <i class="bi bi-tractor"></i></div>
                                                            ${detail.farmer.username}
                                                        </div>
                                                    </td>
                                                    <td class="px-4 fw-bold text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <div
                                                                class="bg-primary bg-opacity-10 text-primary rounded-circle p-2 me-2 shadow-sm d-flex">
                                                                <i class="bi bi-building"></i></div>
                                                            ${detail.buyer.username}
                                                        </div>
                                                    </td>
                                                    <td class="px-4">
                                                        <span
                                                            class="fw-bold d-block text-dark mb-1">${detail.crop.cropName}</span>
                                                        <span class="text-muted small border rounded px-2 py-1"><i
                                                                class="bi bi-boxes me-1"></i> ${detail.crop.quantity}
                                                            Metric Tons</span>
                                                    </td>
                                                    <td class="px-4 text-end">
                                                        <div
                                                            class="fs-5 fw-bold text-success bg-success bg-opacity-10 px-3 py-1 rounded-pill d-inline-flex border border-success border-opacity-25">
                                                            ₹${detail.contract.finalPrice}</div>
                                                    </td>
                                                    <td class="px-4 pe-5 text-center">
                                                        <c:choose>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'pending'}">
                                                                <span
                                                                    class="badge rounded-pill bg-warning text-dark px-3 py-2 shadow-sm border border-warning"><i
                                                                        class="bi bi-hourglass-split me-1"></i> Under
                                                                    Review</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'accepted'}">
                                                                <span
                                                                    class="badge rounded-pill bg-primary px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-shield-lock-fill me-1"></i>
                                                                    Locked</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'completed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-success px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-check-circle-fill me-1"></i>
                                                                    Executed</span></c:when>
                                                            <c:when
                                                                test="${fn:toLowerCase(detail.contract.contractStatus) == 'disputed'}">
                                                                <span
                                                                    class="badge rounded-pill bg-danger px-3 py-2 shadow-sm"><i
                                                                        class="bi bi-exclamation-octagon-fill me-1"></i>
                                                                    Escalated</span></c:when>
                                                            <c:otherwise><span
                                                                    class="badge rounded-pill bg-secondary px-3 py-2 shadow-sm">${detail.contract.contractStatus}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-4 text-end">
                                                        <a href="/traceability/contract/${detail.contract.id}" class="btn btn-sm btn-outline-dark rounded-pill shadow-sm mb-1 w-100"><i class="bi bi-upc-scan me-1"></i> View Trace</a>
                                                        <div class="d-flex gap-2">
                                                            <button class="btn btn-sm btn-primary rounded-pill shadow-sm w-100 fw-bold" onclick="openEditContractModal(${detail.contract.id}, '${detail.contract.contractStatus}', '${detail.contract.paymentStatus}')"><i class="bi bi-pencil me-1"></i> Edit</button>
                                                            <form action="/admin/contracts/delete" method="post" class="m-0 w-100" onsubmit="return confirm('WARNING: Force deleting a contract bypasses all escrow safety checks. Proceed?');">
                                                                <input type="hidden" name="contractId" value="${detail.contract.id}">
                                                                <button type="submit" class="btn btn-sm btn-danger rounded-pill shadow-sm w-100 fw-bold"><i class="bi bi-trash"></i></button>
                                                            </form>
                                                        </div>

                                                    </td>
                                                </tr>

                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="6" class="text-center py-5">
                                                    <div class="py-4">
                                                        <div
                                                            class="bg-secondary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                                            <i class="bi bi-file-earmark-x text-secondary"
                                                                style="font-size: 3rem;"></i>
                                                        </div>
                                                        <h3 class="fw-bold text-dark mb-2">No Platform Contracts</h3>
                                                        <p class="text-secondary fs-5 mb-0">System contract data will
                                                            appear here once agreements are formed.</p>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                </div>

                <!-- Edit Contract Modal -->
                <div class="modal fade" id="editContractModal" tabindex="-1" aria-labelledby="editContractModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 shadow-lg" style="border-radius: 1rem; overflow: hidden;">
                            <div class="modal-header bg-danger bg-opacity-10 border-0">
                                <h5 class="modal-title fw-bold text-danger" id="editContractModalLabel"><i class="bi bi-exclamation-triangle-fill me-2"></i> Override Contract State</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/admin/contracts/update" method="post">
                                <div class="modal-body p-4 bg-light">
                                    <input type="hidden" name="contractId" id="editContractId">
                                    <p class="text-danger small fw-bold">Manual override circumvents escrow validations. Use only to fix deadlocked agreements.</p>
                                    
                                    <div class="form-floating mb-3">
                                        <select class="form-select border-light shadow-sm fw-bold" id="editContractStatus" name="contractStatus" required>
                                            <option value="Pending">Pending</option>
                                            <option value="Active">Active</option>
                                            <option value="Accepted">Accepted / Locked</option>
                                            <option value="Completed">Completed</option>
                                            <option value="Disputed">Disputed</option>
                                            <option value="Cancelled">Cancelled</option>
                                        </select>
                                        <label for="editContractStatus">Lifecycle Status</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <select class="form-select border-light shadow-sm fw-bold" id="editPaymentStatus" name="paymentStatus" required>
                                            <option value="Pending">Pending</option>
                                            <option value="Escrow Locked">Escrow Locked</option>
                                            <option value="Paid">Paid Out</option>
                                            <option value="Escrow Frozen">Escrow Frozen</option>
                                            <option value="Refunded">Refunded to Buyer</option>
                                        </select>
                                        <label for="editPaymentStatus">Escrow / Payment State</label>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 p-4 bg-white">
                                    <button type="button" class="btn btn-light rounded-pill px-4 fw-bold" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-danger rounded-pill px-4 fw-bold shadow-sm hover-elevate transition"><i class="bi bi-shield-lock-fill me-2"></i> Force Update</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function openEditContractModal(id, contractStatus, paymentStatus) {
                        document.getElementById('editContractId').value = id;
                        document.getElementById('editContractStatus').value = contractStatus || 'Pending';
                        document.getElementById('editPaymentStatus').value = paymentStatus || 'Pending';
                        new bootstrap.Modal(document.getElementById('editContractModal')).show();
                    }

                    function filterDatagrid() {
                        let filter = document.getElementById("datagridSearch").value.toLowerCase();
                        let rows = document.querySelectorAll("#datagridBody tr");
                        rows.forEach(row => {
                            let text = row.innerText.toLowerCase();
                            row.style.display = text.includes(filter) ? "" : "none";
                        });
                    }
                    
                    function downloadCSV(csv, filename) {
                        let csvFile = new Blob([csv], {type: "text/csv"});
                        let downloadLink = document.createElement("a");
                        downloadLink.download = filename;
                        downloadLink.href = window.URL.createObjectURL(csvFile);
                        downloadLink.style.display = "none";
                        document.body.appendChild(downloadLink);
                        downloadLink.click();
                    }
                    function exportTableToCSV(filename) {
                        let csv = [];
                        let rows = document.querySelectorAll("table tr");
                        for (let i = 0; i < rows.length; i++) {
                            if(rows[i].style.display === "none") continue;
                            let row = [], cols = rows[i].querySelectorAll("td, th");
                            for (let j = 0; j < cols.length; j++) { 
                                row.push('"' + cols[j].innerText.trim().replace(/"/g, '""') + '"');
                            }
                            csv.push(row.join(","));
                        }
                        downloadCSV(csv.join("\n"), filename);
                        if(typeof showToast === 'function') {
                            showToast('Export Successful', `Ledger accurately exported to ${filename}`, 'success');
                        }
                    }

                    function exportTableToPDF(title) {
                        if(typeof showToast === 'function') {
                            showToast('Generating Report', 'Please wait while the PDF is compiled and encrypted.', 'primary');
                        }
                        const element = document.querySelector('.table-responsive');
                        const opt = {
                            margin:       10,
                            filename:     title.replace(/ /g, '_') + '.pdf',
                            image:        { type: 'jpeg', quality: 0.98 },
                            html2canvas:  { scale: 2 },
                            jsPDF:        { unit: 'mm', format: 'a4', orientation: 'landscape' }
                        };
                        
                        const titleEl = document.createElement('h3');
                        titleEl.innerText = title;
                        titleEl.style.marginBottom = '20px';
                        element.insertBefore(titleEl, element.firstChild);

                        try {
                            html2pdf().set(opt).from(element).save().then(() => {
                                titleEl.remove();
                                if(typeof showToast === 'function') {
                                    showToast('Export Successful', `PDF Report successfully exported to your device`, 'success');
                                }
                            });
                        } catch(e) {
                            titleEl.remove();
                            console.error(e);
                        }
                    }
                </script>
            </body>

            </html>