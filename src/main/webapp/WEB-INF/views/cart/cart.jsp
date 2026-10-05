<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Cart | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart/cart.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<%-- Cart Page --%>
<div class="cart-page">
    <div class="cart-container">
        <c:if test="${not empty sessionScope.cart}">
            <div class="cart-header">
                <div>
                    <span class="page-label">YOUR ORDER</span>
                        <h1>${sessionScope.cart.restName}</h1>

                    <p>Review your selected items before placing your order.</p>
                </div>
                <a href="${pageContext.request.contextPath}/guest/restaurants/view?id=${sessionScope.cart.restId}" class="back-to-restaurant">
                    <span>←</span>
                    Back to restaurant
                </a>
            </div>
        </c:if>
        <c:choose>
            <c:when test="${empty sessionScope.cart || empty sessionScope.cart.cartItemMap}">
                <div class="empty-cart">
                    <div class="empty-cart-icon">
                        🛒
                    </div>
                    <h2>Your cart is empty</h2>
                    <p>Looks like you haven't added anything to your cart yet.</p>
                    <a href="${pageContext.request.contextPath}/guest/restaurants" class="browse-btn">
                        Browse Restaurants
                    </a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="cart-layout">
                    <section class="cart-items-section">
                        <div class="section-heading">
                            <div>
                                <h2>Cart Items</h2>
                                <span>
                                    ${sessionScope.cart.totalItems} item(s)
                                </span>
                            </div>
                            <form action="${pageContext.request.contextPath}/cart/clear" method="post">
                                <button type="submit" class="clear-cart-btn">
                                    Clear Cart
                                </button>
                            </form>
                        </div>
                        <div class="cart-items">
                            <c:forEach var="entry" items="${sessionScope.cart.cartItemMap}">
                                <c:set var="cartItem" value="${entry.value}"/>
                                <c:set var="menu" value="${cartItem.menu}"/>
                                <div class="cart-item">
                                    <div class="item-image-wrapper">
                                        <img src="${menu.imagePath}" alt="${menu.itemName}" class="item-image">
                                    </div>
                                    <div class="item-details">
                                        <h3>${menu.itemName}</h3>
                                        <p>${menu.description}</p>
                                        <span class="item-price">
                                            ₹<fmt:formatNumber value="${menu.price}" minFractionDigits="2" maxFractionDigits="2"/>
                                        </span>
                                    </div>
                                    <div class="item-quantity">
                                        <span class="quantity-label">Quantity</span>
                                        <form action="${pageContext.request.contextPath}/cart/update" method="post" class="quantity-form">
                                            <input type="hidden" name="itemId" value="${menu.menuId}">
                                            <button type="submit" name="quantity" value="${cartItem.quantity - 1}" class="quantity-btn"
                                                    <c:if test="${cartItem.quantity <= 1}">disabled</c:if>>
                                                −
                                            </button>
                                            <span class="quantity-value">${cartItem.quantity}</span>
                                            <button type="submit" name="quantity" value="${cartItem.quantity + 1}" class="quantity-btn">
                                                +
                                            </button>
                                        </form>
                                    </div>
                                    <div class="item-subtotal">
                                        <span class="subtotal-label">Subtotal</span>
                                        <strong>
                                            ₹<fmt:formatNumber value="${cartItem.subtotal}" minFractionDigits="2" maxFractionDigits="2"/>
                                        </strong>
                                    </div>
                                    <form action="${pageContext.request.contextPath}/cart/remove" method="post" class="remove-form">
                                        <input type="hidden" name="itemId" value="${menu.menuId}">
                                        <button type="submit" class="remove-btn" title="Remove item">
                                            ×
                                        </button>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>
                    </section>
                    <aside class="order-summary">
                        <div class="summary-header">
                            <span class="summary-label">ORDER SUMMARY</span>
                            <h2>Bill Details</h2>
                        </div>
                        <div class="summary-content">
                            <div class="summary-row">
                                <span>Total Items</span>
                                <span>
                                    ${sessionScope.cart.totalItems}
                                </span>
                            </div>
                            <div class="summary-row">
                                <span>Subtotal</span>
                                <span>
                                    ₹<fmt:formatNumber value="${sessionScope.cart.subtotal}" minFractionDigits="2" maxFractionDigits="2"/>
                                </span>
                            </div>
                            <div class="summary-row">
                                <span>Delivery Fee</span>
                                <span>
                                    ₹<fmt:formatNumber value="${sessionScope.cart.deliveryFee}" minFractionDigits="2" maxFractionDigits="2"/>
                                </span>
                            </div>
                            <div class="summary-row">
                                <span>GST</span>
                                <span>
                                    ₹<fmt:formatNumber value="${sessionScope.cart.gst}" minFractionDigits="2" maxFractionDigits="2"/>
                                </span>
                            </div>
                            <div class="summary-row">
                                <span>Platform Fee</span>
                                <span>₹${sessionScope.cart.platformFee}</span>
                            </div>
                            <div class="summary-divider"></div>
                            <div class="summary-total">
                                <span>Grand Total</span>
                                <strong>
                                    ₹<fmt:formatNumber value="${sessionScope.cart.grandTotal}" minFractionDigits="2" maxFractionDigits="2"/>
                                </strong>
                            </div>
                            <form action="${pageContext.request.contextPath}/order/checkout" method="get">
                                <button type="submit" class="checkout-btn">
                                    Proceed to Checkout
                                    <span>→</span>
                                </button>
                            </form>
                            <div class="secure-note">
                                <span>🔒</span>
                                <span>Secure checkout & protected payment</span>
                            </div>
                        </div>
                    </aside>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>
