<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us - Assured Contract Farming</title>
        <link rel="website icon" type="png" href="/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <link rel="stylesheet" href="/global-theme.css">
    </head>

    <body class="d-flex flex-column min-vh-100 bg-light">

        <!-- Header -->
        <nav class="navbar navbar-expand-lg premium-nav py-3 sticky-top">
            <div class="container">
                <a class="navbar-brand fw-bold d-flex align-items-center" href="/">
                    <div class="bg-success p-2 rounded-circle me-2 d-flex shadow-sm">
                        <i class="bi bi-seedling fs-5 text-white m-0 lh-1"></i>
                    </div>
                    <span class="text-dark">CFS</span>
                </a>
                <button class="navbar-toggler shadow-none border-0" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navContact">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navContact">
                    <ul class="navbar-nav ms-auto fw-semibold">
                        <li class="nav-item"><a class="nav-link px-3" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-3" href="/about">About Us</a></li>
                        <li class="nav-item"><a class="nav-link px-3" href="/privacy">Privacy Policy</a></li>
                        <li class="nav-item"><a class="nav-link px-3 active text-success" href="/contact">Contact</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="container py-5 flex-grow-1">
            <div class="row justify-content-center">
                <div class="col-lg-10 col-xl-8">

                    <div class="text-center mb-5">
                        <h1 class="fw-bold text-dark display-5 mb-3">We'd Love to Hear from You</h1>
                        <p class="text-muted fs-5 mx-auto" style="max-width: 600px;">
                            Have questions, feedback, or need technical support regarding your contracts? Our dedicated
                            team is here to help.
                        </p>
                    </div>

                    <div class="row g-4 mb-5">
                        <div class="col-md-4">
                            <div class="glass-card text-center p-4 h-100 border-0 hover-elevate">
                                <i class="bi bi-envelope-paper-fill text-primary fs-1 mb-3 d-block"></i>
                                <h5 class="fw-bold text-dark">Email Us</h5>
                                <a href="mailto:support@contractfarming.com"
                                    class="text-decoration-none text-muted">support@cfs.com</a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="glass-card text-center p-4 h-100 border-0 hover-elevate">
                                <i class="bi bi-telephone-fill text-success fs-1 mb-3 d-block"></i>
                                <h5 class="fw-bold text-dark">Call Us</h5>
                                <span class="text-muted">+1-800-555-1234</span>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="glass-card text-center p-4 h-100 border-0 hover-elevate">
                                <i class="bi bi-geo-alt-fill text-danger fs-1 mb-3 d-block"></i>
                                <h5 class="fw-bold text-dark">Headquarters</h5>
                                <span class="text-muted">123 Agriculture Ln, Greenfield</span>
                            </div>
                        </div>
                    </div>

                    <!-- Contact Form -->
                    <div class="glass-card p-4 p-md-5 border-0 shadow-sm">
                        <h3 class="fw-bold text-dark mb-4"><i class="bi bi-chat-dots-fill text-primary me-2"></i> Send a
                            Direct Message</h3>
                        <form action="https://api.web3forms.com/submit" method="post">
                            <!-- Replace with your actual Web3Forms access key if keeping this -->
                            <input type="hidden" name="access_key" value="93ef86da-f425-4fa7-945b-9f54801adb49" />

                            <div class="row g-4 mb-4">
                                <div class="col-md-6">
                                    <label for="name"
                                        class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Full
                                        Name</label>
                                    <input type="text" id="name" name="name"
                                        class="form-control form-control-lg bg-light border-0 shadow-none px-4"
                                        placeholder="John Doe" required style="border-radius: 1rem;">
                                </div>
                                <div class="col-md-6">
                                    <label for="email"
                                        class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Email
                                        Address</label>
                                    <input type="email" id="email" name="email"
                                        class="form-control form-control-lg bg-light border-0 shadow-none px-4"
                                        placeholder="john@example.com" required style="border-radius: 1rem;">
                                </div>
                            </div>

                            <div class="mb-4">
                                <label for="message"
                                    class="form-label fw-bold small text-muted text-uppercase tracking-wider ms-1">Message</label>
                                <textarea id="message" name="message" rows="5"
                                    class="form-control form-control-lg bg-light border-0 shadow-none px-4 py-3"
                                    placeholder="How can we help you today?" required
                                    style="border-radius: 1rem; resize: none;"></textarea>
                            </div>

                            <button type="submit"
                                class="btn btn-premium w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm">Submit Request <i
                                    class="bi bi-send ms-2"></i></button>
                        </form>
                    </div>

                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="bg-white border-top py-4 mt-auto">
            <div class="container text-center">
                <p class="mb-0 text-muted fw-semibold">&copy; 2024 Assured Contract Farming System. All rights reserved.
                </p>
            </div>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>