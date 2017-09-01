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
  <link href="/static/css/site.css" rel="stylesheet">    
</head>

<body id="settings">
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
						<li class="nav"><a href="/visit/all-visitors">List</a></li>
					</ul>					
					<a class="navbar-brand navbar-right" href="/visit/settings"><i class="fa fa-cog"></i> Settings</a>
					</ul>
				</div>
			</div>
		</header>
		<section id="body" class="container">
			<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="/visit/upload">
				<div class="panel panel-info">
					<div class="panel-heading">
					  <h3 class="panel-title">Import</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="exampleInputFile">File input</label> <input
								type="file" class="form-control-file" name="file"
								aria-describedby="fileHelp"> <small id="fileHelp"
								class="form-text text-muted">Import users file</small>							
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</div>
	</div>
	</form>

	<script src="/static/js/jquery.min.js"></script>
  <script src="/static/js/bootstrap.js"></script>
</body>

</html>  