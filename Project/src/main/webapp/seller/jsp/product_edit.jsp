<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    boolean isLoggedIn = (nickname != null);
%>

<html>
<header>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <jsp:include page="./layout/header.jsp"/>
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

        .additional-option-wrapper {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .form-container {
            width: 50%;
            margin: 0 auto;
            text-align: left;
        }

        .button-container {
            display: flex;
            gap: 10px;
            justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
            margin-top: 20px;
        }

        .center{
            text-align: center;
        }

        .option-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .placeholder {
            background-color: #f9f9f9;
        }

    </style>
</header>
<body class="container mt-4">
<h3 class="mb-3 center">상품 등록</h3>

<!-- 상품 정보 폼 -->
<form method="POST" action="updateproduct.jsp" class="form-container" enctype="multipart/form-data">
    <!-- 상품 명 -->
    <div style="flex-grow: 1;">
        <div class="mb-3">
            <label for="prod_name" class="form-label">상품명</label>
            <input type="text" class="form-control" id="prod_name" name="prod_name" value="${product.prod_name}" style="width: 100%;">
        </div>
        <hr/>
        <!-- 상품 옵션 -->
        <div class="mb-3">
            <label class="form-label">상품 옵션</label>
            <div id="productOptionsContainer">
                <div class="option-group">
                    <input type="text" class="form-control" name="prod_option[]" placeholder="옵션을 입력하세요">
                </div>
            </div>
            <button type="button" class="btn btn-outline-success mt-2" onclick="addOption()">옵션 추가</button>
        </div>
        <hr/>
        <div class="mb-3">
            <label for="prod_color" class="form-label">상품 색상</label>
            <select id="prod_color" name="prod_color" class="form-control"
                    onchange="changeColor()" style="height: 40px; width:60px;">
                <option value="" disabled selected>선택</option>
                <option value="red" style="background-color: red;"></option>
                <option value="blue" style="background-color: blue; "></option>
                <option value="green" style="background-color: green;"></option>
                <option value="yellow" style="background-color: yellow; "></option>
                <option value="orange" style="background-color: orange;"></option>
                <option value="purple" style="background-color: purple; "></option>
                <option value="pink" style="background-color: pink; "></option>
                <option value="brown" style="background-color: brown; "></option>
                <option value="gray" style="background-color: gray; "></option>
                <option value="black" style="background-color: black;  ;"></option>
                <option value="white" style="background-color: white;  ;"></option>
                <option value="beige" style="background-color: beige; ;"></option>
                <option value="cyan" style="background-color: cyan; ;"></option>
                <option value="magenta" style="background-color: magenta;"></option>
                <option value="lavender" style="background-color: lavender; "></option>
                <option value="indigo" style="background-color: indigo; "></option>
                <option value="gold" style="background-color: gold; ;"></option>
                <option value="silver" style="background-color: silver;"></option>
                <option value="teal" style="background-color: teal;"></option>
                <option value="violet" style="background-color: violet;"></option>
            </select>
        </div>
        <hr/>
        <!-- 가격 -->
        <div class="mb-3">
            <label for="price" class="form-label">판매가</label><br/>
            <input type="number" class="form-control" id="price" name="price" value="${product.price}" style="width: 50%;display: inline-block;">
            <span>원</span>
        </div>
        <hr/>
        <!-- 할인 -->
        <div class="mb-3">
            <label for="sale_price" class="form-label">할인</label><br/>
            <input type="number" class="form-control" id="sale_price" name="sale_price" value="${product.sale_price}" style="width: 50%; display: inline-block;">
            <span>원</span>
        </div>
        <div class="mb-3" id="discountedPriceContainer">
            <p id="discountedPrice" style="font-weight: bold; color: #28a745;">할인 후 가격: 0 원</p>
        </div>
        <hr/>
        <label class="form-label">대표 이미지</label>
        <div>
            <div id="mainImageContainer" class="image-container">
                <span class="placeholder">+</span>
                <img id="mainImagePreview" src="" alt="대표 이미지 미리보기" style="display: none;"/>
            </div>
        </div>
        <button type="button" class="btn btn-outline-primary mt-2" onclick="document.getElementById('mainImageInput').click();">대표 이미지 선택</button>
        <input type="file" id="mainImageInput" name="mainImage" accept="image/*" style="display: none;" onchange="previewMainImage(event)"/>

        <!-- 추가 이미지 -->

        <hr/>
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
    <!-- 추가 이미지 아래에 HTML 에디터 추가 -->
    <div class="mb-3">
        <label class="form-label">HTML 에디터</label>
        <textarea name="htmlContent" id="htmlEditor" class="form-control" rows="10" placeholder="여기에 HTML을 작성하세요..."></textarea>
    </div>

    <script>
        // CKEditor 초기화
        ClassicEditor
            .create(document.querySelector('#htmlEditor'), {
                simpleUpload: {
                    uploadUrl:  "./seller/images/file.jpg", // 파일을 업로드할 서버 URL을 설정
                }
            })
            .catch(error => {
                console.error(error);
            });

    </script>
    <button type="button" class="btn btn-outline-primary mt-2" onclick="loadExternalHtml()">외부 HTML 불러오기</button>

    <script>
        // 외부 HTML 파일을 불러와 에디터에 로드하는 함수

        function loadExternalHtml() {
            fetch('/static/external/file.html')
                .then(response => response.text())
                .then(data => {
                    // 가져온 HTML을 에디터에 삽입
                    const editorInstance = ClassicEditor.instances.htmlEditor;
                    editorInstance.setData(data);
                })
                .catch(error => {
                    console.error("HTML 파일을 불러오는 중 오류가 발생했습니다.", error);
                });
        }
    </script>
    <!-- 수정/저장 버튼 -->
    <div class="button-container">
        <button type="button" class="btn btn-primary" id="editButton" onclick="enableEditing()">수정</button>
        <button type="submit" class="btn btn-success" id="saveButton" disabled>저장</button>
    </div>
    <hr/>
</form>

<script>
    // 상품 옵션 추가
    function addOption() {
        const container = document.getElementById('productOptionsContainer');
        const newOptionGroup = document.createElement('div');
        newOptionGroup.className = 'option-group';
        newOptionGroup.innerHTML = `
            <input type="text" class="form-control" name="productOption[]" placeholder="옵션을 입력하세요">
        `;
        container.appendChild(newOptionGroup);
    }

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
    function changeColor() {
        const selectElement = document.getElementById("prod_color");
        const selectedColor = selectElement.value;

        // 선택된 색상으로 select 박스의 배경색을 변경
        selectElement.style.backgroundColor = selectedColor;
    }
    window.onload = function() {
        updateDiscountedPrice();
    };

    // 할인 후 가격 업데이트
    function updateDiscountedPrice() {
        const price = parseFloat(document.getElementById('price').value) || 0;
        const salePrice = parseFloat(document.getElementById('sale_price').value) || 0;
        const discountedPrice = price - salePrice;

        if (discountedPrice < 0) {
            alert("할인 금액이 정가보다 클 수 없습니다.");
            document.getElementById('sale_price').value = 0;
            return;
        }

        // discountedPriceElement를 가져오고 텍스트 업데이트
        const discountedPriceElement = document.getElementById('discountedPrice');
        console.log("${discountedPrice.toString()}")
        if (discountedPriceElement) {
            discountedPriceElement.innerText = "할인 후 가격: " +discountedPrice+"원"; // innerText 사용
        }
    }

    // 정가나 할인 금액이 변경될 때마다 가격 업데이트
    document.getElementById('price').addEventListener('input', updateDiscountedPrice);
    document.getElementById('sale_price').addEventListener('input', updateDiscountedPrice);
</script>
</script>
</body>
</html>