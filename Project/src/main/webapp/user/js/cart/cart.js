// 수량 감소
function minusCount() {
    const id = document.getElementById("cart-prod-id").value;
    const cartCountValue = document.getElementById("cart-count-value");
    const count = parseInt(cartCountValue.textContent, 10);
    const size = document.getElementById("cart-prod-size").value;

    $.ajax({
        url: count == "0" ? "Controller?type=cart&action=delete" : "Controller?type=cart&action=update",
        method: 'POST',
        data: {
            id: id,
            size: size,
            count: count
        },
        success: function () {
            if (count != "0") {
                alert("수량이 변경되었습니다.");
            }
        }
    });
}

// 수량 증가
function plusCount() {
    const id = document.getElementById("cart-prod-id").value;
    const cartCountValue = document.getElementById("cart-count-value");
    const count = parseInt(cartCountValue.textContent, 10);
    const size = document.getElementById("cart-prod-size").value;

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
        url: "Controller?type=cart&action=delete",
        method: 'POST',
        traditional: true, // 배열로 데이터 전송
        data: {
            ids: ids
        },
        success: function () {
            alert("삭제되었습니다.");
            window.location.href = 'Controller?type=cart&action=select';
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
        }
    });
}