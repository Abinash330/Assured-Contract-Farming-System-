# Assured Contract Farming System (CFS)

An enterprise-grade platform designed to bridge the trust gap between ambitious farmers and reliable corporate buyers. This system facilitates fair, transparent, and legally binding farming contracts, ensuring stable income for farmers and a guaranteed supply pipeline for buyers. 

![Aesthetic UI](src/main/resources/static/images/logo.png)

---

## 🚀 How It Works
The platform acts as a secure marketplace and escrow service, eliminating middlemen:
1. **Listings:** Farmers list their available land, upcoming crops, and expected yields.
2. **Proposals:** Buyers browse the dynamic marketplace and propose binding contracts for specific commodities.
3. **Agreements:** Both parties negotiate pricing and terms. Once mutually accepted, an immutable digital contract is generated.
4. **Escrow Guarantee:** Buyers lock the required funds into a secure digital escrow gateway.
5. **Execution:** Upon successful harvest and delivery (verified by Inspectors if necessary), the funds are instantly released to the Farmer's digital wallet. 

---

## 🧑‍🌾 How It Helps a Farmer
The CFS platform is built from the ground up to protect and empower the agricultural backbone of our economy:
- **Price Security:** Securing pre-agreed contract prices protects farmers from sudden market crashes and volatility.
- **Guaranteed Buyers:** Eliminates the stress and logistical nightmare of finding a buyer post-harvest.
- **Financial Safety:** The escrow payment model ensures farmers get paid the exact agreed amount, on time, without the risk of buyer default or fraud.
- **Maximized Profit:** By removing commission agents, brokers, and middlemen, farmers retain 100% of their negotiated value.
- **Fair Dispute Resolution:** If a buyer acts unfairly, farmers have direct access to an Admin mediation queue to resolve disputes quickly.

---

## 🌟 Core Features

- **Secure Authentication:** Multi-role authorization protecting Farmers, Buyers, and System Administrators.
- **KYC Verification Subsystem:** Mandatory identity verification checks to prevent fraudulent accounts.
- **Dynamic Crop Marketplace:** Rich, responsive grid where buyers can search and filter available crops.
- **Smart Contract Lifecycle Management:** Full CRUD operations for contracts, moving seamlessly from `Pending` -> `Accepted` -> `Completed` or `Disputed`.
- **Escrow Payment Gateway:** Simulated digital wallet system allowing buyers to credit nodes and lock funds against active contracts.
- **Dispute Resolution Engine:** Dedicated admin queue to manually review case files, favor plaintiffs, and route escrow payouts.
- **Interactive Dashboards:** Role-specific analytics panels featuring glassmorphism `.glass-card` styling and data tables.
- **Premium Global UI:** A stunning, highly-polished user interface rebuilt with Tailwind CSS, custom Bootstrap 5 overrides, micro-animations, and the modern *Outfit* typeface.

---

## 👑 Admin Control Center Innovations (New!)
The platform's administrative command center has been fundamentally overhauled into a premium, responsive, industrial-grade software interface:
- **Phase 1 (Layout & Analytics):** Transitioned to an elegant fixed vertical sidebar architecture. Integrated real-time Chart.js visual data models on the dashboard to track active contracts and system escrow volume dynamically.
- **Phase 2 (Interactive DataGrids):** Engineered client-side real-time Search/Filter algorithms for instant datagrid sorting. Developed a custom, animated z-indexed Toast Notification system (`cfsToastContainer`) to replace native browser alerts.
- **Phase 3 (System Preferences):** Designed a dedicated `/admin/settings` panel using secure controller mappings and glassmorphic Bootstrap Pills. Includes functional toggles for realistic business variables, such as switching into "Maintenance Mode" or configuring the platform transaction commission rate.
- **Phase 4 (Enterprise PDF Engine & Omnibar):** Built a precise HTML-to-PDF compilation engine utilizing `html2pdf.js`, empowering admins to instantly export and download formatted, layout-aware PDF ledgers. Upgraded the Topbar navigation with a live Javascript SDK system clock and a CSS-animated "System Health" network pulse orb.
- **Phase 5 (Public & Authentication Modernization):** Thoroughly redesigned user-facing pages including `/login`, `/register`, and `/profile`. Implemented a premium split-screen layout for authentication processes, glassmorphism UI cards for displaying core identity parameters, dynamic hero banners using radial gradients, and fluid micro-animations.
- **Phase 6 (Enterprise Agritech Innovations):** Integrated a real-time Weather Forecast REST API (`open-meteo.com`) directly into the dashboards alongside a high-fidelity Javascript IoT Precision Farming chart simulating critical soil metrics. Upgraded the Contract Ledger with WebCrypto SHA-256 client-side cryptographic hashing to simulate immutable blockchain agreements.

---

## 💻 Technologies Used

### Backend Integration
- **Java 17:** Primary programming language.
- **Spring Boot 3.x:** Core application framework ensuring rapid, secure, and robust development.
- **Spring Security** Role-based access control, cryptographic password hashing (BCrypt).
- **Spring Data JPA / Hibernate:** ORM layer for seamless relational data mapping.
- **MySQL:** Primary relational database for resilient data persistence.

### Frontend Aesthetics
- **JSP (Jakarta Server Pages):** Server-side view rendering.
- **Tailwind CSS:** Utility-first styling for the hyper-modern Landing Page.
- **Bootstrap 5 & Custom CSS:** A robust `global-theme.css` was layered over Bootstrap to create a premium "Glassmorphism" UI with cohesive spacing, bespoke components, and micro-animations.
- **Bootstrap Icons:** High-quality SVG icons integrated across all dashboards.

---

## ⚙️ Running Locally

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Abinash330/Assured-Contract-Farming-System-.git
   cd Assured-Contract-Farming-System-
   ```

2. **Database Configuration:**
   Ensure you have a MySQL server running. Update your `src/main/resources/application.properties` with your credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/cfs_db
   spring.datasource.username=root
   spring.datasource.password=your_password
   ```

3. **Compile and Run:**
   ```bash
   mvn clean compile
   mvn spring-boot:run
   ```

4. **Access the Application:**
   Open a browser and navigate to `http://localhost:8081` (or your configured port).
