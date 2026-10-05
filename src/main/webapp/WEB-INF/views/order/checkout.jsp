<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Checkout | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order/checkout.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<div class="checkout-page">
    <div class="checkout-container">

        <div class="checkout-header">
            <div>
                <h1>Checkout</h1>
                <p>Review your order and provide your delivery details.</p>
            </div>
            <a href="${pageContext.request.contextPath}/cart/view" class="back-to-cart">← Back to Cart</a>
        </div>

        <div class="checkout-layout">
            <div class="checkout-left">

                <section class="checkout-card">
                    <div class="card-header">
                        <div class="section-icon">📍</div>
                        <div>
                            <h2>Delivery Information</h2>
                            <p>Where should we deliver your order?</p>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/order/place" method="post" id="checkout-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="userName">Full Name</label>
                                <input type="text" id="userName" name="userName" value="${loggedInUser.userName}" required readonly>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone Number</label>
                                <input type="tel" id="phone" name="phone" value="${loggedInUser.phone}" required readonly>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="address">Delivery Address</label>
                            <textarea id="address" name="address" rows="5" required>${loggedInUser.address}</textarea>
                        </div>

                        <div class="address-note">
                            <span>ⓘ</span>
                            <span>You can update the delivery address for this order.</span>
                        </div>
                    </form>
                </section>

                <section class="checkout-card">
                    <div class="card-header">
                        <div class="section-icon">💳</div>
                        <div>
                            <h2>Payment Method</h2>
                            <p>Select your preferred payment option.</p>
                        </div>
                    </div>

                    <label class="payment-option">
                        <input type="radio" name="paymentMethod" value="CASH_ON_DELIVERY" form="checkout-form" checked>
                        <div class="payment-content">
                            <div class="payment-icon">💵</div>
                            <div>
                                <strong>Cash on Delivery</strong>
                                <span>Pay when your order arrives.</span>
                            </div>
                        </div>
                        <div class="payment-check">✓</div>
                    </label>
                </section>

            </div>

            <div class="checkout-right">

                <section class="checkout-card order-summary">
                    <div class="card-header">
                        <div class="section-icon">🛒</div>
                        <div>
                            <h2>Order Summary</h2>
                            <p>Review the items in your order.</p>
                        </div>
                    </div>

                    <div class="restaurant-name">
                        <span>Restaurant</span>
                        <strong>${cart.restName}</strong>
                    </div>

                    <div class="order-items">
                        <c:forEach var="cartItem" items="${cart.cartItemMap.values()}">
                            <div class="order-item">
                                <div class="item-image">
                                    <c:choose>
                                        <c:when test="${not empty cartItem.menu.imagePath}">
                                            <img src="${cartItem.menu.imagePath}" alt="${cartItem.menu.itemName}">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="image-placeholder">🍽️</div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="item-details">
                                    <h3>${cartItem.menu.itemName}</h3>
                                    <span>Qty: ${cartItem.quantity}</span>
                                </div>
                                <div class="item-price">
                                    ₹${cartItem.subtotal}
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div class="price-breakdown">
                        <div class="price-row">
                            <span>Subtotal</span>
                            <span>₹<fmt:formatNumber value="${cart.subtotal}" minFractionDigits="2" maxFractionDigits="2"/></span>
                        </div>
                        <div class="price-row">
                            <span>Delivery Fee</span>
                            <span>
                                ₹<fmt:formatNumber value="${cart.deliveryFee}" minFractionDigits="2" maxFractionDigits="2"/>
                            </span>
                        </div>
                        <div class="price-row">
                            <span>GST</span>
                            <span>₹<fmt:formatNumber value="${cart.gst}" minFractionDigits="2" maxFractionDigits="2"/></span>
                        </div>
                        <div class="price-row">
                            <span>Platform Fee</span>
                            <span>₹${cart.platformFee}</span>
                        </div>
                    </div>

                    <div class="grand-total">
                        <span>Total</span>
                        <strong>
                            ₹<fmt:formatNumber value="${cart.grandTotal}" minFractionDigits="2" maxFractionDigits="2"/>
                        </strong>
                    </div>

                    <button type="submit" form="checkout-form" class="place-order-btn">
                        <span>Place Order</span>
                    </button>

                    <p class="secure-note">🔒 Your order information is securely processed.</p>
                </section>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/guest-footer.jsp" %>
</body>
</html>