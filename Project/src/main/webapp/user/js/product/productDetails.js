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

        // 해당하는 패널 활성화
        if (target === "inquiry") {
            loadInquiryData(); // 문의 데이터를 로드
        } else {
            document.getElementById(target).classList.add("active");
        }
    }

    // 문의 데이터를 불러오는 함수 정의
    function loadInquiryData() {
        const inquiryPanel = document.getElementById("inquiry");

        $.ajax({
            url: "Controller?type=productDetails&action=question",
            type: "POST",
            success: function (response) {
                $("#inquiry").html(response);
                inquiryPanel.classList.add("active");
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
    const inquiryItems = document.querySelectorAll(".inquiry-item");

    inquiryItems.forEach((item) => {
        const header = item.querySelector(".inquiry-header");
        const arrow = header?.querySelector(".arrow"); // arrow가 없을 경우 null 처리
        const content = item.querySelector(".inquiry-content");

        if (!header || !content) {
            console.warn("Required elements (header/content) are missing:", item);
            return; // 필수 요소가 없으면 실행 중단
        }

        header.addEventListener("click", () => {
            const isOpen = item.classList.contains("open");

            inquiryItems.forEach((i) => {
                if (i !== item) {
                    i.classList.remove("open");
                    const otherContent = i.querySelector(".inquiry-content");
                    const otherArrow = i.querySelector(".arrow");
                    if (otherContent) otherContent.style.display = "none";
                    if (otherArrow) otherArrow.classList.replace("bi-chevron-up", "bi-chevron-down");
                }
            });

            if (isOpen) {
                item.classList.remove("open");
                content.style.display = "none";
                if (arrow) arrow.classList.replace("bi-chevron-up", "bi-chevron-down");
            } else {
                item.classList.add("open");
                content.style.display = "block";
                if (arrow) arrow.classList.replace("bi-chevron-down", "bi-chevron-up");
            }
        });
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
    const prodNo = document.getElementById("prod_id").value;
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
            prodNo: prodNo,
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