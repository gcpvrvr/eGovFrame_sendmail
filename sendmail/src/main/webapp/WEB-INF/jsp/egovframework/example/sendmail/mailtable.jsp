<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="../sendmail/header.jsp" %>



    <title>전체메일함</title>

    <!-- Custom fonts for this template -->
    <link href="<%=request.getContextPath()%>/css/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">


<body id="page-top">

     <!-- Page Wrapper -->
    <div id="wrapper">

       

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">전체메일함</h1>
                    <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <!-- <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div> 테이블 감싸는 한줄메뉴칸 -->
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>발신자</th>
                                            <th>수신자</th>
                                            <th>제목</th>
                                            <th>발송일</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>글번호</th>
                                            <th>발신자</th>
                                            <th>수신자</th>
                                            <th>제목</th>
                                            <th>발송일</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>보내자</td>
                                            <td>받자</td>
                                            <td>제에모옥</td>
                                            <td>나알짜아</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>3</td>
                                            <td>보내자3</td>
                                            <td>받자3</td>
                                            <td>제에모옥3</td>
                                            <td>나알짜아3</td>
                                        </tr>
                                        <tr>
                                            <td>4</td>
                                            <td>보내자4</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>5</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>6</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>7</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                       <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>보내자2</td>
                                            <td>받자2</td>
                                            <td>제에모옥2</td>
                                            <td>나알짜아2</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

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


<%@ include file="../sendmail/footer.jsp" %>  <!-- 고정 하단 -->

</body>

</html>