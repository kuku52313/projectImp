<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<title>IMP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
    .img2 {
        width: 600px;
        height: 400px;
        object-fit: cover;
    }

    .trash {
        background-image: url("/resources/img/trash-alt-regular.svg");
        background-size: cover;
        height: 24px;
        width: 21px;
        display: inline;
        float: right;
        ;
    }

</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">
<c:set var="myGallery" value="${param.myGallery}"/>
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
        <a href="/" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ${myGallery ne 'myGallery' ? "w3-text-teal":""}"><i class="fa fa-th-large fa-fw w3-margin-right"></i>Gallery</a>

        <sec:authorize access="isAuthenticated()">
        <a href="/my-gallery?myGallery=myGallery" onclick="w3_close()" class="w3-bar-item w3-button w3-padding ${myGallery eq 'myGallery' ? "w3-text-teal":""}"><i class="fa fa-th-large fa-fw w3-margin-right"></i>My Gallery</a>
        <a href="/photo/regist-photo" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-photo w3-margin-right"></i>Regist Photo</a>
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
            <div class="w3-section w3-bottombar w3-padding-16">

            </div>
        </div>
    </header>

    <c:set var="i" value="0" />
    <c:set var="j" value="3" />
    <%-- 유저가 로그인시 user라는 변수로 회원아이디저장--%>
<sec:authorize access="isAuthenticated()">
    <c:set var="user" value="${user.username}"/>
</sec:authorize>
    <%-- 유저가 관리자계정일시 생성--%>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <c:set var="admin" value="admin"/>
</sec:authorize>
<div>
    <c:forEach items="${photoList}" var="list" varStatus="status">
        <c:if test="${i%j == 0 }">
    <div class="w3-row-padding">
        </c:if>
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="${list.photoImgPath}${list.photoThumbnail}" alt="${list.photoNumber}" style="width:100%" class="w3-hover-opacity img2" onclick="onClick(this)">
            <div class="w3-container ">
                <p>
                    <sec:authorize access="isAuthenticated()">
                <c:set var="author" value="${list.photoMemberId}"/>
                        <c:if test="${user eq author || admin eq 'admin'}">
                <div class="trash" onclick="location.href='/photo/photo-remove?photoNumber=${list.photoNumber}&pageNum=${pageMaker.cri.pageNum}&amount=9&memberId=${list.photoMemberId}'"></div>
                        </c:if>
                </sec:authorize>
                <b>${list.photoTitle}</b>
                </p>


                <p>Author : ${list.photoMemberId}</p>
                <p>${list.photoContent}</p>
                <input type="hidden" id="photoTitle${list.photoNumber}" value="${list.photoTitle}">
                <input type="hidden" id="photoMemberId${list.photoNumber}" value="${list.photoMemberId}">
                <input type="hidden" id="photoContent${list.photoNumber}" value="${list.photoContent}">
                <input type="hidden" id="photoImgSrc${list.photoNumber}" value="${list.photoImgPath}${list.photoImg}">
            </div>
        </div>
        <c:if test="${i%j == j-1 }">
    </div>
        </c:if>
        <c:set var="i" value="${i+1 }" />
    </c:forEach>
</div>

    <!-- Pagination -->
    <div class="w3-center w3-padding-32">
        <div class="w3-bar">
            <c:if test="${pageMaker.prev}">
            <a href="/${myGallery eq 'myGallery' ? "my-gallery":""}?pageNum=${pageMaker.startPage - 1}&amount=9${myGallery eq 'myGallery' ? "&myGallery=myGallery":""}"
               class="w3-bar-item w3-button w3-hover-black">«</a>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            <a href="/${myGallery eq 'myGallery' ? "my-gallery":""}?pageNum=${num}&amount=9${myGallery eq 'myGallery' ? "&myGallery=myGallery":""}"
               class="w3-bar-item w3-hover-black ${pageMaker.cri.pageNum == num ? "w3-button w3-black":""} ">${num}</a>
            </c:forEach>

            <c:if test="${pageMaker.next}">
            <a href="/${myGallery eq 'myGallery' ? "my-gallery":""}?pageNum=${pageMaker.endPage + 1}&amount=9${myGallery eq 'myGallery' ? "&myGallery=myGallery":""}" class="w3-bar-item w3-button w3-hover-black">»</a>
            </c:if>
        </div>
    </div>



    <!-- Footer -->
    <footer class="w3-container w3-padding-32 w3-dark-grey">
        <div class="w3-row-padding">
            <div class="w3-third">
                <h3>FOOTER</h3>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
            </div>

            <div class="w3-third">

            </div>

        </div>
    </footer>

    <!-- Modal for full size images on click-->
    <div id="modal01" class="w3-modal w3-black" style="padding-top:0" onclick="this.style.display='none'">
        <span class="w3-button w3-black w3-xlarge w3-display-topright">×</span>
        <div class="w3-modal-content w3-animate-zoom w3-center w3-transparent w3-padding-64">
            <img id="img01" class="w3-image">
            <br>
            <h id="Mtitle"></h>
            <p id="Mauthor"></p>
            <p id="caption"></p>

        </div>
    </div>

    <!-- End page content -->
</div>

<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }

    // Modal Image Gallery
    function onClick(element) {

        let imgId = '#photoImgSrc'+element.alt;
        let titleId = '#photoTitle'+element.alt;
        let memberId = '#photoMemberId'+element.alt;
        let contentId = '#photoContent'+element.alt;

        let imgSrc = $(imgId).val();
        let getTitle = $(titleId).val();
        let getMember = $(memberId).val();
        let getContent = $(contentId).val();


        document.getElementById("img01").src = imgSrc;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        var titleText = document.getElementById("Mtitle");
        var MemberText = document.getElementById("Mauthor");
        captionText.innerHTML = getContent;
        titleText.innerHTML = "Title : " + getTitle;
        MemberText.innerHTML = "Author : " + getMember;
    }
</script>

</body>
</html>
