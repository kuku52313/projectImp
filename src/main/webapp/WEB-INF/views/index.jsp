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
<script src="/resources/jquery/3.5.1/jquery.min.js"></script>
<script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
    img {
        width: 600px;
        height: 400px;
        object-fit: cover;
    }

</style>
<body class="w3-light-grey w3-content" style="max-width:1600px">

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
    <div class="w3-container">
        <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
            <i class="fa fa-remove"></i>
        </a>
        <img src="/resources/profile/logo.png" style="width:100%;" class="w3-round"><br><br>
        <h4><b>Introduce My Photo</b></h4>
        <p class="w3-text-grey">김희곤 회원님</p>
    </div>
    <div class="w3-bar-block">
        <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a>
        <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT</a>
        <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT</a>
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
                <span class="w3-margin-right">Filter:</span>
                <button class="w3-button w3-black">ALL</button>
                <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
                <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
                <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>
            </div>
        </div>
    </header>

    <!-- First Photo Grid-->
    <div class="w3-row-padding">
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC09031.JPG" alt="1111" style="width:100%" class="w3-hover-opacity" onclick="onClick(this)">
            <div class="w3-container ">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesen</p>
            </div>
        </div>
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC07998.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity" onclick="onClick(this)">
            <div class="w3-container ">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
        <div class="w3-third w3-container">
            <img src="/resources/img/DSC08013.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container ">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
    </div>

    <!-- Second Photo Grid-->
    <div class="w3-row-padding">
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC08094.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container ">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC08184-2.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
        <div class="w3-third w3-container">
            <img src="/resources/img/DSC08585.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container ">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
    </div>

    <!-- 3 Photo Grid-->
    <div class="w3-row-padding">
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC08184-2.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
        <div class="w3-third w3-container w3-margin-bottom">
            <img src="/resources/img/DSC09055.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
        <div class="w3-third w3-container">
            <img src="/resources/img/DSC08585.JPG" alt="Norway" style="width:100%" class="w3-hover-opacity">
            <div class="w3-container w3-white">
                <p><b>Lorem Ipsum</b></p>
                <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
            </div>
        </div>
    </div>

    <!-- Pagination -->
    <div class="w3-center w3-padding-32">
        <div class="w3-bar">
            <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
            <a href="#" class="w3-bar-item w3-black w3-button">1</a>
            <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
            <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
            <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
            <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
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
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        captionText.innerHTML = element.alt;
    }
</script>

</body>
</html>
