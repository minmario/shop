document.addEventListener("DOMContentLoaded", function () {
    // 장바구니 목록
    selectCart();

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
            selectCart();
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
            selectCart();
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
            selectCart();
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
            selectCart();
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}

// 장바구니 목록 조회
function selectCart() {
    $.ajax({
        url: "Controller?type=cart&action=select",
        method: 'POST',
        success: function (response) {
            $("#cart-article").html(response);
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
        selectedItems.push($(this).data('item-id'));
    });

    if (selectedItems.length == 0) {
        alert("선택된 상품이 없습니다.");
        return;
    }

    let path= "Controller?type=cart&action=order";
    for (let i= 0; i < selectedItems.length; i++) {
        path += "&selectedItems="+selectedItems[i];
    }
    window.location.href = path;
}

// 옵션 변경 모달 열기
function onShowOptionModal(value) {
    $('#optionModal').on('shown.bs.modal', function () {
        const isVisible = $('#optionModal').is(':visible');

        if (isVisible) {
            selectProdSize(value);
        }
    });

    // 모달 열기
    $('#optionModal').modal('show');
}

// 옵션 변경 모달 닫기
function onHideOptionModal() {
    $('#optionModal').modal('hide');
}

// 사이즈 정보 조회
function selectProdSize(value) {
    $.ajax({
        url: "Controller?type=cart&action=select_size",
        method: 'POST',
        data: {
            prod_no: value
        },
        success: function (response) {
            if (response.success) {
                const optionSelect = document.getElementById('option-size-select');
                optionSelect.innerHTML = '';

                response.data.forEach(function(item) {
                    const option = document.createElement('option');
                    option.value = item.prod_no;
                    option.textContent = item.option_name;

                    optionSelect.appendChild(option);
                });
            } else {
                alert("응답에 실패했습니다.");
            }
        },
        error: function (error) {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
}