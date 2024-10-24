<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Login</title>
    <script src="https://cdn.tailwindcss.com"></script> <!-- Include Tailwind CSS -->
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">

<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
    <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Login</h2>

    <form th:action="@{/login}" method="POST" class="space-y-6">
        <!-- CSRF protection using Thymeleaf -->
        <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" />

        <!-- Email Field -->
        <div>
            <label for="email" class="block text-gray-700 font-medium">Email</label>
            <input type="email" id="email" name="email" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" />
        </div>

        <!-- Password Field -->
        <div>
            <label for="password" class="block text-gray-700 font-medium">Password</label>
            <input type="password" id="password" name="password" required
                   class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" />
        </div>

        <!-- Submit Button -->
        <div>
            <button type="submit"
                    class="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded-md hover:bg-indigo-700 focus:ring-4 focus:ring-indigo-500">
                Login
            </button>
        </div>

        <!-- Forgot Password Link -->
        <div class="text-center mt-4">
            <a href="#" class="text-indigo-600 hover:text-indigo-800">Forgot your password?</a>
        </div>
    </form>
</div>

</body>
</html>
