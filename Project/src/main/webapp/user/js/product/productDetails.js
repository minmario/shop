document.addEventListener("DOMContentLoaded", function () {
    // 카테고리
    const categoryTabs = document.querySelectorAll(".review-categories li");
    const reviewLists = document.querySelectorAll(".review-list");

    categoryTabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            categoryTabs.forEach((tab) => tab.classList.remove("active"));
            reviewLists.forEach((list) => list.classList.remove("active"));

            this.classList.add("active");
            const target = this.getAttribute("data-target");
            document.getElementById(target).classList.add("active");
        });
    });
    
    // 수량 변경
    const cartCountElements = document.querySelectorAll(".cart-count");
    cartCountElements.forEach(function (cartCountElement) {
        // - 버튼, + 버튼, 카운트 값 span 선택
        const minusButton = cartCountElement.querySelector(".btn-minus");
        const plusButton = cartCountElement.querySelector(".btn-plus");
        const spanElement = cartCountElement.querySelector(".cart-count-value");

        // - 버튼 클릭 이벤트
        minusButton.addEventListener("click", function () {
            let count = parseInt(spanElement.textContent, 10);
            if (count > 0) {
                count -= 1;
                spanElement.textContent = count;
            }
        });

        // + 버튼 클릭 이벤트
        plusButton.addEventListener("click", function () {
            let count = parseInt(spanElement.textContent, 10);
            count += 1;
            spanElement.textContent = count;
        });
    });
});

// 리뷰 입력(키, 몸무게)
function onCheckInput() {
    const heightInputElement = document.getElementById("height-input");
    const weightInputElement = document.getElementById("weight-input");

    // 숫자만 허용 (특수문자와 음수 제거)
    heightInputElement.value = heightInputElement.value.replace(/[^0-9]/g, "");
    weightInputElement.value = weightInputElement.value.replace(/[^0-9]/g, "");

    // 로그 출력
    console.log("heightInput: " + heightInputElement.value);
    console.log("weightInput: " + weightInputElement.value);
}

// 문의 탭 클릭 함수
document.addEventListener("DOMContentLoaded", function () {
    // 모든 탭 버튼과 탭 패널을 선택
    const tabs = document.querySelectorAll(".tab-btn");
    const panels = document.querySelectorAll(".tab-panel");

    // 탭 클릭 이벤트 처리 함수
    function handleTabClick(event) {
        // 모든 탭 버튼과 패널의 active 클래스 제거
        tabs.forEach((btn) => btn.classList.remove("active"));
        panels.forEach((panel) => panel.classList.remove("active"));

        // 현재 클릭한 탭 버튼에 active 클래스 추가
        const clickedTab = event.target;
        clickedTab.classList.add("active");

        // 클릭한 탭의 target 속성 가져오기
        const target = clickedTab.getAttribute("data-target");

        if (target === "review") {
            selectReview();
        } else if (target === "question") {
            selectQuestion();
        }

        document.getElementById(target).classList.add("active");
    }

    // 각 탭 버튼에 클릭 이벤트 추가
    tabs.forEach((tab) => {
        tab.addEventListener("click", handleTabClick);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    
});

// 장바구니 추가
function insertCart() {
    const prod_no = document.getElementById("prod_id").dataset.item;
    const size = document.getElementById("cart-select-size").value;
    const cartCountValue = document.getElementById("count-value");
    const count = parseInt(cartCountValue.textContent, 10);

    if (size == "0") {
        alert("사이즈를 선택하세요.");
        return;
    }
    
    if (count == 0) {
        alert("수량을 선택하세요.");
        return;
    }

    $.ajax({
        url: "Controller?type=cart&action=insert",
        method: 'POST',
        data: {
            prod_no: prod_no,
            size: size,
            count: count
        },
        success: function () {
            if (confirm("장바구니에 상품이 담겼습니다. 장바구니로 이동하시겠습니까?")) {
                window.location.href = 'Controller?type=cart&action=select';
            }
        }
    });
}

// 좋아요 설정/해제
function handleLike(obj) {
    const prod_no = document.getElementById("prod_id").dataset.item;

    // 좋아요 상태
    const isLiked = obj.classList.contains("btn-outline-danger");

    $.ajax({
        url: isLiked ? "Controller?type=productDetails&action=like" : "Controller?type=productDetails&action=unlike",
        method: "POST",
        data: {
            prod_no: prod_no
        },
        success: function (response) {
            if (isLiked) {
                obj.classList.remove("btn-outline-danger");
                obj.classList.add("btn-danger");
                obj.innerHTML = '<i class="bi bi-heart"></i> 좋아요';
            } else {
                obj.classList.remove("btn-danger");
                obj.classList.add("btn-outline-danger");
                obj.innerHTML = '<i class="bi bi-heart"></i> 좋아요';
            }

            window.location.href = 'Controller?type=productDetails&action=select&prod_no=' + prod_no;
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 리뷰 조회
function selectReview() {
    const gender = document.getElementById('gender-select').value;
    const height = document.getElementById('height-input').value;
    const weight = document.getElementById('weight-input').value;

    const data = {
        prod_no: document.getElementById("prod_id").dataset.item,
        gender: gender,
        height: height,
        weight: weight
    };

    $.ajax({
        url: 'Controller?type=productDetails&action=review',
        method: 'POST',
        data: data,
        success: function (response) {
            $("#review").html(response);

            document.getElementById("gender-select").value = gender;
            document.getElementById("height-input").value = height;
            document.getElementById("weight-input").value = weight;
        },
        error: function (error) {
            alert("리뷰 데이터를 가져오는 중 오류가 발생했습니다.");
        }
    });
}

// 문의 조회
function selectQuestion() {
    $.ajax({
        url: "Controller?type=productDetails&action=question",
        type: "POST",
        data: {
            prod_no: document.getElementById("prod_id").dataset.item,
        },
        success: function (data) {
            $("#question").html(data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("문의 데이터를 가져오는 중 오류가 발생했습니다.");
        }
    });
}

// 판매자에게 문의하기
function onMoveQuestionPage() {
    window.location.href = "Controller?type=question&action=write&prod_no=" + document.getElementById("prod_id").dataset.item;
}