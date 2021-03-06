<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.security.MessageDigest"%>
<%@ page import="java.math.BigInteger"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Sales Management</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/global_assets/images/companylogo.png"
	type="image/x-icon" />
<!-- Global stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/global_assets/css/icons/icomoon/styles.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/loginstyle.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap_limitless.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/layout.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/components.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/assets/css/colors.min.css"
	rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/main/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/main/bootstrap.bundle.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/loaders/blockui.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/ui/ripple.min.js"></script>
<!-- /core JS files -->

<link
	href="https://fonts.googleapis.com/css2?family=Oxygen:wght@300;400;700&display=swap"
	rel="stylesheet">
<!-- font-family: 'Oxygen', sans-serif; -->

</head>
<style>
.login_bg {
	background-image:
		url("${pageContext.request.contextPath}/resources/global_assets/images/login_bg1.jpg");
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
	height: 100vh;
}

body1 {
	/* background-image:
		url("${pageContext.request.contextPath}/resources/global_assets/images/bg3.jpeg"); */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.no-background1 {
	background-image:
		url("${pageContext.request.contextPath}/resources/global_assets/images/bg2.jpg");
}

.img {
	width: 175px;
	height: 110px;
}

.img img {
	max-width: 100%;
	right: 8%;
	margin-top: -20%;
	margin-left: 25%
}
</style>
<body>
	<div class="login_bg">

		<div class="page_loader"></div>

		<div class="power_logo">
			<a href="https://aaryatechindia.in/" target="_blank"> <img
				src="${pageContext.request.contextPath}/resources/global_assets/images/powerd_logo.png"
				alt="">
			</a>
		</div>

		<!-- login-form -->
		<form id="form-login" action="resetPassword" method="post">
			<div class="loginInner" id="pass_form1">

				<div class="login_l">
					<a href="">
						<div class="img">
							<img
								src="${pageContext.request.contextPath}/resources/global_assets/images/powerdBy.png"
								alt="">
						</div>
					</a>

					<p class="login_txt">
						Welcome to India’s one of most preferred bakery brand ! <span>Lets
							make Monginis a part of everybody’s celebration!!</span>
					</p>

				</div>

				<div class="login_r">



					<%-- 	<img
						src="${pageContext.request.contextPath}/resources/global_assets/images/logo_white.png"
						alt=""> --%>
					<h2 class="login_head_one">Reset Your Password</h2>
					<div class="clr"></div>
					<c:if test="${msg!=null}">
						<div class="alert alert-danger">${msg}</div>

					</c:if>
					<c:if test="${sessionScope.errorPassMsg!=null}">
						<div class="alert alert-danger">${sessionScope.errorPassMsg}</div>

						<%
							session.removeAttribute("errorPassMsg");
						%>
					</c:if>

					<!-- class="login-form" -->
					<%-- 	<form action="${pageContext.request.contextPath}/loginProcess"
						id="submitInsertEmpType" method="post"> --%>

					<%
						UUID uuid = UUID.randomUUID();
						MessageDigest md = MessageDigest.getInstance("MD5");
						byte[] messageDigest = md.digest(String.valueOf(uuid).getBytes());
						BigInteger number = new BigInteger(1, messageDigest);
						String hashtext = number.toString(16);
						session = request.getSession();
						session.setAttribute("generatedKey", hashtext);
					%>
					<input type="hidden" value="<%out.println(hashtext);%>"
						name="token" id="token">
					<c:if test="${sessionScope.errorMsg!=null}">
						<div class="alert alert-danger">${sessionScope.errorMsg}</div>

						<%
							session.removeAttribute("errorMsg");
						%>
					</c:if>
					<%-- <c:out value="${empId}"></c:out> --%>
					<input type="hidden" value="${empId}" id="empId" name="empId">
					<div
						class="form-group form-group-feedback form-group-feedback-left">
						<input type="text" id="password" name="password"
							class="form-control form_lgn" placeholder="Enter New Password"
							onkeyup="Validate()" style="border-radius: 5px;"
							autocomplete="off" required="required"> <span
							class="validation-invalid-label" id="error_pass"
							style="display: none;"> Password Is Requiered!!!!. </span> <span
							class="validation-invalid-label" id="error_minpass"
							style="display: none;"> Password Length Should Be Greater
							Than 5!!!!. </span> <span class="validation-invalid-label"
							id="error_maxpass" style="display: none;"> Password Length
							Must Be Less Than 13!!!!. </span>
						<div class="form-control-feedback" style="padding-left: 10px;">
							<i class="icon-user text-muted"></i>
						</div>
					</div>

					<div
						class="form-group form-group-feedback form-group-feedback-left">
						<input type="password" id="cpassword" name="cpassword"
							class="form-control form_lgn" placeholder="Confirm Password"
							onkeyup="Validate()" style="border-radius: 5px;"
							autocomplete="off" required="required"> <span
							class="validation-invalid-label" id="error_cpass"
							style="display: none;"> Confirm Password Is Requiered!!!!.
						</span> <span class="validation-invalid-label" id="error_cminpass"
							style="display: none;"> Password Length Should Be Greater
							Than 5!!!!. </span> <span class="validation-invalid-label"
							id="error_cmaxpass" style="display: none;"> Password
							Length Must Be Less Than 13!!!!. </span>
						<div class="form-control-feedback" style="padding-left: 10px;">
							<i class="icon-lock2 text-muted"></i>
						</div>

					</div>

					<br> <span class="validation-invalid-label" id="error_pass1"
						style="display: none;"> Pasword Dosent Match </span>
					<div class="checkbox clearfix">

						<%--  <a href="${pageContext.request.contextPath}/showForgotPass">Forgot Password?</a> --%>
					</div>
					<div class="form-group" style="margin: 0;">
						<button type="submit" class="buttonlogin" id="sbtn">Reset
							Password</button>
						<!-- <div class="forgot_pass">
							<a href="#" onclick="showForgotWindow()">Forgot Password?</a>
						</div> -->
					</div>
					<div class="d-lg-none">
						<span class="navbar-text"> &copy; 2019 - 2022. <a href="#">Powered
						</a> by <a href="http://aaryatechindia.in/" class="navbar-text"
							target="_blank">AARYA TECH SOLUTIONS</a>
							</p> <a href="http://aaryatechindia.in/" target="_blank"><img
								src="${pageContext.request.contextPath}/resources/global_assets/images/powerdBy.png"
								width="60" height="50" alt=""></a>
					</div>

				</div>

				<div class="clr"></div>
			</div>



			<!-- forgot password form -->
			<%-- <div class="loginInner" style="display: none" id="pass_form">

				<div class="login_l">
					<a href=""><img
						src="${pageContext.request.contextPath}/resources/global_assets/images/monginis1.png"
						alt=""></a>

					<p class="login_txt">
						Welcome to India’s one of most preferred bakery brand ! <span>Lets
							make Monginis a part of everybody’s celebration!!</span>
					</p>

				</div>

				<div class="login_r forgot">



					<img
						src="${pageContext.request.contextPath}/resources/global_assets/images/logo_white.png"
						alt="">
					<h2 class="login_head_one">Forgot Password</h2>
					<div class="clr"></div>


					<!-- class="login-form" -->


					<c:if test="${sessionScope.errorPassMsg1!=null}">
						<div class="alert alert-danger">${sessionScope.errorPassMsg1}</div>

						<%
							session.removeAttribute("errorPassMsg1");
						%>
					</c:if>
					<div
						class="form-group form-group-feedback form-group-feedback-left">
						<input type="text" id="usernameFp" name="usernameFp"
							class="form-control form_lgn" placeholder="Email Address"
							style="border-radius: 5px;">
						<div class="form-control-feedback" style="padding-left: 10px;">
							<i class="icon-envelop text-muted"></i>
						</div>
					</div>


					<div class="form-group" style="margin: 0;">
						<button type="button" onclick="subPassForForm()"
							class="buttonlogin">Submit</button>
						<div class="forgot_pass" style="text-align: left;">
							<a href="#" onclick="hidePassForForm()">Back</a>
						</div>
					</div>

				</div> 

				<div class="clr"></div>

			</div> --%>
		</form>


	</div>

	<script type="text/javascript">
		function subPassForForm() {
			//alert("Hi")
			var form = document.getElementById("form-login")
			form.action = "${pageContext.request.contextPath}/checkUserName";
			form.submit();
		}
		function showForgotWindow() {
			document.getElementById("pass_form").style.display = "block";
			document.getElementById("pass_form1").style = "display:none";

		}
		function hidePassForForm() {
			document.getElementById("pass_form").style = "display:none";
			document.getElementById("pass_form1").style.display = "block";

		}
	</script>
	<script type="text/javascript">
		function Validate() {
			//alert("call validate")
			var password = document.getElementById("password").value;
			var confirmPassword = document.getElementById("cpassword").value;
			$("#error_pass").hide();
			$("#error_cpass").hide();
			$("#error_pass1").hide();

			if (!$("#password").val()) {
				//alert("if pass")
				$("#error_pass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			}

			if (password.length < 5) {
				//alert(password.length)
				$("#error_minpass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			} else {
				$("#error_minpass").hide();
			}

			if (password.length >= 13) {
				//alert(password.length)
				$("#error_maxpass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			} else {
				$("#error_maxpass").hide();
			}

			if (confirmPassword.length < 5) {
				//alert(password.length)
				$("#error_cminpass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			} else {
				$("#error_cminpass").hide();
			}

			if (confirmPassword.length >= 13) {
				//alert(password.length)
				$("#error_cmaxpass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			} else {
				$("#error_cmaxpass").hide();
			}

			if (!$("#cpassword").val()) {
				//alert("if cpass")
				$("#error_cpass").show();
				document.getElementById("sbtn").disabled = true;
				return false;
			}

			// alert(confirmPassword)
			if (password != confirmPassword) {
				//alert("if pass1")
				$("#error_pass1").show();
				document.getElementById("sbtn").disabled = true;
				// alert("Passwords do not match.");
				return false;
			} else {
				document.getElementById("sbtn").disabled = false;
			}
			return true;
		}
	</script>
</body>

</html>