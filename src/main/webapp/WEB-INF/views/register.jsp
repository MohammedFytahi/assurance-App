<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 font-sans antialiased">
<div class="flex items-center justify-center min-h-screen">
    <form method="post" action="${pageContext.request.contextPath}/registered" class="bg-white p-8 rounded-lg shadow-lg max-w-md w-full">
        <h2 class="text-3xl font-semibold text-gray-800 mb-6 text-center">Register</h2>

        <!-- Name Field -->
        <div class="mb-4">
            <label for="name" class="block text-gray-700 font-semibold">Name:</label>
            <input type="text" name="name" id="name" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
        </div>

        <!-- Phone Field -->
        <div class="mb-4">
            <label for="phone" class="block text-gray-700 font-semibold">Phone:</label>
            <input type="tel" name="phone" id="phone" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"/>
        </div>

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

        <!-- Submit Button -->
        <button type="submit" class="w-full bg-indigo-600 text-white py-3 rounded-lg hover:bg-indigo-700 transition duration-300 ease-in-out">
            Register
        </button>

        <!-- Redirect to Login -->
        <div class="mt-4 text-center">
            <span class="text-gray-600">Already have an account?</span>
            <a href="${pageContext.request.contextPath}/login" class="text-indigo-600 hover:text-indigo-800">Login</a>
        </div>
    </form>
</div>
</body>
</html>
