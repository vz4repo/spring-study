<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <%--  favicon  --%>
    <link rel="icon" href="<c:url value='/resources/favicon.ico'/>" type="image/x-icon"/>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
      /* Additional styles */
      body {
        background-color: #0d1117;
      }

      .btn-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: calc(100vh - 2rem);
      }

      .btn-container button {
        width: 300px;
        height: 300px;
      }
    </style>
</head>
<body>
<div class="btn-container">
    <button onclick="window.location.href='/admin'" class="bg-gray-900 text-white rounded-full text-3xl shadow-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-700 transition duration-300 ease-in-out">
        Admin
    </button>
    <button onclick="openModal()" class="bg-gray-900 text-white rounded-full text-3xl shadow-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-700 transition duration-300 ease-in-out">
        User
    </button>
</div>

<!-- Modal -->
<div id="myModal" class="modal hidden fixed inset-0 flex items-center justify-center bg-black bg-opacity-50">
    <div class="bg-white p-8 rounded-lg shadow-lg">
        <p class="text-lg font-semibold text-center">
            해당 기능은 제공되지 않습니다.
        </p>
        <button onclick="closeModal()" class="block mx-auto mt-4 bg-gray-900 text-white py-2 px-4 rounded-md shadow-lg hover:bg-gray-700 focus:outline-none focus:bg-gray-700 transition duration-300 ease-in-out">
            확인
        </button>
    </div>
</div>

<script>
  // 모달 열기
  function openModal() {
    document.getElementById('myModal').classList.remove('hidden');
  }

  // 모달 닫기
  function closeModal() {
    document.getElementById('myModal').classList.add('hidden');
  }
</script>
</body>
</html>
