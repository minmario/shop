"use strict";

// 전역 변수 선언
const productsData = {};      // 각 상품의 할인 및 가격 정보를 저장 (상품별 멤버 변수)
const appliedCoupons = {};    // (key: cartNo, value: 쿠폰 번호)
const usedCoupons = new Set(); // 사용 중인 쿠폰 번호 저장
let currentCartNo = null;     // 현재 모달에 표시 중인 상품 번호
let coupons = [];             // 선택된 상품의 쿠폰 목록 저장
let usedPoints = 0;           // 사용한 보유 적립금(포인트)을 전역 변수로 관리

// 페이지 로드 시 초기 상품 데이터 저장 및 초기 리워드 옵션 적용
document.addEventListener("DOMContentLoaded", () => {
    const productElements = document.querySelectorAll(".product-info");
    productElements.forEach((productElem) => {
        const cartNo = productElem.getAttribute("data-cart-no");
        const prodNo = productElem.getAttribute("data-prod-no");
        const inventoryNo = productElem.getAttribute("data-inventory-no");

        // 원래 가격은 original-price 요소에서 읽음
        let originalPrice = 0;
        const originalPriceElem = productElem.querySelector(".original-price");
        if (originalPriceElem) {
            originalPrice = parseFloat(originalPriceElem.innerText.replace(/[^0-9]/g, "")) || 0;
        }
        // 할인된 가격(이미 적용된 vendor 할인)이 있다면 별도 변수에 저장(참고용)
        let vendorPrice = originalPrice;
        const discountedPriceElem = productElem.querySelector(".discounted-price");
        if (discountedPriceElem) {
            vendorPrice = parseFloat(discountedPriceElem.innerText.replace(/[^0-9]/g, "")) || originalPrice;
        }
        // 쿠폰 할인은 원래 가격에 대해 적용하기 위해 basePrice를 originalPrice로 설정
        const basePrice = originalPrice;

        const countElem = productElem.querySelector("#product-count");
        const count = countElem ? parseInt(countElem.innerText.replace(/[^0-9]/g, "")) || 0 : 0;
        const point = Math.floor(productElem.querySelector(".prod_point").value);

        if (cartNo) {
            productsData[cartNo] = {
                prodNo: prodNo,
                inventoryNo: inventoryNo,
                originalPrice: basePrice,       // 원래 가격 (쿠폰 할인의 기준)
                basePrice: basePrice,           // 쿠폰 할인 적용 시 기준이 되는 가격
                count: count,
                couponDiscount: 0,              // 쿠폰 할인액 (원래 가격 기준)
                rewardDiscount: 0,              // 리워드 할인액 (선할인 또는 구매 적립 시 할인액)
                amount: basePrice * count,      // 원래 총액 (할인 전)
                base_total: basePrice * count,  // 쿠폰, 리워드 할인 적용 후 금액 (포인트 배분 전)
                result_amount: basePrice * count, // 최종 결제 금액 (포인트 배분까지 적용)
                point: point
            };
        }
    });
    // 리워드 옵션 설정 (구매 적립 또는 선할인)
    toggleRewardDisplay(document.querySelector('input[name="reward"]:checked'));
    calcTotalPaymentPrice();
});

// ──────────────────────────────
// 할인 및 최종 금액 재계산 함수
// ──────────────────────────────

/*
  각 상품에 대해:
  1. unitPriceAfterDiscount = max(basePrice - couponDiscount - rewardDiscount, 0)
  2. base_total = unitPriceAfterDiscount * count
  3. 전체 상품의 base_total 합계(totalWithoutPoints)를 구함
  4. 각 상품에 대해 allocatedPoint = usedPoints * (product.base_total / totalWithoutPoints)
  5. result_amount = base_total - allocatedPoint
*/
const recalcAllProductResults = () => {
    let totalWithoutPoints = 0;
    for (let cartNo in productsData) {
        const product = productsData[cartNo];
        const unitPriceAfterDiscount = Math.max(product.basePrice - product.couponDiscount - product.rewardDiscount, 0);
        product.base_total = unitPriceAfterDiscount * product.count;
        totalWithoutPoints += product.base_total;

        console.log("cartNo:", cartNo, "basePrice:", product.basePrice,
            "couponDiscount:", product.couponDiscount, "rewardDiscount:", product.rewardDiscount,
            "unitPriceAfterDiscount:", unitPriceAfterDiscount, "base_total:", product.base_total);
    }

    for (let cartNo in productsData) {
        const product = productsData[cartNo];
        let allocatedPoint = 0;
        if (totalWithoutPoints > 0) {
            allocatedPoint = usedPoints * (product.base_total / totalWithoutPoints);
        }
        product.result_amount = product.base_total - allocatedPoint;

        console.log("cartNo:", cartNo, "allocatedPoint:", allocatedPoint, "result_amount:", product.result_amount);

        // DOM 업데이트 (최종 결제 금액 표시)
        const productElem = document.querySelector(".product-info[data-cart-no='" + cartNo + "']");
        if (productElem) {
            const discountedPriceElem = productElem.querySelector(".discounted-price");
            if (discountedPriceElem) {
                discountedPriceElem.innerText = new Intl.NumberFormat().format(product.result_amount) + "원";
            }
        }
    }
};

const calcTotalPaymentPrice = () => {
    recalcAllProductResults();
    let sum = 0;
    for (let cartNo in productsData) {
        sum += productsData[cartNo].result_amount;
    }
    document.getElementById("total-payment-amount").innerText = sum.toLocaleString() + "원";
    document.getElementById("total_amount").innerText = sum.toLocaleString() + "원";
    document.getElementById("total-payment").innerText = sum.toLocaleString();
};

// ──────────────────────────────
// 쿠폰 할인 관련 함수
// ──────────────────────────────

const updateProductPriceWithDiscount = (cartNo, salePer) => {
    const product = productsData[cartNo];
    if (!product) return;
    // 쿠폰 할인액 = 원래 가격(originalPrice) * (salePer / 100)
    product.couponDiscount = product.originalPrice * (salePer / 100);
    console.log("updateProductPriceWithDiscount - cartNo:", cartNo, "couponDiscount:", product.couponDiscount);
    calcTotalPaymentPrice();
};

const resetCouponForProduct = (cartNo) => {
    const product = productsData[cartNo];
    if (!product) return;
    product.couponDiscount = 0;
    calcTotalPaymentPrice();
};

// ──────────────────────────────
// 리워드(구매 적립/선할인) 관련 함수
// ──────────────────────────────

const updateRewardDiscountForAll = () => {
    const selectedRadio = document.querySelector('input[name="reward"]:checked');
    if (!selectedRadio) return;

    for (let cartNo in productsData) {
        const product = productsData[cartNo];
        if (getSelectedReward() === "1") { // 선할인 선택 시: 할인액 = 원래 가격 * (할인율)
            const discountRate = parseFloat(selectedRadio.getAttribute("data-value")) / 100;
            product.rewardDiscount = product.originalPrice * discountRate;
        } else { // 구매 적립 선택 시: 할인액 없음
            product.rewardDiscount = 0;
        }
    }
    calcTotalPaymentPrice();
};

const toggleRewardDisplay = (selectedRadio) => {
    const rewardEarnElem = document.getElementById("reward-earn");
    const rewardDiscountElem = document.getElementById("reward-discount");
    const totalSavePointElem = document.getElementById("total-save-point");

    // 두 옵션 모두 숨김
    rewardEarnElem.style.display = "none";
    rewardDiscountElem.style.display = "none";
    if (totalSavePointElem && totalSavePointElem.parentElement) {
        totalSavePointElem.parentElement.style.display = "none";
    }

    if (selectedRadio.value === "earn") {
        rewardEarnElem.style.display = "inline";
        totalSavePointElem.innerText = "";
        if (totalSavePointElem.parentElement) {
            totalSavePointElem.parentElement.style.display = "flex";
        }
    } else if (selectedRadio.value === "discount") {
        rewardDiscountElem.style.display = "inline";
    }
    updateRewardDiscountForAll();
};

// ──────────────────────────────
// 헬퍼 함수
// ──────────────────────────────

const getSelectedReward = () => {
    const selectedRadio = document.querySelector('input[name="reward"]:checked');
    return selectedRadio.value === "earn" ? "0" : "1";
};

const getNumericValue = (elementId) => {
    const elem = document.getElementById(elementId);
    if (!elem) {
        console.error("요소 " + elementId + "를 찾을 수 없습니다.");
        return 0;
    }
    const text = elem.innerText;
    const numericValue = parseInt(text.replace(/[^0-9]/g, ""), 10) || 0;
    console.log("getNumericValue(" + elementId + ") = " + numericValue);
    return numericValue;
};

const mergeProducts = () => {
    const merged = {};
    for (let cartNo in productsData) {
        merged[cartNo] = {
            prod: {
                prodNo: productsData[cartNo].prodNo,
                inventoryNo: productsData[cartNo].inventoryNo,
                // amount: 원래 총액, result_amount: 최종 결제 금액
                amount: productsData[cartNo].amount,
                result_amount: productsData[cartNo].result_amount,
                count: productsData[cartNo].count
            }
        };
        if (appliedCoupons.hasOwnProperty(cartNo)) {
            merged[cartNo].coupon = appliedCoupons[cartNo];
        }
    }
    return merged;
};

// ──────────────────────────────
// 쿠폰 관련 모달 함수
// ──────────────────────────────

const onShowCouponModal = (cartNo, prodNo) => {
    currentCartNo = cartNo;
    $("#couponModal").on("shown.bs.modal", () => {
        if ($("#couponModal").is(":visible")) {
            selectCoupon(prodNo);
        }
    });
    $("#couponModal").modal("show");
};

const selectCoupon = (prodNo) => {
    $.ajax({
        url: "Controller?type=order&action=coupon",
        method: "POST",
        data: { prod_no: prodNo },
        success: (response) => {
            if (response.success) {
                coupons = response.data;
                renderCouponList();
            } else {
                alert("응답에 실패했습니다.");
            }
        },
        error: (error) => {
            alert("요청 처리 중 오류가 발생했습니다.");
            console.error(error);
        }
    });
};

const renderCouponList = () => {
    const couponList = document.getElementById("coupon-list");
    couponList.innerHTML = "";
    if (coupons.length > 0) {
        let maxSalePer = 0;
        coupons.forEach((coupon) => {
            maxSalePer = Math.max(maxSalePer, parseFloat(coupon.sale_per));
        });
        coupons.forEach((coupon) => {
            const couponItem = document.createElement("div");
            couponItem.className = "coupon-item";

            const radioInput = document.createElement("input");
            radioInput.type = "radio";
            radioInput.id = "coupon_" + coupon.coupon_id;
            radioInput.name = "coupon";
            radioInput.className = "coupon-radio";
            radioInput.value = coupon.coupon_id;
            if (appliedCoupons[currentCartNo] === coupon.coupon_id) {
                radioInput.checked = true;
            } else if (usedCoupons.has(coupon.coupon_id)) {
                radioInput.disabled = true;
            }
            couponItem.appendChild(radioInput);

            const label = document.createElement("label");
            label.setAttribute("for", "coupon_" + coupon.coupon_id);
            label.className = "coupon-label";

            const discountText = document.createElement("p");
            discountText.className = "discount";
            discountText.innerText = coupon.sale_per + "% 할인";
            label.appendChild(discountText);

            const description = document.createElement("p");
            description.className = "description";
            if (parseFloat(coupon.sale_per) === maxSalePer) {
                const highlight = document.createElement("span");
                highlight.className = "highlight";
                highlight.innerText = "[최대 할인 쿠폰] ";
                description.appendChild(highlight);
            }
            description.appendChild(document.createTextNode(coupon.name));
            label.appendChild(description);

            const expiryText = document.createElement("p");
            expiryText.className = "expiry";
            expiryText.innerText = coupon.end_date + "까지";
            label.appendChild(expiryText);

            couponItem.appendChild(label);
            couponList.appendChild(couponItem);
        });
    } else {
        const noCouponMsg = document.createElement("div");
        noCouponMsg.innerText = "사용할 수 있는 쿠폰이 없습니다.";
        couponList.appendChild(noCouponMsg);
    }
};

const onApplyCoupon = () => {
    const selectedCoupon = document.querySelector(".coupon-radio:checked");
    if (!selectedCoupon) {
        alert("적용할 쿠폰을 선택하세요.");
        return;
    }
    if (appliedCoupons[currentCartNo]) {
        usedCoupons.delete(appliedCoupons[currentCartNo]);
    }
    const couponId = selectedCoupon.value;
    appliedCoupons[currentCartNo] = couponId;
    usedCoupons.add(couponId);
    const selectedCouponData = coupons.find((coupon) => coupon.coupon_id === couponId);
    if (selectedCouponData) {
        const salePer = parseFloat(selectedCouponData.sale_per);
        updateProductPriceWithDiscount(currentCartNo, salePer);
    }
    alert("쿠폰이 적용되었습니다.");
    $("#couponModal").modal("hide");
};

const cancelCoupon = (cartNo) => {
    if (appliedCoupons[cartNo]) {
        usedCoupons.delete(appliedCoupons[currentCartNo]);
        delete appliedCoupons[cartNo];
        resetCouponForProduct(cartNo);
        alert("쿠폰이 취소되었습니다.");
        renderCouponList();
    } else {
        alert("현재 상품에 적용된 쿠폰이 없습니다.");
    }
};

const onHideCouponModal = () => {
    $("#couponModal").modal("hide");
};

// ──────────────────────────────
// 보유 적립금(포인트) 관련 함수
// ──────────────────────────────

const formatCurrency = () => {
    const pointInput = document.getElementById("point-input");
    const inputValue = pointInput.value.replace(/[^0-9]/g, "");
    pointInput.value = inputValue ? parseInt(inputValue, 10).toLocaleString() : "";
};

const applyPoint = () => {
    const pointInputElem = document.getElementById("point-input");
    const maxPointsElem = document.getElementById("max-points");
    const savePointsElem = document.getElementById("save-points");
    const usedPointElem = document.getElementById("used-point");

    if (pointInputElem.value) {
        const maxPoints = parseInt(maxPointsElem.textContent.replace(/[^0-9]/g, ""), 10);
        const savePoints = parseInt(savePointsElem.textContent.replace(/[^0-9]/g, ""), 10);
        const inputValue = parseInt(pointInputElem.value.replace(/[^0-9]/g, ""), 10);

        console.log("입력값:", inputValue, "최대 사용 가능:", maxPoints, "보유 적립금:", savePoints);

        if (isNaN(inputValue) || inputValue > maxPoints || inputValue > savePoints) {
            usedPoints = savePoints;
            pointInputElem.value = savePoints.toLocaleString();
            usedPointElem.textContent = "- " + savePoints.toLocaleString() + "원";
        } else {
            usedPoints = inputValue;
            usedPointElem.textContent = "- " + inputValue.toLocaleString() + "원";
        }

        console.log("usedPoints 값:", usedPoints);
        calcTotalPaymentPrice();
    } else {
        alert("사용할 적립금을 입력해 주세요.");
    }
};

const resetPoint = () => {
    document.getElementById("point-input").value = "";
    usedPoints = 0;
    document.getElementById("used-point").textContent = "- 0원";
    calcTotalPaymentPrice();
};

// ──────────────────────────────
// 결제 관련 함수
// ──────────────────────────────

const onGetOrderCode = () => {
    const today = new Date();
    const year = today.getFullYear();
    const month = ("0" + (today.getMonth() + 1)).slice(-2);
    const date = ("0" + today.getDate()).slice(-2);
    const randomDigits = Math.floor(1000 + Math.random() * 9000);
    return "" + year + month + date + randomDigits;
};

const onGetDeliveryId = () => {
    const headerElem = document.querySelector(".delivery-info-container .header");
    return headerElem ? headerElem.getAttribute("data-value") : null;
};

const onGetUsedPoints = () => usedPoints;

const onPayment = () => {
    calcTotalPaymentPrice();
    const totalAmount = getNumericValue("total-payment-amount");
    const order_code = onGetOrderCode();
    const deli_no = onGetDeliveryId();
    const used_point = onGetUsedPoints();
    const products = mergeProducts();
    const benefit_type = getSelectedReward();
    const taxFreeAmount = Math.floor(totalAmount * 0.1);

    $.ajax({
        url: "Controller?type=order&action=kakaopay",
        method: "POST",
        data: {
            order_code: order_code,
            products: JSON.stringify(products),
            deli_no: deli_no,
            used_point: used_point,
            benefit_type: benefit_type,
            total_amount: totalAmount,
            tax_free_amount: taxFreeAmount
        },
        dataType: "JSON",
        success: (response) => {
            if (response.success && response.data && response.data.next_redirect_pc_url) {
                window.location.href = response.data.next_redirect_pc_url;
            } else {
                alert("결제 중 오류가 발생했습니다. 관리자에게 문의해 주세요.");
            }
        },
        error: (err) => {
            alert("결제 중 오류가 발생했습니다.");
            console.error(err);
        }
    });
};
