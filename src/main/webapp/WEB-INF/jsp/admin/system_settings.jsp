<%@ page language="java" contentType="text/html; charset=UTF-8" pageContext="session" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Platform Settings - Admin Control Center</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="/global-theme.css" rel="stylesheet">
</head>
<body class="admin-body">
    <jsp:include page="../common/header_admin.jsp" />

    <main class="container-fluid py-4 px-md-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark mb-1">Platform Settings</h2>
                <p class="text-muted mb-0">Configure core engine parameters and business logic variables.</p>
            </div>
            <button class="btn btn-premium shadow-sm hover-elevate transition" onclick="saveSettings()">
                <i class="bi bi-save me-2"></i> Save Configurations
            </button>
        </div>

        <div class="row g-4">
            <!-- Settings Navigation -->
            <div class="col-lg-3 col-md-4">
                <div class="glass-card shadow-sm border-0 bg-white">
                    <div class="nav flex-column nav-pills p-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <button class="nav-link active text-start fw-semibold py-3 mb-2 rounded-3" id="v-pills-general-tab" data-bs-toggle="pill" data-bs-target="#v-pills-general" type="button" role="tab" aria-controls="v-pills-general" aria-selected="true">
                            <i class="bi bi-globe me-2 opacity-75"></i> General Preferences
                        </button>
                        <button class="nav-link text-start fw-semibold py-3 mb-2 rounded-3" id="v-pills-financial-tab" data-bs-toggle="pill" data-bs-target="#v-pills-financial" type="button" role="tab" aria-controls="v-pills-financial" aria-selected="false">
                            <i class="bi bi-bank me-2 opacity-75"></i> Financial Engine
                        </button>
                        <button class="nav-link text-start fw-semibold py-3 mb-2 rounded-3" id="v-pills-security-tab" data-bs-toggle="pill" data-bs-target="#v-pills-security" type="button" role="tab" aria-controls="v-pills-security" aria-selected="false">
                            <i class="bi bi-shield-check me-2 opacity-75"></i> Security Policies
                        </button>
                        <button class="nav-link text-start fw-semibold py-3 rounded-3" id="v-pills-email-tab" data-bs-toggle="pill" data-bs-target="#v-pills-email" type="button" role="tab" aria-controls="v-pills-email" aria-selected="false">
                            <i class="bi bi-envelope-paper me-2 opacity-75"></i> Communications
                        </button>
                    </div>
                </div>
            </div>

            <!-- Settings Content -->
            <div class="col-lg-9 col-md-8">
                <div class="tab-content" id="v-pills-tabContent">
                    
                    <!-- General Settings -->
                    <div class="tab-pane fade show active" id="v-pills-general" role="tabpanel" aria-labelledby="v-pills-general-tab">
                        <div class="glass-card shadow-sm border-0 bg-white p-4 p-md-5">
                            <h4 class="fw-bold mb-4 text-dark"><i class="bi bi-gear-fill me-2 text-primary"></i> General Preferences</h4>
                            
                            <div class="mb-5">
                                <label class="fw-bold text-dark mb-3 fs-5">Platform Status</label>
                                <div class="form-check form-switch fs-5 mb-3">
                                    <input class="form-check-input" type="checkbox" role="switch" id="maintenanceToggle">
                                    <label class="form-check-label ms-2 mt-1" for="maintenanceToggle">Enable Maintenance Mode <span class="badge bg-warning text-dark ms-2 fw-normal fs-6">Take Offline</span></label>
                                </div>
                                <p class="text-muted small">When enabled, only administrators can access the platform. Farmers and Buyers will see a 'temporarily down' notice.</p>
                            </div>
                            
                            <hr class="my-4 border-light">
                            
                            <div class="mb-4">
                                <label class="fw-bold text-dark mb-3 fs-5">Account Verification</label>
                                <div class="form-check form-switch fs-5 mb-3">
                                    <input class="form-check-input" type="checkbox" role="switch" id="autoApproveToggle" checked>
                                    <label class="form-check-label ms-2 mt-1" for="autoApproveToggle">Auto-Approve Verified Farmers</label>
                                </div>
                                <p class="text-muted small">Automatically grant 'Verified' badge to farmers who successfully complete SMS phone verification.</p>
                            </div>
                        </div>
                    </div>

                    <!-- Financial Engine -->
                    <div class="tab-pane fade" id="v-pills-financial" role="tabpanel" aria-labelledby="v-pills-financial-tab">
                        <div class="glass-card shadow-sm border-0 bg-white p-4 p-md-5">
                            <h4 class="fw-bold mb-4 text-dark"><i class="bi bi-cash-stack me-2 text-success"></i> Financial Engine</h4>
                            
                            <div class="row g-4 mb-4">
                                <div class="col-md-6">
                                    <label class="fw-bold text-dark mb-2">Platform Commission Rate</label>
                                    <div class="input-group input-group-lg shadow-sm">
                                        <input type="number" class="form-control" value="2.5" step="0.1" min="0" max="100">
                                        <span class="input-group-text bg-white fw-bold">%</span>
                                    </div>
                                    <div class="form-text mt-2">Deducted automatically upon successful contract completion.</div>
                                </div>
                                
                                <div class="col-md-6">
                                    <label class="fw-bold text-dark mb-2">Minimum Escrow Lockup</label>
                                    <div class="input-group input-group-lg shadow-sm">
                                        <input type="number" class="form-control" value="7" min="1" max="90">
                                        <span class="input-group-text bg-white">Days</span>
                                    </div>
                                    <div class="form-text mt-2">The minimum duration buyer funds are locked prior to release.</div>
                                </div>
                            </div>
                            
                            <div class="mb-4">
                                <label class="fw-bold text-dark mb-2">Supported Payment Gateways</label>
                                <div class="d-flex gap-3 flex-wrap mt-2">
                                    <div class="border rounded-3 p-3 d-flex align-items-center bg-light">
                                        <div class="form-check form-switch m-0">
                                            <input class="form-check-input" type="checkbox" role="switch" checked>
                                            <label class="form-check-label fw-bold ms-2">Stripe Connect</label>
                                        </div>
                                    </div>
                                    <div class="border rounded-3 p-3 d-flex align-items-center bg-light">
                                        <div class="form-check form-switch m-0">
                                            <input class="form-check-input" type="checkbox" role="switch" checked>
                                            <label class="form-check-label fw-bold ms-2">Razorpay UPI</label>
                                        </div>
                                    </div>
                                    <div class="border rounded-3 p-3 d-flex align-items-center bg-light opacity-50">
                                        <div class="form-check form-switch m-0">
                                            <input class="form-check-input" type="checkbox" role="switch" disabled>
                                            <label class="form-check-label fw-bold ms-2">Bank Wire Transfer</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Security Policies -->
                    <div class="tab-pane fade" id="v-pills-security" role="tabpanel" aria-labelledby="v-pills-security-tab">
                        <div class="glass-card shadow-sm border-0 bg-white p-4 p-md-5">
                            <h4 class="fw-bold mb-4 text-dark"><i class="bi bi-shield-lock-fill me-2 text-danger"></i> Security Policies</h4>
                            
                            <div class="alert alert-danger bg-opacity-10 border-danger border-opacity-25 rounded-3 mb-4">
                                <div class="d-flex">
                                    <i class="bi bi-exclamation-triangle-fill fs-4 text-danger me-3"></i>
                                    <div>
                                        <h6 class="fw-bold mb-1 text-danger">Critical Infrastructure Settings</h6>
                                        <p class="mb-0 small text-dark">Modifying these parameters affects globally active sessions and data governance policies. Proceed with caution.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-4 border-bottom pb-4">
                                <label class="fw-bold text-dark mb-3 fs-5">MFA Enforcement</label>
                                <div class="form-check form-switch fs-5 mb-2">
                                    <input class="form-check-input" type="checkbox" role="switch" id="mfaToggle" checked>
                                    <label class="form-check-label ms-2 mt-1" for="mfaToggle">Require 2FA for 'Administrator' roles</label>
                                </div>
                            </div>
                            
                            <div class="mb-2">
                                <label class="fw-bold text-dark mb-2">Session Timeout Duration</label>
                                <select class="form-select form-select-lg shadow-sm" style="max-width: 300px;">
                                    <option value="15">15 Minutes</option>
                                    <option value="30" selected>30 Minutes</option>
                                    <option value="60">1 Hour</option>
                                    <option value="never">Never (Not Recommended)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Communications -->
                    <div class="tab-pane fade" id="v-pills-email" role="tabpanel" aria-labelledby="v-pills-email-tab">
                        <div class="glass-card shadow-sm border-0 bg-white p-4 p-md-5 text-center py-5">
                            <div class="d-inline-flex align-items-center justify-content-center bg-primary bg-opacity-10 text-primary rounded-circle mb-3" style="width: 80px; height: 80px;">
                                <i class="bi bi-envelope-check-fill fs-1"></i>
                            </div>
                            <h4 class="fw-bold text-dark">Communication Tiers Active</h4>
                            <p class="text-muted mx-auto" style="max-width: 400px;">System-generated emails and SMS dispatchers are currently healthy and responding via AWS SES and Twilio protocols.</p>
                            <button class="btn btn-outline-primary mt-3"><i class="bi bi-send-fill me-2"></i> Send Test Payload</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function saveSettings() {
            // Show loading state on button
            const btn = document.querySelector('button[onclick="saveSettings()"]');
            const originalHTML = btn.innerHTML;
            btn.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Saving...';
            btn.disabled = true;

            // Simulate network latency for realism
            setTimeout(() => {
                btn.innerHTML = originalHTML;
                btn.disabled = false;
                
                // Trigger the Toast configuration
                if(typeof showToast === 'function') {
                    showToast('Settings Saved', 'Platform configurations have been successfully updated in real-time.', 'success');
                } else {
                    alert("Platform configurations updated.");
                }
            }, 800);
        }
    </script>
</body>
</html>
