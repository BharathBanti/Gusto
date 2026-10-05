<%@ page import="java.util.HashMap" %>
<%@ page import="com.banti.fda.model.CartItem" %>
<%@ page import="com.banti.fda.model.Cart" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>${restaurant.name} | Food Delivery</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>

    <!-- Restaurant View CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/guest/restaurant-view.css">

</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="restaurant-page">
    <!-- =====================================================
    RESTAURANT HERO
    ====================================================== -->
    <section class="restaurant-hero">
        <div class="container">
            <div class="restaurant-hero-card">
                <!-- Restaurant Image -->
                <div class="restaurant-image-wrapper">
                    <c:choose>
                        <c:when test="${not empty restaurant.imagePath}">
                            <img src="${restaurant.imagePath}"
                                 alt="${restaurant.name}" class="restaurant-image">
                        </c:when>
                        <c:otherwise>
                            <div class="restaurant-image-placeholder">
                                🍽️
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!-- Restaurant Information -->
                <div class="restaurant-information">
                    <div class="restaurant-meta">
                        <c:if test="${restaurant.isActive}">
                            <div class="meta-item">
                                <span class="status-label"></span>
                                <div>
                                    <span class="meta-label" style="color: lawngreen">
                                        Open
                                    </span>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${!restaurant.isActive}">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <i class="fa-solid fa-store-slash" style="color: darkred"></i>
                                </span>
                                <div>
                                    <span class="meta-label" style="color: red">
                                        Closed
                                    </span>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <span class="restaurant-label">
                                RESTAURANT
                    </span>
                    <h1>
                        ${restaurant.name}
                    </h1>
                    <!-- Restaurant Meta -->
                    <div class="restaurant-meta">
                        <c:if test="${not empty restaurant.cuisineType}">
                            <div class="meta-item">
                                            <span class="meta-icon">
                                                <i class="fa-solid fa-utensils" style="color:#ff6b35"></i>
                                            </span>
                                <div>
                                            <span class="meta-label">
                                                Cuisine
                                            </span>
                                    <strong>
                                            ${restaurant.cuisineType}
                                    </strong>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty restaurant.deliveryTime}">
                            <div class="meta-item">
                                    <span class="meta-icon">
                                        🚴
                                    </span>
                                <div>
                                    <span class="meta-label">
                                        Delivery
                                    </span>
                                    <strong>
                                            ${restaurant.deliveryTime} mins
                                    </strong>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty restaurant.address}">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    📍
                                </span>
                                <div>
                                    <span class="meta-label">
                                        Location
                                    </span>
                                    <strong>
                                            ${restaurant.address}
                                    </strong>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${not empty restaurant.rating}">
                            <div class="meta-item">
                                <span class="meta-icon">
                                    <i class="fa-regular fa-star" style="color: green"></i>
                                </span>
                                <div>
                                    <span class="meta-label">
                                        Rating
                                    </span>
                                    <strong>
                                            ${restaurant.rating}
                                    </strong>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- =====================================================
    RESTAURANT DETAILS
    ====================================================== -->
    <main>
        <div class="container">
            <!-- =================================================
            MENU SECTION
            ================================================== -->
            <section class="restaurant-menu">
                <div class="section-heading">
                    <span class="section-eyebrow">
                        EXPLORE OUR MENU
                    </span>
                    <h2>
                        Menu
                    </h2>
                    <c:choose>
                        <c:when test="${not empty menuItems}">
                            <p>
                                    ${menuItems.size()}
                                delicious items available
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p>
                                Menu items are currently unavailable.
                            </p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <!-- =============================================
                MENU ITEMS
                ============================================== -->
                <c:choose>
                    <c:when test="${not empty menuItems}">
                        <div class="menu-grid">
                            <c:forEach var="item" items="${menuItems}">
                                <c:set var="cartItem" value="${sessionScope.cart.getItem(item.menuId)}"></c:set>
                                <c:set var="currentQuantity" value="${empty cartItem ? 0 : cartItem.quantity}"/>
                                <article class="menu-card">
                                    <!-- Food Image -->
                                    <div class="menu-image-wrapper">
                                        <c:choose>
                                            <c:when test="${not empty item.imagePath}">
                                                <img src="${item.imagePath}"
                                                     alt="${item.itemName}" class="menu-image">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="menu-image-placeholder">
                                                    🍽️
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <!-- Menu Content -->
                                    <div class="menu-content">
                                        <!-- Availability Badge -->
                                        <div class="item-availability">
                                            <c:if test="${restaurant.isActive}">
                                                <c:choose>
                                                    <c:when test="${item.isAvailable}">
                                                        <span class="badge badge-available">
                                                            <i class="fa-solid fa-circle-check"></i> Available
                                                        </span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-unavailable">
                                                            <i class="fa-solid fa-circle-xmark"></i> Out of Stock
                                                        </span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </div>

                                        <h3>
                                                ${item.itemName}
                                        </h3>
                                        <c:if test="${not empty item.description}">
                                            <p class="menu-description">
                                                    ${item.description}
                                            </p>
                                        </c:if>
                                        <div class="menu-footer">
                                            <span class="menu-price">
                                                ₹${item.price}
                                            </span>
                                            <div class="menuitem-update-actions">
                                                <c:if test="${restaurant.isActive}">
                                                    <c:choose>
                                                        <c:when test="${currentQuantity == 0}">
                                                            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form">
                                                                <input type="hidden" name="itemId" value="${item.menuId}">
                                                                <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                                                                <div class="cart-actions">
                                                                    <input type="number" hidden="hidden" name="quantity" value="${currentQuantity + 1}" class="cart-quantity-input" ${!item.isAvailable ? 'disabled' : ''}>
                                                                    <button type="submit" class="btn-add-to-cart" ${!item.isAvailable ? 'disabled' : ''}>
                                                                        <i class="fa-solid fa-cart-shopping"></i> Add to cart
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form">
                                                                <input type="hidden" name="itemId" value="${item.menuId}">
                                                                <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                                                                <div class="cart-actions">
                                                                    <input type="number" hidden="hidden" name="quantity" value="${currentQuantity - 1}" class="cart-quantity-input" ${!item.isAvailable ? 'disabled' : ''}>
                                                                    <button type="submit" class="btn-add-to-cart" ${!item.isAvailable ? 'disabled' : ''}>
                                                                        -
                                                                    </button>
                                                                </div>
                                                            </form>
                                                            <span class="current-quantity">${currentQuantity}</span>
                                                            <form action="${pageContext.request.contextPath}/cart/add" method="post" class="add-to-cart-form">
                                                                <input type="hidden" name="itemId" value="${item.menuId}">
                                                                <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}">
                                                                <div class="cart-actions">
                                                                    <input type="number" hidden="hidden" name="quantity" value="${currentQuantity + 1}" class="cart-quantity-input" ${!item.isAvailable ? 'disabled' : ''}>
                                                                    <button type="submit" class="btn-add-to-cart" ${!item.isAvailable ? 'disabled' : ''}>
                                                                        +
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:if>
                                            </div>
                                            <c:if test="${!restaurant.isActive}">
                                                <div class="meta-item">
                                                    <span class="meta-icon">
                                                        <i class="fa-solid fa-store-slash" style="color: darkred"></i>
                                                    </span>
                                                    <div>
                                                        <span class="meta-label" style="color: red">
                                                            Closed
                                                        </span>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </article>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-menu">
                            <div class="empty-menu-icon">
                                🍽️
                            </div>
                            <h3>
                                No Menu Items Available
                            </h3>
                            <p>
                                This restaurant hasn't added
                                any menu items yet.
                            </p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </section>
        </div>
    </main>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>