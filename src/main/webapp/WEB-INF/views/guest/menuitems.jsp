<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Food Items</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- Page CSS -->
    <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/guest/menuitems.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="menu-page">
    <!-- =========================================
         PAGE HEADER
    ========================================== -->
    <header class="page-header">
        <div class="container">
            <div class="header-content">
                <div>
                    <span class="eyebrow">DISCOVER FOOD</span>
                    <h1>Delicious Food Near You</h1>
                    <p>
                        Explore delicious dishes from restaurants
                        around you.
                    </p>
                </div>
                <div class="dish-search">
                    <form action="${pageContext.request.contextPath}/homesearch"
                          method="get">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        <input type="hidden" name="type" value="dish">
                        <input type="text"
                               id="dishSearch"
                               name="query"
                               placeholder="Search dishes..."
                               autocomplete="off" value="${param.query}" required autofocus>
                        <button type="submit" hidden="hidden">Search</button>
                    </form>
                </div>
            </div>
        </div>
    </header>

    <!-- =========================================
         MENU ITEMS SECTION
    ========================================== -->
    <main class="menu-section">
        <div class="container">
            <c:choose>
                <c:when test="${not empty menuItems}">
                    <div class="results-header">
                        <div>
                            <h2>Food Items</h2>
                            <p>
                                    ${menuItems.size()} delicious
                                items found
                            </p>
                        </div>
                    </div>

                    <div class="menu-grid">
                        <c:forEach var="item"
                                   items="${menuItems}">
                            <article class="menu-card">
                                <div class="food-image-wrapper">
                                    <c:choose>
                                        <c:when test="${not empty item.imagePath}">
                                            <img
                                                    src="${item.imagePath}"
                                                    alt="${item.itemName}"
                                                    class="food-image">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="image-placeholder">
                                                🍽️
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <div class="card-content">
                                    <h3 class="food-name">
                                            ${item.itemName}
                                    </h3>
                                    <div class="restaurant-info">
                                        <span class="restaurant-icon">
                                            🏪
                                        </span>
                                        <span>
                                            From — ${item.restaurantName} restaurant
                                        </span>
                                    </div>
                                    <div class="delivery-info">
                                        <span class="delivery-icon">
                                            🚴
                                        </span>
                                        <span>
                                                Delivery in ${item.deliveryTime} mins
                                        </span>
                                    </div>
                                    <div class="card-footer">
                                        <span class="food-price">
                                            ₹${item.price}
                                        </span>
                                        <a
                                                href="${pageContext.request.contextPath}/guest/restaurants/view?id=${item.restaurantId}"
                                                class="restaurant-button">
                                            <span>
                                                View Restaurant
                                            </span>
                                            <span class="arrow">
                                                →
                                            </span>
                                        </a>
                                    </div>
                                </div>
                            </article>
                        </c:forEach>
                    </div>
                </c:when>

                <c:otherwise>
                    <section class="empty-state">
                        <div class="empty-icon">
                            🍽️
                        </div>
                        <h2>No food items found</h2>
                        <p>
                            We couldn't find any food items
                            matching your search.
                        </p>
                        <a
                                href="${pageContext.request.contextPath}/guest/restaurants"
                                class="back-button">
                            Explore Restaurants
                        </a>
                    </section>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
</div>
    <%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>
