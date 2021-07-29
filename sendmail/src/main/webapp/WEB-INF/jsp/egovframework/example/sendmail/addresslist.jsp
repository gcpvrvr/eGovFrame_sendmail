<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- 윗 부분 넣어줘야 한글 안깨짐 --> 
<%@ include file ="../sendmail/layout/header.jsp" %>
<!-- 헤더 넣음 -->

<title>주소록</title>
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
                        <h6 class="m-0 font-weight-bold text-primary">주소록  &nbsp;&nbsp;  <!-- 공백 띄어쓰기 -->
	                        <thead>
	                            <tr>
		                        <!-- add Button-->
								<th><button class="btn btn-primary btn-xl disabled" id="addButton"
									type="submit" onclick="addBtn();">등록</button></th>
								</tr>
                         	 </thead>
                         </h6>
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                          <thead>
                            <tr>
                              <th>No</th>
                              <th>회사</th>
                              <th>부서</th>
                              <th>이름</th>
                              <th>이메일</th>
                              <th>전화번호</th>
                              <th>메모</th>
                              <th>날짜</th> 
                              <th>편집</th>                           
                           <!--    <th colspan="2" align="center">편집</th> 편집에 수정/삭제 들어가게... -->                     
                            </tr>
                          </thead>
                          <tbody>						<!-- VO 파라미터 -->
														<c:forEach var="result" items="${resultList}" varStatus="status">
															<tr>
																<td><c:out value="${result.idx2}"/></td>
																<td><c:out value="${result.workplace}"/></td>
																<td><c:out value="${result.dept}"/></td>
																<td><c:out value="${result.addressName}"/></td>
																<td><c:out value="${result.emailAddress}"/></td>
																<td><c:out value="${result.pNumber}"/></td>
																<td><c:out value="${result.memo}"/></td>
																<td><c:out value="${result.indate2}"/></td>
																<td><a href="javascript:view();">수정</a> &nbsp;/&nbsp;
																	<a href="javascript:view();">삭제</a></td>	
															</tr>
														</c:forEach>   
                          </tbody>
                        </table>
                      </div>
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


	<!-- 주소록의 등록버튼 작동 함수 -->
	<script>
	function addBtn(){
        location.href = "<c:url value='/addressbook.do'/>";
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