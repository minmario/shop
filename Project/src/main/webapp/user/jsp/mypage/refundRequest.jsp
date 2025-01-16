<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <link rel="stylesheet" type="text/css" href="../../css/mypage/refundRequest.css"/>
</head>
<body>
  <!-- header -->
  <jsp:include page="../layout/header.jsp"></jsp:include>

  <!-- content -->
  <div class="wrap">
    <div class="wrap-title">
      <span class="left">환불요청</span>
    </div>

    <!-- 전체 틀 -->
    <div class="box">

      <!-- 환불 상품 정보 -->
      <section class="wrap-product">
        <div class="product-content">
          <div class="product-img">
            <span class="thisisnever_img"></span>
          </div>
          <div class="product-detail">
            <span>[thisisnever]</span><br/>
            Mesh Football Jersey Navy
            <div class="option-text">옵션 : M / 수량 : 1</div>
          </div>
        </div>
      </section>
      <hr/>

      <!-- 환불 사유 선택 -->
      <span class="bold">환불사유</span><br/>
      <select id="select" name="select" onchange="addInput()">
        <option selected="selected">:: 환불 사유를 선택하세요 ::</option>
        <option value="1">단순 변심</option>
        <option value="2">상품 불량</option>
        <option value="3">배송 지연</option>
        <option value="4">상품정보와 상이</option>
        <option value="5">직접 입력</option>
      </select>
      <br/>

      <!-- '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
      <div id="custom-input">
        <input type="text" class="toggle" name="request-reason" placeholder="환불 사유를 입력해주세요"/>
      </div>
      <br/><hr/>

      <!-- 반품 방법 선택 -->
      <div>
      <span class="bold">반품 방법 선택</span><br/>
      <input type="radio" id="shop-delivery" name="delivery" value="1" checked/>
      <label for="shop-delivery">쇼핑몰 지정 반품 택배(CJ대한통운)</label><br/>
      <input type="radio" id="direct" name="delivery" value="2"/>
      <label for="direct">직접발송</label>
      </div><br/>

      <!-- '쇼핑몰 지정 반품 택배'를 선택할 때만 보이는 필드 -->
      <div class="custom-addr">
        <div class="wrap-addrList">
          <button type="button" class="btn btn-outline-secondary add-address-button">배송지 추가하기</button>
          <div class="address-box">
            <input type="radio" id="default-address" name="address" checked>
            <label for="default-address">
              <div class="address-details">
                <p class="name">홍길동 <span class="default">기본 배송지</span></p>
                <p class="address">서울특별시 동작구 보라매로5길 15<br>1층 108호</p>
                <p class="phone">010-1234-1234</p>
              </div>
            </label>
          </div>
          <div class="address-box">
            <input type="radio" id="etc-address" name="address" checked>
            <label for="etc-address">
              <div class="address-details">
                <p class="name">홍길동</p>
                <p class="address">서울특별시 동작구 보라매로5길 15<br>1층 108호</p>
                <p class="phone">010-1234-1234</p>
              </div>
            </label>
          </div>
          <hr/>

          <!-- 환불 계좌 등록-->
          <div class="refund-account">
            <span class="bold">환불 계좌 선택</span><br/><br/>

            <!-- 은행 선택 -->
            <label for="bank-select" class="bold">은행 선택</label><br>
            <select id="bank-select" name="bank">
              <option value="" selected disabled>:: 은행을 선택하세요 ::</option>
              <option value="kbank">KB국민은행</option>
              <option value="shinhan">신한은행</option>
              <option value="woori">우리은행</option>
              <option value="nh">NH농협은행</option>
            </select>
            <br/><br/>

            <!-- 계좌 번호 입력 -->
            <label for="account-number" class="bold">계좌번호</label><br>
            <input type="text" class="toggle" id="account-number" name="account-number" placeholder="계좌번호를 입력하세요" />
            <br/><br/>

            <!-- 예금주 이름 -->
            <label for="account-holder" class="bold">예금주</label><br>
            <input type="text" class="toggle" id="account-holder" name="account-holder" placeholder="예금주 이름을 입력하세요" />
            <br/><br/>
            <hr/>

            <!-- 환불요청 버튼-->
            <button type="button" class="btn btn-outline-secondary add-address-button">환불 신청</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- footer -->
  <jsp:include page="../layout/footer.jsp"></jsp:include>

<script>
  function addInput() {
    let selectValue = document.getElementById("select").value;
    let customInput = document.getElementById("custom-input");

    // 선택된 값이 '5'이면 input 필드를 표시하고, 아니면 숨긴다.
    if (selectValue == "5") {
      customInput.style.display = "block";  // 새로운 input 필드를 보이게 한다.
    } else {
      customInput.style.display = "none";   // 새로운 input 필드를 숨긴다.
    }
  }

  function selectAddr(){
    let radioValue = document.getElementById("shop-delivery").value;
    let customAddr = document.getElementById("custom-addr");

    if (radioValue == "1") {
      customAddr.style.display = "block";  // 새로운 input 필드를 보이게 한다.
    } else {
      customAddr.style.display = "none";   // 새로운 input 필드를 숨긴다.
    }
  }
</script>
</body>
</html>
