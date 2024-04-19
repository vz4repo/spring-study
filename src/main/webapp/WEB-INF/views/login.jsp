<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <!-- Tailwind CSS -->
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-900 flex items-center justify-center h-screen">
<div class="max-w-sm w-full bg-gray-800 p-8 rounded-lg shadow-lg">
  <svg class="w-20 h-20 mx-auto text-white" fill="none" viewBox="0 0 24 24" stroke="currentColor">
    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
  </svg>
  <h1 class="text-2xl font-semibold mb-4 text-white text-center">Sign in to your account</h1>
  <form action="/login" method="post">
    <div class="mb-4">
      <label for="id" class="block text-sm font-medium text-gray-300">Username or email</label>
      <input type="text" id="id" name="id" class="mt-1 p-2 w-full border-gray-500 rounded-md shadow-sm focus:ring focus:ring-blue-200 focus:outline-none" required value="${cookie.id.value}">
    </div>
    <div class="mb-4">
      <label for="pw" class="block text-sm font-medium text-gray-300">Password</label>
      <input type="password" id="pw" name="pw" class="mt-1 p-2 w-full border-gray-500 rounded-md shadow-sm focus:ring focus:ring-blue-200 focus:outline-none" required>
    </div>
      <input type="hidden" name="url" value="${param.url}">
<%--      <input type="text" name="url" value="${param.url}">--%>
    <div class="flex items-center justify-between mb-4">
      <div class="flex items-center">
        <input type="checkbox" id="remember" name="remember" class="form-checkbox h-6 w-6 text-blue-500"  ${cookie.remember.value eq "on" ? "checked" : ""}>
        <label for="remember" class="ml-2 block text-sm text-gray-300">Remember ID</label>
      </div>
      <button type="submit" class="w-1/2 bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600 transition duration-150 ease-in-out">Sign in</button>
    </div>
  </form>
  <div class="mt-4 text-center">
    <a href="#" class="text-sm text-blue-500 hover:text-blue-300">Forgot password?</a>
  </div>
</div>
</body>
</html>
