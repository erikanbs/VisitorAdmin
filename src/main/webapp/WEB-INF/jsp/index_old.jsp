<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head> 
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE-edge">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="no-cache">
	<meta http-equiv="Expires" content="Wed, 01 Feb 2017 00:00:00GMT">
    
    <title>ReMark | Home </title>
    
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">    
    <link href="/static/css/style.css" rel="stylesheet">
     <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css" />
    
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.js"></script>  
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>  
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.js"></script>
    
    
</head>
<body>

	<script>
              $(document).ready(
                      function() {
                        $('#datePicker').datepicker({
                                  format : 'mm/dd/yyyy'
                                })
                            .on('changeDate',
                                function(e) {
                                  // Revalidate the date field
                                  $('#visitorForm').formValidation(
                                          'revalidateField',
                                          'date');
                                });                        

                     //   $('#timePicker').datepicker({
                      //      format: 'HH:mm:ss'
                      //  });
                        
                        $('#timePicker').datetimepicker({
                            format: 'LT'
                        });
                        
                        $('#visitorForm').formValidation({
                            framework : 'bootstrap',
                            icon : {
                              valid : 'glyphicon glyphicon-ok',
                              invalid : 'glyphicon glyphicon-remove',
                              validating : 'glyphicon glyphicon-refresh'
                            },
                            fields : {
                              date : {
                                validators : {
                                  notEmpty : {
                                    message : 'The date is required'
                                  },
                                  date : {
                                    format : 'MM/DD/YYYY',
                                    message : 'The date is not a valid'
                                  }
                                }
                              }
                            }
                          });
                        
                       
                      });
            </script>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href='/poc' class="navbar-brand">ReMark</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="/poc/new-visitor">New Visitor</a></li>
					<li><a href="/poc/all-visitors">All Visitors</a></li>
					<li><a href="/poc/search-visitor">Search Visitor</a></li>
				</ul>		
				<ul class="nav navbar-nav navbar-right">
          <li><p class="navbar-text">${user}</p></li>
        </ul>		
			</div>		
		</div>
	<!-- 	<form:form method="post" action="/poc" class="form-horizontal" modelAttribute="visitorForm">  -->
		<c:choose>
			<c:when test="${mode == 'MODE_HOME'}">
				<div class="container" id="homeDiv">
					<div class="jumbotron text-center">
						<h1>Welcome to Visitors Manager</h1>
					</div>		
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_ALL'}">
			<form:form class="form-horizontal" method="POST" action="/poc/add" modelAttribute="visitorForm">
				<div class="container text-center" id="visitorDiv">
					<h3>Visitors</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>Id</th>
									<th>Visitor</th>
									<th>Host</th>
									<th>Company</th>
									<th>Visit Date</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="visit" items="${visitors}">
									<tr>
										<td>${visit.id}</td>
										<td>${visit.visitorName}</td>
										<td>${visit.hostName}</td>
										<td>${visit.companyName}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${visit.dateVisit}"/></td>
										<td><a href="update-visit?id=${visit.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="delete-visit?id=${visit.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
									</tr>							
								</c:forEach>
							</tbody>
						</table>
					</div>					
				</div>
				</form:form>
			</c:when>
			<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
				<div class="container text-left">
					<h3>Manage Visitor</h3>
					<hr>
					<form:form class="form-horizontal" method="POST" action="/poc/add" modelAttribute="visitorForm">
						<input type="hidden" name="id" value="${visitorForm.id}"/>
						<div class="form-group">
							<label class="control-label col-md-3">Name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="visitorName" value="${visitorForm.visitorName}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Host</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="hostName" value="${visitorForm.hostName}"/>
							</div>
						</div>

						<div class="form-group">
							<label class="col-xs-3 control-label">Date</label>
							<div class="col-xs-5 date">
								<div class="input-group input-append date" id="datePicker">
									<input type="text" class="form-control" name="date" /> <span
										class="input-group-addon add-on"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</div>
						</div>
						
						<div class="form-group">
              <label class="col-xs-3 control-label">Time</label>
              <div class="col-xs-5 date">
                <div class="input-group input-append date" id="timePicker">
                  <input type="text" class="form-control" name="time" /> <span
                    class="input-group-addon add-on"><span
                    class="glyphicon glyphicon-time"></span></span>
                </div>
              </div>
            </div>
						
						<div class="pull-right">
							<input type="submit" class="btn btn-primary" value="Save"/>
						</div>
					</form:form>
				</div>
			</c:when>
			<c:when test="${mode == 'MODE_SEARCH'}">
				<div class="container text-center">
					<h3>Search Employee</h3>
					<hr>
					<form:form class="form-horizontal" method="GET" action="result-search-employee" modelAttribute="employee">
						<div class="form-group">
							<label class="control-label col-md-3">Name</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="fullName" value="${employee.fullName}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Email</label>
							<div class="col-md-7">
								<input type="text" class="form-control" name="email" value="${employee.email}"/>
							</div>
						</div>
						<div class="pull-right">
							<input type="submit" class="btn btn-primary" value="Search"/>
						</div>
					</form:form>
				</div>
				<div class="container text-center" id="employeeDiv">
					<h3>Results</h3>
					<hr>
					<div class="table-responsive">
						<table class="table table-striped table-bordered text-left">
							<thead>
								<tr>
									<th>Id</th>
									<th>Name</th>
									<th>Email</th>
                  <th>Entered Date</th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="employee" items="${employees}">
									<tr>
										<td>${employee.id}</td>
										<td>${employee.fullName}</td>
										<td>${employee.email}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${employee.enteredDate}"/></td>
										<td><a href="update-employee?id=${employee.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
										<td><a href="delete-employee?id=${employee.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
									</tr>							
								</c:forEach>
							</tbody>
						</table>
					</div>					
				</div>
			</c:when>
		</c:choose>	
	 <!--  </form:form> -->
	
</body>
</html>