<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>코디 페이지</title>

    <!-- Bootstrap CSS -->

    <style>
        .category-menu {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            padding: 15px;
        }

        .category-header {
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .category-buttons .btn {
            font-size: 12px;
            margin-right: 5px;
            margin-bottom: 5px;
        }

        .thumbnail img {
            max-width: 100%;
            height: auto;
        }

        .thumbnail .info {
            font-size: 12px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="container-fluid mt-4" style="padding-left: 20px; padding-right: 0;">
    <div class="row">

        <div class="col-md-10">
            <div class="border-bottom pb-2 mb-3">
                무신사>스냅>스트릿 스냅
            </div>
            <div class="border-bottom pb-2 mb-3">
                <h3 style="margin: 0; font-weight: bold;">Street Snap</h3>
            </div>
            <div class="border-bottom pb-2 mb-3" id="selectedCategoryDiv">
                <!-- 이 영역은 비워져 있으므로 여백으로 사용 -->
            </div>



        </div>
    </div>
</div>
<footer>
    <jsp:include page="../layout/footer.jsp"></jsp:include>
</footer>

<script>
    const selectedCategoryDiv = document.getElementById('selectedCategoryDiv');
    const categoryButtons = document.querySelectorAll('.category-btn');

    const selectedCategories = {};

    categoryButtons.forEach((button) => {
        button.addEventListener('click', () => {
            const category = button.textContent.trim();

            if (selectedCategories[category]) return;

            selectedCategories[category] = true;

            const categoryItem = document.createElement('span');
            categoryItem.className = 'badge bg-secondary me-2 mb-2';
            categoryItem.innerHTML = `${category}<button type="button" class="btn-close btn-close-white" aria-label="Close"></button>`;

            categoryItem.querySelector('.btn-close').addEventListener('click', (e) => {
                e.stopPropagation();
                delete selectedCategories[category];
                selectedCategoryDiv.removeChild(categoryItem);
                button.classList.remove('active');
            });

            selectedCategoryDiv.appendChild(categoryItem);
            button.classList.add('active');
        });
    });
</script>
</body>
</html>
