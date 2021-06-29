<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width--device-width, initial-scale=1">
<link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css">
<script src="/js/jquery-3.5.1.min.js"></script>
<script src="/css/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function cancel() {
		location.href = "<c:url value='/mainList.do'/>";
	}
	function list() {
		location.href = "<c:url value='/mainList.do'/>";
	}
</script>

</head>
<div class="container">
	<h1>상세화면</h1>
	<div class="panel panel-default">
		<div class="panel-heading">
			<label for="">생각중:</label>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="post" action="/">
				<div class="form-group">
					<label class="control-label col-sm-2" for="idx">게시물아이디:</label>
					<div class="col-sm-10 control-label" style="text-align: left;">
						게시물아이디</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">제목:</label>
					<div class="col-sm-10 control-label" style="text-align: left;">
						제목</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">등록자/등록일:</label>
					<div class="col-sm-10 control-label" style="text-align: left;">
						등록자/등록일</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">내용:</label>
					<div class="col-sm-10 control-label" style="text-align: left;">
						내용</div>
				</div>
			</form>
		</div>

		<div class="panel-footer">
			<button type="button" class="btn btn-default">수정</button>
			<button type="button" class="btn btn-default">삭제</button>
			<button type="button" class="btn btn-default" onclick="cancel();">목록</button>
		</div>

	</div>
</div>
</html>