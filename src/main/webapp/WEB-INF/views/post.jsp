<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<section>
    <!-- 이후에 board에서 바로 modal 띄울 예정 -->
    <!-- Modal content -->
        <div class="flex justify-center items-center">
            <div class="relative bg-white rounded-lg shadow-xl w-full max-w-6xl mx-4">
                <!-- Modal header -->
                <div class="flex justify-between items-center p-5 rounded-t border-b">
                    <h3 class="text-black text-2xl font-semibold">[ ${post.seq} ] ${post.title}</h3>
                    <button type="button" class="close-btn text-gray-900 font-semibold text-2xl" onclick="closeModal()">×</button>
                </div>
                <div class="flex justify-between items-center p-5 rounded-t border-b">
                    <h3 class="text-black text-l">by "${post.username}"</h3>
                    <h3 class="text-black text-l">조회( ${post.viewcount} )</h3>
                </div>
                <!-- Modal body -->
                <div class="p-6 space-y-6">
                    <textarea id="modalContent" readonly rows="15" class="text-black w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring">${post.content}</textarea>
                </div>
                <!-- Modal footer -->
                <div class="flex items-center justify-between p-6 space-x-2 rounded-b border-t border-gray-200">
                    <button name="previous" type="button" class="previous-btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none">Previous</button>
                    <div>
                        <button name="new" type="button" class="new-btn bg-green-500 text-white px-4 py-2 rounded hover:bg-green-700 focus:outline-none">New</button>
                        <a href="modify?bno=${post.seq}">
                            <button name="modify" type="button" class="modify-btn bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-700 focus:outline-none">Modify</button>
                        </a>
                        <button id="delete" type="button" class="delete-btn bg-red-500 text-white px-4 py-2 rounded hover:bg-red-800 focus:outline-none">Delete</button>
                        <button name="close" onclick="closeModal()" class="close-btn bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 focus:outline-none">Close</button>
                    </div>
                    <button name="next" type="button" class="next-btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none">Next</button>
                </div>
            </div>
        </div>
</section>

<script>
  // Delete 클릭 이벤트 리스너
  document.querySelector('#delete').addEventListener('click', function() {
    // URL에서 bno 파라미터 값 추출
    const urlParams = new URLSearchParams(window.location.search);
    const bno = urlParams.get('bno');

    // fetch를 사용하여 POST:remove 요청
    fetch('/remove', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ bno: bno }),
      credentials: 'include' // 쿠키/인증 정보를 함께 보내려면 이 옵션을 사용
    }).then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json(); // ResponseEntity로 HashMap 받아오니까 Json
    })
    .then(data => {
      if(data.status === 'success') {
        window.location.href = data.redirect;   // baord로 이동
      }else{
        console.error('data error')
      }
    })
    .catch(error => {
      console.error('Fetch error:', error);
    });
  });
</script>