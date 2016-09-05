<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/templates/layout/tags.jsp"%>
<html lang="es">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="<tiles:insertAttribute name="description" ignore="true"></tiles:insertAttribute>" />
<title><tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute></title>
<tiles:insertAttribute name="stylesheets" />
	<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- Layout -->
	<tiles:insertAttribute name="menu" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<tiles:insertAttribute name="js_footer" />
<!-- Layout -->
</body>
</html>