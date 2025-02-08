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

// 카테고리와 정렬 값 추출
function getCategoryAndSort() {
    const categoryItem = document.getElementById("list-unstyled");
    const sortItem = document.querySelector(".dropdown-items .dropdown-item.active");

    const category = categoryItem ? categoryItem.querySelector(".unstyled-btn.active")?.getAttribute("data-value") : null;
    const sort = sortItem ? sortItem.getAttribute("data-value") : null;

    return { category, sort };
}

// 상품 조회
function selectProducts(page = 1) {
    const { category, sort } = getCategoryAndSort();
    const search = document.getElementById("total-search-input").value;

    if (!category || !sort) {
        return;
    }

    $.ajax({
        url: 'Controller?type=index&action=select',
        method: 'POST',
        data: {
            category: category,
            sort: sort,
            search: search,
            page: page,
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

// 좋아요 아이콘 클릭 시
function toggleProdHeart(obj, value) {
    // 아이콘이 비어 있는 하트인지 확인
    if (obj.classList.contains('bi-heart')) {
        // 좋아요 처리 로직 호출
        likeProduct(value);

        // 하트 채우기로 변경 및 애니메이션 추가
        obj.classList.remove('bi-heart');
        obj.classList.add('bi-heart-fill', 'heart-animation', 'heart-active');
    } else {
        // 좋아요 취소 처리 로직 호출
        unlikeProduct(value);

        // 다시 비어 있는 하트로 변경 및 애니메이션 추가
        obj.classList.remove('bi-heart-fill', 'heart-active');
        obj.classList.add('bi-heart', 'heart-animation');
    }

    // 애니메이션이 끝나면 클래스 제거
    obj.addEventListener('animationend', function () {
        obj.classList.remove('heart-animation');
    }, { once: true });
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
            selectProducts();
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
            selectProducts();
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}
