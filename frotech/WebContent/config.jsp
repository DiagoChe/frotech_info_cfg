<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>信息配置模块</title>
    <style>
        .header {
            text-align: center;
            font-family: sans-serif;
            font-size: 20px;
            font-weight: bold;
            margin-top: 235px;
        }
        
        .add_comm {
            width: 600px;
            margin: 40px auto;
            height: 500px;
        }
        
        .text {
            line-height: 15px;
            height: 25px;
            width: 320px;
            margin: 10px 140px 0 140px;
            text-align: center;
        }
        
        .btn {
            height: 22px;
            width: 45px;
            margin-left: 170px;
            margin-top: 30px;
        }
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<div class="header">
        <h1>信息配置模块</h1>
    </div>
    <div class="add_comm">
        <form method="post" action="add">
            <input class="text" type="text" placeholder="title" name="title" />
            <input class="text" type="text" placeholder="keyword" name="keyword" />
            <input class="text" type="text" placeholder="description" name="description" />
            <br>
            <input class="btn" type="submit" value="提交" />
            <input class="btn" type="button" value="取消" id="cancel2" class="" />
        </form>
    </div>
</body>
<script>
$(function() {
    $("#cancel2").click(function() {
        window.location.href = "index.html";
    })
})

function add_reg() {
    var title = $("#add_edit_title").val();
    var keyword = $("#add_edit_keyword").val();
    var description = $("#add_edit_description").val();
    var titleNot = title != null && title != '';
    var keywordNot = keyword != null && keyworde != '';
    var descriptionNot = description != null && description != '';

    if (titleNot && keywordNot && descriptionNot)
        return true;
    else
        return false;
}
</script>
</html>