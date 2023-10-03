<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Hospital Management System</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../img/favicon.png" rel="icon">
<link href="../img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../vendor/aos/aos.css" rel="stylesheet">
<link href="../vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="../vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="../vendor/remixicon/remixicon.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../css/main.css" rel="stylesheet">
</head>

<body class="page-index">

	<%
	session.invalidate();
	%>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">

			<a href="../index.jsp" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<img src="../img/logo.png" alt="">
				<h1 class="d-flex align-items-center">HMS</h1>
			</a> <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i> <i
				class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>

		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero" class="hero d-flex align-items-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-4">
					<h2 data-aos="fade-up">Hospital Management System</h2>
					<form action="/hms/Login" method="post">
						<div class="form-group mt-3">
							<h2 style="font-size: 14px;" for="email">
								<span style="color: white;">Email</span>
							</h2>
							<input type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp" placeholder="Enter email" required>
						</div>
						<div class="form-group mt-3">
							<h2 style="font-size: 14px;" for="password"><span style="color: white;">Password</span></h2>
							<input type="password" class="form-control" id="password"
								name="password" placeholder="Password" required>
						</div>
						<br>
						<div style="display: flex; justify-content: flex-end">
							<button type="submit" class="btn-get-started float-right">Login</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</section>
	<!-- End Hero Section -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="footer-legal">
			<div class="container">
				<div class="copyright">
					&copy; Copyright <strong><span>Team 4</span></strong>. All Rights
					Reserved
				</div>
				<div class="credits">
					<!-- All the links in the footer should remain intact. -->
					<!-- You can delete the links only if you purchased the pro version. -->
					<!-- Licensing information: https://bootstrapmade.com/license/ -->
					<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nova-bootstrap-business-template/ -->
					Designed by Team 4</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../vendor/aos/aos.js"></script>
	<script src="../vendor/glightbox/js/glightbox.min.js"></script>
	<script src="../vendor/swiper/swiper-bundle.min.js"></script>
	<script src="../vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="../vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="../js/main.js"></script>
</body>

</html>