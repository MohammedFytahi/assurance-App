<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans antialiased">
<div class="flex items-center justify-center min-h-screen">
    <form method="post" action="${pageContext.request.contextPath}/login" class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full">
        <h2 class="text-3xl font-semibold text-gray-800 mb-6 text-center">Login</h2>

        <!-- Email Field -->
        <div class="mb-4">
            <label for="email" class="block text-gray-700 font-semibold">Email:</label>
            <input type="email" name="email" id="email" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
        </div>

        <!-- Password Field -->
        <div class="mb-6">
            <label for="password" class="block text-gray-700 font-semibold">Password:</label>
            <input type="password" name="password" id="password" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty param.error}">
            <div class="text-red-500 text-center mb-4">Invalid username or password.</div>
        </c:if>

        <!-- Register Link -->
        <div class="text-center mb-6">
            <a href="${pageContext.request.contextPath}/register" class="text-indigo-600 hover:text-indigo-800 text-sm">Don't have an account? Register</a>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="w-full bg-indigo-600 text-white py-3 rounded-lg hover:bg-indigo-700 transition duration-300 ease-in-out">
            Login
        </button>
    </form>
</div>
</body>
</html>
