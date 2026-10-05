<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} | Food Delivery</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/privacy.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<%-- Gusto - Privacy Policy --%>
<div class="gusto-info-page policy-page">
    <section class="policy-hero">
        <div class="policy-hero-content">
            <span class="policy-eyebrow">GUSTO LEGAL</span>
            <h1>Privacy <span>Policy</span></h1>
            <p>Your privacy matters to us. This policy explains what information Gusto may collect, how it may be used, and the choices available to you.</p>
            <div class="policy-updated"><i class="fa-regular fa-clock"></i><span>Last updated: September 2026</span></div>
        </div>
    </section>
    <section class="policy-layout info-section">
        <aside class="policy-sidebar">
            <div class="policy-sidebar-inner">
                <span>On this page</span>
                <a href="#introduction">Introduction</a>
                <a href="#information">Information We Collect</a>
                <a href="#usage">How We Use Information</a>
                <a href="#cookies">Cookies</a>
                <a href="#sharing">Information Sharing</a>
                <a href="#security">Data Security</a>
                <a href="#retention">Data Retention</a>
                <a href="#rights">Your Rights</a>
                <a href="#children">Children's Privacy</a>
                <a href="#changes">Policy Changes</a>
                <a href="#contact">Contact Us</a>
            </div>
        </aside>
        <main class="policy-content">
            <section class="policy-section" id="introduction">
                <span class="policy-number">01</span>
                <h2>Introduction</h2>
                <p>Welcome to Gusto. Gusto is a food discovery and ordering platform designed to connect customers with restaurants and their menus.</p>
                <p>This Privacy Policy describes the types of information that may be collected when you use Gusto and explains how that information may be handled. By using Gusto, you acknowledge the practices described in this policy.</p>
            </section>
            <section class="policy-section" id="information">
                <span class="policy-number">02</span>
                <h2>Information We Collect</h2>
                <p>Depending on how you use Gusto, we may collect information that helps us provide and improve the service.</p>
                <h3>Information you provide</h3>
                <ul>
                    <li>Name and account information</li>
                    <li>Email address and contact details</li>
                    <li>Delivery information when required for an order</li>
                    <li>Order history and preferences</li>
                    <li>Information you provide when contacting support</li>
                </ul>
                <h3>Information collected automatically</h3>
                <p>We may collect limited technical information such as browser type, device information, pages visited, and general usage information to help maintain and improve the platform.</p>
            </section>
            <section class="policy-section" id="usage">
                <span class="policy-number">03</span>
                <h2>How We Use Information</h2>
                <p>Information may be used for purposes such as:</p>
                <ul>
                    <li>Creating and managing your Gusto account</li>
                    <li>Processing and managing food orders</li>
                    <li>Providing customer support</li>
                    <li>Improving the functionality and user experience of Gusto</li>
                    <li>Communicating important service-related information</li>
                    <li>Protecting the platform against misuse and unauthorized activity</li>
                </ul>
            </section>
            <section class="policy-section" id="cookies">
                <span class="policy-number">04</span>
                <h2>Cookies and Similar Technologies</h2>
                <p>Gusto may use cookies or similar technologies to maintain sessions, remember preferences, understand how the platform is used, and improve the overall experience.</p>
                <p>You can manage cookies through your browser settings. Disabling certain cookies may affect some functionality of the application.</p>
            </section>
            <section class="policy-section" id="sharing">
                <span class="policy-number">05</span>
                <h2>Information Sharing</h2>
                <p>Gusto does not intend to sell personal information to third parties. Information may be shared when necessary to provide requested services or operate the platform.</p>
                <p>For example, information relevant to an order may need to be made available to the applicable restaurant or service provider so that the order can be processed.</p>
                <p>Information may also be disclosed when required by applicable law or when necessary to protect the rights, security, or integrity of Gusto and its users.</p>
            </section>
            <section class="policy-section" id="security">
                <span class="policy-number">06</span>
                <h2>Data Security</h2>
                <p>We take reasonable measures to protect information handled through Gusto against unauthorized access, alteration, disclosure, or destruction.</p>
                <p>However, no internet-based application or method of electronic storage can guarantee absolute security. Users should also take appropriate steps to protect their account credentials.</p>
            </section>
            <section class="policy-section" id="retention">
                <span class="policy-number">07</span>
                <h2>Data Retention</h2>
                <p>Information may be retained for as long as reasonably necessary to provide services, maintain business and transaction records, resolve disputes, enforce applicable terms, and meet legal or operational requirements.</p>
            </section>
            <section class="policy-section" id="rights">
                <span class="policy-number">08</span>
                <h2>Your Rights</h2>
                <p>Depending on applicable law, you may have rights regarding your personal information, including the ability to request access, correction, or deletion of certain information.</p>
                <p>To make a privacy-related request, please contact Gusto using the contact details provided below. We may need to verify your identity before processing certain requests.</p>
            </section>
            <section class="policy-section" id="children">
                <span class="policy-number">09</span>
                <h2>Children's Privacy</h2>
                <p>Gusto is not intended to knowingly collect personal information from children who are not permitted to use the service under applicable law. If you believe a child has provided personal information to Gusto, please contact us so that appropriate action can be considered.</p>
            </section>
            <section class="policy-section" id="changes">
                <span class="policy-number">10</span>
                <h2>Changes to This Policy</h2>
                <p>Gusto may update this Privacy Policy from time to time to reflect changes to the service, technology, legal requirements, or our practices.</p>
                <p>When changes are made, the updated policy will be published on this page along with a revised update date.</p>
            </section>
            <section class="policy-section" id="contact">
                <span class="policy-number">11</span>
                <h2>Contact Us</h2>
                <p>If you have questions or concerns about this Privacy Policy or how information is handled by Gusto, you can contact us through our Contact Us page.</p>
                <a href="${pageContext.request.contextPath}/info/contact" class="policy-link">Contact Gusto <i class="fa-solid fa-arrow-right"></i></a>
            </section>
            <div class="policy-notice">
                <i class="fa-solid fa-circle-info"></i>
                <p>This Privacy Policy is prepared for the Gusto food-delivery application project and describes the intended handling of information within the application.</p>
            </div>
        </main>
    </section>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>