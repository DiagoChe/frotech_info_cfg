<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" 
           uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>信息配置管理</title>
    <style>
        .header {
            text-align: center;
            font-family: sans-serif;
            font-size: 20px;
            font-weight: bold;
            margin-top: 75px;
        }
        
        .all {
            width: 100%;
            margin: 20px auto;
            text-align: center;
            height: 300px;
        }
        
        table {
            width: 750px;
            margin: 50px auto;
            font-size: 14px;
            overflow: auto;
        }
        
        table02 {
            width: 360px;
            margin-left: 78px;
            margin-top: 50px;
            font-size: 14px;
            overflow: auto;
        }
        
        table th,
        table td {
            border-bottom: 1px #000 solid;
            line-height: 23px;
        }
        
        h2 {
            text-align: center;
        }
        
        .btn_1 {
            height: 125px;
            font-size: 16px;
            margin: 30px auto;
        }
        
        #search {
            height: 40px;
            font-size: 16px;
            margin: 50px auto;
            text-align: center;
        }
        
        #edit_comm {
            width: 500px;
            margin: 20px auto;
            height: 200px;
        }
        
        .text {
            line-height: 15px;
            height: 25px;
            width: 320px;
            margin: 10px auto;
            text-align: center;
            margin-left: 80px;
        }
        
        .btn {
            height: 22px;
            width: 80px;
            margin-left: 110px;
            margin-top: 20px;
            text-align: center;
        }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body> 
	${msg }
    <div class="header">
        <h1>信息配置管理</h1>
    </div>
    <div id="all_comm" class="all">
        <table id="items">
            <tr>
                <td>title</td>
                <td>keyword</td>
                <td>description</td>
            </tr>
            <c:forEach items="${frotech_config}" var="frotech_config">
                <tr>
                    <td id="title${frotech_config.keyword}">${frotech_config.title}</td>
                    <td id="keyword${frotech_config.keyword}">${frotech_config.keyword}</td>
                    <td id="description${frotech_config.keyword}">${frotech_config.description}</td>
                    <td><a onclick="delete_stu('${mes.keyword}')" href="#">删除</a>|<a onclick="edit_stu('${mes.keyword}')" id="edit0" href="#">编辑</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="all" onclick="refush()">点此刷新</a>
        <form action="" class="btn_1">
            <input id="add" class="add" type="button" value="新增" />
            <input id="search_btn" class="search_btn" type="button" value="查找" />
        </form>
    </div>
    <div class="search" id="search_comm">
        <h2>查找关键词</h2>
        <form action="queryByKeyword" method="post" id="search">
            <input type="text" placeholder="检索关键词" name="keyword">
            <input type="submit" value="查找关键词">
            <input type="button" value="取消" id="cancel3" />
        </form>
    </div>
    <div id="edit_comm">
        <h2 id="edit_title">编辑信息</h2>
        <form action="update" method="post">
            <input class="text" type="text" placeholder="要修改的title为" id="edit_title" name="title" readonly="readonly" />
            <input class="text" type="text" placeholder="要修改的keyword为" id="edit_keyword" name="keyword" />
            <input class="text" type="text" placeholder="description为" id="edit_description" name="description" />
            <input class="btn" type="submit" value="确定修改" />
            <input class="btn" type="button" value="取消修改" id="cancel1" class="edit_stu" />
        </form>
    </div>
</body>
<script type="text/javascript">
$(function() {
    $("#cancel1").click(function() {
        $("#all_comm").fadeIn();
        $("#edit_comm").fadeOut();
        $("#search_comm").fadeOut();
    })
    $("input").addClass("edit_stu");
    $("#add").click(function() {
        window.location.href = "login.html";
    })
    $("#search_btn").click(function() {
        $("#search_comm").fadeIn();
        $("#all_comm").fadeOut();
        $("#edit_comm").fadeOut();
    })
    $("#cancel3").click(function() {
        $("#all_comm").fadeIn();
        $("#edit_comm").fadeOut();
        $("#search_comm").fadeOut();
    })
    $("#edit0").click(function() {
        $("#all_comm").fadeOut();
        $("#edit_comm").fadeIn();
        $("#search_comm").fadeOut();
    })
})


function refush() {
    window.location.href = "/all";
}

function delete_stu(keyword) {
    var result = confirm("是否删除？");
    if (result)
        window.location.href = "deleteByKeyword?id=" + keyword;

}

function edit_stu(id) {

    var title = $("#title" + id).text();
    var keyword = $("#keyword" + id).text();
    var description = $("#description" + id).text();
    $("#edit_title").val(title);
    $("#edit_keyword").val(keyword);
    $("#edit_description").val(description);
    $("#all_comm").fadeOut();
    $("#edit_comm").fadeIn();
}
</script>
</html>