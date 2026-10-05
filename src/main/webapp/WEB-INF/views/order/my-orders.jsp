<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Orders | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/my-orders.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="orders-page">
    <div class="orders-container">

        <div class="page-header">
            <div>
                <h1>My Orders</h1>
                <p>Track and review your previous orders.</p>
            </div>
        </div>

        <c:choose>
            <c:when test="${empty myOrders}">
                <div class="empty-orders">
                    <h2>No Orders Yet</h2>
                    <p>You haven't placed any orders yet.</p>
                    <a href="${pageContext.request.contextPath}/guest/restaurants" class="browse-btn">Browse Restaurants</a>
                </div>
            </c:when>

            <c:otherwise>
                <div class="orders-list">
                    <c:forEach var="order" items="${myOrders}">
                        <div class="order-bar">

                            <div class="order-section order-id-section">
                                <span class="label">Order </span>
                                <strong>${order.orderId}</strong>
                            </div>

                            <div class="order-section restaurant-section">
                                <span class="label">Restaurant</span>
                                <strong>${order.restaurantName}</strong>
                            </div>

                            <div class="order-section date-section">
                                <span class="label">Placed On</span>
                                <strong>${order.orderDate}</strong>
                            </div>

                            <div class="order-section status-section">
                                <span class="label">Status</span>
                                <span class="status ${order.status}">
                                        ${order.status}
                                </span>
                            </div>

                            <div class="order-section amount-section">
                                <span class="label">Total</span>
                                <strong>₹${order.totalAmount}</strong>
                            </div>

                            <div class="order-section action-section">
                                <a href="${pageContext.request.contextPath}/order/orderdetails?orderId=${order.orderId}" class="view-btn">
                                    View Details
                                </a>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>
