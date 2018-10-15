<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="introduction.aspx.cs" Inherits="TWweb.Web.introduction" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>

<body>
    <h1 style="text-align: center;font-size: 25px;"><%=t.Rows[0]["title"] %></h1>
    <%=t.Rows[0]["contents"] %>
</body>
</html>
