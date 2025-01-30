// 체크 박스
document.addEventListener("DOMContentLoaded", function () {
    // 장바구니 체크박스 전체 선택 / 해제 기능
    const cartAllCheckbox = document.querySelector("#cart-table #cart-all");
    const checkboxes = document.querySelectorAll("#cart-table > tbody input[type='checkbox']");

    // 전체 선택 / 해제 기능
    cartAllCheckbox.addEventListener("click", function () {
        checkboxes.forEach(function (checkbox) {
            checkbox.checked = cartAllCheckbox.checked;
        });
    });

    // 개별 선택 / 해제 기능
    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("click", function () {
            let allChecked = true;

            // 모든 체크박스를 확인
            checkboxes.forEach(function (cb) {
                if (!cb.checked) {
                    allChecked = false;
                }
            });

            // 전체 선택 체크박스 상태 업데이트
            cartAllCheckbox.checked = allChecked;
        });
    });
});

// 수량 감소
function minusCount(obj) {
    // tr 요소
    const row = obj.closest("tr");

    const id = row.dataset.value;
    const size = row.querySelector(".cart-prod-size").textContent.trim();

    // 수량 정보
    const cartCountValue = row.querySelector('.cart-count-value');
    let count = parseInt(cartCountValue.textContent.trim(), 10);

    // 수량 감소
    if (count > 0) {
        count -= 1;
        cartCountValue.textContent = count;
    }

    $.ajax({
        url: count === 0 ? "Controller?type=cart&action=delete" : "Controller?type=cart&action=update",
        method: 'POST',
        data: count === 0 ? { id: id } : { id: id, size: size, count: count },
        success: function () {
            if (count !== 0) {
                alert("수량이 변경되었습니다.");
            } else {
                alert("상품이 장바구니에서 삭제되었습니다.");
                window.location.href = 'Controller?type=cart&action=select';
            }
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 수량 증가
function plusCount(obj) {
    // tr 요소
    const row = obj.closest("tr");

    const id = row.dataset.value;
    const size = row.querySelector(".cart-prod-size").textContent.trim();

    // 수량 정보
    const cartCountValue = row.querySelector('.cart-count-value');
    let count = parseInt(cartCountValue.textContent.trim(), 10);

    // 수량 증가
    count += 1;
    cartCountValue.textContent = count;

    console.log('id : ' + id);
    console.log('size : ' + size);
    console.log('count : ' + count);

    $.ajax({
        url: "Controller?type=cart&action=update",
        method: 'POST',
        data: {
            id: id,
            size: size,
            count: count
        },
        success: function () {
            alert("수량이 변경되었습니다.");
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 장바구니 삭제
function deleteCart() {
    const checkedBoxes = document.querySelectorAll(".cart-checkbox:checked");
    const ids = Array.from(checkedBoxes).map((checkbox) =>
        checkbox.getAttribute("data-item-id")
    );

    if (ids.length === 0) {
        alert("삭제할 항목을 선택하세요.");
        return;
    }

    $.ajax({
        url: "Controller?type=cart&action=deletes",
        method: 'POST',
        traditional: true, // 배열로 데이터 전송
        data: {
            ids: ids
        },
        success: function () {
            alert("상품이 장바구니에서 삭제되었습니다.");
            window.location.href = 'Controller?type=cart&action=select';
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 장바구니 전체 삭제
function deleteAllCart() {
    $.ajax({
        url: "Controller?type=cart&action=delete_all",
        method: 'POST',
        success: function () {
            alert("전체 삭제되었습니다.");
            window.location.href = 'Controller?type=cart&action=select';
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 장바구니 선택 주문
function onSendPayment() {
    // 체크된 상품들의 정보를 담을 배열
    let selectedItems = [];

    // 체크된 상품들을 가져오기
    $('input[name="chk-cart"]:checked').each(function() {
        const itemId = $(this).data('item-id');
        const itemRow = $(this).closest('tr');

        // 각 항목의 데이터를 가져오기
        const item = [
            itemId,
            itemRow.find('img').attr('src'),
            itemRow.find('.prod_brand').text().trim(),
            itemRow.find('.prod_name').text().trim(),
            itemRow.find('.cart-prod-size').text().trim(),
            itemRow.find('.default-price').text().trim(),
            itemRow.find('.sale-price').text().trim(),
            itemRow.find('.cart-count-value').text().trim()
        ];

        // 데이터를 문자열로 변환하여 배열에 추가
        selectedItems.push(item.join(','));
    });

    $.ajax({
        url: "Controller?type=order&action=order",
        method: 'POST',
        data: {

        },
        success: function () {

        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}