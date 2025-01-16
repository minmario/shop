<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="delivery-section">
    <div class="delivery-header">
        <span class="delivery-title">배송지 목록</span>
    </div>
</div>
<table id="delivery-table" class="table">
    <thead>
        <tr>
            <th><input type="checkbox" id="delivery-all"/></th>
            <th>번호</th>
            <th>이름</th>
            <th>연락처</th>
            <th>주소</th>
            <th>관리</th>
        </tr>
    </thead>
    <tbody>
        <c:set var="cnt" value="3"/>
        <c:forEach begin="1" end="${cnt}" varStatus="st">
            <tr>
                <td><input type="checkbox" name="chk-delivery"/></td>
                <td>${st.index}</td>
                <td>OOO</td>
                <td>010-0000-0000</td>
                <td>서울특별시 동작구 보라매로5길 15</td>
                <td>
                    <button type="button" class="btn btn-outline-secondary" onclick="location.href='Controller?type=editAddr'">수정</button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<div class="delivery-buttons">
    <span class="delivery-buttons-left">
        <button type="button" class="btn btn-sm btn-outline-danger" onclick="">선택 배송지 삭제</button>
    </span>
    <span class="delivery-buttons-right">
        <button type="button" class="btn btn-primary btn-sm" onclick="onShowAddAddrModal()">배송지 추가</button>
    </span>
</div>
<br/><br/>
<div class="delivery-notice">
    <ol>
        <li>배송 주소록은 최대 3개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
        <li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
    </ol>
</div>