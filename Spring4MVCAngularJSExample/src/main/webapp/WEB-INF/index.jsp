<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Rabo Bank</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
<script data-require="jquery@3.1.1" data-server="3.1.1" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script data-require="angular.js@1.5.8" data-semver="1.5.8" src="https://code.angularjs.org/1.5.8/angular.js"></script>
<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/service/reportservice.js' />"></script>
<script src="<c:url value='/static/js/controller/display.js' />"></script>
<script src="<c:url value='/static/js/controller/main.js' />"></script>
<script src="<c:url value='/static/js/controller/report.js' />"></script>
<script src="<c:url value='/static/lib/xml2json.js' />"></script>
</head>
<body ng-app="myApp" class="ng-cloak">
	<div ng-controller="MainController as ctrl">
		<div class="generic-container">
			<div class="logo"></div>
			<div class="companyName">Rabobank</div>
		</div>
		<nav class="navbar navbar-default">
			<div class="container-fluid nav-container ">
				<ul class="nav navbar-nav pointer">
					<li><a ng-click="ctrl.navigate('display')">Display</a></li>
					<li><a ng-click="ctrl.navigate('report')">Report</a></li>
				</ul>
			</div>
		</nav>

		<div ng-view></div>
	</div>
</body>
</html>