<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Profile | Gusto</title>
    <%@ include file="/WEB-INF/views/common/guest-header.jsp" %>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile/profile.css">
</head>
<body>
<%@ include file="/WEB-INF/views/common/guest-navbar.jsp" %>
<main class="profile-page">
    <div class="profile-container">
        <a href="${pageContext.request.contextPath}/home" class="back-link">← Back to Home</a>
        <div class="profile-header">
            <div>
                <h1>My Profile</h1>
                <p>Manage your personal information</p>
            </div>
        </div>
        <section class="profile-card">
            <div class="profile-card-header">
                <div class="profile-avatar">
                    ${user.userName.substring(0, 1).toUpperCase()}
                </div>
                <div>
                    <h2>${user.userName}</h2>
                    <span class="role-badge">${user.role}</span>
                </div>
            </div>
            <c:if test="${param.success == 'updated'}">
                <div class="alert alert-success">
                    Profile updated successfully.
                </div>
            </c:if>

            <c:if test="${param.error == 'invalid'}">
                <div class="alert alert-error">
                    Please fill all required fields.
                </div>
            </c:if>
            <form action="${pageContext.request.contextPath}/profile/update" method="post" class="profile-form">
                <div class="form-group">
                    <label for="userName">Name</label>
                    <input type="text" id="userName" name="userName" value="${user.userName}" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="${user.email}" readonly>
                    <span class="field-note">Email is used for login and cannot be changed here.</span>
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="tel" id="phone" name="phone" value="${user.phone}" required>
                </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="4" required>${user.address}</textarea>
                </div>
                <div class="profile-details">
                    <div class="detail-item">
                        <span class="detail-label">Account ID</span>
                        <span class="detail-value">#${user.userId}</span>
                    </div>
                    <div class="detail-item">
                        <span class="detail-label">Role</span>
                        <span class="detail-value">${user.role}</span>
                    </div>
                </div>
                <div class="profile-actions">
                    <a href="${pageContext.request.contextPath}/profile/change-password" class="secondary-btn">Change Password</a>
                    <button type="submit" class="primary-btn">Update Profile</button>
                </div>
            </form>
        </section>
    </div>
</main>
<%--<%@ include file="/WEB-INF/views/common/guest-header.jsp" %>--%>
<jsp:include page="/WEB-INF/views/common/guest-footer.jsp"/>
</body>
</html>
