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
  <title>Ekholabs | Visitor </title>
    
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">    
  <link href="/static/css/bootstrap_flatly.min.css" rel="stylesheet">
  <link href="/static/css/site.css" rel="stylesheet">    
</head>

<body>
  <div id="page">
  <header class="container">
      <div id="menu" class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
          <button class="btn btn-success navbar-toggle"
            data-toggle="collapse" data-target=".navbar-collapse">
            <span class="glyphicon glyphicon-chevron-down"></span>
          </button>
          <div id="logo">
            <a href='.' class="navbar-brand">Visitors Management</a>
          </div>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-left">
            <li class="nav"><a href=".">Home</a></li>           
            <li class="nav"><a href="/visit/new-visitor">Register</a></li>
            <li class="nav active"><a href="/visit/all-visitors">List</a></li>
          </ul>
          <a class="navbar-brand navbar-right" href="/visit/settings"><i class="fa fa-cog"></i> Settings</a>
        </div>
      </div>
    </header>
    <section id="body" class="container">
    
    <h3>Visitors</h3>
    <ul class="pagination pagination-sm">
      <li><a href="/visit/all-visitors?page=0">&laquo;</a></li>
      <c:forEach begin="${startpage}" end="${endpage - 1}" var="p">
         <li class="${p == page.getNumber() ? 'active' : ''}">
           <a href="/visit/all-visitors?page=${p}">${p+1}</a>
         </li>
      </c:forEach>
      <li><a href="/visit/all-visitors?page=${page.getTotalPages()-1}">&raquo;</a></li>
    </ul>  
    <div class="row">
      <div class="col-md-12">
        <div class="table-responsive">
          <table class="table table-striped table-hover table-condensed">
            <thead>
              <tr>
                <th>Visitor</th>
                <th>Company</th>
                <th>Host</th>
                <th>Date</th>
                <th>Time</th>
                <th>Purpose</th>                
                <th></th>
                <th></th>
              </tr>
            </thead>
						<tbody>
						  <c:forEach var="visitor" items="${page.getContent()}">
						    <tr>
								  <td>${visitor.visitorName}</td>
								  <td>${visitor.companyName}</td>
									<td>${visitor.hostName}</td>
									<td><fmt:formatDate pattern="dd-MM-yyyy" value="${visitor.dateVisit}" /></td>
									<td><fmt:formatDate pattern="HH:mm" value="${visitor.timeVisit}" /></td>
									<td>${visitor.purpose}</td>									
									<td><a href="update-visitor?id=${visitor.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-visitor?id=${visitor.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
        </div>
      </div>
    </div>    
  </div>

  <script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/bootstrap.js"></script>
</body>
</html>