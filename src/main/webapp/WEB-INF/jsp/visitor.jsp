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
  <title>Ekholabs | Visitor </title>
    
  <link href="/static/css/bootstrap.min.css" rel="stylesheet">    
  <link href="/static/css/bootstrap_flatly.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
  <link rel="stylesheet" type="text/css" href="/static/css/bootstrap-clockpicker.min.css">
  <link href="/static/css/site.css" rel="stylesheet">    
</head>

<body id="visitor">

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
						<li class="nav active"><a href="/visit/new-visitor">Register</a></li>
						<li class="nav"><a href="/visit/all-visitors">List</a></li>
					</ul>
					<a class="navbar-brand navbar-right" href="/visit/settings"><i class="fa fa-cog"></i> Settings</a>
				</div>
			</div>
		</header>
		<section id="body" class="container">
		
		<div class="well tab-pane active">
		  <div class="row">
		    <form action="/visit/add" class="form-horizontal" id="visitorForm" method="POST">		      
						<div class="form-group">
							<label for="visitorName" class="control-label col-md-2">Visitor Name</label>
							<div class="col-md-10">
								<div class="input-group">
									<input type="text" name="visitorName" class="form-control"	placeholder="e.g. Visitor Name" />
								</div>
							</div>
						</div>
						<div class="form-group">
              <label for="companyName" class="control-label col-md-2">Company</label>
              <div class="col-md-10">
                <div class="input-group">
                  <input type="text" name="companyName" class="form-control"  placeholder="e.g. Company Name" />
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="mobile" class="control-label col-md-2">Mobile</label>
              <div class="col-md-10">
                <div class="input-group">
                  <input type="tel" name="mobile" class="form-control"  pattern="\d{6}[\-]\d{4}"  placeholder="061122-3344" />
                </div>
              </div>
            </div>
            <!--
            <div class="form-group">
              <label for="hostName" class="control-label col-md-2">Whom to Visit</label>
              <div class="col-md-10">
                <div class="input-group">
                  <input type="text" name="hostName" class="form-control" placeholder="e.g. Host Name" />
                </div>
              </div>
            </div>
              -->
						<div class="form-group">
              <label for="hostName" class="control-label col-md-2">Whom to Visit</label>
              <div class="col-md-10">
                <div class="input-group dropdown">
								<!-- 	<div class="dropdown"> -->
										 <select class="form-control" name="user" path="user.id">
											<c:forEach var="u" items="${users}">
												<option value="${u.id}"
													${user == u ? 'selected="selected"' : ''}>${u.fullName}</option>
											</c:forEach>
										</select>
								<!-- 	</div> -->
								</div>
              </div>
            </div>            
            <div class="form-group">
              <label for="dateVisit" class="control-label col-md-2">Date</label>
              <div class="col-md-10">
                <div class="input-group">
                  <input type="text" name="dateVisit" class="form-control" placeholder="dd/mm/yyyy" />
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="timeVisit" class="control-label col-md-2">Time</label>
              <div class="col-md-10">
                <div class="input-group">                  
                  <div class="input-group clockpicker">
                    <input type="text" name="timeVisit" class="form-control" value="09:30">
                    <span class="input-group-addon"> 
                      <span class="glyphicon glyphicon-time"></span>
                    </span>
                 </div>
               </div>
              </div>
            </div>
						<div class="form-group">
							<label class="control-label col-md-2">Purpose</label>
							<div class="col-md-10">
							  <div class="input-group">
								  <textarea cols="40" rows="4" class="form-control" name="purpose" placeholder="e.g. The purpose of the visit"></textarea>
								</div>
							</div>
						</div>
						
						
						<div class="form-group">
              <div class="col-md-10 col-md-offset-2">
                <input type="submit" value="Submit" class="btn btn-success" />
              </div>
            </div>
					</form>
		  </div>
		</div>		
	</div>
	
	<div class="modal" id="sentDialog" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <a href="#" class="close" data-dismiss="modal">&times;</a>
          <h4>Success</h4>
        </div>
        <div class="modal-body">
          <p>Visitor included</p>
        </div>
        <div class="modal-footer">
          <button class="btn btn-success" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


	<script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/bootstrap.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="/static/js/bootstrap-clockpicker.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
  <script src="/static/js/myFunctions.js"></script>
  <!--  <script src="/static/js/site.js"></script>-->
</body>

</html>