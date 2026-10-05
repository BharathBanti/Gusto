<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Refund & Cancellation | Gusto</title>
    <jsp:include page="/WEB-INF/views/common/guest-header.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/about.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info/refund.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/guest-navbar.jsp"/>
<main class="refund-page">
    <section class="refund-hero">
        <div class="refund-hero-content">
            <span class="refund-eyebrow"><i class="fa-solid fa-rotate-left"></i> Help Center</span>
            <h1>Refund &amp; Cancellation</h1>
            <p>Understand how order cancellations, refunds, failed payments, and order issues are handled on Gusto.</p>
            <div class="refund-meta">
                <span><i class="fa-regular fa-calendar"></i> Last updated: September 2026</span>
            </div>
        </div>
    </section>
    <section class="refund-layout">
        <aside class="refund-sidebar">
            <div class="sidebar-card">
                <h3>On this page</h3>
                <nav>
                    <a href="#overview">Overview</a>
                    <a href="#cancellation">Order Cancellation</a>
                    <a href="#restaurant-cancellation">Restaurant Cancellation</a>
                    <a href="#missing-items">Missing or Incorrect Items</a>
                    <a href="#damaged-orders">Damaged or Spilled Orders</a>
                    <a href="#failed-payments">Failed Payments</a>
                    <a href="#duplicate-payments">Duplicate Payments</a>
                    <a href="#eligibility">Refund Eligibility</a>
                    <a href="#processing">Refund Processing</a>
                    <a href="#support">How to Request Help</a>
                    <a href="#contact">Contact Us</a>
                </nav>
            </div>
        </aside>
        <div class="refund-content">
            <section class="refund-section" id="overview">
                <span class="section-number">01</span>
                <div class="section-heading">
                    <h2>Overview</h2>
                    <span class="section-icon"><i class="fa-solid fa-circle-info"></i></span>
                </div>
                <p>Gusto aims to make cancellations and refund-related issues as simple and transparent as possible. The availability of a cancellation or refund may depend on the status of an order, the reason for the request, restaurant actions, payment status, and other circumstances.</p>
                <p>This page explains the intended refund and cancellation approach for the Gusto food-delivery application project.</p>
            </section>
            <section class="refund-section" id="cancellation">
                <span class="section-number">02</span>
                <div class="section-heading">
                    <h2>Order Cancellation</h2>
                    <span class="section-icon"><i class="fa-solid fa-ban"></i></span>
                </div>
                <div class="info-grid">
                    <div class="info-card eligible">
                        <div class="info-card-icon"><i class="fa-solid fa-check"></i></div>
                        <h3>Before Acceptance</h3>
                        <p>If an order has not yet been accepted by the restaurant, cancellation may be available depending on the application's order status.</p>
                    </div>
                    <div class="info-card limited">
                        <div class="info-card-icon"><i class="fa-solid fa-clock"></i></div>
                        <h3>After Acceptance</h3>
                        <p>Once the restaurant has accepted or started preparing an order, cancellation may no longer be available or may be subject to the circumstances of the order.</p>
                    </div>
                </div>
                <p>Users should review the current order status before requesting cancellation. The final cancellation behavior depends on the application's implemented order workflow.</p>
            </section>
            <section class="refund-section" id="restaurant-cancellation">
                <span class="section-number">03</span>
                <div class="section-heading">
                    <h2>Restaurant Cancellation</h2>
                    <span class="section-icon"><i class="fa-solid fa-store-slash"></i></span>
                </div>
                <p>A restaurant may cancel an order because of operational limitations, item availability, restaurant capacity, or other circumstances.</p>
                <div class="highlight-box">
                    <i class="fa-solid fa-circle-check"></i>
                    <div>
                        <strong>When a restaurant cancels</strong>
                        <p>If payment has already been completed for an eligible cancelled order, the applicable amount may be refunded according to the payment and order status.</p>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="missing-items">
                <span class="section-number">04</span>
                <div class="section-heading">
                    <h2>Missing or Incorrect Items</h2>
                    <span class="section-icon"><i class="fa-solid fa-bag-shopping"></i></span>
                </div>
                <p>If an order arrives with missing, incorrect, or incomplete items, the issue should be reported to Gusto support as soon as reasonably possible.</p>
                <div class="action-list">
                    <div class="action-item">
                        <span class="action-number">1</span>
                        <div>
                            <h4>Check your order</h4>
                            <p>Compare the delivered items with the items shown in your order details.</p>
                        </div>
                    </div>
                    <div class="action-item">
                        <span class="action-number">2</span>
                        <div>
                            <h4>Report the issue</h4>
                            <p>Provide the order information and describe which item is missing or incorrect.</p>
                        </div>
                    </div>
                    <div class="action-item">
                        <span class="action-number">3</span>
                        <div>
                            <h4>Review the resolution</h4>
                            <p>Depending on the circumstances, an eligible item or amount may be refunded or otherwise resolved.</p>
                        </div>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="damaged-orders">
                <span class="section-number">05</span>
                <div class="section-heading">
                    <h2>Damaged or Spilled Orders</h2>
                    <span class="section-icon"><i class="fa-solid fa-box-open"></i></span>
                </div>
                <p>If food arrives damaged, spilled, or substantially affected during delivery, contact support promptly with the relevant order details.</p>
                <p>Where appropriate, Gusto may review the issue and determine a suitable resolution based on the available information and circumstances of the order.</p>
                <div class="notice-box">
                    <i class="fa-solid fa-camera"></i>
                    <div>
                        <strong>Helpful information</strong>
                        <p>Photos or other relevant details may help explain the condition of an affected order when reporting the issue.</p>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="failed-payments">
                <span class="section-number">06</span>
                <div class="section-heading">
                    <h2>Failed Payments</h2>
                    <span class="section-icon"><i class="fa-solid fa-credit-card"></i></span>
                </div>
                <p>If a payment attempt fails, the order may not be successfully created or confirmed. Depending on the payment provider, a temporary authorization or deducted amount may take some time to be reversed.</p>
                <p>If an amount remains deducted even though the order was not successfully completed, the payment status should be checked and the issue can be reported to support.</p>
            </section>
            <section class="refund-section" id="duplicate-payments">
                <span class="section-number">07</span>
                <div class="section-heading">
                    <h2>Duplicate Payments</h2>
                    <span class="section-icon"><i class="fa-solid fa-copy"></i></span>
                </div>
                <p>If the same order appears to have been charged more than once, contact Gusto support with the order details and relevant payment information.</p>
                <p>The payment records can then be reviewed to determine whether a duplicate charge occurred and whether a refund or reversal is applicable.</p>
            </section>
            <section class="refund-section" id="eligibility">
                <span class="section-number">08</span>
                <div class="section-heading">
                    <h2>Refund Eligibility</h2>
                    <span class="section-icon"><i class="fa-solid fa-circle-check"></i></span>
                </div>
                <p>Refund eligibility may depend on the specific circumstances of an order. The following scenarios provide a general guide:</p>
                <div class="scenario-table">
                    <div class="scenario-row scenario-header">
                        <span>Scenario</span>
                        <span>Possible Resolution</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-store-slash"></i> Restaurant cancels</span>
                        <span>Eligible order amount may be refunded</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-ban"></i> Eligible cancellation</span>
                        <span>Applicable amount may be refunded</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-bag-shopping"></i> Missing or incorrect item</span>
                        <span>Issue may qualify for an item-level resolution</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-box-open"></i> Damaged or spilled order</span>
                        <span>May be reviewed for an appropriate resolution</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-credit-card"></i> Failed payment</span>
                        <span>Temporary authorization may be reversed by the provider</span>
                    </div>
                    <div class="scenario-row">
                        <span><i class="fa-solid fa-copy"></i> Duplicate payment</span>
                        <span>Duplicate charge may be reviewed for refund or reversal</span>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="processing">
                <span class="section-number">09</span>
                <div class="section-heading">
                    <h2>Refund Processing</h2>
                    <span class="section-icon"><i class="fa-solid fa-money-bill-transfer"></i></span>
                </div>
                <p>When a refund is approved, it is generally processed through the applicable payment method or payment provider.</p>
                <p>The time required for the amount to appear in the user's account can depend on the payment provider, bank, card network, or other financial institution involved.</p>
                <div class="processing-grid">
                    <div class="processing-card">
                        <i class="fa-solid fa-receipt"></i>
                        <h3>Refund Initiated</h3>
                        <p>The applicable refund request is processed after the issue has been reviewed.</p>
                    </div>
                    <div class="processing-card">
                        <i class="fa-solid fa-building-columns"></i>
                        <h3>Provider Processing</h3>
                        <p>The payment provider or financial institution processes the reversal or refund.</p>
                    </div>
                    <div class="processing-card">
                        <i class="fa-solid fa-wallet"></i>
                        <h3>Amount Received</h3>
                        <p>The refunded amount becomes available according to the provider's processing cycle.</p>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="support">
                <span class="section-number">10</span>
                <div class="section-heading">
                    <h2>How to Request Help</h2>
                    <span class="section-icon"><i class="fa-solid fa-headset"></i></span>
                </div>
                <p>If you experience a problem with an order or payment, keep the relevant order information available when contacting support.</p>
                <div class="support-steps">
                    <div class="support-step">
                        <div class="step-icon"><i class="fa-solid fa-file-invoice"></i></div>
                        <h3>Find your order</h3>
                        <p>Keep your order ID and order details ready.</p>
                    </div>
                    <div class="support-step">
                        <div class="step-icon"><i class="fa-solid fa-message"></i></div>
                        <h3>Describe the issue</h3>
                        <p>Clearly explain what happened and what needs to be reviewed.</p>
                    </div>
                    <div class="support-step">
                        <div class="step-icon"><i class="fa-solid fa-envelope"></i></div>
                        <h3>Contact support</h3>
                        <p>Send the issue through the available Gusto support channel.</p>
                    </div>
                </div>
            </section>
            <section class="refund-section" id="contact">
                <span class="section-number">11</span>
                <div class="section-heading">
                    <h2>Contact Us</h2>
                    <span class="section-icon"><i class="fa-solid fa-envelope"></i></span>
                </div>
                <div class="contact-card">
                    <div class="contact-card-icon"><i class="fa-solid fa-headset"></i></div>
                    <div>
                        <h3>Need help with an order?</h3>
                        <p>For refund, cancellation, payment, or order-related questions, visit our contact page and provide the relevant details.</p>
                        <a href="${pageContext.request.contextPath}/info/contact" class="contact-button">Contact Gusto Support <i class="fa-solid fa-arrow-right"></i></a>
                    </div>
                </div>
            </section>
            <div class="policy-notice">
                <i class="fa-solid fa-circle-info"></i>
                <p>This Refund &amp; Cancellation policy is prepared for the Gusto food-delivery application project. Specific refund behavior may depend on the application's implemented order and payment workflows.</p>
            </div>
        </div>
    </section>
</main>
<jsp:include page="/WEB-INF/views/common/guest-footer.jsp"/>
</body>
</html>