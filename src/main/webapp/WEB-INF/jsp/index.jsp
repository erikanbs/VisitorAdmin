<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE-edge">
  <meta http-equiv="Pragma" content="no-cache">
  <meta http-equiv="Cache-Control" content="no-cache">
  <meta http-equiv="Expires" content="Wed, 01 Feb 2017 00:00:00GMT">    
  <title>Ekholabs | Home </title>
    
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">    
  <link href="/static/css/bootstrap_flatly.min.css" rel="stylesheet">
  <link href="/static/css/site.css" rel="stylesheet">    
</head>

<body id="indexBody">
  <div id="page">
    <header class="container">
      <div id="menu" class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
          <button class="btn btn-success navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="glyphicon glyphicon-chevron-down"></span>
          </button>
          <div id="logo">
            <a href='.' class="navbar-brand">Visitors Management</a>
          </div>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-left">
            <li class="nav active"><a href=".">Home</a>
            </li>
            <li class="nav"><a href="/visit/new-visitor">Register</a>
            </li>
            <li class="nav"><a href="/visit/all-visitors">List</a>
            </li>
          </ul>
        </div>
      </div>
    </header>
    <section id="body" class="container">
    
    <div class="page-header">
      <h1>Visitors</h1>
      <jsp:useBean id="todayDate" class="java.util.Date"/>  
      <p class="text-info"><fmt:formatDate value="${todayDate}" dateStyle = "long" timeStyle = "long"/></p>
    </div>
      
    <div class="panel panel-default">
      <div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<div class="table-responsive" id="resultsTable">
								<table class="table table-striped table-hover table-condensed" >
									<thead>
										<tr>
											<td>Visitor</td>
											<td>Company</td>
											<td>Host</td>
											<td>Time</td>
											<td>Purpose</td>
										</tr>
									</thead>
									<tbody class="searchable">
										<tr class="no-data">
											<td colspan="6">No data</td>
										</tr>
										<c:forEach var="visitor" items="${visitors}">
											<tr>
												<td>${visitor.visitorName}</td>
												<td>${visitor.companyName}</td>
												<td>${visitor.hostName}</td>
												<td><fmt:formatDate pattern="HH:mm" value="${visitor.timeVisit}" /></td>
												<td>${visitor.purpose}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
    </div>  
  
    <footer class="container">
      <p>Footer</p>
    </footer>
  </div>

	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.js"></script>
	<script src="/static/js/site.js"></script>
	<script	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.js"></script>
</body>

</html>