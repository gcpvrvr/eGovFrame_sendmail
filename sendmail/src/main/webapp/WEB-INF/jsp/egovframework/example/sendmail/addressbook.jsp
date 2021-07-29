<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 윗 부분 넣어줘야 한글 안깨짐 --> 

<%@ include file ="../sendmail/layout/header.jsp" %> 

<title>주소록</title>
 

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
  
  	<%@ include file ="../sendmail/layout/sidebar.jsp" %>
  
   <!-- Content Wrapper -->
   <div id="content-wrapper" class="d-flex flex-column">
  
     <!-- Main Content -->
     <div id="content">
	
       <!-- Topbar -->
       <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
       </nav>
       <!-- End of Topbar -->


	<!-- Contact Section-->
	<section class="page-section" id="contact">
		<div class="container">
			<!-- Contact Section Heading-->
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">주소록</h2>
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
						<!-- workplace input-->
						<div class="form-floating mb-3">
						<label for="workplace">회사</label>
							<input class="form-control" id="workplace" type="text"
								placeholder="회사명" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="workplace:required">
								회사를 입력해주세요</div>
						</div>
						<!-- dept input-->
						<div class="form-floating mb-3">
						<label for="dept">부서</label>
							<input class="form-control" id="dept" type="text"
								placeholder="부서명" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="dept:required">
								부서를 입력해주세요</div>
						</div>
						<!-- Name input-->
						<div class="form-floating mb-3">
						<label for="name">이름</label>
							<input class="form-control" id="name" type="text"
								placeholder="이름" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="name:required">
								이름을 입력해주세요</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
						<label for="email">이메일</label>	
							<input class="form-control" id="email" type="email"
								placeholder="이메일"
								data-sb-validations="required,email" /> 	
							<div class="invalid-feedback" data-sb-feedback="email:required">
								이메일 주소를 입력해주세요</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">
								이메일 주소를 입력해주세요</div>
						</div>
						<!-- Phone number input-->
						<div class="form-floating mb-3">
						<label for="phone">전화번호</label>	
							<input class="form-control" id="phone" type="tel"
								placeholder="전화번호" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="phone:required">
								전화번호를 입력해주세요</div>
						</div>
						<!-- Message input-->
						<div class="form-floating mb-3">
						<label for="message">메모</label>
							<textarea class="form-control" id="message" type="text"
								placeholder="메모(최대 2,000자)" style="height: 10rem"
								data-sb-validations="required"></textarea>
							<div class="invalid-feedback" data-sb-feedback="message:required">
								메모를 입력해주세요</div>
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
							type="submit"  onclick="addBtn();">입력</button> &nbsp;
							
						<!-- Update Button-->
						<button class="btn btn-primary btn-xl disabled" id="updateButton"
							type="button">수정</button> &nbsp;
							
						<!-- return Button-->
						<button class="btn btn-primary btn-xl disabled" id="returnButton"
							type="button" onclick="cancel();">취소</button>
					</form>
				</div>
			</div>
		</div>
	</section>


<!-- 이게 있어야 footer가 sidevar 안가리고 아래에 고정됨 -->		
</div>

 	<!-- End of Main Content -->

	<%@ include file ="../sendmail/layout/footer.jsp" %>


	<!-- 주소록의 등록,취소(돌아가기)버튼 작동 함수 -->
	<script>	
	function addBtn(){
        location.href = "<c:url value='/addresslist.do'/>";
        }
	
	function cancel(){
		location.href = "<c:url value='/addresslist.do'/>";
		}
	</script>




	  <!-- Bootstrap core JavaScript-->
	  <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/jquery/jquery.min.js"></script>
	  <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	  <!-- Core plugin JavaScript-->
	  <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	  <!-- Custom scripts for all pages-->
	  <script src="<%=request.getContextPath()%>/css/bootstrap/js/sb-admin-2.min.js"></script>
	
	  <!-- Page level plugins -->
	  <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/chart.js/Chart.min.js"></script>
	
	  <!-- Page level custom scripts -->
	  <script src="<%=request.getContextPath()%>/css/bootstrap/js/demo/chart-area-demo.js"></script>
	  <script src="<%=request.getContextPath()%>/css/bootstrap/js/demo/chart-pie-demo.js"></script>

</body>

</html>