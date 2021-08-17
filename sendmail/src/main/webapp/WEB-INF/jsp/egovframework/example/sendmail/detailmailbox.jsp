<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 윗 부분 넣어줘야 한글 안깨짐 --> 

<%@ include file ="../sendmail/layout/header.jsp" %> 

<title>메일함 수정</title>
 

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
			<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">메일함 수정</h2>
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
					<form id="mailboxForm" name="mailboxForm" method="post" data-sb-form-api-token="API_TOKEN">
					<!-- <form id="contactForm" data-sb-form-api-token="API_TOKEN"> -->
					
						<!-- idx input
						<div class="form-floating mb-3">
						<label for="idx">No</label>
							<input class="form-control" id="idx" name="idx" type="text" readonly="readonly"
								 value="${mailVO.idx }" data-sb-validations="required" />  
							<div class="invalid-feedback" data-sb-feedback="idx:required">
							</div> 
						</div> -->
						<!-- boxName input-->
						<div class="form-floating mb-3">
						<label for="boxName">메일함이름</label>
							<input class="form-control" id="boxName" name="boxName" type="text"
								 value="${mailVO.boxName }" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="boxName:required">
								메일함이름</div>
						</div>
						<!-- userId input-->
						<div class="form-floating mb-3">
						<label for="userId"></label>
							<input class="form-control" id="userId" name="userId" type="hidden" readonly="readonly"
								value="${mailVO.userId }" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="userId:required">
								유저아이디</div>
						</div>
						
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">입력하였습니다</div>
								<!-- To activate this form, sign up at <br /> 
								<a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a> -->
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">입력하지 못했습니다</div>
						</div>
						
						<!-- insert Button-->
						<button class="btn btn-primary btn-xl disabled" id="submitButton"
							type="submit"  onclick="modify();">수정</button> &nbsp;
							
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


	<!-- 메일함의 수정,취소 함수 -->
	<script>

	function modify(){
		
		 if( $("#boxName").val()==''){
			alert("메일함 이름을 입력하세요");
			$("#boxName").focus();
			return;
			}
			if (!confirm("수정하시겠습니까?")){
			return;
			}
		
			document.mailboxForm.action = "<c:url value='/updateMailbox.do'/>?idx=${mailVO.idx}";
			document.mailboxForm.submit(); 
			
        }
	
	function cancel(){
		location.href = "<c:url value='/mboxaddlist.do'/>?userName=${userName }";
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