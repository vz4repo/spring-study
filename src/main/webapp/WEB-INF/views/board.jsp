<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="bg-gray-900 text-white">
    <!-- Main Content -->
    <div class="container mx-auto py-8">
        <div class="overflow-x-auto">
            <table class="w-full bg-gray-800 shadow-md rounded-md">
                <thead class="border-b border-gray-700">
                <tr>
                    <th class="text-left py-3 px-5 w-16">Seq</th>
                    <th class="text-left py-3 px-5 flex-grow">Title</th>
                    <th class="text-left py-3 px-5 w-1/5">Username</th>
                    <th class="text-left py-3 px-5 w-1/6">Register Date</th>
                    <th class="text-left py-3 px-5 w-24">View Count</th>
                </tr>
                </thead>
                <tbody>
                <!-- jstl foreach 반복으로 컨텐츠 출력 -->
                <c:forEach items="${posts}" var="item">
                    <tr class="border-b border-gray-700 hover:bg-gray-700">
                        <td class="p-3 px-5"><a href="read?bno=${item.seq}">${item.seq}</a></td>
                        <td class="p-3 px-5"><a href="read?bno=${item.seq}">${item.title}</a></td>
                        <td class="p-3 px-5">${item.username}</td>
                        <td class="p-3 px-5">${item.registerdate}</td>
                        <td class="p-3 px-5">${item.viewcount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
    <div class="container mx-auto my-8">
            <ul class="flex space-x-2 justify-center mt-4">
<%-- TODO: currentPage, totalPage 변수를 하나로 통합해서 사용할것으로 보이나 더 많은 고민이 필요함                --%>
                <%-- 이전 목록   --%>
                <c:if test="${currentPage > (totalPage * 10) - 1 && totalPage * 10 > 0}">
                    <li>
                        <a href="?page=${totalPage * 10}" class="px-4 py-2 text-gray-700 bg-white rounded-md hover:bg-blue-500 hover:text-white transition-colors">
                            < 이전
                        </a>
                    </li>
                </c:if>
                <%--  <a> 10개 출력   --%>
<%--  TODO: 여기도 얼른 고쳐야하는 conditional   --%>
                <c:set var="endResult" value="${postsCount mod 100 / 10}"/>
                <fmt:formatNumber var = "endNum" maxFractionDigits="0" value="${endResult - (endResult mod 1)}"/>
                    <c:forEach begin="${totalPage * 10 + 1}"
                           end="${totalPage lt postsCount/10/10-1 ?
                            totalPage * 10 + 10 : postsCount mod 10 == 0 ?
                                                ((totalPage * 10) + endNum) : ((totalPage * 10) + endNum)+1}"
                           var="i">
                    <li>
                        <a href="?page=${i}" class="px-4 py-2 text-gray-700 bg-white rounded-md hover:bg-blue-500 hover:text-white transition-colors
                                <%-- 선택 효과 --%>
                                <c:if test="${i == currentPage}"> bg-blue-500 text-white </c:if>">
                            ${i}
                        </a>
                    </li>
                </c:forEach>
                <%-- 이후 목록   --%>
<%-- TODO: 마지막 조건쪽 LT 가장 먼저 고칠 부분   --%>
                <c:if test="${currentPage < (totalPage + 1)*10 + 1 &&  totalPage lt postsCount/10/10-1 }">
                    <li>
                        <a href="?page=${(totalPage + 1)*10 + 1}" class="px-4 py-2 text-gray-700 bg-white rounded-md hover:bg-blue-500 hover:text-white transition-colors">
                            다음 >
                        </a>
                    </li>
                </c:if>
            </ul>
    <div class="flex justify-end">
        <a href="write">
            <button name="new" type="button" class="new-btn bg-green-500 text-white px-4 py-2 rounded hover:bg-green-700 focus:outline-none">글쓰기            </button>
        </a>
    </div>
    </div>
        </div>
    </div>
</section>

<%-- 혹시 몰라 저장하는 페이징 로그 --%>
<div style="display: none">
totalPage = ${totalPage}
| postsCount = ${postsCount}
| postsCount mod 100 = ${postsCount mod 100}
| postsCount mod 100 / 10 =  ${postsCount mod 100 / 10}
| endResult = ${endResult}
| endNum = ${endNum}
| totalPage * 10 + 1(begin)=${totalPage * 10 + 1}
| totalPage lt postsCount/10/10-1(end)=${totalPage lt postsCount/10/10-1}
| totalPage * 10 + 10=${totalPage * 10 + 10}
| postsCount mod 10 == 0 ->${postsCount mod 10 == 0}
| T : ${totalPage * 10 + endNum}
     ((totalPage * 10) + endNum) : ((totalPage * 10) + endNum)+1}
</div>

<!-- Modal content -->
<div id="postModal" class="hidden fixed inset-0 bg-gray-900 bg-opacity-50 z-40 overflow-y-auto h-full w-full" onclick="closeModal(event)">
    <div class="flex h-screen justify-center items-center">
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
                <textarea id="modalContent" rows="10" class="text-black w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring">${post.content}</textarea>
            </div>
            <!-- Modal footer -->
            <div class="flex items-center justify-between p-6 space-x-2 rounded-b border-t border-gray-200">
                <button name="previous" type="button" class="previous-btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none">Previous</button>
                <div>
                    <button name="new" type="button" class="new-btn bg-green-500 text-white px-4 py-2 rounded hover:bg-green-700 focus:outline-none">New</button>
                    <button name="modify" type="button" class="modify-btn bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-700 focus:outline-none">Modify</button>
                    <button name="delete" type="button" class="delete-btn bg-red-500 text-white px-4 py-2 rounded hover:bg-red-800 focus:outline-none">Delete</button>
                    <button name="close" onclick="closeModal()" class="close-btn bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 focus:outline-none">Close</button>
                </div>
                <button name="next" type="button" class="next-btn bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700 focus:outline-none">Next</button>
            </div>
        </div>
    </div>
</div>

<script>
  /*    .close-btn, modal close    */
  function closeModal(event) {
    // Only close if the modal backdrop or close button is clicked
    if (event.target.id === 'postModal' || event.target.classList.contains('close-btn')) {
      document.getElementById('postModal').classList.add('hidden');
    }
  }
  // Your JavaScript will go here
  // Add event listeners for opening and closing the modal
  document.querySelectorAll('.seq-link').forEach((link) => {
    link.addEventListener('click', function (event) {
      event.preventDefault();
      const seq = this.getAttribute('data-seq');
      const content = postsData.find((post) => post.seq === seq).content;
      document.getElementById('modalContent').value = content;
      document.getElementById('postModal').classList.remove('hidden');
    });
  });

  document.querySelectorAll('.close-modal').forEach((button) => {
    button.addEventListener('click', function () {
      document.getElementById('postModal').classList.add('hidden');
    });
  });
  //
  // function closeModal(event) {
  //   // Only close if the modal backdrop or close button is clicked
  //   if (
  //       event.target.id === 'postModal' ||
  //       event.target.classList.contains('close-btn')
  //   ) {
  //     document.getElementById('postModal').classList.add('hidden');
  //   }
  // }

  // Functions for handling modal buttons
  function previousPost() {
    /* ... */
  }
  function newPost() {
    /* ... */
  }
  function modifyPost() {
    /* ... */
  }
  function deletePost() {
    /* ... */
  }
  function nextPost() {
    /* ... */
  }
</script>