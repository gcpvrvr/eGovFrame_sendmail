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
	function add() {
		location.href = "<c:url value='/mgmt.do'/>";
	}
	function view() {
		location.href = "<c:url value='/view.do'/>";
	}
	function setPwd(user_id) {
		if (user_id == "admin") {
			$("#password").val("1234")
		} else if (user_id == "guest") {
			$("#password").val("1234")
		} else {
			$("#password").val("1234")
		}
	}
	function check() {
		if ($("#user_id").val() == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if ($("#password").val() == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		return true;
	}
</script>
</head>
<div class="container">
	<h1>메인화면</h1>
	<div class="panel panel-default">
		<div class="panel-heading">

			<form class="form-inline" method="post" action="/login.do">

				<div class="form-group">
					<label for="user_id">아이디:</label> <select class="form-control"
						id="user_id" name="user_id" onchange="setPwd(this.value);">
						<option value="">선택하세요</option>
						<option value="admin">관리자</option>
						<option value="guest">사용자</option>
					</select>
				</div>
				<div class="form-group">
					<label for="password">Password:</label> <input type="password"
						class="form-control" id="password" name="password">
				</div>
				<button type="submit" class="btn btn-default"
					onclick="return check();">로그인</button>

			</form>

		</div>
		<div class="panel-body">
			<form class="form-inline" action="/search.do">
				<div class="form-group">
					<label for="searchName">제목:</label> <input type="text"
						class="form-control" id="searchName">
				</div>
				<button type="submit" class="btn btn-default">검색</button>
			</form>
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>게시물번호</th>
							<th>제목</th>
							<th>조회수</th>
							<th>등록자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><a href="javascript:view();">1</a></td>
							<td><a href="javascript:view();">안녕하세요. 게시판공지 입니다</a></td>

							<td>1</td>
							<td>관리자</td>
							<td>2020-05-24</td>
						</tr>
					</tbody>

				</table>
			</div>
		</div>
		<div class="panel-footer">
			<button type="button" class="btn btn-default" onclick="add();">등록</button>
		</div>
	</div>
</div>
</html>
