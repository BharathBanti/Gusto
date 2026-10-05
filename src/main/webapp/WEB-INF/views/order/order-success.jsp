<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Confirmed | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/order-success.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="success-page">
    <div class="success-container">
        <div class="success-card">
            <div class="success-icon">
                <span>✓</span>
            </div>
            <div class="success-content">
                <p class="success-label">ORDER CONFIRMED</p>
                <h1>Your order has been placed!</h1>
                <p class="success-message">Thank you for ordering with Gusto. Your order has been received and will be prepared shortly.</p>
            </div>
            <div class="order-info">
                <div class="info-item">
                    <span class="info-label">Order ID</span>
                    <strong>#${orderId}</strong>
                </div>
                <div class="info-divider"></div>
                <div class="info-item">
                    <span class="info-label">Payment</span>
                    <strong>Cash on Delivery</strong>
                </div>
                <div class="info-divider"></div>
                <div class="info-item">
                    <span class="info-label">Status</span>
                    <strong class="status">Pending</strong>
                </div>
            </div>
            <div class="confirmation-note">
                <div class="note-icon">✓</div>
                <div>
                    <strong>What's next?</strong>
                    <p>Your restaurant will confirm and start preparing your order. You can track its progress from your orders section.</p>
                </div>
            </div>
            <div class="success-actions">
                <a href="${pageContext.request.contextPath}/home" class="primary-btn">Explore More</a>
                <a href="${pageContext.request.contextPath}/order/myorders" class="secondary-btn">View My Orders</a>
            </div>
            <div class="footer-message">
                <p>Thank you for choosing <span>Gusto</span> ❤️</p>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>