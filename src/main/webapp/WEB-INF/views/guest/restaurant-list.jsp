<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Restaurants</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <!-- Restaurant CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/guest/restaurant.css">
</head>
<body>
    <div class="admin-main">
        <%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
        <main class="restaurant-page">
            <!-- KEEP ALL YOUR EXISTING RESTAURANT PAGE CONTENT HERE -->
            <!-- ==========================================
             PAGE HEADER
             ========================================== -->
            <section class="restaurant-page-header">
                <div class="restaurant-heading">
                    <div class="heading-icon">
                        <i class="fa-solid fa-store"></i>
                    </div>
                    <div>
                        <h1>Restaurants</h1>
                        <p>
                            Browse and manage all restaurants available
                            on the platform.
                        </p>
                    </div>
                </div>
                <!-- Restaurant Count -->
                <div class="restaurant-count">
                            <span class="count-number">
                                ${restaurants.size()}
                            </span>
                    <span class="count-label">
                            Restaurants
                            </span>
                </div>
            </section>

            <!-- ==========================================
                 FILTER / SEARCH BAR
                 ========================================== -->
            <section class="restaurant-toolbar">
                <div class="restaurant-search">
                    <form action="${pageContext.request.contextPath}/homesearch"
                          method="get">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input type="hidden" name="type" value="restaurant">
                        <input type="text"
                               id="restaurantSearch"
                               name="query"
                               placeholder="Search restaurants..."
                               autocomplete="off" value="${param.query}" required autofocus>
                        <button type="submit" hidden="hidden">Search</button>
                    </form>
                </div>
                <c:if test="${not empty param.query}">
                    <div>
                        <a href="${pageContext.request.contextPath}/guest/restaurants" class="restaurants-link">
                            <span>←</span>
                            View All Restaurants
                        </a>
                    </div>
                </c:if>
            </section>

            <!-- ==========================================
                 RESTAURANT GRID
                 ========================================== -->
            <section class="restaurant-grid">
                <!-- ======================================
                     RESTAURANT LOOP
                     ====================================== -->
                <c:forEach var="restaurant"
                           items="${restaurants}">
                    <article class="restaurant-card">
                        <!-- Restaurant Image -->
                        <div class="restaurant-image-wrapper">
                            <img src="${restaurant.imagePath}"
                                 alt="${restaurant.name}"
                                 class="restaurant-image"
                                 onerror="this.src='https://placehold.co/600x400/f5f5f5/999999?text=Restaurant';">
                            <!-- Status -->
                            <c:choose>
                                <c:when test="${restaurant.isActive}">
                                        <span class="restaurant-status status-open">
                                            <span class="status-dot"></span>
                                            Open
                                        </span>
                                </c:when>
                                <c:otherwise>
                                        <span class="restaurant-status status-closed">
                                            <span class="status-dot"></span>
                                            Closed
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <!-- Restaurant Content -->
                        <div class="restaurant-card-content">
                            <!-- Name -->
                            <div class="restaurant-name-row">
                                <h2>
                                    <c:out value="${restaurant.name}"/>
                                </h2>
                            </div>

                            <!-- Cuisine -->
                            <div class="restaurant-cuisine">
                                <i class="fa-solid fa-utensils"></i>
                                <span>
                                        <c:out value="${restaurant.cuisineType}"/>
                                    </span>
                            </div>

                            <!-- Rating + Delivery -->
                            <div class="restaurant-meta">
                                <!-- Rating -->
                                <div class="restaurant-rating">
                                        <span class="rating-star">
                                            <i class="fa-solid fa-star"></i>
                                        </span>
                                    <strong>
                                            ${restaurant.rating}
                                    </strong>
                                </div>
                                <span class="meta-divider">
                                        •
                                        </span>
                                <!-- Delivery Time -->
                                <div class="delivery-time">
                                    <i class="fa-regular fa-clock"></i>
                                    <span>
                                            ${restaurant.deliveryTime} mins
                                        </span>
                                </div>
                            </div>

                            <!-- Address -->
                            <div class="restaurant-address">
                                <i class="fa-solid fa-location-dot"></i>
                                <span>
                                        <c:out value="${restaurant.address}"/>
                                    </span>
                            </div>

                            <!-- View Button -->
                            <a href="${pageContext.request.contextPath}/guest/restaurants/view?id=${restaurant.restaurantId}"
                               class="view-restaurant-button">
                                    <span>
                                        View Restaurant
                                    </span>
                                <i class="fa-solid fa-arrow-right"></i>
                            </a>
                        </div>
                    </article>
                </c:forEach>
                <!-- ======================================
                     EMPTY STATE
                     ====================================== -->
                <c:if test="${empty restaurants}">
                    <div class="restaurant-empty-state">
                        <div class="empty-icon">
                            <i class="fa-solid fa-store-slash"></i>
                        </div>
                        <h2>
                            No restaurants found
                        </h2>
                        <p>
                            There are currently no restaurants
                            available in the system.
                        </p>
                    </div>
                </c:if>
            </section>
        </main>
        <%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
    </div>
</body>
</html>
