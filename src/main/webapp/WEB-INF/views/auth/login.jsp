<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Gusto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth/login.css">
</head>
<body>
<div class="auth-container">
    <div class="auth-card">

        <div class="brand-section">
            <img src="${pageContext.request.contextPath}/images/gusto-logo.png">
            <p>Welcome back! Sign in to continue.</p>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="message error-message">${errorMessage}</div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="message success-message">${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/auth/login" method="post" class="auth-form">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="auth-btn">Sign In</button>
        </form>

        <div class="auth-footer">
            <p>Don't have an account? <a href="${pageContext.request.contextPath}/auth/register">Create Account</a></p>
        </div>

    </div>
</div>
</body>
</html>
