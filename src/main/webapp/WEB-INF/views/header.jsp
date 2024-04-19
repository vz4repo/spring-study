<!-- Fixed Profile Panel -->
<div class="fixed-profile-panel flex items-center px-3 opacity-50 hover:opacity-100 fixed">
    <div>
        <p class="text-sm"><span> Admin ID: ${empty sessionScope.get("sid") ? "!! PLEASE LOGIN !!" : sessionScope.get("sid")}</span></p>
        <%-- 이전/현재 접속 시간 --%>
        <p class="text-sm"><span> Prev Acc: ${empty sessionScope.get("sid") ? "!! PLEASE LOGIN !!" : cookie.prevAccTime.value } </span></p>
        <p class="text-sm"><span> DeviceIP: <%= request.getRemoteAddr() %> </span></p>
    </div>
    <div>
        <button onclick="window.location.href= '${empty sessionScope.get("sid") ? "/login" : "/logout"}' "
                class="bg-red-500 text-white py-2 px-4 rounded-md shadow-lg hover:bg-red-600 focus:outline-none focus:bg-red-600 transition duration-300 ease-in-out">
            ${empty sessionScope.get("sid") ? "login" : "logout"}
        </button>
    </div>
</div>
<!-- Page Content -->
<div class="container mx-auto px-4 py-3">
    <!-- Page Title -->
    <h1 class="text-3xl font-semibold mb-4">Admin Page</h1>
    <!-- Navigation -->
    <nav class="flex space-x-4">
        <a href="board" class="text-blue-500 hover:text-blue-700">Board</a>
        <a href="users" class="text-blue-500 hover:text-blue-700">Users</a>
        <a href="info" class="text-blue-500 hover:text-blue-700">Info</a>
        <a href="setting" class="text-blue-500 hover:text-blue-700">Setting</a>
    </nav>
</div>
<script>
    // login값 없는 경우 효과 처리
    const profilePanel = document.querySelectorAll(".fixed-profile-panel span");
    profilePanel.forEach((item) => {
      item.textContent.includes("!!") ?
      item.classList.add('bg-red-500') : item.classList.remove('bg-red-500') ;
    });

</script>