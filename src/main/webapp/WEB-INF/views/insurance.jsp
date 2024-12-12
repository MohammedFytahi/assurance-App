<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insurance Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gradient-to-r from-blue-500 via-indigo-600 to-purple-700 text-white">

<div class="flex items-center justify-center min-h-screen py-12 px-6 lg:px-8">
    <div class="text-center space-y-8 max-w-lg mx-auto">
        <h1 class="text-5xl font-extrabold leading-tight tracking-tight sm:text-6xl">Insurance Portal</h1>
        <p class="text-xl text-indigo-200">Manage all your insurances with ease and security.</p>
        <div class="space-y-4">
            <a href="${pageContext.request.contextPath}/insurances/InsuranceForm"
               class="inline-block bg-indigo-700 hover:bg-indigo-800 text-white font-medium text-lg py-4 px-8 rounded-lg shadow-lg transition duration-300 transform hover:scale-105">
                Request Insurance
            </a>
            <p class="text-indigo-100 text-sm">Quick and secure process, start managing your insurance now.</p>
        </div>
    </div>
</div>

</body>
</html>
