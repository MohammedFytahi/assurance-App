<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription List</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans antialiased">
<div class="container mx-auto mt-10 px-4 sm:px-6 lg:px-8">
    <h1 class="text-3xl font-semibold text-gray-800 mb-8 text-center">Your Subscriptions</h1>

    <div class="space-y-6">
        <c:forEach var="subscription" items="${subscriptions}">
            <div class="bg-white p-6 shadow rounded-lg flex flex-col sm:flex-row items-start sm:items-center justify-between">
                <div class="sm:w-2/3">
                    <p class="text-gray-700 font-semibold">Status: <span class="text-blue-600">${subscription.status}</span></p>
                    <p class="text-gray-500">Date: ${subscription.subscriptionDate}</p>
                    <p class="text-gray-500">Documents Provided: ${subscription.documentsProvided}</p>
                </div>

                <div class="sm:w-1/3 mt-4 sm:mt-0">
                    <ul class="space-y-2">
                        <li><strong>Subscription ID:</strong> ${subscription.id}</li>
                        <li><strong>Devis ID:</strong> ${subscription.devis.id}</li>

                        <c:if test="${subscription.devis.carInsurance != null}">
                            <li><strong>Age:</strong> ${subscription.devis.carInsurance.age}</li>
                            <li><strong>Driver History:</strong> ${subscription.devis.carInsurance.driverHistory}</li>
                            <li><strong>Vehicle Type:</strong> ${subscription.devis.carInsurance.vehicleType}</li>
                            <li><strong>Vehicle Usage:</strong> ${subscription.devis.carInsurance.vehicleUsing}</li>
                        </c:if>

                        <c:if test="${subscription.devis.homeInsurance != null}">
                            <li><strong>Asset Type:</strong> ${subscription.devis.homeInsurance.assetType}</li>
                            <li><strong>Asset Value:</strong> ${subscription.devis.homeInsurance.assetValue}</li>
                            <li><strong>Localization:</strong> ${subscription.devis.homeInsurance.localization}</li>
                            <li><strong>Security System:</strong> ${subscription.devis.homeInsurance.securitySystem}</li>
                        </c:if>

                        <c:if test="${subscription.devis.healthInsurance != null}">
                            <li><strong>Age:</strong> ${subscription.devis.healthInsurance.age}</li>
                            <li><strong>Coverage Type:</strong> ${subscription.devis.healthInsurance.typeCoverage}</li>
                            <li><strong>Health Status:</strong> ${subscription.devis.healthInsurance.healthStatus}</li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
