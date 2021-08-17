<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 윗 부분 넣어줘야 한글 안깨짐 --> 
<%@ include file ="../sendmail/layout/header.jsp" %>
<!-- 헤더 넣음 -->

<title>메일함 추가</title>
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<body id="page-top">


<!-- Modify Modal창 :  modify(${result.idx})부분 
	
	<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">	
		<div class="modal-dialog" role="document">	
			<div class="modal-content">	
	    		<div class="modal-header">	
	   				<h5 class="modal-title" id="exampleModalLabel">메일함 수정</h5>
	  					<button class="btn btn-secondary" type="button" data-dismiss="modal" aria-label="Close">
	       				<i class="fa fa-fw fa-times"></i>	
	        		</button>	
	    		</div>
	    		<div class="modal-body">	
	    			<input type="text" id="updateMailbox" name="updateMailbox" />	
	    		</div>
    			<div class="modal-footer">	
	    			<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>	
		       		<button class="btn btn-primary" type="button" id="btn_modify">수정</button>	
	    		</div>	
			</div>	
		</div>	
	</div>  -->



    <!-- Page Wrapper -->
    <div id="wrapper">

			<!-- 사이드바-->
			<%@ include file ="../sendmail/layout/sidebar.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

          <!-- Main Content -->
          <div id="content">
          
	          <!-- Topbar -->
			      <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
			      </nav>
			      <!-- End of Topbar -->

              <!-- Begin Page Content -->
              <div class="container-fluid">

                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">메일함 추가  &nbsp;&nbsp;  
	                        <thead>
	                            <tr>
										<!-- mailboxForm -->
										<p> 
										<form id="mailboxForm" name="mailboxForm" method="post" data-sb-form-api-token="API_TOKEN">
											<!-- mailbox input-->
										<div class="form-floating mb-3">											
										<label for="boxName">메일함</label> &nbsp;&nbsp;							
											<input class="form-control" id="boxName" name="boxName" type="text" 
													style="display:inline-block; width:300px;" placeholder="메일함 이름" 
													data-sb-validations="required" /> 
													<div class="invalid-feedback" data-sb-feedback="boxName:required">
													</div> &nbsp;
											<input class="form-control" id="userId" name="userId" type="hidden"
													style="display:inline-block; width:300px;" 
													value="${userId }" data-sb-validations="required" /> 
													<div class="invalid-feedback" data-sb-feedback="userId:required">
													</div> &nbsp;
											<button class="btn btn-primary btn-xl disabled" id="mailboxButton"
													type="submit" onclick="mailboxBtn();">추가</button>&nbsp;&nbsp;																
										</div>							
										</form>										
										</p>
									
										<td><button class="btn btn-primary btn-xl disabled" id="searchBtn"
													type="submit" onclick="searchBtn();">분류</button></td>
																												
								</tr>
                         	 </thead>
                         </h6>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                            <tr>	<!-- 밑에 input selectAll(this)함수 - 클릭시 전체선택 체크박스 구현 -->
							  <th><input type="checkbox" id="select_all" onclick="selectAll(this)"></th>
                              <th>메일함이름</th>
                              <th>편집</th>                                               
                            </tr>
                          </thead>
                          <tbody>						<!-- VO 파라미터 -->
														<c:forEach var="result" items="${resultList}" varStatus="status">
															<tr>	<!-- 하나씩 선택하는 체크박스 구현 -->
																<td><input type="checkbox" name="select_each" onclick="selectEach()" value="${result.idx}"/></td>
																<td><c:out value="${result.boxName}"/></td>
																<td><input type="button" value="수정" onclick="modify(${result.idx})" 
																		class="btn btn-primary btn-xl btn-sm disabled"></input>
																	<input type="button" value="삭제" onclick="del(${result.idx})" 
																		class="btn btn-primary btn-xl btn-sm disabled"></input>
																</td>	
															</tr>
														
														</c:forEach>   
                          </tbody>
                        </table>
                      </div>
                     		 <!-- 체크박스 선택하여 삭제하는 button -->
					  <button class="btn btn-primary" id="delBtn" disabled="disabled" onclick="deleteTmp();" 	
							  style="margin: 0px 5px; background-color: #96a8ba; border-color: white; font-weight: bold; font-size: small;" >
                    		  선택삭제</button>	 
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
          </div>
          <!-- End of Main Content -->

						<%@ include file ="../sendmail/layout/footer.jsp" %>
						<!-- 푸터넣음 -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


	<!-- 메일함의 수정,삭제버튼 함수 -->
	<!-- 메일함 추가,분류(검색)하는 함수 -->
	<script type="text/javascript">

/* 	<!-- Modify Modal창 -->
	function modify(idx) {
    	$("#modifyModal").modal('show');

    	$("#btn_modify").on("click", function(e) {
			alert($(this).parent().siblings('span').text());
			var result = $("#updateMailbox").val();
			$("#modifyModal").modal('hide');
			$("#updateMailbox").val("");
		});
	} */ 
	
 	function modify(idx) {
		var chk = confirm("수정하시겠습니까?");
		if (chk) {
			location.href="<c:url value='/detailmailbox.do?idx='/>"+idx;   
		} 
	}  

 	function del(idx) {
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href="<c:url value='/deleteMailbox.do?idx='/>"+idx;   
		} 
	} 
 	
 	function mailboxBtn(){		
		 if( $("#boxName").val()==''){        
			alert("메일함 이름을 입력하세요");
			$("#boxName").focus();
			return;
			}
			if (!confirm("메일함을 생성하시겠습니까?")){
			return;
			}
			
			document.mailboxForm.action = "<c:url value='/insertMailbox.do'/>?idx=${mailVO.idx}"; 
			document.mailboxForm.submit(); 
       }
 	
 	function searchBtn(){
        location.href = "<c:url value='/searchmail.do'/>?userName=${userName }";
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
    <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/css/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>