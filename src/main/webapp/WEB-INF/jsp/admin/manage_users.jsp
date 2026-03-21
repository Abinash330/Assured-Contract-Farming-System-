<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Manage Users - Admin Control Center</title>
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

            <jsp:include page="../common/header_admin.jsp" />

            <div class="container-fluid px-4 px-lg-5">

                <div class="glass-card mb-4 p-4 p-lg-5 border-0">
                    <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                        <div class="d-flex align-items-center gap-3">
                            <div
                                class="bg-primary bg-opacity-10 text-primary p-3 rounded-circle border border-primary border-opacity-25">
                                <i class="bi bi-people-fill fs-2"></i>
                            </div>
                            <div>
                                <h1 class="fw-bold text-dark display-6 mb-1">User Management & KYC</h1>
                                <p class="text-muted fs-5 mb-0">Review identity documents and verify user accounts.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="glass-card border-0 shadow-sm overflow-hidden bg-white">
                    <!-- DataGrid Toolbar -->
                    <div class="d-flex justify-content-between align-items-center p-4 border-bottom bg-light bg-opacity-50">
                        <div class="d-flex align-items-center gap-3">
                            <h5 class="fw-bold text-dark mb-0 m-0"><i class="bi bi-person-lines-fill text-primary me-2"></i> User Directory</h5>
                            <span class="badge bg-primary rounded-pill px-3 py-2">${fn:length(users)} Active Records</span>
                        </div>
                        <div class="d-flex gap-2">
                            <div class="input-group shadow-sm" style="max-width: 250px; width: 100%;">
                                <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                                <input type="text" id="datagridSearch" class="form-control border-start-0 ps-0" placeholder="Search users..." onkeyup="filterDatagrid()">
                            </div>
                            <button class="btn btn-outline-danger shadow-sm hover-elevate transition hide-on-pdf me-2" onclick="exportTableToPDF('User Directory Ledger')"><i class="bi bi-file-earmark-pdf me-1"></i> Export PDF</button>
                            <button class="btn btn-outline-secondary shadow-sm hover-elevate transition hide-on-pdf" onclick="exportTableToCSV('cfs_users.csv')"><i class="bi bi-download me-1"></i> Export CSV</button>
                        </div>
                    </div>

                    <!-- DataGrid Table -->
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0 text-nowrap">
                            <thead class="bg-light text-uppercase small fw-bold text-secondary" style="letter-spacing: 0.5px;">
                                <tr>
                                    <th class="py-3 px-4 ps-5 border-0">User ID</th>
                                    <th class="py-3 px-4 border-0">Identity</th>
                                    <th class="py-3 px-4 border-0">Platform Role</th>
                                    <th class="py-3 px-4 border-0">Govt IDs (Aadhaar / PAN)</th>
                                    <th class="py-3 px-4 text-center border-0">KYC Status</th>
                                    <th class="py-3 px-4 pe-5 text-end border-0">Manage</th>
                                </tr>
                            </thead>
                            <tbody class="border-top-0" id="datagridBody">
                                <c:forEach var="user" items="${users}">
                                    <tr class="transition hover-bg-light">
                                        <td class="px-4 ps-5 font-monospace text-muted fw-semibold">USR-${user.id}</td>
                                        <td class="px-4">
                                            <div class="d-flex align-items-center">
                                                <div class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex justify-content-center align-items-center fw-bold me-3" style="width: 40px; height: 40px;">
                                                    <i class="bi bi-person-fill fs-5"></i>
                                                </div>
                                                <div>
                                                    <h6 class="fw-bold text-dark mb-1">${not empty user.username ? user.username : 'Unregistered User'}</h6>
                                                    <span class="text-muted small">${user.email}</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-4">
                                            <c:choose>
                                                <c:when test="${user.role == 'admin'}"><span class="badge bg-dark text-white px-3 py-2 rounded-pill"><i class="bi bi-star-fill me-1 text-warning"></i> Admin</span></c:when>
                                                <c:when test="${user.role == 'farmer'}"><span class="badge bg-success bg-opacity-10 border border-success border-opacity-25 text-success px-3 py-2 rounded-pill fw-bold"><i class="bi bi-tractor me-1"></i> Farmer</span></c:when>
                                                <c:when test="${user.role == 'buyer'}"><span class="badge bg-primary bg-opacity-10 border border-primary border-opacity-25 text-primary px-3 py-2 rounded-pill fw-bold"><i class="bi bi-briefcase me-1"></i> Buyer</span></c:when>
                                                <c:otherwise><span class="badge bg-info bg-opacity-10 border border-info border-opacity-25 text-info px-3 py-2 rounded-pill fw-bold"><i class="bi bi-person-badge me-1"></i> Inspector</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="px-4">
                                            <div class="d-flex flex-column gap-1">
                                                <span class="text-muted font-monospace small"><i class="bi bi-upc-scan me-1 opacity-50"></i> ${not empty user.aadhaarNumber ? user.aadhaarNumber : 'Unverified'}</span>
                                                <span class="text-muted font-monospace small"><i class="bi bi-file-text me-1 opacity-50"></i> ${not empty user.panNumber ? user.panNumber : 'Unverified'}</span>
                                            </div>
                                        </td>
                                        <td class="px-4 text-center">
                                            <c:choose>
                                                <c:when test="${user.kycStatus == 'APPROVED'}"><span class="badge bg-success px-3 py-2 rounded-pill shadow-sm"><i class="bi bi-shield-check me-1"></i> Approved</span></c:when>
                                                <c:when test="${user.kycStatus == 'REJECTED'}"><span class="badge bg-danger px-3 py-2 rounded-pill shadow-sm"><i class="bi bi-shield-x me-1"></i> Rejected</span></c:when>
                                                <c:otherwise><span class="badge bg-warning text-dark px-3 py-2 rounded-pill shadow-sm"><i class="bi bi-hourglass-split me-1"></i> Action Required</span></c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="px-4 pe-5 text-end">
                                            <div class="d-flex justify-content-end gap-2 align-items-center">
                                                <c:if test="${user.role != 'admin' && user.kycStatus == 'PENDING'}">
                                                    <form action="/admin/users/approve-kyc" method="post" class="mb-0">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit" class="btn btn-success btn-sm rounded-pill fw-bold shadow-sm px-3 hover-elevate transition"><i class="bi bi-check-lg"></i> Approve</button>
                                                    </form>
                                                    <form action="/admin/users/reject-kyc" method="post" class="mb-0">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit" class="btn btn-outline-danger btn-sm rounded-pill font-weight-bold shadow-sm px-3 hover-elevate transition">Reject</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${user.role != 'admin'}">
                                                    <form action="/admin/users/delete" method="post" class="mb-0" onsubmit="return confirm('Permanently delete this user?');">
                                                        <input type="hidden" name="userId" value="${user.id}">
                                                        <button type="submit" class="btn btn-light text-danger btn-sm rounded-circle shadow-sm border ms-1 hover-elevate transition" title="Delete User" style="width:34px; height:34px;"><i class="bi bi-trash"></i></button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <c:if test="${empty users}">
                            <div class="text-center py-5">
                                <i class="bi bi-folder-x text-muted opacity-50" style="font-size: 3rem;"></i>
                                <h5 class="text-muted mt-3">No user records found</h5>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>

            <jsp:include page="../common/footer.jsp" />
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
            <script>
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
                        if(rows[i].style.display === "none") continue; // Export filtered only
                        let row = [], cols = rows[i].querySelectorAll("td, th");
                        let colLength = i === 0 ? cols.length - 1 : cols.length - 1; // skip action column
                        for (let j = 0; j < colLength; j++) { 
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
                        filename:     `${title.replace(/ /g, '_')}.pdf`,
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