<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" %>
<%@ page import="com.google.util.JDBCUtils" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background: url("img/back.jpg") no-repeat center 0px;
            background-size: 100% 100%;
        }
    </style>
    <title>修改学生成绩信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">

</head>
<script language="javascript" type="">
    function checkform()
    {//验证输入数据的合法性
        if (form1.id.value=="") {
            alert("学号不能为空。");
            return false;
        }
        if (isNaN(form1.id.value)) {
            alert("学号只能为数字");
            return false;
        }
        if (form1.name.value=="") {
            alert("姓名不能为空。");
            return false;
        }
        if (form1.circuit_score.value=="") {
            alert("电路成绩不能为空。");
            return false;
        }
        if (isNaN(form1.circuit_score.value))
        {
            alert("电路成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.circuit_score.value);
            if (num<0||num>100)
            {
                alert("电路成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.en_RW_score.value=="") {
            alert("电路成绩不能为空。");
            return false;
        }
        if (isNaN(form1.en_RW_score.value))
        {
            alert("电路成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.en_RW_score.value);
            if (num<0||num>100)
            {
                alert("电路成绩必须在0-100之间！");
                return false;
            }
        }
        if (form1.physics_score.value=="") {
            alert("英语读写成绩不能为空。");
            return false;
        }
        if (isNaN(form1.physics_score.value))
        {
            alert("英语读写成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.physics_score.value);
            if (num<0||num>100)
            {
                alert("英语读写成绩必须在0-100之间！");
                return false;
            }
        }

        if (form1.history_score.value=="") {
            alert("大学物理成绩不能为空。");
            return false;
        }
        if (isNaN(form1.history_score.value))
        {
            alert("大学物理成绩只能为数字");
            return false;
        }
        else
        {
            var num=parseFloat(form1.history_score.value);
            if (num<0||num>100)
            {
                alert("大学物理成绩必须在0-100之间！");
                return false;
            }
        }

        if (form1.rank.value=="") {
            alert("查询密码成绩不能为空。");
            return false;
        }
        if (form1.rank.value.length<1||form1.rank.value.length>20) {
            alert("密码超出了范围（1～20）");
            return false;
        }
    }


</script>
<body>
<%
    String id = request.getParameter("id");
    String sql = "select * from score where id='" + id + "'";//设置查询SQL语句

    try {
        Connection conn = JDBCUtils.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {//获取学生数据表中的记录
%>
<center><h3>修改成绩预览</h3></center>

<form class="m-t" role="form" name="form1" method=post action="Update3.jsp">
    <table class="table table-condensed table-hover">
        <tr>
            <td width="140" align="right">学号：</td>
            <td width="250" valign="top"><%=rs.getString("id")%>
                <input type="hidden" name="id" value=<%=rs.getString("id")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">姓名：</td>
            <td width="250" valign="top"><%=rs.getString("name")%>
                <input type="hidden" name="name" value=<%=rs.getString("name")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">电路成绩：</td>
            <td><input type="text" name="circuit_score" value=<%=rs.getString("circuit_score")%> class="form-control">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">英语读写成绩：</td>
            <td><input type="text" name="en_RW_score" value=<%=rs.getString("en_RW_score")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right">大物成绩：</td>
            <td><input type="text" name="physics_score" value=<%=rs.getString("physics_score")%> class="form-control">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">历史成绩：</td>
            <td><input type="text" name="history_score" value=<%=rs.getString("history_score")%> class="form-control">
            </td>
        </tr>
        <tr>
            <td width="140" align="right">总分：</td>
            <td><input type="text" name="total_score" value=<%=rs.getString("total_score")%> class="form-control"></td>
        </tr>

        <tr>
            <td width="140" align="right">GPA：</td>
            <td><input type="text" name="gpa" value=<%=rs.getString("gpa")%> class="form-control" disabled="disabled">
            </td>
        </tr>

        <tr>
            <td width="140" align="right">密码：</td>
            <td><input type="text" name="rank" value=<%=rs.getString("rank")%> class="form-control"></td>
        </tr>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <button type="submit" class="btn btn-primary block full-width m-b"
                        onclick="javascript:return(checkform());">提交
                </button>

        </tr>
        <br>
        <tr>
            <td width="140" align="right"></td>
            <td width="250" valign="top">
                <a href="teacher_menu.jsp" class="btn btn-info" role="button">返回</a></td>
        </tr>
    </table>
</form>
<%
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>

<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="bootstrap.min.js"></script>
</body>
</html>