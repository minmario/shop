document.addEventListener('DOMContentLoaded', () => {
    // side menu toggle
    const toggleButtons = document.querySelectorAll('.toggle-btn');

    toggleButtons.forEach(button => {
        button.addEventListener('click', function () {
            const allButtons = document.querySelectorAll('.toggle-btn i');
            const targetCollapse = this.getAttribute('data-target');
            const targetIcon = this.querySelector('i');

            allButtons.forEach(icon => {
                icon.classList.remove('bi-dash');
                icon.classList.add('bi-plus');
            });

            if (!document.querySelector(targetCollapse).classList.contains('show')) {
                targetIcon.classList.remove('bi-plus');
                targetIcon.classList.add('bi-dash');
            }
        });
    });

    // 카테고리 선택
    const listItems = document.querySelectorAll(".list-unstyled .unstyled-btn");
    let activeItem = document.querySelector(".list-unstyled .unstyled-btn.active");

    const updateActiveItem = (newActiveItem) => {
        // 기존 active 상태 제거
        if (activeItem) {
            activeItem.classList.remove("active");
        }

        // 새 active 상태 설정
        newActiveItem.classList.add("active");
        activeItem = newActiveItem;

        // 선택된 아이템 정보 업데이트
        const itemText = newActiveItem.dataset.name;
        const selectedButton = document.querySelector(".selected-item");
        selectedButton.querySelector(".item-text").textContent = itemText;
        selectedButton.classList.remove("d-none");

        selectProducts();
    };

    // 페이지 로드 시 첫 번째 active 아이템 초기화
    if (activeItem) {
        updateActiveItem(activeItem);
    }

    // 클릭 이벤트 핸들링
    listItems.forEach((item) => {
        item.addEventListener("click", () => {
            updateActiveItem(item);
        });
    });

    // sort 선택
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', function () {
            document.querySelectorAll('.dropdown-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');

            selectProducts();
        });
    });

    // 검색어 입력 및 상품 조회
    document.getElementById("total-search-input").addEventListener("keydown", function (e) {
        if (e.key === 'Enter') {
            selectProducts();
        }
    });
});

// 상품 조회
function selectProducts() {
    const categoryItem = document.getElementById("list-unstyled");
    const sortItem = document.querySelector(".dropdown-items .dropdown-item.active");
    const search = document.getElementById("total-search-input").value;

    let category;
    let sort;

    if (categoryItem) {
        const activeButton = categoryItem.querySelector(".unstyled-btn.active");

        if (activeButton) {
            category = activeButton.getAttribute("data-value");
        }
    }

    if (sortItem) {
        sort = sortItem.getAttribute("data-value");
    }

    if (!category || !sort) {
        return;
    }

    $.ajax({
        url: 'Controller?type=index&action=select',
        method: 'POST',
        data: {
            category: category,
            sort: sort,
            search: search
        },
        success: function (response) {
            $("#product-list").html(response);
        },
        error: function () {
            alert('상품 조회에 실패했습니다.');
        }
    });
}

// 로그인을 하지 않았을 때 좋아요 클릭
function notLoginLike() {
    if (confirm("로그인 후 이용할 수 있습니다. 로그인 페이지로 이동하시겠습니까?")) {
        window.location.href = "Controller?type=showlogin";
    }
}

// 좋아요 설정
function likeProduct(value) {
    $.ajax({
        url: "Controller?type=like&action=like",
        method: 'POST',
        data: {
            prod_no: value
        },
        success: function () {
            window.location.href = "Controller";
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 좋아요 해제
function unlikeProduct(value) {
    $.ajax({
        url: "Controller?type=like&action=unlike",
        method: 'POST',
        data: {
            prod_no: value
        },
        success: function () {
            window.location.href = "Controller";
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}
