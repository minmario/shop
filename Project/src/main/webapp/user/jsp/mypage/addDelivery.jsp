<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2025-01-14
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/mypage/addDelivery.css"/>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
    <div id="wrap">

        <div id="wrap-title">
            <h4>배송지 추가</h4>
        </div>

        <div id="wrap-table">
            <table id="table">
                <caption>배송지 정보 입력 테이블</caption>
                <tbody>
                    <tr>
                        <td class="info">
                            <span>이름</span>
                            <span class="asterisk"></span>
                        </td>
                        <td><input type="text" class="text" name="name" placeholder="받는 분의 이름을 입력하세요"/></td>
                    </tr>
                    <tr>
                        <td class="info">
                            <span>연락처</span>
                            <span class="asterisk"></span>
                        </td>
                        <td><input type="text" class="text" name="phone" placeholder="받는 분의 연락처를 입력하세요"/></td>
                    </tr>
                    <tr>
                        <td class="info">
                            <span>주소</span>
                            <span class="asterisk"></span>
                        </td>
                        <td>
                            <input type="text" class="addr1" name="pos_code" placeholder="우편번호"/>
                            <button class="btn btn-primary" type="submit">주소검색</button><br/>
                            <input type="text" class="addr2" name="addr1" placeholder="주소"/><br/>
                            <input type="text" class="addr2" name="addr2" placeholder="상세주소"/><br/>
                        </td>
                    </tr>
                    <tr>
                        <td class="info"><span>배송 요청사항 (선택)</span></td>
                        <td>
                            <select id="select" name="select" onchange="addInput()">
                                <option selected="selected">:: 배송 요청사항을 선택하세요 ::</option> <!--가장 먼저 작성하는 것이 선택되기 때문에 selected로 지정한다. -->
                                <option value="1">문 앞에 놔주세요</option>
                                <option value="2">경비실에 맡겨주세요</option>
                                <option value="3">택배함에 넣어주세요</option>
                                <option value="4">배송 전에 연락주세요</option>
                                <option value="5">직접 입력</option>
                            </select>
                            <br/>
                            <!-- '직접 입력'을 선택할 때만 보이는 새로운 입력 필드 -->
                            <div id="custom-input">
                                <input type="text" class="toggle" name="deli_request" placeholder="배송 요청 사항을 직접 입력하세요"/>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div id="wrap-checkbox">
            <span class="left">
                <input type="checkbox" id="chk" name="chk"/>
                <label for="chk">기본 배송지로 설정</label>
            </span>
            <span class="right">
                <button type="button" class="btn btn-secondary" onclick="save()">등록</button>
            </span>
        </div>
        <br/>
        <div id="wrap-list">
            <ol>
                <li>배송 주소록은 최대 3개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
                <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
            </ol>
        </div>


    </div>
</body>
<footer>
    <jsp:include page="../layout/footer.jsp"></jsp:include>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossOrigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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
</script>
</html>
