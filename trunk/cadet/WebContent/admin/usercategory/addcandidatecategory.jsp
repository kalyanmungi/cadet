<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Create Test</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link rel="stylesheet" href="../../css/bootstrap.css">
<style>
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

#footer {
	background: none scroll repeat 0 0 #FFFFFF;
}
</style>
<link rel="stylesheet" href="../../css/bootstrap-responsive.css">
<link rel="stylesheet" href="../../css/main.css">


</head>
<body>
	<!--[if lt IE 7]>
            <p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p>
        <![endif]-->

	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="../index.jsp"><img
					src="../../img/cadet.gif" alt="CADET" width="66"></a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="../index.jsp">Home</a></li>
						<li><a href="#questionBank">Question Bank</a></li>
						<li class="active"><a href="testManagementHome.jsp">Test
								Management</a></li>
						<li><a href="#candidateCategory">Candidate Category</a></li>
					</ul>
					<button class="btn btn-danger pull-right">Logout</button>
				</div>
			</div>
			<!--/.container -->
		</div>
	</div>
	<!--/.navbar -->

	<div class="container-fluid">
		<div class="row">
			<div class="accordion span2" id="accordionMenu">

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-parent="#accordionMenu"
							href="../index.jsp">Home</a>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordionMenu" href="#collapse2">Question Bank</a>
					</div>
					<div id="collapse2" class="accordion-body collapse">
						<div class="accordion-inner">
							<ul class="nav">
								<li><a href="#">Add/View Questions</a></li>
								<li><a href="#">Upload Questions</a></li>
								<li><a href="#">Add/View Category</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordionMenu" href="#collapse3">Test
							Management</a>
					</div>
					<div id="collapse3" class="accordion-body collapse in">
						<div class="accordion-inner">
							<ul class="nav">
								<li><a href="testManagementHome.jsp">View Test</a></li>
								<li class="active"><a href="#createTest">Create Test</a></li>
								<li><a href="#result">Result</a></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="accordion-group">
					<div class="accordion-heading">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordionMenu" href="#collapse4">Candidate
							Category</a>
					</div>
					<div id="collapse4" class="accordion-body collapse">
						<div class="accordion-inner">
							<ul class="nav">
								<li><a href="viewallcategory.jsp">Add Category</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid span7">
				<div class="navbar">
					<div class="navbar-inner">
						<div class="container-fluid pull-left">
							<span class="brand">Candidate Category</span>
						</div>
					</div>
				</div>
				<table id="tblusercategories" class="table table-striped table-condensed table-hover">
					<thead>
						<th> Add Candidate Categories</th>
					</thead>
					<tbody>
					<form method="post" action="AddCandidateCategory">
					<tr><td><input type="text" name="txtcandidatecategory"/></td></tr>
					<tr><td><input type="Submit" class="btn" value="Save"/></td></tr>
					</form>
					</tbody>
				</table>
			</div>
		</div>
		<!--/#accordion -->


		<!--/.row div -->

	</div>
	<!--/main container -->

	<div id="footer" class="container-fluid navbar navbar-fixed-bottom">
		<hr>
		<div class="row" style="margin-bottom: 10px;">
			<a class="span pull-right" href="#">About</a> <a
				class="span pull-right" href="#">FAQ</a> <a class="span pull-right"
				href="#">Contact us</a> <a class="span pull-right" href="#">Help</a>
			<a class="span pull-right" href="#">Privacy &amp; Policy</a>
		</div>
	</div>

	
	<script src="../../js/jquery-1.8.2.js"></script>
        <script src="../../js/bootstrap.js"></script>
        <script src="../../js/handlebars.js"></script>
        <script src="../../js/bootbox.js"></script>
	
</body>
</html>