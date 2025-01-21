<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="alarm-header">
    <h2>알림</h2>
</div>
<div class="alarm-tabs">
    <ul class="nav nav-tabs" id="alarmTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="tab-all" data-toggle="tab" href="#table-all" role="tab">전체</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="tab-sale" data-toggle="tab" href="#table-sale" role="tab">세일/쿠폰</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="tab-snap" data-toggle="tab" href="#table-snap" role="tab">스냅</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="tab-review" data-toggle="tab" href="#table-review" role="tab">후기</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="tab-order" data-toggle="tab" href="#table-order" role="tab">주문/배송</a>
        </li>
    </ul>
</div>
<div class="tab-content">
    <table id="table-all" class="table tab-pane fade show active" role="tabpanel">
        <tbody>
            <c:forEach begin="0" end="9">
                <tr>
                    <td>
                        <div class="alarm-item">
                            <div class="alarm-content">
                                <h5>무신사 체험단</h5>
                                <p>피곤한워싱턴버튼님! 체험단 당첨 확률이 약 20명 중 1명인 거 알고 계신가요?</p>
                                <span class="alarm-time">8시간 전</span>
                            </div>
                            <div class="alarm-img">
                                <img src="./user/images/share_musinsa.png" alt="Logo">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <table id="table-sale" class="table tab-pane fade" role="tabpanel">
        <tbody>
            <c:forEach begin="0" end="1">
                <tr>
                    <td>
                        <div class="alarm-item">
                            <div class="alarm-content">
                                <h5>무신사 체험단</h5>
                                <p>피곤한워싱턴버튼님! 체험단 당첨 확률이 약 20명 중 1명인 거 알고 계신가요?</p>
                                <span class="alarm-time">8시간 전</span>
                            </div>
                            <div class="alarm-img">
                                <img src="./user/images/share_musinsa.png" alt="Logo">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <table id="table-snap" class="table tab-pane fade" role="tabpanel">
        <tbody>
            <c:forEach begin="0" end="3">
                <tr>
                    <td>
                        <div class="alarm-item">
                            <div class="alarm-content">
                                <h5>무신사 체험단</h5>
                                <p>피곤한워싱턴버튼님! 체험단 당첨 확률이 약 20명 중 1명인 거 알고 계신가요?</p>
                                <span class="alarm-time">8시간 전</span>
                            </div>
                            <div class="alarm-img">
                                <img src="./user/images/share_musinsa.png" alt="Logo">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <table id="table-review" class="table tab-pane fade" role="tabpanel">
        <tbody>
            <c:forEach begin="0" end="6">
                <tr>
                    <td>
                        <div class="alarm-item">
                            <div class="alarm-content">
                                <h5>무신사 체험단</h5>
                                <p>피곤한워싱턴버튼님! 체험단 당첨 확률이 약 20명 중 1명인 거 알고 계신가요?</p>
                                <span class="alarm-time">8시간 전</span>
                            </div>
                            <div class="alarm-img">
                                <img src="./user/images/share_musinsa.png" alt="Logo">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <table id="table-order" class="table tab-pane fade" role="tabpanel">
        <tbody>
            <c:forEach begin="0" end="2">
                <tr>
                    <td>
                        <div class="alarm-item">
                            <div class="alarm-content">
                                <h5>무신사 체험단</h5>
                                <p>피곤한워싱턴버튼님! 체험단 당첨 확률이 약 20명 중 1명인 거 알고 계신가요?</p>
                                <span class="alarm-time">8시간 전</span>
                            </div>
                            <div class="alarm-img">
                                <img src="./user/images/share_musinsa.png" alt="Logo">
                            </div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>