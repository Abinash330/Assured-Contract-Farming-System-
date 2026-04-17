<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Crops - Admin Control Center</title>
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
                        <a class="nav-link px-3" href="/admin/dashboard"><i class="bi bi-house border-end border-secondary border-opacity-25 pe-2 me-2"></i> Dashboard</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid px-4 px-lg-5">
        <div class="glass-card mb-4 p-4 p-lg-5 border-0">
            <div class="d-flex justify-content-between align-items-center flex-wrap gap-3">
                <div class="d-flex align-items-center">
                    <div class="bg-success bg-opacity-10 text-success p-3 rounded-circle border border-success border-opacity-25 me-3">
                        <i class="bi bi-basket-fill fs-2"></i>
                    </div>
                    <div>
                        <h2 class="fw-bold text-dark mb-0">Crop Directory Management</h2>
                        <p class="text-muted fs-5 mb-0">Global audit view of all farmer crops across the platform.</p>
                    </div>
                </div>
                <button class="btn btn-success fw-bold px-4 py-2 rounded-pill shadow-sm" data-bs-toggle="modal" data-bs-target="#addCropModal">
                    <i class="bi bi-plus-circle me-2"></i> Add New Crop
                </button>
            </div>
        </div>

        <div class="glass-card border-0 shadow-sm overflow-hidden bg-white">
            <div class="d-flex flex-wrap justify-content-between align-items-center p-4 border-bottom bg-light bg-opacity-50 gap-3">
                <h5 class="fw-bold text-dark mb-0 m-0"><i class="bi bi-database text-success me-2"></i> System Crops Ledger</h5>
                <div class="d-flex gap-2 align-items-center ms-auto">
                    <div class="input-group shadow-sm" style="max-width: 250px;">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                        <input type="text" id="datagridSearch" class="form-control border-start-0 ps-0" placeholder="Search crops..." onkeyup="filterDatagrid()">
                    </div>
                    <button class="btn btn-outline-secondary shadow-sm hover-elevate transition hide-on-pdf text-nowrap" onclick="exportTableToCSV('cfs_crops.csv')"><i class="bi bi-download me-1"></i> CSV</button>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-custom align-middle mb-0 text-nowrap">
                    <thead class="table-custom-header">
                        <tr>
                            <th class="py-4 px-4 ps-5">ID</th>
                            <th class="py-4 px-4">Crop Name</th>
                            <th class="py-4 px-4">Farmer</th>
                            <th class="py-4 px-4">Quantity (MT)</th>
                            <th class="py-4 px-4">Price / MT</th>
                            <th class="py-4 px-4">Status</th>
                            <th class="py-4 px-4">Image</th>
                            <th class="py-4 px-4 text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="border-top-0 bg-white bg-opacity-50" id="datagridBody">
                        <c:choose>
                            <c:when test="${not empty cropDetailsList}">
                                <c:forEach var="detail" items="${cropDetailsList}">
                                    <tr class="border-bottom border-light">
                                        <td class="px-4 ps-5 fw-bold text-slate-400">#${detail.crop.id}</td>
                                        <td class="px-4 fw-bold text-dark">${detail.crop.cropName}</td>
                                        <td class="px-4">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-person-badge text-primary me-2"></i>
                                                ${detail.farmer != null ? detail.farmer.username : 'Unknown'}
                                            </div>
                                        </td>
                                        <td class="px-4">${detail.crop.quantity} MT</td>
                                        <td class="px-4 text-success fw-bold">₹${detail.crop.pricePerUnit}</td>
                                        <td class="px-4">
                                            <c:choose>
                                                <c:when test="${detail.crop.status == 'Available'}">
                                                    <span class="badge rounded-pill bg-success px-3 py-2">Available</span>
                                                </c:when>
                                                <c:when test="${detail.crop.status == 'Under_Contract'}">
                                                    <span class="badge rounded-pill bg-warning text-dark px-3 py-2">In Contract</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge rounded-pill bg-secondary px-3 py-2">${detail.crop.status}</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="px-4">
                                            <c:if test="${not empty detail.crop.imageUrl}">
                                                <a href="${detail.crop.imageUrl}" download="crop_image_${detail.crop.id}.jpg" class="btn btn-sm btn-outline-secondary rounded-pill">
                                                    <i class="bi bi-image me-1"></i> Download
                                                </a>
                                            </c:if>
                                            <c:if test="${empty detail.crop.imageUrl}">
                                                <span class="text-muted small">No Image</span>
                                            </c:if>
                                        </td>
                                        <td class="px-4 text-end">
                                            <div class="d-flex gap-2 justify-content-end">
                                                <button class="btn btn-sm btn-primary rounded-pill shadow-sm" onclick="openEditCropModal('${detail.crop.id}', '${detail.crop.cropName}', '${detail.crop.quantity}', '${detail.crop.pricePerUnit}', '${detail.crop.location}', '${detail.crop.status}')">
                                                    <i class="bi bi-pencil"></i>
                                                </button>
                                                <form action="/admin/crops/delete" method="post" class="m-0" onsubmit="return confirm('WARNING: Deleting this crop will also delete associated contracts. Proceed?');">
                                                    <input type="hidden" name="cropId" value="${detail.crop.id}">
                                                    <button type="submit" class="btn btn-sm btn-danger rounded-pill shadow-sm"><i class="bi bi-trash"></i></button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="8" class="text-center py-5">
                                        <div class="py-4">
                                            <div class="bg-secondary bg-opacity-10 d-inline-flex p-4 rounded-circle mb-4">
                                                <i class="bi bi-basket text-secondary" style="font-size: 3rem;"></i>
                                            </div>
                                            <h3 class="fw-bold text-dark mb-2">No System Crops Found</h3>
                                            <p class="text-secondary fs-5 mb-0">Farmer crop data will appear here.</p>
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

    <!-- Edit Crop Modal -->
    <div class="modal fade" id="editCropModal" tabindex="-1" aria-labelledby="editCropModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg" style="border-radius: 1rem; overflow: hidden;">
                <div class="modal-header bg-primary bg-opacity-10 border-0">
                    <h5 class="modal-title fw-bold text-primary" id="editCropModalLabel"><i class="bi bi-pencil-square me-2"></i> Edit Crop Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/admin/crops/update" method="post">
                    <div class="modal-body p-4 bg-light">
                        <input type="hidden" name="cropId" id="editCropId">
                        
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control border-light shadow-sm fw-bold" id="editCropName" name="crop_name" required>
                            <label for="editCropName">Crop Name</label>
                        </div>
                        <div class="row gx-3">
                            <div class="col-md-6 form-floating mb-3">
                                <input type="number" class="form-control border-light shadow-sm" id="editQuantity" name="quantity" required>
                                <label for="editQuantity">Quantity (MT)</label>
                            </div>
                            <div class="col-md-6 form-floating mb-3">
                                <input type="number" step="0.01" class="form-control border-light shadow-sm" id="editPrice" name="price_per_unit" required>
                                <label for="editPrice">Price / MT (₹)</label>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control border-light shadow-sm" id="editLocation" name="location" required>
                            <label for="editLocation">Location / Depot</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select border-light shadow-sm fw-bold" id="editStatus" name="status" required>
                                <option value="Available">Available</option>
                                <option value="Under_Contract">Under Contract</option>
                                <option value="Depleted">Depleted</option>
                            </select>
                            <label for="editStatus">Crop Listing Status</label>
                        </div>
                    </div>
                    <div class="modal-footer border-0 p-4 bg-white">
                        <button type="button" class="btn btn-light rounded-pill px-4 fw-bold" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary rounded-pill px-4 fw-bold shadow-sm hover-elevate transition">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add Crop Modal -->
    <div class="modal fade" id="addCropModal" tabindex="-1" aria-labelledby="addCropModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content border-0 shadow-lg" style="border-radius: 1rem; overflow: hidden;">
                <div class="modal-header bg-success bg-opacity-10 border-0">
                    <h5 class="modal-title fw-bold text-success" id="addCropModalLabel"><i class="bi bi-plus-circle me-2"></i> Add Platform Crop Listing</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="/admin/crops/add" method="post" enctype="multipart/form-data">
                    <div class="modal-body p-4 bg-light">
                        <div class="form-floating mb-3">
                            <select class="form-select border-light shadow-sm fw-bold" id="addFarmerId" name="farmerId" required>
                                <option value="" disabled selected>Select Farmer Account</option>
                                <c:forEach var="f" items="${farmers}">
                                    <option value="${f.id}">${f.username} (${f.email})</option>
                                </c:forEach>
                            </select>
                            <label for="addFarmerId">Assign to Farmer</label>
                        </div>
                        
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control border-light shadow-sm fw-bold" id="addCropName" name="crop_name" placeholder="Crop Name" required>
                            <label for="addCropName">Crop Name</label>
                        </div>
                        <div class="row gx-3">
                            <div class="col-md-6 form-floating mb-3">
                                <input type="number" class="form-control border-light shadow-sm" id="addQuantity" name="quantity" placeholder="10" required>
                                <label for="addQuantity">Quantity (Metric Tons)</label>
                            </div>
                            <div class="col-md-6 form-floating mb-3">
                                <input type="number" step="0.01" class="form-control border-light shadow-sm" id="addPrice" name="price_per_unit" placeholder="5000" required>
                                <label for="addPrice">Price / MT (₹)</label>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control border-light shadow-sm" id="addLocation" name="location" placeholder="Location" required>
                            <label for="addLocation">Location</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="date" class="form-control border-light shadow-sm" id="addHarvestDate" name="harvest_date" required>
                            <label for="addHarvestDate">Harvest Date</label>
                        </div>
                        <div class="form-floating mb-3">
                            <select class="form-select border-light shadow-sm fw-bold" id="addProductCategory" name="productCategory">
                                <option value="Primary Crop">Primary Crop (Wheat, Paddy, etc.)</option>
                                <option value="Wastage/Byproduct">Wastage/Byproduct (Bio-Mass)</option>
                                <option value="Fertilizer">Organic Fertilizer (Compost)</option>
                            </select>
                            <label for="addProductCategory">Product Category</label>
                        </div>
                        <div class="mb-3">
                            <label for="addImage" class="form-label fw-bold text-muted small">Upload Product Image (Optional)</label>
                            <input class="form-control shadow-sm" type="file" id="addImage" name="image" accept="image/*">
                        </div>
                    </div>
                    <div class="modal-footer border-0 p-4 bg-white">
                        <button type="button" class="btn btn-light rounded-pill px-4 fw-bold" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success rounded-pill px-4 fw-bold shadow-sm hover-elevate transition">Create Listing</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function openEditCropModal(id, name, qty, price, loc, status) {
            document.getElementById('editCropId').value = id;
            document.getElementById('editCropName').value = name;
            document.getElementById('editQuantity').value = qty;
            document.getElementById('editPrice').value = price;
            document.getElementById('editLocation').value = loc;
            document.getElementById('editStatus').value = status;
            new bootstrap.Modal(document.getElementById('editCropModal')).show();
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
                for (let j = 0; j < cols.length - 1; j++) { 
                    row.push('"' + cols[j].innerText.trim().replace(/"/g, '""') + '"');
                }
                csv.push(row.join(","));
            }
            downloadCSV(csv.join("\n"), filename);
        }
    </script>
</body>
</html>
