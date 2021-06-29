<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width--device-width, initial-scale=1">
    <link rel="stylesheet" href="/css/bootstrap/css/bootstrap.min.css">
        <script src="/js/jquery-3.5.1.min.js"></script>
        <script src="/css/bootstrap/js/bootstrap.min.js"></script>
</head>
<div class="container">
    <h1> 메인화면 </h1>
    <div class="panel panel-default">
       <div class="panel-heading">
          <form class="form-inline" action="/login.do">
             <div class="form-group">
                <label for="id">아이디:</label>
                <input type="text" class="form-control" id="id">
             </div>
             <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password" class="form-control" id="pwd">
             </div>
             <button type="submit" class="btn btn-default">로그인</button>
          </form>
       </div>
        <div class="panel-body">
    <form class="form-inline" action="/search.do">
       <div class="form-group">
          <label for="searchName">제목:</label>
          <input type="text" class="form-control" id="searchName">
       </div>
       <button type="submit" class="btn btn-default">검색</button>
    </form>
    <div class="table-responsive">
       <table class="table table-hover">
          <thead>
             <tr>
                <th>#</th>
                <th>Firstname</th>
                <th>Lastname</th>
                <th>Age</th>
                <th>City</th>
                <th>Country</th>
             </tr>
          </thead>
          <tbody>
             <tr>
                <td>1</td>
                <td>Anna</td>
                <td>Pitt</td>
                <td>35</td>
                <td>New York</td>
                <td>USA</td>
             </tr>
          </tbody>
       </table>
    </div>
 </div>
    <div class="panel-footer">
    <button type="button" class="btn btn-default">Default</button>
 </div>
    </div>
</div>
</html>