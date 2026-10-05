<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} | Food Delivery</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<%-- Gusto - About Page --%>
<div class="gusto-info-page about-page">
    <section class="about-hero">
        <div class="about-hero-content">
            <span class="about-eyebrow">ABOUT GUSTO</span>
            <h1>Good food.<br><span>Simple ordering.</span></h1>
            <p>Gusto brings restaurants, delicious food, and hungry customers together in one simple and convenient experience.</p>
            <a href="${pageContext.request.contextPath}/guest/restaurants" class="about-primary-btn">Explore Restaurants <i class="fa-solid fa-arrow-right"></i></a>
        </div>
        <div class="about-hero-visual">
            <div class="hero-glow"></div>
            <div class="hero-food-icon"><i class="fa-solid fa-utensils"></i></div>
            <div class="floating-card floating-card-one">
                <i class="fa-solid fa-bowl-food"></i>
                <div>
                    <strong>Great Food</strong>
                    <span>Made for every craving</span>
                </div>
            </div>
            <div class="floating-card floating-card-two">
                <i class="fa-solid fa-heart"></i>
                <div>
                    <strong>Made with Gusto</strong>
                    <span>Enjoy every bite</span>
                </div>
            </div>
        </div>
    </section>
    <section class="about-story info-section">
        <div class="section-heading">
            <span class="section-eyebrow">OUR STORY</span>
            <h2>Food brings people together.</h2>
            <p>Gusto was created with a simple idea: finding and ordering great food should be enjoyable, convenient, and effortless.</p>
        </div>
        <div class="story-content">
            <div class="story-card">
                <div class="story-icon"><i class="fa-solid fa-compass"></i></div>
                <h3>Discover</h3>
                <p>Explore restaurants, cuisines, dishes, and new flavors from one convenient place.</p>
            </div>
            <div class="story-card">
                <div class="story-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                <h3>Choose</h3>
                <p>Browse menus, discover your favorites, and choose exactly what you are craving.</p>
            </div>
            <div class="story-card">
                <div class="story-icon"><i class="fa-solid fa-face-smile"></i></div>
                <h3>Enjoy</h3>
                <p>Place your order and enjoy a simple food-ordering experience from start to finish.</p>
            </div>
        </div>
    </section>
    <section class="about-mission info-section">
        <div class="mission-visual">
            <div class="mission-icon"><i class="fa-solid fa-bowl-rice"></i></div>
        </div>
        <div class="mission-content">
            <span class="section-eyebrow">OUR MISSION</span>
            <h2>Making every food decision a little easier.</h2>
            <p>We believe great food should be easy to discover. Gusto is designed to connect people with restaurants and menus they love while keeping the ordering experience simple and intuitive.</p>
            <p>From discovering a new restaurant to choosing a familiar favorite, Gusto brings the essential parts of the food journey together in one place.</p>
        </div>
    </section>
    <section class="how-gusto-works info-section">
        <div class="section-heading centered">
            <span class="section-eyebrow">HOW GUSTO WORKS</span>
            <h2>From craving to table.</h2>
            <p>A simple experience designed around the way people enjoy food.</p>
        </div>
        <div class="steps-container">
            <div class="step-card">
                <span class="step-number">01</span>
                <div class="step-icon"><i class="fa-solid fa-magnifying-glass"></i></div>
                <h3>Discover</h3>
                <p>Find restaurants and explore menus that match your mood and cravings.</p>
            </div>
            <div class="step-connector"><i class="fa-solid fa-arrow-right"></i></div>
            <div class="step-card">
                <span class="step-number">02</span>
                <div class="step-icon"><i class="fa-solid fa-utensils"></i></div>
                <h3>Choose</h3>
                <p>Select your favorite dishes and build your perfect order.</p>
            </div>
            <div class="step-connector"><i class="fa-solid fa-arrow-right"></i></div>
            <div class="step-card">
                <span class="step-number">03</span>
                <div class="step-icon"><i class="fa-solid fa-bag-shopping"></i></div>
                <h3>Order</h3>
                <p>Review your choices and place your order with ease.</p>
            </div>
            <div class="step-connector"><i class="fa-solid fa-arrow-right"></i></div>
            <div class="step-card">
                <span class="step-number">04</span>
                <div class="step-icon"><i class="fa-solid fa-heart"></i></div>
                <h3>Enjoy</h3>
                <p>Sit back, relax, and enjoy the food you love.</p>
            </div>
        </div>
    </section>
    <section class="why-gusto info-section">
        <div class="section-heading centered">
            <span class="section-eyebrow">WHY GUSTO</span>
            <h2>Everything you need to enjoy food.</h2>
            <p>Gusto focuses on keeping the food discovery and ordering experience clear, convenient, and enjoyable.</p>
        </div>
        <div class="why-grid">
            <div class="why-card">
                <div class="why-icon"><i class="fa-solid fa-store"></i></div>
                <h3>Restaurant Discovery</h3>
                <p>Explore different restaurants and discover menus that fit your taste.</p>
            </div>
            <div class="why-card">
                <div class="why-icon"><i class="fa-solid fa-list-check"></i></div>
                <h3>Simple Experience</h3>
                <p>Browse, choose, and order through an experience designed to stay straightforward.</p>
            </div>
            <div class="why-card">
                <div class="why-icon"><i class="fa-solid fa-utensils"></i></div>
                <h3>More Choice</h3>
                <p>Discover different dishes and cuisines whenever you are ready to try something new.</p>
            </div>
            <div class="why-card">
                <div class="why-icon"><i class="fa-solid fa-mobile-screen-button"></i></div>
                <h3>Built for Convenience</h3>
                <p>Access the food discovery experience from a clean and easy-to-use platform.</p>
            </div>
        </div>
    </section>
    <section class="about-cta info-section">
        <div class="cta-content">
            <span class="section-eyebrow">READY TO EXPLORE?</span>
            <h2>Your next favorite meal is waiting.</h2>
            <p>Discover restaurants, explore menus, and find something delicious with Gusto.</p>
            <a href="${pageContext.request.contextPath}/home" class="about-primary-btn">Explore Gusto <i class="fa-solid fa-arrow-right"></i></a>
        </div>
    </section>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>