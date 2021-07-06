<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../sendmail/header.jsp"%>



 <title>메일쓰기</title>
 

<!-- Custom fonts for this template -->
<link
	href="<%=request.getContextPath()%>/css/bootstrap/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">


<body id="page-top">


	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">메일쓰기</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<!-- <i class="fas fa-star"></i> -->
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Contact Section Form-->
			<div class="row justify-content-center">
				<div class="col-lg-8 col-xl-7">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="contactForm" data-sb-form-api-token="API_TOKEN">
						<!-- Name input-->
						<div class="form-floating mb-3">
						<label for="name">발신자</label>
							<input class="form-control" id="name" type="text"
								placeholder="이름" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="name:required">
								이름을 입력해주세요</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
						<label for="email">이메일</label>	
							<input class="form-control" id="email" type="email"
								placeholder="이메일@email.com"
								data-sb-validations="required,email" /> 	
							<div class="invalid-feedback" data-sb-feedback="email:required">
								이메일 주소를 입력해주세요</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">
								이메일 주소를 입력해주세요</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
						<label for="phone">제목</label>	
							<input class="form-control" id="phone" type="tel"
								placeholder="제목을 입력해주세요" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="phone:required">
								제목을 입력해주세요</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
						<label for="message">내용</label>
							<textarea class="form-control" id="message" type="text"
								placeholder="내용을 입력해주세요" style="height: 10rem"
								data-sb-validations="required"></textarea>
							<div class="invalid-feedback" data-sb-feedback="message:required">
								내용을 입력해주세요</div>
						</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">전송에 성공하였습니다</div>
								To activate this form, sign up at <br /> 
								<a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">전송에 실패하였습니다</div>
						</div>
						<!-- Submit Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit">전송</button>
					</form>
				</div>
			</div>
		</div>
	</section>



	<!-- Page level plugins -->
	<script
		src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="<%=request.getContextPath()%>/css/bootstrap/js/demo/datatables-demo.js"></script>

<%@ include file="../sendmail/footer.jsp" %>  <!-- 고정 하단 -->

</body>

</html>