<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<html>
<head>
    <title>IMP Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="_csrf" content="${_csrf.token}"/>
    <script src="/resources/jquery/3.5.1/jquery.min.js"></script>
    <script src="/resources/bootstrap/4.5.3/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/resources/css/login.css"/>
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
</head>
<body>
<input type="hidden" id="idCheckHidden" value="0"/> <input type="hidden" id="pwCheckHidden" value="0"/> <input type="hidden" id="pwckCheckHidden" value="0"/> <input type="hidden" id="emailCheckHidden"
                                                                                                                                                                     value="0"/>
<input type="hidden" id="nameCheckHidden" value="0"/> <input type="hidden" id="telCheckHidden" value="0"/>
<div class="wrap">
    <div class="form-wrap">
        <!-- toggle -->
        <div class="button-wrap">
            <div id="btn" style="width: 50%"></div>
            <button type="button" class="togglebtn" onclick="login()">로그인</button>
            <button type="button" class="togglebtn" onclick="register()">회원가입</button>
        </div>
        <div class="logo" style="text-align: center">
            <a href="/">
                <img src="/resources/mainLogo/twitter_header_photo_1.png"/>
            </a>
        </div>
        <!-- Login -->
        <form class="input-group" id="login" name="memberLogin" action="/login" method="POST">
            <input type="text" class="input-field_log" id="loginId" name="memberId" placeholder="User ID" required/>
            <input type="password" class="input-field_log" id="loginPw" name="memberPw" placeholder="Enter Password" onKeyUp="pressEnter()" required/> <input type="button" id="loginBtn"
                                                                                                                                                              class="submitBtn" value="로그인"/>
        </form>
        <!-- Sign up -->
        <form class="input-group" id="register" name="memberForm" action="/member/signup" method="POST">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <input type="text" class="input-check" id="userId" name="memberId" placeholder="ID 6글자 이상 ex) hkl123" onchange="idCheck()" required/>
            <input type="button" id="idCheckBtn" class="idCheckBtn" value="중복검사"/>
            <input type="password" class="input-field" onkeyup="checkPwfn()" id="userPw" name="memberPw" placeholder="PW : 알파벳 대,소문자,특수문자,숫자 포함" required/> &nbsp;&nbsp;
            <input type="button" id="pwCheckBtn" class="pwCheckBtn"/>
            <input type="password" class="input-field" onkeyup="checkPwfn()" id="userPwCk" placeholder="PW 확인" required/> &nbsp;&nbsp;
            <input type="button" id="pwckCheckBtn" class="pwckCheckBtn"/>
            <input type="text" class="input-field" id="userEmail" onkeyup="checkEmailfn()" name="memberEmail" placeholder="Email ex) qwer1@hkl.com" required/> &nbsp;&nbsp;
            <input type="button" id="emailCheckBtn" class="emailCheckBtn"/>
            <input type="text" class="input-field" id="userName" name="memberName" onkeyup="checkNamefn()" placeholder="name ex) 홍길동" required/> &nbsp;&nbsp;
            <input type="button" id="nameCheckBtn" class="nameCheckBtn"/>
            <input type="text" class="input-field" id="userTel" name="memberTel" onkeyup="telCheckfn(),enterKeyUp()" placeholder="Tel ex) 01012345678" required/> &nbsp;&nbsp;
            <input type="button" id="telCheckBtn" class="telCheckBtn"/>
            <button type="button" class="submitBtn" onclick="memberCheckfn()">회원가입</button>
        </form>
    </div>
</div>
</body>
<script>
    var x = document.getElementById("login");
    var y = document.getElementById("register");
    var z = document.getElementById("btn");

    function login() {
        x.style.left = "50px";
        y.style.left = "450px";
        z.style.left = "0";
    }

    function register() {
        x.style.left = "-400px";
        y.style.left = "50px";
        z.style.left = "115px";
    }

    function idCheck() {
        var userId = $("#userId").val();
        var checkId = /^[a-zA-Z0-9]{6,15}$/;
        if (!checkId.test(userId)) {
            document.getElementById('idCheckBtn').value = "사용불가";
            document.getElementById('idCheckBtn').style.background = '#6c757d';
            $("#idCheckHidden").val("0");
        } else if (checkId.test(userId)) {
            //유효성검사 테스트후

            $.ajax({
                type: 'post',
                data: userId, //서버로 보낼 data
                url: '/idCheck',
                dataType: 'json', //서버에서 받을 데이터
                contentType: "application/json; charset=UTF-8", //보낼 data 타입을 json으로 설정
                beforeSend: function (xhr) { /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data.cnt > 0) {

                        document.getElementById('idCheckBtn').value = "사용불가";
                        document.getElementById('idCheckBtn').style.background = '#6c757d';
                        $("#idCheckHidden").val("0");
                    } else {

                        document.getElementById('idCheckBtn').value = "사용가능";
                        document.getElementById('idCheckBtn').style.background = '#a7e3ff';
                        $("#idCheckHidden").val("1");

                    }
                },
                error: function () {
                    alert("Error. 관리자에게 문의하십시오.");
                }
            });

        }

    }

    function checkPwfn() {
        var userPw = $("#userPw").val();

        var checkPwSik = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,15}$/;

        if (checkPwSik.test(userPw)) {
            $("#pwCheckBtn").css("border", "");
            $("#pwCheckBtn").css("border", "solid 5px #007bff");
            $("#pwCheckHidden").val("1");
        }

        if (!checkPwSik.test(userPw)) {
            $("#pwCheckBtn").css("border", "");
            $("#pwCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwCheckHidden").val("0");
        }

        var checkpw = $("#userPw").val() === $("#userPwCk").val();

        if (checkpw) {
            $("#pwckCheckBtn").css("border", "");
            $("#pwckCheckBtn").css("border", "solid 5px #007bff");
            $("#pwckCheckHidden").val("1");
        } else {
            $("#pwckCheckBtn").css("border", "");
            $("#pwckCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#pwckCheckHidden").val("0");
        }
    }

    function checkEmailfn() {
        var userEmail = $("#userEmail").val();
        var checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
        if (checkEmail.test(userEmail)) {
            $("#emailCheckBtn").css("border", "");
            $("#emailCheckBtn").css("border", "solid 5px #007bff");
            $("#emailCheckHidden").val("1");
        }
        if (!checkEmail.test(userEmail)) {
            $("#emailCheckBtn").css("border", "");
            $("#emailCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#emailCheckHidden").val("0");
        }
    }

    function checkNamefn() {
        var userName = $("#userName").val();
        var checkName = /^[가-힣]{2,5}$/;
        if (checkName.test(userName)) {
            $("#nameCheckBtn").css("border", "");
            $("#nameCheckBtn").css("border", "solid 5px #007bff");
            $("#nameCheckHidden").val("1");
        }

        if (!checkName.test(userName)) {
            $("#nameCheckBtn").css("border", "");
            $("#nameCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#nameCheckHidden").val("0");
        }
    }

    function telCheckfn() {
        var userTel = $("#userTel").val();
        var checkTel = /^[0-9]{11}$/;
        if (checkTel.test(userTel)) {
            $("#telCheckBtn").css("border", "");
            $("#telCheckBtn").css("border", "solid 5px #007bff");
            $("#telCheckHidden").val("1");
        }

        if (!checkTel.test(userTel)) {
            $("#telCheckBtn").css("border", "");
            $("#telCheckBtn").css("border", "solid 5px rgb(245, 99, 99)");
            $("#telCheckHidden").val("0");
        }
    }

    function enterKeyUp() {
        if (event.keyCode == 13) {
            memberCheckfn();
        }
    }

    function memberCheckfn() {
        var subForm = document.memberForm;
        if (
            $("#idCheckHidden").val() == 1 &&
            $("#pwCheckHidden").val() == 1 &&
            $("#pwckCheckHidden").val() == 1 &&
            $("#emailCheckHidden").val() == 1 &&
            $("#nameCheckHidden").val() == 1 &&
            $("#telCheckHidden").val() == 1
        ) {
            alert("회원가입을 환영합니다");
            subForm.submit();
        } else {
            alert("양식에 오류가있습니다. 다시입력하여 주십시오.");
        }
    }

    $(document).on("click", "#loginBtn", function () {
        var sendData = {
            memberId: $("#loginId").val(),
            memberPw: $("#loginPw").val(),
        };
        $.ajax({
            url: "/login",
            type: "POST",
            dataType: "json",
            data: sendData,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function (data) {
                if (data.loginStatus === true) {
                    alert("로그인 하였습니다");
                    window.location.href = "/";
                } else {
                    alert(data.loginFailMsg);
                }
            },
            error: function () {
                alert("Error. 관리자에게 문의하십시오.");
            },
        });
    });

    function pressEnter() {
        if (event.keyCode == 13) {
            var sendData = {
                memberId: $("#loginId").val(),
                memberPw: $("#loginPw").val(),
            };

            $.ajax({
                url: "/login",
                type: "POST",
                dataType: "json",
                data: sendData,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (data) {
                    if (data.loginStatus === true) {
                        alert("로그인 하였습니다");
                        window.location.href = "/";
                    } else {
                        alert(data.loginFailMsg);
                    }
                },
                error: function () {
                    alert("Error. 관리자에게 문의하십시오.");
                },
            });
        }
    }
</script>
</html>
