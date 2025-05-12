<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>쇼핑몰 입점 신청</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .red{color: red;}
        .form-label{font-size: 14pt;}
        .center{text-align: center;}
    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    let check=false;
    $(document).ready(function () {
        $("#seller_pw, #chk_pw").on("blur", function () {
            if ($("#seller_pw").val() !== $("#chk_pw").val()) {
                $("#pw_alert").css("display", "block").text("비밀번호가 일치하지 않습니다!");
                $("#submit_bt").prop("disabled",true).css("background-color", "#ddd");
            } else {
                $("#pw_alert").css("display", "none");
                $("#submit_bt").prop("disabled",false).css("background-color", "blue");
            }
        });
    });

    function chk() {

        const id = $("#seller_id").val();
        const param = "type=checkId&seller_id=" + encodeURIComponent(id);
        console.log("idCheck:" +id);
        $.ajax({
            url: "/shop/Controller",
            type: "post",
            data: param,
            dataType: "json",
        }).done(function (res) {
            const submitBtn = document.getElementById("submit_bt");
            if (res.cnt == 0) {
                alert("사용 가능한 ID입니다!");
                submitBtn.removeAttribute("disabled"); // 버튼 활성화
                submitBtn.style.backgroundColor = "blue"; // 배경색 변경
                document.getElementById("seller_id").setAttribute("readonly","true");
                check=true;
            } else {
                alert("사용 불가능한 ID입니다!");
            }
        });
    }
    function submit_btn(frm){
        if(!frm.seller_id.value){
            alert("판매자 ID를 입력해주세요");
            frm.seller_id.focus();
            return;
        }
        if(!check){
            alert("중복 확인을 해주세요")
            return;
        }
        if(!frm.seller_pw.value || frm.seller_pw.value!=frm.chk_pw.value){
            alert("비밀번호를 확인 해주세요");
            frm.seller_pw.focus();
            return;
        }
        if(!frm.email.value){
            alert("이메일을 입력해주세요");
            return;
        }
        if(!frm.phone.value){
            alert("핸드폰 번호를 입력해주세요");
            return;
        }
        if(!frm.name.value){
            alert(" ID를 입력해주세요");
            return;
        }
        if(!frm.ename.value){
            alert(" ID를 입력해주세요");
            return;
        }
        if(!frm.desc.value){
            alert(" ID를 입력해주세요");
            return;
        }
        if(!frm.courier.value){
            alert(" ID를 입력해주세요");
            return;
        }
        if(!frm.address.value){
            alert(" ID를 입력해주세요");
            return;
        }
        frm.submit();
    }
</script>
<div class="container mt-5">
    <h2 class="mb-4 text-center">MUSINSA Parter Center 입점 신청</h2>
    <form action="/shop/Controller?type=addSeller" method="post">
        <div class="card p-4 mb-4">
            <h4 class="mb-3 center">판매자 개인정보</h4>
            <div class="mb-3">
                <label class="form-label">판매자 ID<span class="red">*</span></label>
                <div class="input-group">
                    <input type="text" name="seller_id" id="seller_id" class="form-control" placeholder="아이디 입력">
                    <button type="button" class="btn btn-primary" onclick="chk()">중복 확인</button>
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">판매자 PW<span class="red">*</span></label>
                <div class="input-group">
                    <input type="password" id="seller_pw" name="seller_pw" class="form-control" placeholder="비밀번호 입력">
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">PW 체크<span class="red">*</span></label>
                <div class="input-group">
                    <input type="password" id="chk_pw" class="form-control" placeholder="비밀번호 한 번 더 입력">
                </div>
                <p class="red" id="pw_alert" style="display: none;">비밀번호가 동일하지 않습니다</p>
            </div>
        </div>

        <div class="card p-4 mb-4">
            <h4 class="mb-3 center">브랜드 정보</h4>
            <div class="mb-3">
                <label class="form-label">담당자 이메일<span class="red">*</span></label>
                <input type="email" id="email" name="email" class="form-control" placeholder="담당자 이메일">
            </div>
            <div class="mb-3">
                <label class="form-label">휴대전화번호<span class="red">*</span></label>
                <div class="input-group">
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="'-' 제외하고 입력">
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label">브랜드명(국문)<span class="red">*</span></label>
                <input type="text" id="name" name="name" class="form-control" placeholder="한글 브랜드명 입력">
            </div>
            <div class="mb-3">
                <label class="form-label">브랜드명(영문)<span class="red">*</span></label>
                <input type="text" id="ename" name="ename" class="form-control" placeholder="영문 브랜드명 입력">
            </div>
            <div class="mb-3">
                <label class="form-label">회사 주소<span class="red">*</span></label>
                <input type="text" name="address" id="address" class="form-control" placeholder="회사 주소명을 입력해주세요">
            </div>
            <div class="mb-3">
                <label class="form-label">택배 사<span class="red">*</span></label>
                <input type="text" name="courier" id="courier" class="form-control" placeholder="회사 주소명을 입력해주세요">
            </div>
            <div class="mb-3">
                <label class="form-label">회사 및 브랜드 소개<span class="red">*</span></label>
                <textarea class="form-control" id="desc" name="desc" rows="4" placeholder="브랜드 소개를 입력하세요."></textarea>
            </div>

        </div>
        <div class="text-center">
            <button type="button" id="submit_bt" class="btn btn-success btn-lg" onclick="submit_btn(this.form)" disabled style="background-color: #dddddd" >입점 신청</button>
        </div>
    </form>
</div>


<script>

</script>
</body>
</html>
