<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order ${restaurant.name} | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/order-details.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="order-details-page">
    <div class="order-details-container">
        <div class="page-header">
            <div>
                <a href="${pageContext.request.contextPath}/order/myorders" class="back-link">← Back</a>
                <h1>Order #${order.orderId}</h1>
                <p>Placed on ${order.orderDate}</p>
            </div>
            <div class="order-status ${order.status}">
                ${order.status}
            </div>
        </div>
        <div class="restaurant-bar">
            <div class="restaurant-info">
                <span class="section-label">RESTAURANT</span>
                <h2>${restaurant.name}</h2>
            </div>
            <div class="payment-info">
                <span class="section-label">PAYMENT</span>
                <strong>${order.paymentMethod}</strong>
            </div>
        </div>
        <section class="order-section">
            <div class="section-header">
                <h2>Order Items</h2>
                <span>${orderItemsList.size()} Items</span>
            </div>
            <div class="items-list">
                <c:forEach var="item" items="${orderItemsList}">
                    <div class="order-item-row">
                        <div class="item-image-wrapper">
                            <img src="${item.imagePath}" alt="${item.itemName}" class="item-image">
                        </div>
                        <div class="item-info">
                            <h3>${item.itemName}</h3>
                            <c:if test="${not empty item.description}">
                                <p>${item.description}</p>
                            </c:if>
                        </div>
                        <div class="item-price">
                            <span class="item-label">Price</span>
                            <strong>₹${item.price}</strong>
                        </div>
                        <div class="item-quantity">
                            <span class="item-label">Quantity</span>
                            <strong>× ${item.quantity}</strong>
                        </div>
                        <div class="item-total">
                            <span class="item-label">Total</span>
                            <strong>₹${item.itemTotal}</strong>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <div class="order-bottom-grid">
            <section class="info-section">
                <div class="section-header">
                    <h2>Delivery Address</h2>
                </div>
                <div class="address-content">
                    <div class="address-icon">⌖</div>
                    <p>${order.address}</p>
                </div>
            </section>
            <section class="info-section">
                <div class="section-header">
                    <h2>Payment</h2>
                </div>
                <div class="payment-content">
                    <div class="payment-row">
                        <span>Payment Method</span>
                        <strong>${order.paymentMethod}</strong>
                    </div>
                    <div class="payment-row">
                        <span>Payment Status</span>
                        <strong>Cash on Delivery</strong>
                    </div>
                </div>
            </section>
        </div>
        <section class="total-section">
            <div class="total-row">
                <span>Order Total (includes GST, Delivery Fee, Platform Fee)</span>
                <strong>₹${order.totalAmount}</strong>
            </div>
        </section>
        <div class="page-actions">
            <a href="${pageContext.request.contextPath}/order/myorders" class="secondary-btn">← Back</a>
            <a href="${pageContext.request.contextPath}/guest/restaurants" class="primary-btn">Continue Ordering</a>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>
