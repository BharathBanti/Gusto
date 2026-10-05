<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Food Delivery App</title>
        <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/guest/homepage.css">
    </head>
    <body>
        <%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
        <main>
            <section class="hero-section">
                <div class="container hero-container">
                    <div class="hero-content">
                        <span class="hero-badge">
                            <i class="fa-solid fa-bolt"></i>
                            Fast & Fresh Delivery
                        </span>
                        <h1>
                            Good food.
                            <span>Great mood.</span>
                        </h1>
                        <p>
                            Discover the best restaurants and delicious
                            meals around you. Order your favorites and
                            get them delivered right to your doorstep.
                        </p>

                        <!-- Search -->
                        <form action="${pageContext.request.contextPath}/homesearch"
                              method="get"
                              class="hero-search">
                            <div class="search-drop-down">
                                <select name="type">
                                    <option value="dish">Dish</option>
                                    <option value="restaurant">Restaurant</option>
                                </select>
                            </div>
                            <div class="search-icon">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </div>
                            <input type="text"
                                   name="query"
                                   placeholder="Search restaurants or cuisines..."
                                   autocomplete="off">
                            <button type="submit">
                                Search
                            </button>
                        </form>

                        <div class="hero-features">
                            <span>
                                <i class="fa-solid fa-circle-check"></i>
                                No minimum order
                            </span>
                            <span>
                                <i class="fa-solid fa-circle-check"></i>
                                Fast delivery
                            </span>
                            <span>
                                <i class="fa-solid fa-circle-check"></i>
                                Secure payment
                            </span>
                        </div>
                    </div>

                    <!-- Hero Visual -->
                    <div class="hero-visual">
                        <div class="hero-circle"></div>
                        <div class="hero-food-card">
                            <div class="hero-food-image">
                                <img src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=700&q=80"
                                     alt="Delicious food">
                            </div>
                            <div class="hero-food-info">
                                <div>
                                    <strong>
                                        Delicious meals
                                    </strong>
                                    <span>
                                        Delivered to you
                                    </span>
                                </div>
                                <div class="hero-rating">
                                    <i class="fa-solid fa-star"></i>
                                    4.8
                                </div>
                            </div>
                        </div>

                        <div class="floating-card floating-delivery">
                            <div class="floating-icon">
                                <i class="fa-solid fa-motorcycle"></i>
                            </div>
                            <div>
                                <strong>
                                    Fast delivery
                                </strong>
                                <span>
                                    At your doorstep
                                </span>
                            </div>
                        </div>


                        <div class="floating-card floating-rating">
                            <div class="floating-icon rating-icon">
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <div>
                                <strong>
                                    4.8 / 5
                                </strong>
                                <span>
                                    Customer rating
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- =================================================
                 FOOD CATEGORIES
                 ================================================= -->
            <section class="categories-section">
                <div class="container">
                    <div class="section-heading">
                        <div>
                            <span class="section-eyebrow">
                                EXPLORE
                            </span>
                            <h2>
                                What are you craving?
                            </h2>
                        </div>
                    </div>
                    <div class="category-grid">
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=pizza"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://png.pngtree.com/png-vector/20250124/ourmid/pngtree-mouth-watering-pepperoni-pizza-slice-png-image_15317290.png">
                            </div>
                            <span>Pizza</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=burger"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://png.pngtree.com/png-clipart/20231017/original/pngtree-burger-food-png-free-download-png-image_13329458.png">
                            </div>
                            <span>Burgers</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=biryani"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://png.pngtree.com/png-vector/20240712/ourmid/pngtree-a-delicious-chicken-biryani-png-image_13066955.png">
                            </div>
                            <span>Biryani</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=dosa"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://static.vecteezy.com/system/resources/previews/059/319/962/non_2x/south-indian-dosa-breakfast-on-transparent-background-png.png">
                            </div>
                            <span>Dosa</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=coffee"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://png.pngtree.com/png-clipart/20240405/original/pngtree-cup-of-hot-cappuccino-coffee-on-white-background-png-image_14759211.png">
                            </div>
                            <span>Coffee</span>
                        </a>
                        <a href="${pageContext.request.contextPath}/homesearch?type=dish&query=vada"
                           class="category-card">
                            <div class="category-icon">
                                <img src="https://static.vecteezy.com/system/resources/thumbnails/068/620/068/small_2x/medu-vada-crispy-lentil-doughnut-served-with-sambar-and-coconut-chutney-garnished-with-fresh-coriander-traditional-south-indian-breakfast-appetizing-and-savory-png.png">
                            </div>
                            <span>Vada</span>
                        </a>
                    </div>
                </div>
            </section>

            <!-- =================================================
                 TOP RATED RESTAURANTS
                 ================================================= -->
            <section class="restaurants-section">
                <div class="container">
                    <div class="section-heading">
                        <div>
                            <span class="section-eyebrow">
                                TOP RATED
                            </span>
                            <h2>
                                Popular restaurants
                            </h2>
                            <p>
                                Highly rated restaurants loved by our customers.
                            </p>
                        </div>
                        <a href="${pageContext.request.contextPath}/guest/restaurants"
                           class="view-all-link">
                            View all
                            <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                    <div class="restaurant-grid">
                        <c:forEach var="restaurant"
                                   items="${popularRestaurants}">
                            <article class="home-restaurant-card">
                                <!-- Image -->
                                <div class="home-restaurant-image">
                                    <img src="${restaurant.imagePath}"
                                         alt="${restaurant.name}"
                                         onerror="this.src='https://placehold.co/600x400/f5f5f5/999999?text=Restaurant';">
                                    <c:choose>
                                        <c:when test="${restaurant.isActive}">
                                            <span class="home-status status-open">
                                                <span></span>
                                                Open
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="home-status status-closed">
                                                <span></span>
                                                Closed
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <!-- Content -->
                                <div class="home-restaurant-content">
                                    <h3>
                                        <c:out value="${restaurant.name}"/>
                                    </h3>
                                    <p class="home-cuisine">
                                        <i class="fa-solid fa-utensils"></i>
                                        <c:out value="${restaurant.cuisineType}"/>
                                    </p>
                                    <div class="home-restaurant-meta">
                                        <span class="home-rating">
                                            <i class="fa-solid fa-star"></i>
                                            ${restaurant.rating}
                                        </span>
                                        <span class="meta-dot">
                                            •
                                        </span>
                                        <span>
                                            <i class="fa-regular fa-clock"></i>
                                            ${restaurant.deliveryTime} mins
                                        </span>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/guest/restaurants/view?id=${restaurant.restaurantId}"
                                       class="restaurant-view-button">
                                        View Restaurant
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>
                            </article>
                        </c:forEach>
                        <c:if test="${empty popularRestaurants}">
                            <div class="empty-home-state">
                                <i class="fa-solid fa-store-slash"></i>
                                <h3>
                                    No restaurants available
                                </h3>
                                <p>
                                    Check back soon for delicious restaurants.
                                </p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>

            <!-- =================================================
                 POPULAR DISHES
                 ================================================= -->
            <section class="dishes-section">
                <div class="container">
                    <div class="section-heading">
                        <div>
                            <span class="section-eyebrow">
                                CUSTOMER FAVORITES
                            </span>
                            <h2>
                                Popular dishes
                            </h2>
                            <p>
                                Delicious dishes worth trying.
                            </p>
                        </div>
                    </div>
                    <div class="dish-grid">
                        <c:forEach var="item"
                                   items="${popularMenuItems}">
                            <article class="dish-card">
                                <div class="dish-image">
                                    <img src="${item.imagePath}"
                                         alt="${item.itemName}"
                                         onerror="this.src='https://placehold.co/500x400/f5f5f5/999999?text=Food';">
                                </div>
                                <div class="dish-content">
                                    <div class="dish-name-row">
                                        <h3>
                                            <c:out value="${item.itemName}"/>
                                        </h3>
                                        <span class="dish-price">
                                            ₹${item.price}
                                        </span>
                                    </div>
                                    <p class="dish-description">
                                        <c:out value="${item.description}"/>
                                    </p>
                                    <c:choose>
                                        <c:when test="${item.isAvailable}">
                                            <span class="availability available">
                                                <span></span>
                                                Available
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="availability unavailable">
                                                <span></span>
                                                Currently unavailable
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </article>
                        </c:forEach>
                        <c:if test="${empty popularMenuItems}">
                            <div class="empty-home-state">
                                <i class="fa-solid fa-bowl-food"></i>
                                <h3>
                                    Popular dishes coming soon
                                </h3>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>

            <!-- =================================================
                 WHY FOODHUB
                 ================================================= -->
            <section class="why-section">
                <div class="container">
                    <div class="section-heading centered">
                        <span class="section-eyebrow">
                            WHY GUSTO
                        </span>
                        <h2>
                            Everything you need for a great meal
                        </h2>
                        <p>
                            We make ordering your favorite food simple,
                            fast and convenient.
                        </p>
                    </div>
                    <div class="benefits-grid">
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fa-solid fa-bolt"></i>
                            </div>
                            <h3>
                                Fast Delivery
                            </h3>
                            <p>
                                Get your favorite meals delivered quickly
                                and conveniently.
                            </p>
                        </div>
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fa-solid fa-star"></i>
                            </div>
                            <h3>
                                Top Rated
                            </h3>
                            <p>
                                Discover highly rated restaurants and
                                dishes loved by customers.
                            </p>
                        </div>
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fa-solid fa-shield-halved"></i>
                            </div>
                            <h3>
                                Secure Payments
                            </h3>
                            <p>
                                Your payment information is handled
                                securely throughout your order.
                            </p>
                        </div>
                        <div class="benefit-card">
                            <div class="benefit-icon">
                                <i class="fa-solid fa-headset"></i>
                            </div>
                            <h3>
                                Easy Support
                            </h3>
                            <p>
                                We're here to help whenever you need
                                assistance with your order.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- =================================================
                 CALL TO ACTION
                 ================================================= -->
            <section class="cta-section">
                <div class="container">
                    <div class="cta-container">
                        <div class="cta-content">
                            <span class="cta-eyebrow">
                                READY TO ORDER?
                            </span>
                            <h2>
                                Your next favorite meal
                                is just a few clicks away.
                            </h2>
                            <p>
                                Explore restaurants, discover delicious
                                dishes and order what you're craving.
                            </p>
                            <a href="${pageContext.request.contextPath}/guest/restaurants"
                               class="cta-button">
                                Explore Restaurants
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="cta-icon">
                            <i class="fa-solid fa-bowl-food"></i>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
    </body>
</html>