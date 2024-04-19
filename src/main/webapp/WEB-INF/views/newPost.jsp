<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section>
    <!-- 이후에 board에서 바로 modal 띄울 예정 -->
    <!-- Modal content  modify|write ? "write" : "modify" -->
        <form name="newPost" action="${empty post.seq ? "write" : "modify"}" method="post"  class="flex justify-center items-center">
            <div class="relative bg-white rounded-lg shadow-xl w-full max-w-6xl mx-4">
                <!-- Modal header -->
                <div class="items-center p-5 rounded-t border-b">
                    <label>
                        <input name="bno" type="hidden" value="${post.seq}"/>
                        <span class="text-black text-xl">${post.seq}</span>
                        <textarea name="title" rows="1" class=" text-black text-2xl font-semibold w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring" placeholder="제목을 입력하세요.">${post.title}</textarea>
                    </label>
                </div>
                <!-- Modal body -->
                <div class="p-6 space-y-6">
                    <label>
                        <textarea name="content" placeholder="내용을 입력하세요." rows="15" class="text-black w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring">${post.content}</textarea>
                    </label>
                </div>
                <!-- Modal footer -->
                <div class="flex items-center justify-center p-6 space-x-2 rounded-b border-t border-gray-200">
                        <button name="save" type="submit" class="new-btn bg-green-500 text-white px-4 py-2 rounded hover:bg-green-700 focus:outline-none">Save</button>
                        <button name="close" type="reset" onclick="history.back()" class="close-btn bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 focus:outline-none"><a href="#"> Close </a></button>
                </div>
            </div>
        </form>
</section>