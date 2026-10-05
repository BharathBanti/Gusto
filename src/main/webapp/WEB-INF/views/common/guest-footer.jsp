<footer class="guest-footer">
    <div class="container footer-container">
        <div class="footer-brand">
            <h3>Gusto</h3>
            <p>
                Delicious food delivered fast,
                fresh and right to your doorstep.
            </p>
        </div>
        <div class="footer-links">
            <h4>Quick Links</h4>
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/guest/restaurants">Restaurants</a>
            <a href="${pageContext.request.contextPath}/info/about">About</a>
            <a href="${pageContext.request.contextPath}/info/contact">Contact</a>
        </div>
        <div class="footer-links">
            <h4>Legal</h4>
            <a href="${pageContext.request.contextPath}/info/privacy">Privacy Policy</a>
            <a href="${pageContext.request.contextPath}/info/termsandconditions">Terms & Conditions</a>
            <a href="${pageContext.request.contextPath}/info/refund">Refund Policy</a>
            <a href="${pageContext.request.contextPath}/info/faq">FAQ</a>
        </div>
        <div class="footer-links">
            <h4>Contact</h4>
            <p>support@gusto.com</p>
            <p>+91 7989666444</p>
        </div>
    </div>
    <div class="footer-bottom">
        © <%= java.time.LocalDate.now().getYear() %> Gusto. All Rights Reserved.
    </div>
</footer>

