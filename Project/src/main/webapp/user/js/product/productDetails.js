document.addEventListener("DOMContentLoaded", function () {
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
});

//문의 탭 클릭 함수
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
        const value = clickedTab.getAttribute("data-value");

        // 해당하는 패널 활성화
        if (target === "question") {
            loadQuestionData(value); // 문의 데이터를 로드
        } else {
            document.getElementById(target).classList.add("active");
        }
    }

    // 문의 데이터를 불러오는 함수 정의
    function loadQuestionData(value) {
        const questionPanel = document.getElementById("question");

        $.ajax({
            url: "Controller?type=productDetails&action=question",
            type: "POST",
            data: {
                prod_no: value,
            },
            success: function (data) {
                $("#question").html(data);
                questionPanel.classList.add("active");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("AJAX 요청 실패:", textStatus, errorThrown);
                alert("문의 데이터를 가져오는 중 오류가 발생했습니다.");
            }
        });
    }

    // 각 탭 버튼에 클릭 이벤트 추가
    tabs.forEach((tab) => {
        tab.addEventListener("click", handleTabClick);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const sizeSelect = document.getElementById("size-select");
    const genderSelect = document.getElementById("gender-select");
    const heightInput = document.getElementById("height-input");
    const weightInput = document.getElementById("weight-input");
    const photoToggle = document.getElementById("photo-review-toggle");
    const mySizeToggle = document.getElementById("my-size-toggle");

    sizeSelect.addEventListener("change", () => {
        console.log("사이즈 선택:", sizeSelect.value);
    });

    genderSelect.addEventListener("change", () => {
        console.log("성별 선택:", genderSelect.value);
    });

    heightInput.addEventListener("input", () => {
        console.log("키 입력:", heightInput.value);
    });

    weightInput.addEventListener("input", () => {
        console.log("몸무게 입력:", weightInput.value);
    });

    photoToggle.addEventListener("change", () => {
        console.log("사진 후기만:", photoToggle.checked);
    });

    mySizeToggle.addEventListener("change", () => {
        console.log("내 사이즈:", mySizeToggle.checked);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    // 모든 cart-count 요소를 선택
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
                alert("좋아요를 추가했습니다.");
            } else {
                obj.classList.remove("btn-danger");
                obj.classList.add("btn-outline-danger");
                obj.innerHTML = '<i class="bi bi-heart"></i> 좋아요';
                alert("좋아요를 취소했습니다.");
            }

            window.location.href = 'Controller?type=productDetails&action=select&prod_no=' + prod_no;
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}
