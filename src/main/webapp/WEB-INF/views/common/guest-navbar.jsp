<%@ taglib prefix="c"
           uri="http://java.sun.com/jsp/jstl/core" %>

<header class="guest-navbar">
    <div class="container navbar-container">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/home"
           class="navbar-logo">
            <img src="${pageContext.request.contextPath}/images/gusto-logo.png">
            <span id="app-name">Gusto</span>
        </a>

        <!-- Navigation -->
        <nav class="navbar-menu">
            <a href="${pageContext.request.contextPath}/home">
                Home
            </a>
            <a href="${pageContext.request.contextPath}/guest/restaurants">
                Restaurants
            </a>
        </nav>

        <!-- Right Side -->
        <div class="navbar-actions">
            <c:choose>
                <c:when test="${not empty sessionScope.loggedInUser}">
<%--                    <a href="${pageContext.request.contextPath}/cart"--%>
<%--                       class="nav-icon">--%>
<%--                        <i class="fa-solid fa-cart-shopping"></i>--%>
<%--                    </a>--%>
                    <div class="cart-wrapper">
                        <a href="${pageContext.request.contextPath}/cart/view" id="cartIcon">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                        <c:if test="${sessionScope.cart.cartItemMap.size() >= 1}">
                            <span id="cartCount">${sessionScope.cart.cartItemMap.size()}</span>
                        </c:if>
                    </div>
                    <a href="${pageContext.request.contextPath}/order/myorders"
                       class="nav-link">
                        Orders
                    </a>
                    <a href="${pageContext.request.contextPath}/profile"
                       class="nav-link">
                        Profile
                    </a>
                    <a href="${pageContext.request.contextPath}/auth/logout"
                       class="btn btn-outline">
                        Logout
                    </a>
                </c:when>
                <c:otherwise>
                    <div class="cart-wrapper">
                        <a href="${pageContext.request.contextPath}/cart/view" id="cartIcon">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                        <c:if test="${sessionScope.cart.cartItemMap.size() >= 1}">
                            <span id="cartCount">${sessionScope.cart.cartItemMap.size()}</span>
                        </c:if>
                    </div>
                    <a href="${pageContext.request.contextPath}/auth/login"
                       class="btn btn-outline">
                        Sign In
                    </a>
                    <a href="${pageContext.request.contextPath}/auth/register"
                       class="btn btn-primary">
                        Sign Up
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>