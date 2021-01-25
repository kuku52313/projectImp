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
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<title>IMP Regist</title>

<body>
<sec:authentication property="principal" var="user" />
<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container">
        <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
            <i class="fa fa-remove"></i>
        </a>
        <img src="/resources/mainLogo/logo.png" style="width:100%;" class="w3-round"><br><br>
        <h4><b>Introduce My Photo</b></h4>
        <!-- 비로그인 상태-->
        <sec:authorize access="isAnonymous()">
            <p class="w3-text-grey"><a href="/member/login-page">Sign in/up</a></p>
        </sec:authorize>
        <!-- 로그인 상태-->
        <sec:authorize access="isAuthenticated()">
            <p class="w3-text-grey">${user.memberName}님</p>
        </sec:authorize>
    </div>
    <div class="w3-bar-block">
        <a href="/" onclick="w3_close()" class="w3-bar-item w3-button w3-padding "><i class="fa fa-th-large fa-fw w3-margin-right"></i>Gallery</a>

        <sec:authorize access="isAuthenticated()">
            <a href="/my-gallery?myGallery=myGallery" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Gallery</a>
            <a href="/photo/regist-photo" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-photo w3-margin-right"></i>Regist Photo</a>
            <br>
            <a class="w3-bar-item w3-button w3-padding" href="#" onclick="$('#logout-form').submit();">로그아웃</a>
            <!-- Logout Form -->
            <form id="logout-form" action="/logout" method="POST">
                <!-- 포스트방식으로 리퀘스트시 무조건 넣기 -->
                <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
            </form>
        </sec:authorize>
    </div>
    <div class="w3-panel w3-large">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px">

    <!-- Header -->
    <header id="portfolio">

        <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
        <div class="w3-container">
            <h1><b>Introduce My Photo</b></h1>
        </div>
    </header>

<div class="container-fluid">
    <div class="row">
        <br>
        <div class="col-10"  style="z-index: 500">
            <!-- form header -->
            <input type="hidden" id="codeCheckHidden" value="0" />
            <form class="insertform" name="insertFormName" action="/photo/photo-regist-up?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data">
                <div class="form-header">
                    <h1>사진 등록</h1>
                </div>
                <!-- form body -->
                <div>
                <div class="form-group left">
                    <label>&nbsp;&nbsp;사진</label>
                    <br /> <input type="file" id="choose-file" name="uploadImg" accept=".bmp, .jpg, .jpeg, .png" size="80" style="margin-top: 10px; margin-bottom: 10px;" />
                    <div id="select_img" style="width: 100%; text-align: center">
                        <img src="" />
                    </div>
                </div>
                    <hr style="border: solid 1px #bab5b5;">

                    <div class="record">
                        <label>&nbsp;&nbsp;작품 제목</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" class="formText" id="photoTitle" name="photoTitle" value="Untitled"/>
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>&nbsp;&nbsp;작품 소개</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>&nbsp;
                        <textarea id="photoContent" name="photoContent" cols="90" rows="5" >

                        </textarea>
                    </div>
                    <hr style="border: solid 1px #bab5b5;">
                    <div class="record">
                        <label>&nbsp;&nbsp;촬영일자</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="date" class="formText" id="photoDate" name="photoDate" />
                    </div>
                    <hr style="border: solid 1px #bab5b5;">

                </div>
                <input type="button" class="insertBtn" onclick="insertCheckfn()" value="등록" />
            </form>
            <br>

        </div>
        <div class="col-2"></div>
    </div>
</div>
</div>
</body>

<script>


    function insertCheckfn() {
        let insertForm = document.insertFormName;
        let image = $("#choose-file").val();
        let photoContent = $("#photoContent").val();
        let photoDate = $("#photoDate").val();
        let photoTitle = $("#photoTitle").val();

        if (image === '' || image === null || image === undefined || image === 0) {
            alert("이미지를 등록하세요");
        }
        else if (photoDate == null || photoDate == ''){
            alert("촬영일자를 작성하여주세요");
        }
        else if (photoTitle == null || photoTitle == ''){
            alert("작품제목을 작성하여주세요");
        }
        else {
            alert("등록하였습니다");
            insertForm.submit();
        }
    }

    function checkImage(fileName, fileSize) {
        let imageExtension = /([^\s]+(?=\.(jpg|jpeg|png|bmp|JPG|JPEG|PNG|BMP))\.\2)/
        if (!imageExtension.test(fileName)) {
            alert("이미지만 등록 가능합니다");
            document.getElementById("choose-file").value = "";
            return false;
        }
        if (fileSize > 26214400) {
            alert("이미지 크기가 너무 큽니다");
            document.getElementById("choose-file").value = "";
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


</script>
</html>