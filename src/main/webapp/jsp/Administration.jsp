<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.Patient"%>

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
			<h1>System Administration</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">System Administration</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">

						<!-- Modal Button Card-->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">
										<span></span>
									</h5>

									<button type="button" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#myModal">ADD
										ACCOUNT</button>

									<div class="modal" id="myModal">
										<div class="modal-dialog modal-dialog-centered modal-lg">
											<div class="modal-content">
												<!-- Modal header -->
												<div class="modal-header">
													<h5 class="modal-title">Add Account Form</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>

												<!-- Modal body -->
												<div class="modal-body">
													<form method="post" action="/hms/AddAccount">
														<div class="form-group row">
															<label for="inputName3" class="col-sm-2 col-form-label">Name</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="inputName3"
																	name="name" placeholder="Name">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
															<div class="col-sm-10">
																<input type="email" class="form-control"
																	id="inputEmail3" name="email" placeholder="Email">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputPassword3"
																class="col-sm-2 col-form-label">Password</label>
															<div class="col-sm-10">
																<input type="password" class="form-control"
																	id="inputPassword3" name="password">
																<!-- An element to toggle between password visibility -->
																<input type="checkbox" onclick="myFunction()">Show
																Password
															</div>

														</div>



														<div class="form-group row">
															<label for="inputIC3" class="col-sm-2 col-form-label">Identification
																Card Number</label>
															<div class="col-sm-10">
																<input type="text" class="form-control" id="inputIC3"
																	name="ic" placeholder="IC Number">
															</div>
														</div>
														<fieldset class="form-group">
															<div class="row">
																<legend class="col-form-label col-sm-2 pt-0">Gender</legend>
																<div class="col-sm-10">
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			id="gender1" name="gender" value="Male" checked>
																		<label class="form-check-label" for="gridRadios1">
																			Male </label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			id="gender2" name="gender" value="Female"> <label
																			class="form-check-label" for="gridRadios2">
																			Female </label>
																	</div>

																</div>
															</div>
														</fieldset>

														<div class="form-group row">
															<label for="inputdob3" class="col-sm-2 col-form-label">Date
																of Birth</label>
															<div class="col-sm-10">
																<input type="date" class="form-control" id="date"
																	name="dateofbirth">
															</div>
														</div>


														<div class="form-group row">
															<label for="inputphonenum"
																class="col-sm-2 col-form-label">Phone Number</label>
															<div class="col-sm-10">
																<input type="text" class="form-control"
																	id="inputphonenum" name="phonenumber"
																	placeholder="Phone Number">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputnationality"
																class="col-sm-2 col-form-label">Nationality</label>
															<div class="col-sm-10">
																<input type="text" class="form-control"
																	id="inputnationality" name="nationality"
																	placeholder="Nationality">
															</div>
														</div>
														<div class="form-group row">
															<label for="inputAddress3"
																class="col-sm-2 col-form-label">Address</label>
															<div class="col-sm-10">
																<input type="text" class="form-control"
																	id="streetAddress" name="streetAddress"
																	placeholder="Street Address" required> <input
																	type="text" class="form-control" id="city" name="city"
																	placeholder="City" required> <input type="text"
																	class="form-control" id="state" name="state"
																	placeholder="State" required> <input
																	type="text" class="form-control" id="postcode"
																	name="postcode" placeholder="Postcode" required>
															</div>
														</div>

														<fieldset class="form-group">
															<div class="row">
																<legend class="col-form-label col-sm-2 pt-0">Access
																	Level</legend>
																<div class="col-sm-10">
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="accesslevel" id="gridRadios1" value="0" checked>
																		<label class="form-check-label" for="gridRadios1">
																			0 </label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="accesslevel" id="gridRadios2" value="1">
																		<label class="form-check-label" for="gridRadios2">
																			1 </label>
																	</div>
																	<div class="form-check disabled">
																		<input class="form-check-input" type="radio"
																			name="accesslevel" id="gridRadios3" value="2">
																		<label class="form-check-label" for="gridRadios3">
																			2 </label>
																	</div>
																</div>
															</div>
														</fieldset>

														<div class="form-group row">
															<div class="col-sm-10">
																<button type="button" class="btn btn-secondary"
																	data-bs-dismiss="modal">Close</button>
																<button type="submit" class="btn btn-primary">Save
																	changes</button>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Modal Button Card -->


						<!-- Recent Sales -->
						<div class="col-12">
							<div class="card recent-sales overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Sort</h6>
										</li>

										<li><a class="dropdown-item" href="#">Ascending</a></li>
										<li><a class="dropdown-item" href="#">Descending</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Patient <span>| Masterdata</span>
									</h5>

									<table class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">Identification No.</th>
												<th scope="col">Name</th>
												<th scope="col">Gender</th>
												<th scope="col"></th>
												<th scope="col">Health Status</th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<Patient> ul = (ArrayList<Patient>) session.getAttribute("PatientData");
											for (Patient u : ul) {
											%>
											<tr>
												<td><%=u.getIc()%></td>
												<td><%=u.getName()%></td>
												<td><%=u.getGender()%></td>
												<th scope="row"><a href="#">More Detail</a></th>
												<%
												if (u.getStatus() == 1) {
												%>
												<td><span class="badge bg-danger">Red Zone</span></td>
												<%
												} else if (u.getStatus() == 2) {
												%>
												<td><span class="badge bg-success">Green Zone</span></td>
												<%
												}
												%>
											</tr>
											<%
											}
											%>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Recent Sales -->

						<!-- Top Selling -->
						<div class="col-12">
							<div class="card top-selling overflow-auto">

								<div class="filter">
									<a class="icon" href="#" data-bs-toggle="dropdown"><i
										class="bi bi-three-dots"></i></a>
									<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
										<li class="dropdown-header text-start">
											<h6>Filter</h6>
										</li>

										<li><a class="dropdown-item" href="#">Today</a></li>
										<li><a class="dropdown-item" href="#">This Month</a></li>
										<li><a class="dropdown-item" href="#">This Year</a></li>
									</ul>
								</div>

								<div class="card-body pb-0">
									<h5 class="card-title">
										Top Selling <span>| Today</span>
									</h5>

									<table class="table table-borderless">
										<thead>
											<tr>
												<th scope="col">Preview</th>
												<th scope="col">Product</th>
												<th scope="col">Price</th>
												<th scope="col">Sold</th>
												<th scope="col">Revenue</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-1.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Ut
														inventore ipsa voluptas nulla</a></td>
												<td>$64</td>
												<td class="fw-bold">124</td>
												<td>$5,828</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-2.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Exercitationem
														similique doloremque</a></td>
												<td>$46</td>
												<td class="fw-bold">98</td>
												<td>$4,508</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-3.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Doloribus
														nisi exercitationem</a></td>
												<td>$59</td>
												<td class="fw-bold">74</td>
												<td>$4,366</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-4.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Officiis
														quaerat sint rerum error</a></td>
												<td>$32</td>
												<td class="fw-bold">63</td>
												<td>$2,016</td>
											</tr>
											<tr>
												<th scope="row"><a href="#"><img
														src="assets/img/product-5.jpg" alt=""></a></th>
												<td><a href="#" class="text-primary fw-bold">Sit
														unde debitis delectus repellendus</a></td>
												<td>$79</td>
												<td class="fw-bold">41</td>
												<td>$3,239</td>
											</tr>
										</tbody>
									</table>

								</div>

							</div>
						</div>
						<!-- End Top Selling -->

					</div>
				</div>
				<!-- End Left side columns -->
			</div>
		</section>

	</main>
	<!-- End #main -->

	<%@ include file="Footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<%@ include file="ScriptResources.jsp"%>
	<script>
		// Get the input element
		var datetimeLocal = document.getElementById('datetime-local');

		// Set the value of the input element to the current date and time
		datetimeLocal.value = new Date().toISOString().substring(0, 16);

		function myFunction() {
			var x = document.getElementById("inputPassword3");
			if (x.type === "password") {
				x.type = "text";
			} else {
				x.type = "password";
			}
		}
	</script>

</body>

</html>