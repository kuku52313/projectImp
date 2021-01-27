<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>IMP Error</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="shortcut icon" href="/resources/img/back_exception.jpg">
    <style>
        html,
        body {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background-size: 100% 100%;
            background-image: url("/resources/img/login/wilhelmsburg-285920_1920.jpg");
            background-repeat: no-repeat;
        }

        .error-page {
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            height: 100%;
            font-family: Arial, "Helvetica Neue", Helvetica, sans-serif;
        }

        .error-page h1 {
            font-size: 30vh;
            font-weight: bold;
            position: relative;
            margin: -8vh 0 0;
            padding: 0;
        }

        .error-page h1:after {
            content: attr(data-h1);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            color: transparent;
            /* webkit only for graceful degradation to IE */
            background: -webkit-repeating-linear-gradient(-45deg, #6CEFF5, #6ED4C8, #85EBCE, #8ED1B3, #BCFBD5);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-size: 400%;
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.247);
            animation: animateTextBackground 10s ease-in-out infinite;
        }

        .error-page h1 + div > p {
            color: #d6d6d6;
            font-weight: bold;
            line-height: 10vh;
            max-width: 100%;
            position: relative;
        }

        .error-page h1 + div > p:after {
            content: attr(data-p);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            color: transparent;
            background: -webkit-repeating-linear-gradient(-45deg, #6CEFF5, #6ED4C8, #85EBCE, #8ED1B3, #BCFBD5);
            /*  background: -webkit-repeating-linear-gradient(-45deg, #71b7e6, #69a6ce, #b98acc, #ee8176, #b98acc, #69a6ce, #9b59b6); */
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.247);
            -webkit-background-clip: text;
            -moz-background-clip: text;
            background-clip: text;
        }

        .error-page i {
            color: #d6d6d6;
            font-size: 8vh;
            font-weight: bold;
            line-height: 10vh;
            max-width: 600px;
            position: relative;
        }

        .error-page h1 + i:after {
            content: attr(data-p);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            color: transparent;
            text-shadow: 1px 1px 2px rgba(255, 255, 255, 0.247);
            -webkit-background-clip: text;
            -moz-background-clip: text;
            background-clip: text;
        }

        @keyframes animateTextBackground {
            0% {
                background-position: 0 0;
            }
            25% {
                background-position: 100% 0;
            }
            50% {
                background-position: 100% 100%;
            }
            75% {
                background-position: 0 100%;
            }
            100% {
                background-position: 0 0;
            }
        }

        @media (max-width: 767px) {
            .error-page h1 {
                font-size: 32vw;
            }

            .error-page h1 + p {
                font-size: 8vw;
                line-height: 10vw;
                max-width: 70vw;
            }

            .error-page i {
                font-size: 8vw;
                line-height: 10vw;
                max-width: 70vw;
            }
        }

        a.back {
            width: 15%;
            height: 15%;
            position: fixed;
            top: 50%;
            left: 50%;
            background-color: #000;
            transform: translate(-50%, -50%);
            background: -webkit-repeating-linear-gradient(-45deg, #6CEFF5, #6ED4C8, #85EBCE, #8ED1B3, #BCFBD5);
            /*    background: -webkit-repeating-linear-gradient(-45deg, #71b7e6, #69a6ce, #b98acc, #ee8176); */
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            color: #fff;
            font-weight: bold;
            line-height: 24px;
            text-decoration: none;
            transition: 0.25s all ease-in-out;
        }

        a.back:hover {
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.4);
        }
    </style>
</head>
<body>
<div class="error-page">
    <div>
        <h1 data-h1="${error}" style="position: fixed; top: 35%; left: 50%; transform: translate(-50%, -50%); font-size: 25vh">${error}</h1>
        <div>
            <p data-p="${message}" style="position: fixed; top: 60%; left: 50%; transform: translate(-50%, -50%); font-size: 7vh">${message}</p>
        </div>
        <a class="back" href="/"><i class="fas fa-home" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);"></i></a>
    </div>
</div>
</body>
</html>