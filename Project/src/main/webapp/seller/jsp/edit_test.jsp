<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<header>
    <jsp:include page="./layout/header.jsp"/>
</header>
<body class="container mt-4">
<h3 class="mb-3">상품 이미지 관리</h3>

<!-- 상품 이미지 관리 폼 -->
<form method="POST" action="uploadImages.jsp" enctype="multipart/form-data">
    <!-- 대표 이미지 -->
    <div class="mb-4">
        <label class="form-label">대표 이미지</label>
        <div>
            <div id="mainImageContainer" class="image-container">
                <span class="placeholder">+</span>
                <img id="mainImagePreview" src="" alt="대표 이미지 미리보기" style="display: none;"/>
            </div>
        </div>
        <button type="button" class="btn btn-outline-primary mt-2" onclick="document.getElementById('mainImageInput').click();">대표 이미지 선택</button>
        <input type="file" id="mainImageInput" name="mainImage" accept="image/*" style="display: none;" onchange="previewMainImage(event)"/>
    </div>

    <!-- 추가 이미지 -->
    <div class="mb-4">
        <label class="form-label">추가 이미지</label>
        <div id="additionalImagesContainer" style="display: flex; gap: 10px; flex-wrap: wrap;">
            <!-- 추가 이미지 1 -->
            <div class="additional-image-wrapper">
                <div class="image-container additional-image">
                    <span class="placeholder">+</span>
                    <img src="" alt="추가 이미지 미리보기" class="additional-image-preview" style="display: none;"/>
                </div>
                <button type="button" class="btn btn-outline-secondary mt-2" onclick="triggerAdditionalImageInput(this)">이미지 선택</button>
                <input type="file" name="additionalImages[]" accept="image/*" style="display: none;" onchange="previewAdditionalImage(event, this)"/>
            </div>
        </div>
        <button type="button" class="btn btn-outline-success mt-3" onclick="addAdditionalImage()">이미지 추가</button>
    </div>

    <!-- 제출 버튼 -->
    <button type="submit" class="btn btn-primary">저장</button>
</form>

<style>
    .image-container {
        width: 150px;
        height: 150px;
        display: flex;
        justify-content: center;
        align-items: center;
        border: 1px dashed #ddd;
        position: relative;
        background-color: #f9f9f9;
    }

    .image-container img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }

    .image-container .placeholder {
        font-size: 36px;
        color: #555; /* 진한 회색 */
        font-weight: bold;
    }

    .additional-image-wrapper {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    .placeholder{
        background-color: #f9f9f9;
    }
</style>

<script>
    // 대표 이미지 미리보기
    function previewMainImage(event) {
        const reader = new FileReader();
        reader.onload = function () {
            const preview = document.getElementById('mainImagePreview');
            const placeholder = document.querySelector('#mainImageContainer .placeholder');
            preview.src = reader.result;
            preview.style.display = 'block';
            placeholder.style.display = 'none';
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    // 추가 이미지 미리보기
    function previewAdditionalImage(event, inputElement) {
        const reader = new FileReader();
        reader.onload = function () {
            const container = inputElement.parentElement.querySelector('.image-container');
            const previewImage = container.querySelector('.additional-image-preview');
            const placeholder = container.querySelector('.placeholder');
            previewImage.src = reader.result;
            previewImage.style.display = 'block';
            placeholder.style.display = 'none';
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    // 추가 이미지 입력 필드 트리거
    function triggerAdditionalImageInput(button) {
        const inputElement = button.nextElementSibling;
        inputElement.click();
    }

    // 추가 이미지 필드 동적으로 추가
    function addAdditionalImage() {
        const container = document.getElementById('additionalImagesContainer');
        const newImageWrapper = document.createElement('div');
        newImageWrapper.className = 'additional-image-wrapper';

        newImageWrapper.innerHTML = `
            <div class="image-container additional-image">
                <span class="placeholder">+</span>
                <img src="" alt="추가 이미지 미리보기" class="additional-image-preview" style="display: none;"/>
            </div>
            <button type="button" class="btn btn-outline-secondary mt-2" onclick="triggerAdditionalImageInput(this)">이미지 선택</button>
            <input type="file" name="additionalImages[]" accept="image/*" style="display: none;" onchange="previewAdditionalImage(event, this)"/>
        `;

        container.appendChild(newImageWrapper);
    }
</script>
</body>
</html>