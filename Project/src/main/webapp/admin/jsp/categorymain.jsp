<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>카테고리 관리</title>
    <style>
        /* 테이블의 레이아웃을 고정하여 각 열이 비례적으로 배분되지 않고 고정된 크기를 가지도록 설정 */
        table {
            table-layout: fixed;
            width: 100%; /* 테이블 전체의 너비 */
        }

        .group-list {
            background-color: #f8f9fa;
            border-right: 1px solid #dee2e6;
            height: 100%;
        }
        .add-user-btn {
            float: right;
        }
        .highlight {
            background-color: #efeff5;
            border: 1px solid #dcdce6;
        }

        th, td {
            padding: 8px 20px;
            text-align: center; /* 중앙 정렬 */
            word-wrap: break-word; /* 긴 텍스트 줄바꿈 방지 */
        }

        /* 열에 대한 너비를 고정적으로 설정 */
        th:nth-child(1), td:nth-child(1) {
            width: 5%;
        }
        th:nth-child(2), td:nth-child(2) {
            width: 10%;
        }
        th:nth-child(3), td:nth-child(3) {
            width: 10%;
        }
        th:nth-child(4), td:nth-child(4) {
            width: 10%;
        }
        th:nth-child(5), td:nth-child(5) {
            width: 10%;
        }
        th:nth-child(6), td:nth-child(6) {
            width: 10%;
        }
        th:nth-child(7), td:nth-child(7) {
            width: 10%;
        }
        th:nth-child(8), td:nth-child(8) {
            width: 10%;
        }
        th:nth-child(9), td:nth-child(9) {
            width: 15%;
        }
        th:nth-child(10), td:nth-child(10) {
            width: 8%;
        }
        th:nth-child(11), td:nth-child(11) {
            width: 8%;
        }
        th:nth-child(12), td:nth-child(12) {
            width: 10%;
        }
        th:nth-child(13), td:nth-child(13) {
            width: 10%;
        }
        th:nth-child(14), td:nth-child(14) {
            width: 10%;
        }
        th:nth-child(15), td:nth-child(15) {
            width: 10%;
        }
        th:nth-child(16), td:nth-child(16) {
            width: 10%;
        }

    </style>
</head>
<body>
<jsp:include page="layout/header.jsp"></jsp:include>

<div class="container-fluid mt-4">
    <!-- 대분류 목록 영역 -->
    <div class="col-9">


        <div class="d-flex justify-content-between align-items-center">
            <h5>대분류 목록</h5>
            <div>
                <!-- 대분류 추가 버튼, 모달 연결 -->
                <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#mainCategoryModal" >대분류 추가</button>
            </div>
        </div>

        <div class="mt-3">
            <div class="input-group">
                <!-- 검색 아이콘 -->
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="major_category_name">

                    <c:forEach var="name" items="${majorcategoryName}" varStatus="st">
                        <c:if test="${name ne 'id' && name ne 'is_del'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>


                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="major_word">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="major_search_btn">
                    검색
                </button>
                <!-- 드롭다운 메뉴 -->
                <%--<ul class="dropdown-menu dropdown-menu-end">
                    <c:forEach var="name" items="${majorcategoryName}" begin="1">
                        <li><a class="dropdown-item" href="#">${name}</a></li>
                    </c:forEach>
                </ul>--%>
            </div>
        </div>

        <table class="table mt-3" id="major_category_table">
            <thead class="table-light">

            <tr>

                <c:forEach var="name" items="${majorcategoryName}">
                    <c:if test="${name ne 'id' && name ne 'is_del'}">
                    <th class="column-name">${name}</th>
                    </c:if>
                </c:forEach>


                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var ="mcl"  items="${majorcategoryList}">
                <tr id="row-${mcl.id}">

                <td>${mcl.name}</td>
                <td>${mcl.ename}</td>
                <td>${mcl.type}</td>

                <td><button class="btn btn-secondary add-user-btn" data-bs-toggle="modal" data-bs-target="#deleteMajorCategoryModal"
                            onclick="setMajorCategoryId('${mcl.id}')"> 삭제</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary" onclick = "location.href='Controller?type=categorymain'">초기화</button>
        </div>

        <hr/>

        <!-- 중분류 목록 부분 -->
        <div class="d-flex justify-content-between align-items-center">
            <h5>중분류 목록</h5>
            <div>
                <!-- 중분류 추가 버튼, 모달 연결 -->
                <button class="btn btn-primary add-user-btn" data-bs-toggle="modal" data-bs-target="#subcategoryModal">중분류 추가</button>
            </div>
        </div>

        <div class="mt-3">
            <div class="input-group">
                <span class="input-group-text">
                    <i class="bi bi-search"></i>
                </span>
                <select class="form-select" aria-label="Default select example" id="middle_category_name">
                    <c:forEach var="name" items="${middlecategoryName}" varStatus="st">
                        <c:if test="${name ne 'id'}">
                            <option class="column-name" value="${name}">${name}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <!-- 검색 입력 -->
                <input type="text" class="form-control" placeholder="검색할 열을 선택" aria-label="Search" id="middle_word">
                <!-- 드롭다운 버튼 -->
                <button class="btn btn-outline-secondary" type="button" aria-expanded="false" id="middle_search_btn">
                    검색
                </button>

            </div>
        </div>

        <table class="table mt-3" id="middle_category_table">
            <thead class="table-light">

            <tr>
                <th><input type="checkbox"></th>
                <c:forEach var="name" items="${middlecategoryName}">
                    <c:if test="${name ne 'id'}">
                        <th class="column-name">${name}</th>
                    </c:if>
                </c:forEach>


                <th>&nbsp;</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var ="mdcl"  items="${middlecategoryList}">
                <tr>
                    <td><input type="checkbox"></td>
                    <td>${mdcl.major_no}</td>
                    <td>${mdcl.name}</td>
                    <td>${mdcl.type}</td>

                    <td><button class="btn btn-secondary add-user-btn" data-bs-toggle="modal" data-bs-target="#deleteMiddleCategoryModal"
                                onclick="setMiddleCategoryId('${mdcl.id}')"> 삭제</button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <div class="mt-3 mb-4">
            <button class="btn btn-outline-secondary">초기화</button>
        </div>
    </div>
</div>

<!-- 대분류 설정 모달 (대분류 추가용) -->
<div class="modal fade" id="mainCategoryModal" tabindex="-1" aria-labelledby="mainCategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="mainCategoryModalLabel">대분류 설정</h5>
                <%--x버튼--%>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="majorCategoryForm">
            <div class="modal-body">

                    <input type="hidden" name="type" value="addMajorCategory">  <!-- type 파라미터 전달 -->
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">대분류 명</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="majorCategoryName" name="name" placeholder="상의, 하의 등 분류별 명칭">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-2 fw-bold">대분류 영문명</div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="majorCategoryEname" name="ename" placeholder="영어 명칭">
                        </div>
                    </div>


            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="submit" class="btn btn-primary">저장</button>
            </div>
            </form>
        </div>
    </div>
</div>


<!-- 중분류 설정 모달 (중분류 추가용) -->
<div class="modal fade" id="subcategoryModal" tabindex="-1" aria-labelledby="subcategoryModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="subcategoryModalLabel">중분류 설정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <div class="col-md-2 fw-bold">상위 대분류</div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" value="상위로 두는 대분류 선택">
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-2 fw-bold">중분류 명</div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" value="맨투맨">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-2 fw-bold">종류</div>
                    <div class="col-md-6">
                        <input type="text" class="form-control" value="1">
                    </div>
                </div>
            </div>ㄴ
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary">저장</button>
            </div>
        </div>
    </div>
</div>
<%--대분류 삭제 모달 창--%>

<div class="modal fade" id="deleteMajorCategoryModal" tabindex="-1" aria-labelledby="deleteMajorCategoryLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteMajorCategoryLabel">주 카테고리 삭제 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="deleteMajorCategoryForm">
                <div class="modal-body">
                    <input type="hidden" id="deleteMajorCategoryId" name="id" >

                    <textarea class="form-control" id="deleteMajorReason" name="content" rows="3" placeholder="대분류를 삭제할 이유를 적어주세요."></textarea>
                    <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%--중분류 삭제 모달 창--%>

<div class="modal fade" id="MiddleMajorCategoryModal" tabindex="-1" aria-labelledby="deleteMiddleCategoryLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteMiddleCategoryLabel">주 카테고리 삭제 사유</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form id="deleteMiddleCategoryForm">
                <div class="modal-body">
                    <input type="hidden" id="deleteMiddleCategoryId" name="id">

                    <textarea class="form-control" id="deleteReason" name="content" rows="3">주 카테고리를 삭제할 이유를 적어주세요.</textarea>
                    <span class="text-danger">*특수문자사용시 스마트스토어 정책에 따라 전송 에러가 발생합니다. 텍스트와 숫자로 안내문구를 작성해주시기 바랍니다.</span>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="submit" class="btn btn-primary">저장</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- 부트스트랩 관련 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(function () {
        $("#major_search_btn").click(function () {
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#major_category_name").val();
            let word = $("#major_word").val();
            alert(category_name + "/" + word);
            let param = "type=searchMajorCategory&searchType=" +
                encodeURIComponent(category_name) +
                "&searchValue=" + encodeURIComponent(word);
            //비동기식 통신
            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function (data) {
                $("#major_category_table tbody").html(data);
            });
        });

        $("#middle_search_btn").click(function () {
            //검색버튼을 클릭할 때마다 수행하는 곳
            let category_name = $("#middle_category_name").val();
            let word = $("#middle_word").val();
            alert(category_name + "/" + word);
            let param = "type=searchMiddleCategory&searchType=" +
                encodeURIComponent(category_name) +
                "&searchValue=" + encodeURIComponent(word);
            //비동기식 통신

            $.ajax({
                url: "Controller",
                type: "POST",
                data: param,
            }).done(function (data) {
                $("#middle_category_table tbody").html(data);
            });
        });




    });
    const columnTranslations = {
        'id': '아이디',
        'name': '이름',
        'ename': '영문 이름',
        'type': '타입',
        'major_no': '대분류 번호'
    };

    // 페이지 로딩 후 컬럼 이름을 한국어로 변환
    document.addEventListener('DOMContentLoaded', function() {
        const columnElements = document.querySelectorAll('.column-name'); // 'column-name' 클래스를 가진 요소들

        columnElements.forEach(element => {
            const columnName = element.innerText.trim();
            if (columnTranslations[columnName]) {
                element.innerText = columnTranslations[columnName];  // 한국어로 번역
            }
        });
    });



    function setMajorCategoryId(categoryId) {
        console.log("전달된 게시판 ID:", categoryId);


        $("#deleteMajorCategoryId").val(categoryId);

    }
    function setMiddleCategoryId(categoryId) {
        console.log("전달된 게시판 ID:", categoryId);


        $("#deleteMiddleCategoryId").val(categoryId);

    }
    <%--major 용 삭제--%>
    $(document).ready(function () {<%--폼태그--%>
        $("#deleteMajorCategoryForm").submit(function (event) {
            event.preventDefault(); // 기본 form 제출 막기

            let majorCategoryId = $("#deleteMajorCategoryId").val();

            let content = $("#deleteMajorReason").val();

            if (!majorCategoryId) {
                alert("삭제할 게시판 ID가 없습니다.");
                return;
            }

            $.ajax({
                url: "Controller",
                type: "POST",
                data: {
                    type: "buttonCategory",
                    id: majorCategoryId,

                    content: content,
                    action: "major"

                },
                dataType: "json", <%--보내지는 데이터 타입--%>
                <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
                <%--삭제시 반드시 1로 만들어준다-->
                <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
                <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

                success: function (response) {
                    if (response.status === "success") {
                        console.log("삭제 성공:", response);

                        <%--테이블의 열의 id를 레코드를 삭제--%>
                        $("#row-" + majorCategoryId).remove();


                        $("#deleteMajorCategoryModal").modal("hide");

                        alert("게시글이 삭제되었습니다.");
                    } else {
                        console.error("삭제 실패:", response.message);
                        alert("게시글 삭제에 실패했습니다: " + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("삭제 실패:", error);
                    alert("게시글 삭제 중 오류가 발생했습니다.");
                }
            });
        });
    });
    $(document).ready(function () {
        $("#majorCategoryForm").submit(function (event) {
            event.preventDefault();//기본 form 제출막기

            let majorCategoryName = $("#majorCategoryName").val();
            let majorCategoryEname = $("#majorCategoryEname").val();
            console.log(majorCategoryName, majorCategoryEname, majorCategoryName);
            if (!majorCategoryName ) {
                alert("전부입력.");
                return;
            }
            else if (!majorCategoryEname ) {
                alert("전부입력.");
                return;
            }
            $.ajax({
                url: "Controller",
                type: "POST",
                data: {
                    type: "addMajorCategory",

                    name: majorCategoryName,
                    ename: majorCategoryEname


                },
                dataType: "json", <%--보내지는 데이터 타입--%>
                <%--삭제의 경우 기존 값에서 하나의 행만 지우는 식이로 해야해서 이렇게 했다--%>
                <%--삭제시 반드시 1로 만들어준다-->
                <%--추가는 전부 불러오는 방식으로 하길 권장한다--%>
                <%--spring에서도 자주 사용하니 반드시 알아야한다--%>

                success: function (response) {
                    if (response.status === "success") {
                        console.log("추가 성공:", response);




                        $("#mainCategoryModal").modal("hide");

                        alert("카테고리가 추가 되었습니다.");
                    } else {
                        console.error("추가 실패:", response.message);
                        alert("카테고리 추가에 실패했습니다: " + response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("추가 실패:", error);
                    alert("카테고리 추가 중 오류가 발생했습니다.");
                }
            });

        });
    });

</script>

</body>
</html>