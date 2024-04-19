<section class="bg-gray-900 text-white">
    <!-- Main Content -->
    <div class="bg-white p-8 rounded-lg shadow">
        <p>Welcome Admin Page, ${sessionScope.get("sid")}!</p>
        <p>Please check your previous access [${cookie.prevAccTime.value}]</p>
    </div>
</section>