<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Gusto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/auth/register.css">
</head>
<body>
<div class="auth-container">
    <div class="auth-card">

        <div class="brand-section">
            <img src="${pageContext.request.contextPath}/images/gusto-logo.png">
            <p>Create your account and start ordering.</p>
        </div>

        <c:if test="${not empty errorMessage}">
            <div class="message error-message">${errorMessage}</div>
        </c:if>

        <c:if test="${not empty successMessage}">
            <div class="message success-message">${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/auth/register" method="post" class="auth-form">
            <div class="form-group">
                <label for="userName">Full Name</label>
                <input type="text" id="userName" name="userName" placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
            </div>

            <div class="form-group">
                <label for="address">Address</label>
                <textarea id="address" name="address" rows="3" placeholder="Enter your delivery address" required></textarea>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
            </div>

            <button type="submit" class="auth-btn">Create Account</button>
        </form>

        <div class="auth-footer">
            <p>Already have an account? <a href="${pageContext.request.contextPath}/auth/login">Sign In</a></p>
        </div>

    </div>
</div>
</body>
</html>