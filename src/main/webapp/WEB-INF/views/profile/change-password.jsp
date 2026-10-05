<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Change Password | Gusto</title>
    <jsp:include page="/WEB-INF/views/common/guest-header.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile/change-password.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/guest-navbar.jsp"/>
<main class="change-password-page">
    <div class="change-password-container">
        <a href="${pageContext.request.contextPath}/profile" class="back-link">← Back to Profile</a>
        <div class="page-header">
            <h1>Change Password</h1>
            <p>Keep your account secure by using a strong password.</p>
        </div>

        <c:if test="${param.success == 'changed'}">
            <div class="alert alert-success">
                Password changed successfully.
            </div>
        </c:if>

        <c:if test="${param.error == 'empty'}">
            <div class="alert alert-error">
                All fields are required.
            </div>
        </c:if>

        <c:if test="${param.error == 'current'}">
            <div class="alert alert-error">
                Current password is incorrect.
            </div>
        </c:if>

        <c:if test="${param.error == 'match'}">
            <div class="alert alert-error">
                New password and confirm password do not match.
            </div>
        </c:if>

        <c:if test="${param.error == 'same'}">
            <div class="alert alert-error">
                New password must be different from current password.
            </div>
        </c:if>

        <section class="password-card">
            <form action="${pageContext.request.contextPath}/profile/change-password" method="post">
                <div class="form-group">
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="currentPassword" required>
                </div>

                <div class="form-group">
                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" required>
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" required>
                </div>

                <div class="action-row">
                    <a href="${pageContext.request.contextPath}/profile" class="secondary-btn">
                        Cancel
                    </a>
                    <button type="submit" class="primary-btn">
                        Change Password
                    </button>
                </div>
            </form>
        </section>
    </div>
</main>
<jsp:include page="/WEB-INF/views/common/guest-footer.jsp"/>
</body>
</html>
