<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Change Restaurant - Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart/cart-confirm.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="confirmation-page">
    <div class="confirmation-card">
        <div class="confirmation-icon">
            <span>!</span>
        </div>
        <div class="confirmation-content">
            <span class="page-label">CART UPDATE</span>
            <h1>Items already in your cart</h1>
            <p class="confirmation-message">
                Your cart already contains items from <strong>${sessionScope.cart.restName}</strong>.
            </p>
            <p class="confirmation-warning">
                Adding an item from <strong>${restaurantName}</strong> will clear your existing cart.
            </p>
        </div>
        <div class="confirmation-actions">
            <a href="${pageContext.request.contextPath}/guest/restaurants/view?id=${param.restaurantId}" class="btn btn-secondary">Cancel</a>
            <form action="${pageContext.request.contextPath}/cart/replace" method="post">
                <input type="hidden" name="itemId" value="${param.itemId}">
                <input type="hidden" name="restaurantId" value="${param.restaurantId}">
                <input type="hidden" name="quantity" value="${param.quantity}">
                <button type="submit" class="btn btn-primary">Clear Cart &amp; Add</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>