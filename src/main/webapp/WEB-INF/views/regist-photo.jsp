<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<head>
    <link rel="stylesheet" href="/resources/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/add-product.css">
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
    <script src="/resources/jquery-ui/jquery-1.12.4.js"></script>
    <script src="/resources/jquery-ui/jquery-ui.js"></script>
    <script src="/resources/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<title>IMP Regist</title>

<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-2"></div>
        <br>
        <div class="col-8"  style="z-index: 500">
            <!-- form header -->
            <input type="hidden" id="codeCheckHidden" value="0" />
            <form class="insertform" name="productData" action="/product/product-regist-up?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
                <div class="form-header">
                    <h1>제품 등록</h1>
                </div>
                <!-- form body -->
                <div>
                    <div class="record">
                        <label>제품명</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="nameProduct" name="productName" />
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>브랜드</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="brandProduct" name="productBrand" />
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>제품 종류</label>&nbsp;&nbsp; <select class="formText" id="kindProduct" name="productType">
                        <option value="1" name="none">- 세부코드를 선택하여주세요 -</option>
                        <option value="1" name="none">-운동화 (10 ~ 29) -</option>
                        <option value="11" name="productType">스니커즈 (11)</option>
                        <option value="12" name="productType">캔버스화 (12)</option>
                        <option value="13" name="productType">슬립온 (13)</option>
                        <option value="1" name="none">-스포츠 (30 ~ 49) -</option>
                        <option value="31" name="productType">런닝화 (31)</option>
                        <option value="32" name="productType">축구화 (32)</option>
                        <option value="33" name="productType">등산화 (33)</option>
                        <option value="1" name="none">-구두 (50 ~ 69) -</option>
                        <option value="51" name="productType">로퍼 (51)</option>
                        <option value="52" name="productType">레이스업 (52)</option>
                        <option value="53" name="productType">힐/펌프스 (53)</option>
                        <option value="54" name="productType">플랫슈즈 (54)</option>
                        <option value="1" name="none">-부츠 (70 ~ 99) -</option>
                        <option value="71" name="productType">첼시부츠 (71)</option>
                        <option value="72" name="productType">워크부츠 (72)</option>
                        <option value="73" name="productType">퍼부츠 (73)</option>
                    </select>
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>&nbsp;&nbsp;제품 코드</label>&nbsp;&nbsp; <input type="text" class="formCode" id="codeProduct" name="productCode" minlength="6" maxlength="6" placeholder="예시 코드 ex) AA0010" onkeyup="codeCheck()" style="width: 50%" />
                        <input type="button" id="codeCheckBtn" class="codeCheckBtn" value="등록불가" style="border-radius: 5px" />
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>&nbsp;&nbsp;제품 가격</label>&nbsp;&nbsp; <input type="text" class="formText" id="priceProduct" name="productPrice" placeholder="주의사항) ,와 원 미입력 ex) 30000" />
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                </div>
                <div class="form-group left">
                    <label>&nbsp;&nbsp;제품 이미지</label>
                    <br /> <input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;" />
                    <div id="select_img" style="width: 100%; text-align: center">
                        <img src="" />
                    </div>
                </div>
                <hr style="border: solid 1px #bab5b5;">
                <div class="form-group left">
                    <label>제품 상세 이미지</label>
                    <br /> <input type="file" id="content-file" name="contentImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;" />
                    <div id="select_content_img" style="width: 100%; text-align: center">
                        <img src="" />
                    </div>
                </div>

                <input type="button" class="insertBtn" onclick="insertCheckfn()" value="등록" />
            </form>
            <br>

        </div>
        <div class="col-2"></div>
    </div>
</div>
</body>

<script>
    // const toggleBtn = document.querySelector('.navbar_toggleBtn');
    // const search = document.querySelector('.navbar_search');
    // const menu = document.querySelector('.navbar_menu');
    //
    // toggleBtn.addEventListener('click', () => {
    //     search.classList.toggle('active');
    //     menu.classList.toggle('active');
    // });

    // $(document).ready(function () {
    //     $('a[href^="#"]').on('click', function (e) {
    //         e.preventDefault();
    //
    //         let target = this.hash;
    //         let $target = $(target);
    //
    //         $('html, body').stop().animate({
    //             'scrollTop': $target.offset().top
    //         }, 900, 'swing', function () {
    //             window.location.hash = target;
    //         });
    //     });
    // });

    function insertCheckfn() {


    }

    function checkImage(fileName, fileSize) {
        let imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
        if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("choose-file").value = "";
            return false;
        }
        if (fileSize >= 3145728) {
            alert("이미지 크기가 너무 큽니다");
            document.getElementById("choose-file").value = "";
            return false;
        }
        return true;
    }

    function contentCheckImage(fileName, fileSize) {
        let imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
        if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("content-file").value = "";
            return false;
        }
        if (fileSize >= 10485760) {
            alert("이미지 크기가 너무 큽니다");
            document.getElementById("content-file").value = "";
            return false;
        }
        return true;
    }

    $("#choose-file").change(function () {
        let file = document.getElementById("choose-file");
        let filePath = file.value;
        let filePathSplit = filePath.split('\\');
        let filePathLength = filePathSplit.length;
        let fileName = filePathSplit[filePathLength - 1];
        let fileSize = file.files[0].size;

        if (checkImage(fileName, fileSize)) {
            if (this.files && this.files[0]) {
                let reader = new FileReader;
                reader.onload = function (data) {
                    $("#select_img img").attr("src", data.target.result).width(300).height(300);
                }
                reader.readAsDataURL(this.files[0]);
            }
        } else {
            document.getElementById("choose-file").value = "";
        }
    });

    $("#content-file").change(function () {
        let file = document.getElementById("content-file");
        let filePath = file.value;
        let filePathSplit = filePath.split('\\');
        let filePathLength = filePathSplit.length;
        let fileName = filePathSplit[filePathLength - 1];
        let fileSize = file.files[0].size;

        if (contentCheckImage(fileName, fileSize)) {
            if (this.files && this.files[0]) {
                let reader = new FileReader;
                reader.onload = function (data) {
                    $("#select_content_img img").attr("src", data.target.result).width(300).height(300);
                }
                reader.readAsDataURL(this.files[0]);
            }
        } else {
            document.getElementById("content-file").value = "";
        }
    });


</script>
</html>