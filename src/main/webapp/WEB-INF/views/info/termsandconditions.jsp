<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} | Food Delivery</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/termsandconditions.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<%-- Gusto - Terms & Conditions --%>
<div class="gusto-info-page policy-page">
    <section class="policy-hero">
        <div class="policy-hero-content">
            <span class="policy-eyebrow">GUSTO LEGAL</span>
            <h1>Terms & <span>Conditions</span></h1>
            <p>These terms explain the rules and conditions that apply when you access or use the Gusto food discovery and ordering platform.</p>
            <div class="policy-updated"><i class="fa-regular fa-clock"></i><span>Last updated: September 2026</span></div>
        </div>
    </section>
    <section class="policy-layout info-section">
        <aside class="policy-sidebar">
            <div class="policy-sidebar-inner">
                <span>On this page</span>
                <a href="#acceptance">Acceptance of Terms</a>
                <a href="#using-gusto">Using Gusto</a>
                <a href="#accounts">User Accounts</a>
                <a href="#restaurants">Restaurant Listings</a>
                <a href="#orders">Orders</a>
                <a href="#pricing">Pricing & Availability</a>
                <a href="#payments">Payments</a>
                <a href="#cancellations">Cancellations</a>
                <a href="#responsibilities">User Responsibilities</a>
                <a href="#prohibited">Prohibited Activities</a>
                <a href="#intellectual">Intellectual Property</a>
                <a href="#availability">Service Availability</a>
                <a href="#liability">Limitation of Liability</a>
                <a href="#changes">Changes to Terms</a>
                <a href="#contact">Contact Us</a>
            </div>
        </aside>
        <main class="policy-content">
            <section class="policy-section" id="acceptance">
                <span class="policy-number">01</span>
                <h2>Acceptance of Terms</h2>
                <p>Welcome to Gusto. By accessing or using Gusto, you agree to comply with these Terms & Conditions and any applicable policies referenced within them.</p>
                <p>If you do not agree with these terms, please do not use the Gusto platform.</p>
            </section>
            <section class="policy-section" id="using-gusto">
                <span class="policy-number">02</span>
                <h2>Using Gusto</h2>
                <p>Gusto provides a platform through which users can discover restaurants, browse menus, and place food orders.</p>
                <p>You agree to use Gusto only for lawful purposes and in accordance with these terms. Gusto may update, modify, or improve features of the platform from time to time.</p>
            </section>
            <section class="policy-section" id="accounts">
                <span class="policy-number">03</span>
                <h2>User Accounts</h2>
                <p>Certain features may require you to create an account. You are responsible for providing accurate information and keeping your account credentials secure.</p>
                <p>You should notify Gusto if you believe your account has been accessed without authorization. You are responsible for activity carried out through your account unless applicable law provides otherwise.</p>
            </section>
            <section class="policy-section" id="restaurants">
                <span class="policy-number">04</span>
                <h2>Restaurant Listings</h2>
                <p>Restaurant names, menus, descriptions, prices, images, availability, and other information displayed on Gusto may be provided or maintained by restaurants or other authorized sources.</p>
                <p>Restaurants are responsible for the accuracy of the information they provide and for preparing orders according to the applicable order details.</p>
            </section>
            <section class="policy-section" id="orders">
                <span class="policy-number">05</span>
                <h2>Orders</h2>
                <p>When you place an order through Gusto, you are requesting the selected products from the applicable restaurant.</p>
                <p>An order may be subject to restaurant acceptance and availability. An order confirmation does not necessarily guarantee that every item will remain available until preparation is complete.</p>
                <p>If an order cannot be fulfilled, the applicable order amount may be cancelled or refunded according to the Refund & Cancellation Policy.</p>
            </section>
            <section class="policy-section" id="pricing">
                <span class="policy-number">06</span>
                <h2>Pricing & Availability</h2>
                <p>Prices and availability of food items may change without prior notice. The applicable price displayed during the ordering process is the price intended to apply to that order, subject to correction of obvious errors.</p>
                <p>Additional charges, such as applicable taxes, delivery charges, or service fees, may be displayed separately where applicable.</p>
            </section>
            <section class="policy-section" id="payments">
                <span class="policy-number">07</span>
                <h2>Payments</h2>
                <p>Where payment functionality is available, users must provide valid payment information and authorize the applicable payment method for the order.</p>
                <p>Payment processing may be handled through a third-party payment provider. Gusto may not directly store or process all payment information.</p>
                <p>If a payment fails or an order cannot be completed, the transaction may be reversed or handled according to the applicable payment provider's procedures.</p>
            </section>
            <section class="policy-section" id="cancellations">
                <span class="policy-number">08</span>
                <h2>Cancellations</h2>
                <p>Order cancellation availability may depend on the status of the order and whether the restaurant has started preparing it.</p>
                <p>Where cancellation is available, the applicable cancellation process will be communicated through the platform. Refund eligibility is governed by the Gusto Refund & Cancellation Policy.</p>
            </section>
            <section class="policy-section" id="responsibilities">
                <span class="policy-number">09</span>
                <h2>User Responsibilities</h2>
                <p>When using Gusto, you agree to:</p>
                <ul>
                    <li>Provide accurate information when creating and using your account.</li>
                    <li>Use the platform only for lawful purposes.</li>
                    <li>Keep your account credentials confidential.</li>
                    <li>Provide accurate delivery and contact information when placing an order.</li>
                    <li>Review order details before submitting an order.</li>
                    <li>Respect restaurants, delivery personnel, support staff, and other users.</li>
                </ul>
            </section>
            <section class="policy-section" id="prohibited">
                <span class="policy-number">10</span>
                <h2>Prohibited Activities</h2>
                <p>You must not use Gusto to:</p>
                <ul>
                    <li>Break or violate applicable laws or regulations.</li>
                    <li>Attempt to gain unauthorized access to the platform or another user's account.</li>
                    <li>Submit fraudulent, misleading, or intentionally false information.</li>
                    <li>Interfere with the operation or security of Gusto.</li>
                    <li>Abuse promotional offers, refunds, cancellations, or other platform features.</li>
                    <li>Use automated methods to access or collect platform information without authorization.</li>
                </ul>
            </section>
            <section class="policy-section" id="intellectual">
                <span class="policy-number">11</span>
                <h2>Intellectual Property</h2>
                <p>The Gusto name, branding, interface design, software, graphics, text, logos, and other original materials associated with the platform may be protected by applicable intellectual property laws.</p>
                <p>You may not copy, reproduce, modify, distribute, or commercially exploit Gusto's protected materials without appropriate authorization.</p>
            </section>
            <section class="policy-section" id="availability">
                <span class="policy-number">12</span>
                <h2>Service Availability</h2>
                <p>Gusto may not always be available without interruption. The platform may be temporarily unavailable because of maintenance, technical issues, network problems, third-party services, or circumstances beyond reasonable control.</p>
                <p>Gusto may also modify, suspend, or discontinue features when necessary to maintain or improve the platform.</p>
            </section>
            <section class="policy-section" id="liability">
                <span class="policy-number">13</span>
                <h2>Limitation of Liability</h2>
                <p>To the extent permitted by applicable law, Gusto is not responsible for losses resulting from circumstances outside its reasonable control, including restaurant operations, inaccurate information supplied by third parties, delivery delays caused by external circumstances, network failures, or temporary service interruptions.</p>
                <p>Nothing in these terms is intended to exclude or limit rights or liabilities that cannot legally be excluded or limited.</p>
            </section>
            <section class="policy-section" id="changes">
                <span class="policy-number">14</span>
                <h2>Changes to These Terms</h2>
                <p>Gusto may update these Terms & Conditions when necessary to reflect changes to the platform, business practices, or applicable requirements.</p>
                <p>Updated terms will be published on this page with a revised update date. Continued use of Gusto after an update may be subject to the revised terms.</p>
            </section>
            <section class="policy-section" id="contact">
                <span class="policy-number">15</span>
                <h2>Contact Us</h2>
                <p>If you have questions about these Terms & Conditions, you can contact Gusto through our Contact Us page.</p>
                <a href="${pageContext.request.contextPath}/info/contact" class="policy-link">Contact Gusto <i class="fa-solid fa-arrow-right"></i></a>
            </section>
            <div class="policy-notice">
                <i class="fa-solid fa-circle-info"></i>
                <p>These Terms & Conditions are prepared for the Gusto food-delivery application project and describe the intended rules for using the application.</p>
            </div>
        </main>
    </section>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>