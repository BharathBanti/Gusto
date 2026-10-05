<aside class="admin-sidebar">
    <!-- Sidebar Brand -->
    <div class="sidebar-brand">

        <div class="brand-logo">
            <i class="fa-solid fa-utensils"></i>
        </div>

        <div class="brand-text">
            <span class="brand-name">FoodAdmin</span>
            <span class="brand-subtitle">Management Panel</span>
        </div>

    </div>

    <!-- Navigation -->
    <nav class="sidebar-nav">

        <div class="nav-section-title">
            MAIN
        </div>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="sidebar-link">

            <i class="fa-solid fa-chart-pie"></i>
            <span>Dashboard</span>

        </a>

        <div class="nav-section-title">
            MANAGEMENT
        </div>

        <a href="${pageContext.request.contextPath}/admin/students"
           class="sidebar-link">

            <i class="fa-solid fa-user-graduate"></i>
            <span>Students</span>

        </a>

        <a href="${pageContext.request.contextPath}/admin/restaurants"
           class="sidebar-link active">

            <i class="fa-solid fa-store"></i>
            <span>Restaurants</span>

        </a>

        <a href="#"
           class="sidebar-link">

            <i class="fa-solid fa-bowl-food"></i>
            <span>Food Items</span>

        </a>

        <a href="#"
           class="sidebar-link">

            <i class="fa-solid fa-users"></i>
            <span>Customers</span>

        </a>

        <div class="nav-section-title">
            SYSTEM
        </div>

        <a href="#"
           class="sidebar-link">

            <i class="fa-solid fa-gear"></i>
            <span>Settings</span>

        </a>

    </nav>

    <!-- Sidebar Bottom -->
    <div class="sidebar-bottom">

        <a href="${pageContext.request.contextPath}/logout"
           class="sidebar-link logout-link">

            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>

        </a>
    </div>
</aside>
