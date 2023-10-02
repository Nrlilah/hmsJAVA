<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Users / Profile - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="../vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="../vendor/quill/quill.snow.css" rel="stylesheet">
<link href="../vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="../vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../vendor/simple-datatables/style.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">NiceAdmin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
				</a> <!-- End Profile Image Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>Kevin Anderson</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="logout.jsp"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link collapsed"
				href="index.html"> <i class="bi bi-grid"></i> <span>Dashboard</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-heading">Function</li>

			<li class="nav-item"><a class="nav-link "
				href="users-profile.html"> <i class="bi bi-person"></i> <span>Profile</span>
			</a></li>
			<!-- End Profile Page Nav -->
		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Home</a></li>
					<li class="breadcrumb-item">Users</li>
					<li class="breadcrumb-item active">Profile</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">
				<div class="col-xl-4">

					<div class="card">
						<div
							class="card-body profile-card pt-4 d-flex flex-column align-items-center">

							<img src="assets/img/profile-img.jpg" alt="Profile"
								class="rounded-circle">
							<h2>Nur Hafizatul Izzah</h2>
							<h3>Nurse</h3>
						</div>
					</div>

				</div>

				<div class="col-xl-8">

					<div class="card">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-overview">Overview</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-edit">Edit Profile</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-change-password">Change
										Password</button>
								</li>

							</ul>
							<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">

									<h5 class="card-title">Profile Details</h5>

									<div class="row">
										<div class="col-lg-3 col-md-4 label ">Name</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("name").toString() %></div>
										 
									</div>
									
									<div class="row">
										<div class="col-lg-3 col-md-4 label">Email</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("email").toString() %></div>
										
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Role</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("role").toString() %></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Identification Card No.</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("ic").toString() %></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Gender</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("gender").toString() %></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Phone</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("phoneNum").toString() %></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Nationality</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("nationality").toString() %></div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">Date of Birth</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("dateOfBirth").toString() %></div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">Address</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("address").toString() %></div>
									</div>

								</div>

								<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

									<!-- Profile Edit Form -->
									<form>
										<div class="row mb-3">
											<label for="profileImage"
												class="col-md-4 col-lg-3 col-form-label">Profile
												Image</label>
											<div class="col-md-8 col-lg-9">
												<img src="assets/img/profile-img.jpg" alt="Profile">
												<div class="pt-2">
													<a href="#" class="btn btn-primary btn-sm"
														title="Upload new profile image"><i
														class="bi bi-upload"></i></a> <a href="#"
														class="btn btn-danger btn-sm"
														title="Remove my profile image"><i class="bi bi-trash"></i></a>
												</div>
											</div>
										</div>

										<div class="row mb-3">
											<label for="fullName"
												class="col-md-4 col-lg-3 col-form-label">Full Name</label>
											<div class="col-md-8 col-lg-9">
												<input name="fullName" type="text" class="form-control"
													id="fullName" value="<%=session.getAttribute("name").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
											<div class="col-md-8 col-lg-9">
												<input name="email" type="email" class="form-control"
													id="Email" value="<%=session.getAttribute("email").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Role" class="col-md-4 col-lg-3 col-form-label">Role</label>
											<div class="col-md-8 col-lg-9">
												<input name="Role" type="text" class="form-control"
													id="Role" value="<%=session.getAttribute("role").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="ic" class="col-md-4 col-lg-3 col-form-label">Identification
												Card No.</label>
											<div class="col-md-8 col-lg-9">
												<input name="ic" type="text" class="form-control" id="ic"
													value="<%=session.getAttribute("ic").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="gender" class="col-md-4 col-lg-3 col-form-label">Gender</label>
											<div class="col-md-8 col-lg-9">
												<input name="gender" type="text" class="form-control"
													id="gender" value="<%=session.getAttribute("gender").toString() %>">
											</div>
										</div>

										<div class="row mb-3">
											<label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
											<div class="col-md-8 col-lg-9">
												<input name="phone" type="text" class="form-control"
													id="Phone" value="<%=session.getAttribute("phoneNum").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="nationality"
												class="col-md-4 col-lg-3 col-form-label">Nationality</label>
											<div class="col-md-8 col-lg-9">
												<input name="nationality" type="text" class="form-control"
													id="nationality" value="<%=session.getAttribute("nationality").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="dateOfBirth"
												class="col-md-4 col-lg-3 col-form-label">Date of
												Birth"</label>
											<div class="col-md-8 col-lg-9">
												<input name="dateOfBirth" type="text" class="form-control"
													id="dateOfBirth" value="<%=session.getAttribute("dateOfBirth").toString() %>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
											<div class="col-md-8 col-lg-9">
												<input name="address" type="text" class="form-control"
													id="Address"
													value="<%=session.getAttribute("address").toString() %>">
											</div>
										</div>


										<div class="text-center">
											<button type="submit" class="btn btn-primary">Save
												Changes</button>
										</div>
									</form>
									<!-- End Profile Edit Form -->

								</div>

								<div class="tab-pane fade pt-3" id="profile-change-password">
									<!-- Change Password Form -->
									<form>

										<div class="row mb-3">
											<label for="currentPassword"
												class="col-md-4 col-lg-3 col-form-label">Current
												Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="password" type="password" class="form-control"
													id="currentPassword">
											</div>
										</div>

										<div class="row mb-3">
											<label for="newPassword"
												class="col-md-4 col-lg-3 col-form-label">New
												Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="newpassword" type="password"
													class="form-control" id="newPassword">
											</div>
										</div>

										<div class="row mb-3">
											<label for="renewPassword"
												class="col-md-4 col-lg-3 col-form-label">Re-enter
												New Password</label>
											<div class="col-md-8 col-lg-9">
												<input name="renewpassword" type="password"
													class="form-control" id="renewPassword">
											</div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary">Change
												Password</button>
										</div>
									</form>
									<!-- End Change Password Form -->

								</div>

							</div>
							<!-- End Bordered Tabs -->

						</div>
					</div>

				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>Group 4</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			<!-- All the links in the footer should remain intact. -->
			<!-- You can delete the links only if you purchased the pro version. -->
			<!-- Licensing information: https://bootstrapmade.com/license/ -->
			<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="../vendor/apexcharts/apexcharts.min.js"></script>
	<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="../vendor/chart.js/chart.umd.js"></script>
	<script src="../vendor/echarts/echarts.min.js"></script>
	<script src="../vendor/quill/quill.min.js"></script>
	<script src="../vendor/simple-datatables/simple-datatables.js"></script>
	<script src="../vendor/tinymce/tinymce.min.js"></script>
	<script src="../vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>