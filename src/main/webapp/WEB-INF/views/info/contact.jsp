<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} | Food Delivery</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/contact.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<%-- Gusto - Contact Page --%>
<div class="gusto-info-page contact-page">
    <section class="contact-hero">
        <div class="contact-hero-content">
            <span class="contact-eyebrow">CONTACT GUSTO</span>
            <h1>We're here to <span>help.</span></h1>
            <p>Have a question, need help with an order, or want to work with Gusto? Reach out to us and we'll be happy to hear from you.</p>
        </div>
    </section>
    <section class="contact-content info-section">
        <div class="contact-grid">
            <div class="contact-info">
                <div class="section-heading">
                    <span class="section-eyebrow">GET IN TOUCH</span>
                    <h2>Let's talk about it.</h2>
                    <p>Choose the right way to reach us. Whether you're a customer, restaurant partner, or simply have a question, we're here to help.</p>
                </div>
                <div class="contact-cards">
                    <div class="contact-card">
                        <div class="contact-card-icon"><i class="fa-solid fa-headset"></i></div>
                        <div class="contact-card-content">
                            <span>Customer Support</span>
                            <h3>Need help with an order?</h3>
                            <a href="mailto:support@gusto.example">support@gusto.example</a>
                        </div>
                    </div>
                    <div class="contact-card">
                        <div class="contact-card-icon"><i class="fa-solid fa-envelope"></i></div>
                        <div class="contact-card-content">
                            <span>General Enquiries</span>
                            <h3>Have something to ask?</h3>
                            <a href="mailto:hello@gusto.example">hello@gusto.example</a>
                        </div>
                    </div>
                    <div class="contact-card">
                        <div class="contact-card-icon"><i class="fa-solid fa-store"></i></div>
                        <div class="contact-card-content">
                            <span>Restaurant Partners</span>
                            <h3>Want to partner with Gusto?</h3>
                            <a href="mailto:partners@gusto.example">partners@gusto.example</a>
                        </div>
                    </div>
                </div>
                <div class="support-hours">
                    <div class="support-hours-icon"><i class="fa-regular fa-clock"></i></div>
                    <div>
                        <span>Support Hours</span>
                        <strong>Monday – Sunday, 9:00 AM – 10:00 PM</strong>
                        <p>We're available throughout the week to assist with your questions.</p>
                    </div>
                </div>
            </div>
            <div class="contact-form-wrapper">
                <div class="contact-form-header">
                    <span class="section-eyebrow">SEND A MESSAGE</span>
                    <h2>How can we help?</h2>
                    <p>Fill out the form below and tell us what you need.</p>
                </div>
                <form class="contact-form" action="https://formspree.io/f/mljgragb" method="post">
                    <div class="form-row">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" placeholder="Your name" value="${sessionScope.loggedInUser.userName}" autocomplete="name">
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="you@example.com" value="${sessionScope.loggedInUser.email}" autocomplete="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <select id="subject" name="subject">
                            <option value="" selected disabled>Select a subject</option>
                            <option value="order">Order Support</option>
                            <option value="restaurant">Restaurant Enquiry</option>
                            <option value="account">Account Support</option>
                            <option value="feedback">Feedback</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea id="message" name="message" rows="7" placeholder="Tell us how we can help..."></textarea>
                    </div>
                    <button type="submit" class="contact-submit-btn">Send Message <i class="fa-solid fa-arrow-right"></i></button>
                </form>
            </div>
        </div>
    </section>
    <section class="contact-bottom info-section">
        <div class="contact-bottom-card">
            <div class="contact-bottom-icon"><i class="fa-solid fa-location-dot"></i></div>
            <div>
                <span>Gusto</span>
                <h3>Made for food lovers.</h3>
                <p>Discover restaurants, explore menus, and enjoy a simpler way to order the food you love.</p>
            </div>
        </div>
    </section>
</div>
<jsp:include page="/WEB-INF/views/common/guest-footer.jsp"/>
</body>
</html>