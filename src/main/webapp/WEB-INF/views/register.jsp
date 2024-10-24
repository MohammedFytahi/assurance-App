<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <title>Register</title>
  <script src="https://cdn.tailwindcss.com"></script> <!-- Include Tailwind -->
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">

<div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
  <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Register</h2>

  <form th:action="@{/register}" method="POST" class="space-y-6">
    <!-- CSRF protection using Thymeleaf -->
    <input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}" />

    <!-- Name Field -->
    <div>
      <label for="name" class="block text-gray-700 font-medium">Name</label>
      <input type="text" id="name" name="name" required
             class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" />
    </div>

    <!-- Address Field -->
    <div>
      <label for="address" class="block text-gray-700 font-medium">Address</label>
      <input type="text" id="address" name="address" required
             class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" />
    </div>

    <!-- Email Field -->
    <div>
      <label for="email" class="block text-gray-700 font-medium">Email</label>
      <input type="email" id="email" name="email" required
             class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-indigo-500 focus:border-indigo-500" />
    </div>

    <!-- Phone Field -->
    <div>
      <label for="phone" class="block text-gray-700 font-medium">Phone</label>
      <input type="text" id="phone" name="phone" required
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
        Register
      </button>
    </div>
  </form>
</div>

</body>
</html>
