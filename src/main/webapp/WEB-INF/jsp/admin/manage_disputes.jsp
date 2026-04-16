<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <title>Manage Disputes - Admin Control Center</title>
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

                    <div
                        class="glass-card mb-4 p-4 p-lg-5 border-0 bg-danger bg-opacity-10 border border-danger border-opacity-10">
                        <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                            <div class="d-flex align-items-center gap-3">
                                <div class="bg-danger text-white p-3 rounded-circle shadow">
                                    <i class="bi bi-exclamation-octagon-fill fs-2"></i>
                                </div>
                                <div>
                                    <h1 class="fw-bold text-dark display-6 mb-1">Dispute Resolution Center</h1>
                                    <p class="text-danger fs-5 mb-0 fw-medium">Critical queue demanding immediate
                                        administrative mediation.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="glass-card border-0 shadow-sm overflow-hidden bg-white">
                        <div class="d-flex flex-wrap justify-content-between align-items-center p-4 border-bottom bg-light bg-opacity-50 gap-3">
                            <h5 class="fw-bold text-dark mb-0 m-0"><i class="bi bi-exclamation-circle text-danger me-2"></i> Dispute Tickets</h5>
                            <div class="d-flex gap-2 align-items-center ms-auto">
                                <div class="input-group shadow-sm" style="max-width: 250px;">
                                    <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                                    <input type="text" id="datagridSearch" class="form-control border-start-0 ps-0" placeholder="Search disputes..." onkeyup="filterDatagrid()">
                                </div>
                                <button class="btn btn-outline-danger shadow-sm hover-elevate transition hide-on-pdf text-nowrap me-2" onclick="exportTableToPDF('Resolution Queue Ledger')"><i class="bi bi-file-earmark-pdf me-1"></i> Export PDF</button>
                                <button class="btn btn-outline-secondary shadow-sm hover-elevate transition hide-on-pdf text-nowrap" onclick="exportTableToCSV('cfs_disputes.csv')"><i class="bi bi-download me-1"></i> Export CSV</button>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-custom align-middle mb-0 text-nowrap">
                                <thead class="table-custom-header">
                                    <tr>
                                        <th class="py-4 px-4 ps-5">Dispute Case #</th>
                                        <th class="py-4 px-4">Contract Ref</th>
                                        <th class="py-4 px-4">Plaintiff (UID)</th>
                                        <th class="py-4 px-4">Claim / Reported Reason</th>
                                        <th class="py-4 px-4 text-center">Case Status</th>
                                        <th class="py-4 px-4 pe-5 text-end">Judicial Action</th>
                                    </tr>
                                </thead>
                                <tbody class="border-top-0 bg-white bg-opacity-50" id="datagridBody">
                                    <c:choose>
                                        <c:when test="${not empty disputes}">
                                            <c:forEach var="d" items="${disputes}">
                                                <tr class="border-bottom border-light">
                                                    <td class="px-4 ps-5 fw-bold text-slate-400">#${d.id}</td>
                                                    <td class="px-4 fw-bold text-primary">Con #${d.contractId}</td>
                                                    <td class="px-4 text-muted"><i
                                                            class="bi bi-person-exclamation fs-5 me-1 text-danger"></i>
                                                        User #${d.raisedBy}</td>
                                                    <td class="px-4">
                                                        <div class="input-group shadow-sm" style="max-width: 250px; width: 100%;">
                                                            <i class="bi bi-quote opacity-50 pe-1"></i>${d.reason}
                                                        </div>
                                                    </td>
                                                    <td class="px-4 text-center">
                                                        <c:choose>
                                                            <c:when test="${d.status == 'OPEN'}">
                                                                <span
                                                                    class="badge bg-danger text-white px-3 py-2 rounded-pill shadow-sm"><i
                                                                        class="bi bi-fire me-1"></i> ACTION REQ</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span
                                                                    class="badge bg-success bg-opacity-25 text-success border border-success border-opacity-50 px-3 py-2 rounded-pill"><i
                                                                        class="bi bi-shield-check me-1"></i>
                                                                    RESOLVED</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td class="px-4 pe-5 text-end">
                                                        <c:choose>
                                                            <c:when test="${d.status == 'OPEN'}">
                                                                <div class="d-flex justify-content-end gap-2 flex-wrap"
                                                                    style="max-width: 240px; float: right;">
                                                                    <button class="btn btn-sm btn-primary rounded-pill shadow-sm w-100 fw-bold py-2 mb-1" onclick="openEditDisputeModal(${d.id}, '${d.status}', 'Force close or update reason...')"><i class="bi bi-pencil me-1"></i> Edit Dispute</button>
                                                                    <form action="/admin/disputes/delete" method="post"
                                                                        class="w-100" onsubmit="return confirm('Permanently delete this dispute record?');">
                                                                        <input type="hidden" name="disputeId"
                                                                            value="${d.id}">
                                                                        <button type="submit"
                                                                            class="btn btn-outline-danger btn-sm w-100 rounded-pill fw-bold shadow-sm py-2"><i
                                                                                class="bi bi-trash me-1"></i> Delete</button>
                                                                    </form>
                                                                </div>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="d-flex flex-column gap-2 align-items-end">
                                                                    <span
                                                                        class="text-success fw-bold d-inline-flex align-items-center bg-success bg-opacity-10 px-3 py-2 border border-success shadow-sm rounded-pill"><i
                                                                            class="bi bi-bookmark-check-fill me-2 fs-5"></i>
                                                                        Case Closed</span>
                                                                    <button class="btn btn-sm btn-outline-primary rounded-pill shadow-sm fw-bold" onclick="openEditDisputeModal(${d.id}, '${d.status}', '')"><i class="bi bi-pencil"></i> Edit Status</button>
                                                                </div>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="6" class="text-center py-5">
                                                    <div class="py-4">
                                                        <div
                                                            class="bg-success bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4 border border-success">
                                                            <i class="bi bi-shield-check text-success"
                                                                style="font-size: 3rem;"></i>
                                                        </div>
                                                        <h3 class="fw-bold text-dark mb-2">No Active Disputes</h3>
                                                        <p class="text-secondary fs-5 mb-0">The platform ecosystem is
                                                            operating smoothly without escalations.</p>
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

                <!-- Edit Dispute Modal -->
                <div class="modal fade" id="editDisputeModal" tabindex="-1" aria-labelledby="editDisputeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content border-0 shadow-lg" style="border-radius: 1rem; overflow: hidden;">
                            <div class="modal-header bg-danger bg-opacity-10 border-0">
                                <h5 class="modal-title fw-bold text-danger" id="editDisputeModalLabel"><i class="bi bi-gavel me-2"></i> Dispute Case Override</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="/admin/disputes/update" method="post">
                                <div class="modal-body p-4 bg-light">
                                    <input type="hidden" name="disputeId" id="editDisputeId">
                                    <p class="text-danger small fw-bold">Modifying dispute records directly may obfuscate judicial audit logs.</p>
                                    
                                    <div class="form-floating mb-3">
                                        <select class="form-select border-light shadow-sm fw-bold" id="editDisputeStatus" name="status" required>
                                            <option value="OPEN">Open / Escalated</option>
                                            <option value="RESOLVED">Resolved / Closed</option>
                                            <option value="DISMISSED">Dismissed / Invalid</option>
                                        </select>
                                        <label for="editDisputeStatus">Dispute Status</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <textarea class="form-control border-light shadow-sm" id="editDisputeResolution" name="resolution" style="height: 100px" placeholder="Force Resolution Notes"></textarea>
                                        <label for="editDisputeResolution">Append Resolution Notes</label>
                                    </div>
                                </div>
                                <div class="modal-footer border-0 p-4 bg-white">
                                    <button type="button" class="btn btn-light rounded-pill px-4 fw-bold" data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-danger rounded-pill px-4 fw-bold shadow-sm hover-elevate transition"><i class="bi bi-hammer me-2"></i> Adjudicate</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function openEditDisputeModal(id, status, placeholder) {
                        document.getElementById('editDisputeId').value = id;
                        document.getElementById('editDisputeStatus').value = status;
                        document.getElementById('editDisputeResolution').value = '';
                        document.getElementById('editDisputeResolution').placeholder = placeholder;
                        new bootstrap.Modal(document.getElementById('editDisputeModal')).show();
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
                            let row = [], cols = rows[i].querySelectorAll("td, th");
                            let len = i === 0 ? cols.length - 1 : cols.length - 1; // Ignore right action column
                            for (let j = 0; j < len; j++) { 
                                row.push('"' + cols[j].innerText.trim().replace(/"/g, '""') + '"');
                            }
                            csv.push(row.join(","));
                        }
                        downloadCSV(csv.join("\n"), filename);
                        if(typeof showToast === 'function') {
                            showToast('Export Successful', `Data accurately exported to ${filename}`, 'success');
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