<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String nickname = (String) session.getAttribute("nickname");
    boolean isLoggedIn = (nickname != null);
%>

<html>
<header>
    <jsp:include page="./layout/header.jsp"/>
    <title>상품 등록</title>
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

        .form-container {
            width: 100%;
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
<body>
<div class="container mt-5">
<h3 class="mb-3 center">상품 등록</h3>
<hr/>
<!-- 상품 정보 폼 -->
<form method="POST" action="updateproduct.jsp" class="form-container" enctype="multipart/form-data">
    <!-- 상품 명 -->
    <div style="flex-grow: 1;">
        <div class="mb-4">
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
    <div class="mb-3" style="margin-top: 30px;">
        <label for="content">상세 설명(HTML)</label>
        <textarea id="content" name="content"></textarea>
    </div>


    <!-- 수정/저장 버튼 -->
    <div class="button-container">
        <button type="button" class="btn btn-primary" id="editButton" onclick="enableEditing()">수정</button>
        <button type="submit" class="btn btn-success" id="saveButton" disabled>저장</button>
    </div>
    <hr/>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"></script>
<script>
    $(function(){
        $("#content").summernote({
            lang:"ko-KR",
            callbacks:{
                onImageUpload: function(files, editor){
                    // 이미지가 에디터에 추가될 때마다 수행하는 곳!!!!!!!!!
                    //이미지를 첨부하면 배열로 인식된다.
                    //이것을 서버로 비동기식 통신을 수행하면
                    //서버에 업로드를 시킬 수 있다.
                    for(let i=0; i<files.length; i++)
                        saveImg(files[i], editor);
                }
            }
        });
    });

    function saveImg(file, editor){
        // 서버로 이미지를 보내기 위해 폼객체 준비
        let frm = new FormData();

        // 서버로 파일을 보내기 위해 폼객체에 파라미터를 지정
        frm.append("upload", file);

        //비 동기식 통신
        $.ajax({
            url: "Controller?type=saveImg",
            data: frm,
            type: "post",
            contentType: false,
            processData: false,// 첨부파일을 보내는 것이고, 일반적인 데이터 전송이 아님!
            dataType: "json"
        }).done(function(res){
            //서버에서 보내는 json데이터는 res가 되며, 그 res안에 img_url을 가지고
            //img요소를 에디터에 추가
            $("#content").summernote("editor.insertImage", res.img_url);
        });
    }
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
</body>
<footer>
    <jsp:include page="./layout/footer.jsp"></jsp:include>
</footer>
</html>