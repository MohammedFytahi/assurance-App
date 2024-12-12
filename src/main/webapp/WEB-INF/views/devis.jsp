<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Devis Management</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans antialiased">
<div class="min-h-screen flex items-center justify-center">
    <div class="bg-white shadow-md rounded-lg p-8 max-w-lg w-full space-y-6">
        <h1 class="text-3xl font-semibold text-gray-800 text-center mb-6">Devis Management</h1>

        <!-- Loop through the devis items -->
        <c:forEach var="devis" items="${devis}">
            <div class="bg-gray-50 p-6 rounded-lg mb-6 shadow-inner hover:shadow-lg transition-shadow duration-300">
                <p class="text-lg font-semibold text-gray-700">Status:
                    <span class="text-blue-600 font-bold">${devis.status}</span>
                </p>
                <p class="text-lg text-gray-600">Base Premium:
                    <span class="font-medium text-green-500">${devis.premiumBase}</span>
                </p>
                <p class="text-lg text-gray-600">Total Premium:
                    <span class="font-medium text-green-500">${devis.premiumTotal}</span>
                </p>

                <!-- Action buttons -->
                <div class="mt-6 flex space-x-4 justify-center">
                    <a href="${pageContext.request.contextPath}/devis/approve?id=${devis.id}"
                       class="px-5 py-3 bg-green-500 text-white rounded-md hover:bg-green-600 transition duration-200 w-full sm:w-auto text-center">
                        Approve
                    </a>
                    <a href="${pageContext.request.contextPath}/devis/reject?id=${devis.id}"
                       class="px-5 py-3 bg-red-500 text-white rounded-md hover:bg-red-600 transition duration-200 w-full sm:w-auto text-center">
                        Reject
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
