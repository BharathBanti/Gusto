<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ | Gusto</title>
    <jsp:include page="/WEB-INF/views/common/guest-header.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/faq.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/guest-navbar.jsp"/>
<main class="faq-page">
    <section class="faq-hero">
        <div class="faq-hero-content">
            <span class="faq-eyebrow"><i class="fa-solid fa-circle-question"></i> Help Center</span>
            <h1>Frequently Asked Questions</h1>
            <p>Quick answers to common questions about discovering restaurants, placing orders, payments, cancellations, and using Gusto.</p>
        </div>
    </section>
    <section class="faq-layout">
        <aside class="faq-sidebar">
            <div class="category-card">
                <h3>Categories</h3>
                <a href="#general"><span><i class="fa-solid fa-circle-info"></i> General</span><i class="fa-solid fa-chevron-right"></i></a>
                <a href="#restaurants"><span><i class="fa-solid fa-store"></i> Restaurants</span><i class="fa-solid fa-chevron-right"></i></a>
                <a href="#orders"><span><i class="fa-solid fa-bag-shopping"></i> Orders</span><i class="fa-solid fa-chevron-right"></i></a>
                <a href="#payments"><span><i class="fa-solid fa-credit-card"></i> Payments</span><i class="fa-solid fa-chevron-right"></i></a>
                <a href="#cancellations"><span><i class="fa-solid fa-ban"></i> Cancellations</span><i class="fa-solid fa-chevron-right"></i></a>
                <a href="#account"><span><i class="fa-solid fa-user"></i> Account</span><i class="fa-solid fa-chevron-right"></i></a>
            </div>
        </aside>
        <div class="faq-content">
            <section class="faq-section" id="general">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">01 · GENERAL</span>
                        <h2>About Gusto</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-circle-info"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item" open>
                        <summary>What is Gusto?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Gusto is a food-delivery application designed to help users discover restaurants, explore menus, and place food orders through a simple digital experience.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>How does Gusto work?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>You can browse available restaurants, view their menus, choose the items you want, review your order, and continue through the available ordering and payment flow.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Is Gusto available everywhere?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Restaurant availability depends on the locations and restaurants configured in the Gusto application. Available restaurants are shown through the application interface.</p>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-section" id="restaurants">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">02 · RESTAURANTS</span>
                        <h2>Restaurants &amp; Menus</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-store"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item">
                        <summary>How can I find a restaurant?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Use the restaurant listing and available search or discovery features to browse restaurants. Selecting a restaurant opens its details and available menu items.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Can I view a restaurant's menu before ordering?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Yes. Gusto provides a restaurant view where available restaurant details and menu items can be explored before deciding what to order.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Why might a menu item be unavailable?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Menu availability can change based on restaurant configuration, item availability, operating conditions, or other restaurant-side updates.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Are restaurant prices always the same?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Prices displayed in Gusto are based on the information configured for the restaurant and menu item. Restaurant pricing and availability may change.</p>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-section" id="orders">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">03 · ORDERS</span>
                        <h2>Orders &amp; Delivery</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-bag-shopping"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item">
                        <summary>How do I place an order?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Select a restaurant, choose the required menu items, review your selections, and continue through the available checkout process.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Can I change an order after placing it?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Order changes depend on the current order status and the application's implemented workflow. Once preparation has started, changes may no longer be possible.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>What should I do if my order is missing an item?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Check your order details and contact support with the order information and details of the missing item so the issue can be reviewed.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>What if I receive the wrong item?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Contact support and provide the order details along with a description of the incorrect item. The issue can then be reviewed for an appropriate resolution.</p>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-section" id="payments">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">04 · PAYMENTS</span>
                        <h2>Payments &amp; Billing</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-credit-card"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item">
                        <summary>What payment methods are supported?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Available payment methods depend on the payment options implemented and configured for the Gusto application.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>What happens if my payment fails?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>If a payment attempt fails, the order may not be successfully created or confirmed. A temporary authorization may be reversed according to the payment provider's process.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>I was charged twice. What should I do?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Keep the order and payment details available and contact support. The payment records can be reviewed to determine whether a duplicate charge occurred.</p>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-section" id="cancellations">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">05 · CANCELLATIONS</span>
                        <h2>Cancellations &amp; Refunds</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-rotate-left"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item">
                        <summary>Can I cancel my order?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Cancellation availability depends on the order status. Cancellation may be available before restaurant acceptance, while orders that are already accepted or being prepared may have different cancellation conditions.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>What happens if the restaurant cancels my order?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>If an eligible order is cancelled by the restaurant after payment, the applicable amount may be refunded according to the order and payment status.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>How long does a refund take?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>After a refund is initiated, the time required for the amount to appear can depend on the payment provider, bank, card network, or other financial institution.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>Where can I learn more about refunds?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Visit the Gusto Refund &amp; Cancellation page for more information about cancellation scenarios, payment issues, and refund handling.</p>
                            <a href="${pageContext.request.contextPath}/refund" class="faq-link">View Refund &amp; Cancellation <i class="fa-solid fa-arrow-right"></i></a>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-section" id="account">
                <div class="faq-section-heading">
                    <div>
                        <span class="section-label">06 · ACCOUNT</span>
                        <h2>Account &amp; Security</h2>
                    </div>
                    <div class="section-icon"><i class="fa-solid fa-user"></i></div>
                </div>
                <div class="faq-list">
                    <details class="faq-item">
                        <summary>Do I need an account to use Gusto?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Some browsing features may be available without an account, while placing orders and accessing user-specific functionality may require authentication.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>What should I do if I forget my password?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Use the password recovery option provided by the application if available. If account recovery is not currently implemented, contact the application's support channel.</p>
                        </div>
                    </details>
                    <details class="faq-item">
                        <summary>How can I get help with my account?<span class="faq-toggle"><i class="fa-solid fa-plus"></i></span></summary>
                        <div class="faq-answer">
                            <p>Contact Gusto support with the relevant account or order information so the issue can be reviewed.</p>
                        </div>
                    </details>
                </div>
            </section>
            <section class="faq-support">
                <div class="faq-support-icon"><i class="fa-solid fa-headset"></i></div>
                <div class="faq-support-content">
                    <span>Still need help?</span>
                    <h2>Can't find the answer you're looking for?</h2>
                    <p>Our support page is the next place to go for questions about orders, payments, restaurants, or your Gusto experience.</p>
                    <a href="${pageContext.request.contextPath}/info/contact" class="support-button">Contact Gusto Support <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </section>
            <div class="faq-notice">
                <i class="fa-solid fa-circle-info"></i>
                <p>This FAQ is prepared for the Gusto food-delivery application project. Specific features, payment methods, cancellation rules, and account functionality depend on the application's implemented workflows.</p>
            </div>
        </div>
    </section>
</main>
<jsp:include page="/WEB-INF/views/common/guest-footer.jsp"/>
</body>
</html>