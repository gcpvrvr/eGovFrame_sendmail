<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- c태그 사용위해 필수! -->  
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 윗 부분 넣어줘야 한글 안깨짐 --> 
<%@ include file ="../sendmail/layout/header.jsp" %>
<!-- 헤더 넣음 -->

<title>받은메일함 검색/조회</title>
<!-- Custom styles for this page -->
<link href="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">


<body id="page-top">

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
                        <h6 class="m-0 font-weight-bold text-primary">받은메일함 검색/조회
                        
                         <!-- mailboxForm -->
		                    <thead>
								<p>
								<form id="mailboxForm" name="mailboxForm" method="post" data-sb-form-api-token="API_TOKEN">
									<!-- mailbox search-->
								<div class="form-floating mb-3">											
								<label for="titleSearch">제 목</label> &nbsp;&nbsp;&nbsp;
															
									<input class="form-control" id="title" name="title" type="text" autocomplete='off'
											style="display:inline-block; width:300px;" placeholder="메일제목" 
											data-sb-validations="required" /> 
											<div class="invalid-feedback" data-sb-feedback="title:required">
											</div> &nbsp;
											
									<button class="btn btn-primary btn-xl disabled" id="searchButton"
												type="submit" onclick="searchBtn();" >검색</button>&nbsp;&nbsp;&nbsp;
												
												
									    <!-- mailbox메일함 셀렉트박스 조회 -->									    
								    	<select id="selectMboxAdd" name="selectMboxAdd" >
								    		<option selected>메일함 분류</option> 
											    <c:forEach var="result2" items="${resultList2}"  varStatus="status">	    															
													  <option><c:out value="${result2.boxName}"/></option>															
												</c:forEach>
								  		</select>&nbsp;&nbsp;
								  		
								  	 <button class="btn btn-primary btn-xl disabled" id="moveButton"
											type="submit" onclick="moveBtn();">이동</button> 
								   											      																		
								</div>
								</form>
								</p>
								
								<!-- <td><form id="mailboxForm2" name="mailboxForm2" method="post" data-sb-form-api-token="API_TOKEN"> -->
								<!-- mailbox search-->
								<div class="form-floating mb-3">											
								<label for="contentsSearch">내 용</label> &nbsp;&nbsp;&nbsp;
															
									<input class="form-control" id="contents" name="contents" type="text" autocomplete='off'
											style="display:inline-block; width:300px;" placeholder="메일내용" 
											data-sb-validations="required" /> 
											<div class="invalid-feedback" data-sb-feedback="contents:required">
											</div> &nbsp;
											
									<button class="btn btn-primary btn-xl disabled" id="searchButton2"
												type="submit" onclick="searchBtn();" >검색</button>&nbsp;&nbsp;
								<!-- </form></td> -->
								
								<br><br>
								<!-- <td><form id="mailboxForm3" name="mailboxForm3" method="post" data-sb-form-api-token="API_TOKEN"> -->
								<!-- mailbox search-->
								<div class="form-floating mb-3">											
								<label for="senderSearch">보낸이</label> &nbsp;
															
									<input class="form-control" id="sender" name="sender" type="text" autocomplete='off'
											style="display:inline-block; width:300px;" placeholder="메일보낸이" 
											data-sb-validations="required" /> 
											<div class="invalid-feedback" data-sb-feedback="sender:required">
											</div> &nbsp;
											
									<button class="btn btn-primary btn-xl disabled" id="searchButton3"
												type="submit" onclick="searchBtn();" >검색</button>&nbsp;&nbsp;
								<!-- </form></td> -->
								
								
								<br><br>
								<td><button class="btn btn-primary btn-xl disabled" id="cancle"
													type="submit" onclick="cancel();">취소</button></td>
										
		                    </thead>                      
                        </h6>
                    </div>
                    
                    
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                            <tr>	<!-- 밑에 input selectAll(this)함수 - 클릭시 전체선택 체크박스 구현 -->
							  <th><input type="checkbox" id="select_all" onclick="selectAll(this)"></th>
                              <th>제목</th>
                              <th>내용</th>
                              <th>보낸이</th>
                              <th>일자</th>                                               
                            </tr>
                          </thead>
                          <tbody>
														<c:forEach var="result" items="${resultList}" varStatus="status">
															<tr>	<!-- 하나씩 선택하는 체크박스 구현 -->
																<td><input type="checkbox" name="select_each" onclick="selectEach()" value="${result.idx}"/></td>
																<td><a href="javascript:view(${result.idx});"><c:out value="${result.title}"/></a></td>
																<td><c:out value="${result.contents}"/></td>
																<td><c:out value="${result.sender}"/></td>
																<td><c:out value="${result.indate}"/></td>																
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

	
	<!-- 메일함이름 추가 함수 -->
	<!-- 메일함의 상세페이지, 메일함으로 이동 버튼 함수 -->
	<script type="text/javascript">
	
 	function searchBtn(){		
		 if( $("#title").val()==''){        
			alert("검색 내용을 입력하세요");
			$("#title").focus();
			return;
			}
			
			document.mailboxForm.action = "<c:url value='/searchmail.do'/>?userName=${userName }"; 
			document.mailboxForm.submit(); 
      } 
      
	
	function view(idx){
        location.href = "<c:url value='/detailwholebox.do'/>?idx="+idx;
        }
	
	function moveBtn(){
        location.href = "<c:url value='/inbox.do'/>?userName=${userName }"; //분류한 메일함 페이지로 이동주소 수정하기
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
    <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath()%>/css/bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="<%=request.getContextPath()%>/css/bootstrap/js/demo/datatables-demo.js"></script>

</body>

</html>