<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="HeadResources.jsp"%>
</head>

<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="SideNav.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Profile</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
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

							<img src="../img/profile-img.jpg" alt="Profile"
								class="rounded-circle">
							<h2><%=session.getAttribute("name")%></h2>
							<h3><%=session.getAttribute("role")%></h3>
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
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("name").toString()%></div>

									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Email</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("email").toString()%></div>

									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Role</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("role").toString()%></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Identification Card
											No.</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("ic").toString()%></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Gender</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("gender").toString()%></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Phone</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("phoneNum").toString()%></div>
									</div>

									<div class="row">
										<div class="col-lg-3 col-md-4 label">Nationality</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("nationality").toString()%></div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">Date of Birth</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("dateOfBirth").toString()%></div>
									</div>
									<div class="row">
										<div class="col-lg-3 col-md-4 label">Address</div>
										<div class="col-lg-9 col-md-8"><%=session.getAttribute("address").toString()%></div>
									</div>

								</div>

								<div class="tab-pane fade profile-edit pt-3" id="profile-edit">

									<!-- Profile Edit Form -->
									<form action="/hms/Profile" method="post">
										<div class="row mb-3">
											<label for="profileImage"
												class="col-md-4 col-lg-3 col-form-label">Profile
												Image</label>
											<div class="col-md-8 col-lg-9">
												<img src="../img/profile-img.jpg" alt="Profile">
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
													id="fullName"
													value="<%=session.getAttribute("name").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
											<div class="col-md-8 col-lg-9">
												<input name="email" type="email" class="form-control"
													id="Email"
													value="<%=session.getAttribute("email").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Role" class="col-md-4 col-lg-3 col-form-label">Role</label>
											<div class="col-md-8 col-lg-9">
												<input name="role" type="text" class="form-control"
													id="Role" disabled
													value="<%=session.getAttribute("role").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="ic" class="col-md-4 col-lg-3 col-form-label">Identification
												Card No.</label>
											<div class="col-md-8 col-lg-9">
												<input name="ic" type="text" class="form-control" id="ic"
													disabled value="<%=session.getAttribute("ic").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="gender" class="col-md-4 col-lg-3 col-form-label">Gender</label>
											<div class="col-md-8 col-lg-9">
												<input name="gender" type="text" class="form-control"
													id="gender"
													value="<%=session.getAttribute("gender").toString()%>">

											</div>
										</div>

										<div class="row mb-3">
											<label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
											<div class="col-md-8 col-lg-9">
												<input name="phone" type="text" class="form-control"
													id="Phone"
													value="<%=session.getAttribute("phoneNum").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="nationality"
												class="col-md-4 col-lg-3 col-form-label">Nationality</label>
											<div class="col-md-8 col-lg-9">
												<input name="nationality" type="text" class="form-control"
													id="nationality"
													value="<%=session.getAttribute("nationality").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="dateOfBirth"
												class="col-md-4 col-lg-3 col-form-label">Date of
												Birth</label>
											<div class="col-md-8 col-lg-9">
												<input name="dateOfBirth" type="text" class="form-control"
													id="dateOfBirth" disabled
													value="<%=session.getAttribute("dateOfBirth").toString()%>">
											</div>
										</div>
										<div class="row mb-3">
											<label for="Address" class="col-md-4 col-lg-3 col-form-label">Address</label>
											<div class="col-md-8 col-lg-9">
												<input name="address" type="text" class="form-control"
													id="Address"
													value="<%=session.getAttribute("address").toString()%>">
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
									<form action="/hms/ChangePassword" method="post">

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
	<%@ include file="Footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<%@ include file="ScriptResources.jsp"%>

</body>

</html>