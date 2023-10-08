<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.Patient"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="HeadResources.jsp"%>
<%@ include file="validationDoctor.jsp"%>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<%@ include file="SideNav.jsp"%>

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>Patient Registration</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">Patient Registration</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">
						<%
							int r = Integer.parseInt(session.getAttribute("red").toString());
							int g = Integer.parseInt(session.getAttribute("green").toString());
							int b = Integer.parseInt(session.getAttribute("blue").toString());

							double pr = (r * 100) / (r + g + b);
							double pg = (g * 100) / (r + g + b);
							double pb = (b * 100) / (r + g + b);
						%>
						<!-- Red Zone Card-->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card customers-card">

								<div class="card-body">
									<h5 class="card-title">
										Red Zone <span>| Total</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-activity"></i>
										</div>
										<div class="ps-3">
											<h6><%=r%></h6>
											<span class="text-danger small pt-1 fw-bold"> <%=pr%>%
											</span> <span class="text-muted small pt-2 ps-1">out of <%=r + g + b%>
												patient(s).
											</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Red Zone Card -->

						<!-- Green Zone Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="card-body">
									<h5 class="card-title">
										Green Zone <span>| Total</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-bag-heart-fill"></i>
										</div>
										<div class="ps-3">
											<h6><%=session.getAttribute("green")%></h6>
											<span class="text-danger small pt-1 fw-bold"><%=pg%>%</span>
											<span class="text-muted small pt-2 ps-1">out of <%=r + g + b%>
												patient(s).
											</span>

										</div>
									</div>
								</div>

							</div>
						</div>
						<!-- End Green Zone Card -->

						<!-- Discharged Card -->
						<div class="col-xxl-4 col-xl-12">

							<div class="card info-card sales-card">

								<div class="card-body">
									<h5 class="card-title">
										Discharged <span>| Total</span>
									</h5>

									<div class="d-flex align-items-center">
										<div
											class="card-icon rounded-circle d-flex align-items-center justify-content-center">
											<i class="bi bi-calendar2-x-fill"></i>
										</div>
										<div class="ps-3">
											<h6><%=session.getAttribute("blue")%></h6>
											<span class="text-danger small pt-1 fw-bold"><%=pb%>%</span>
											<span class="text-muted small pt-2 ps-1">out of <%=r + g + b%>
												patient(s).
											</span>

										</div>
									</div>

								</div>
							</div>

						</div>
						<!-- End Discharged Card -->
					</div>
					<div class="row">
						<!-- Add Patient Card -->
						<div class="col-xxl-4 col-md-6">
							<div class="card info-card revenue-card">

								<div class="card-body">
									<h5 class="card-title">
										Patient <span>| Functionality</span>
									</h5>

									<div class="d-flex align-items-center">
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#addPatientModal">
											<i class="bi bi-collection"> Add Patient</i>
										</button>
										<div class="modal" id="addPatientModal">
											<div class="modal-dialog modal-dialog-centered modal-lg">
												<div class="modal-content">
													<!-- Modal header -->
													<div class="modal-header">
														<h5 class="modal-title">Add Patient</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>

													<!-- Modal body -->
													<form action="/hms/AddPatient" method="post">
														<div class="modal-body">
															<div class="form-group row">
																<label for="email" class="col-sm-3 col-form-label">Name</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="name"
																		name="name" placeholder="Name" required>
																</div>
															</div>
															<div class="form-group row">
																<label for="identificationcard"
																	class="col-sm-3 col-form-label">Identification
																	Card No.</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		id="identificationcard" name="identificationcard"
																		placeholder="Identification Card" required>
																</div>
															</div>
															<div class="form-group row">
																<label for="gender" class="col-sm-3 col-form-label">Gender</label>
																<div class="col-sm-9">
																	<select class="form-select" id="gender" name="gender"
																		aria-label="Gender">
																		<option value="Male">Male</option>
																		<option value="Female">Female</option>
																	</select>
																</div>
															</div>
															<div class="form-group row">
																<label for="phoneNum" class="col-sm-3 col-form-label">Phone
																	No.</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control" id="phoneNum"
																		name="phoneNum" placeholder="Phone No." required>
																</div>
															</div>
															<div class="form-group row">
																<label for="nationality" class="col-sm-3 col-form-label">Nationality</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		id="nationality" name="nationality"
																		placeholder="Nationality" required>
																</div>

															</div>
															<div class="form-group row">
																<label for="dateOfBirth" class="col-sm-3 col-form-label">Date
																	of Birth</label>
																<div class="col-sm-9">
																	<input type="date" class="form-control" id="date"
																		name="date" required>
																</div>
															</div>

															<div class="form-group row">
																<label for="inputAddress3"
																	class="col-sm-3 col-form-label">Address</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		id="streetAddress" name="streetAddress"
																		placeholder="Street Address" required> <input
																		type="text" class="form-control" id="city" name="city"
																		placeholder="City" required> <input
																		type="text" class="form-control" id="state"
																		name="state" placeholder="State" required> <input
																		type="text" class="form-control" id="postcode"
																		name="postcode" placeholder="Postcode" required>
																</div>

															</div>
															<div class="form-group row">
																<label for="appointmentDate"
																	class="col-sm-3 col-form-label">Appointment
																	Date</label>
																<div class="col-sm-9">
																	<input type="datetime-local" class="form-control"
																		id="datetime-local" name="appointmentDate" required>
																</div>
															</div>
															<div class="form-group row">
																<label for="status" class="col-sm-3 col-form-label">Health
																	Status</label>
																<div class="col-sm-9">
																	<select class="form-select" id="status" name="status"
																		aria-label="status">
																		<option value="1">Red Zone</option>
																		<option value="2">Green Zone</option>
																	</select>
																</div>
															</div>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary"
																data-bs-dismiss="modal">Close</button>
															<button type="submit" class="btn btn-primary">Save
																changes</button>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!-- End Add Patient Card -->
				</div>
				<!-- End Left side columns -->



				<!-- Patient Masterdata -->
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
							<table id="patientListTable"
								class="table table-borderless datatable">
								<thead>
									<tr>
										<th scope="col">Identification No.</th>
										<th scope="col">Name</th>
										<th scope="col">Gender</th>
										<th scope="col">Health Status</th>
										<th scope="col">Status Progress</th>
										<th scope="col"></th>
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
										<%
										if (u.getStatus() == 1) {
										%>
										<td><span class="badge bg-danger">Red Zone</span></td>
										<%
										} else if (u.getStatus() == 2) {
										%>
										<td><span class="badge bg-success">Green Zone</span></td>
										<%
										} else {
										%>
										<td><span class="badge bg-secondary">Discharged</span></td>
										<%
										}
										%>
										<td><%=u.getStatusprogress()%></td>
											<td scope="row"><a href="" data-bs-toggle="modal"
												data-bs-target="#viewPatientModal<%=u.getIdpatient()%>">More
													Detail</a>
												<div class="modal"
													id="viewPatientModal<%=u.getIdpatient()%>">
													<div class="modal-dialog modal-dialog-centered modal-lg">
														<div class="modal-content">
															<!-- Modal header -->
															<div class="modal-header">
																<h5 class="modal-title">View Patient</h5>
																<button type="button" class="btn-close"
																	data-bs-dismiss="modal" aria-label="Close"></button>
															</div>

															<!-- Modal body -->
															<form action="/hms/AddPatient" method="post">
																<div class="modal-body">
																	<div class="form-group row">
																		<label for="email" class="col-sm-3 col-form-label">Name</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="name"
																				name="name" placeholder="Name"
																				value="<%=u.getName()%>" required disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="identificationcard"
																			class="col-sm-3 col-form-label">Identification
																			Card No.</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="identificationcard" name="identificationcard"
																				placeholder="Identification Card"
																				value="<%=u.getIc()%>" required disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="gender" class="col-sm-3 col-form-label">Gender</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="gender"
																				name="gender" placeholder="Gender"
																				value="<%=u.getGender()%>" required disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="phoneNum" class="col-sm-3 col-form-label">Phone
																			No.</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="phoneNum"
																				name="phoneNum" placeholder="Phone No."
																				value="<%=u.getPhonenumber()%>" required disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="nationality"
																			class="col-sm-3 col-form-label">Nationality</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control"
																				id="nationality" name="nationality"
																				placeholder="Nationality"
																				value="<%=u.getNationality()%>" required disabled>
																		</div>

																	</div>
																	<div class="form-group row">
																		<label for="dateOfBirth"
																			class="col-sm-3 col-form-label">Date of Birth</label>
																		<div class="col-sm-9">
																			<input type="date" class="form-control" id="date"
																				name="date" value="<%=u.getDateofbirth()%>" required
																				disabled>
																		</div>
																	</div>

																	<div class="form-group row">
																		<label for="inputAddress3"
																			class="col-sm-3 col-form-label">Address</label>
																		<div class="col-sm-9">
																			<input type="text" class="form-control" id="address"
																				name="address" placeholder="address"
																				value="<%=u.getAddress()%>" required disabled>
																		</div>

																	</div>
																	<div class="form-group row">
																		<label for="appointmentDate"
																			class="col-sm-3 col-form-label">Appointment
																			Date</label>
																		<div class="col-sm-9">
																			<input type="datetime-local" class="form-control"
																				id="datetime-local" name="appointmentDate"
																				value="<%=u.getAppointmentDate()%>" required
																				disabled>
																		</div>
																	</div>
																	<div class="form-group row">
																		<label for="status" class="col-sm-3 col-form-label">Health
																			Status</label>
																		<div class="col-sm-9">
																			<%
																			if (u.getStatus() == 1) {
																			%>
																			<input type="text" class="form-control" id="status"
																				name="status" value="Red Zone" required disabled>
																			<%
																			} else {
																			%>
																			<input type="text" class="form-control" id="status"
																				name="status" value="Green Zone" required disabled>
																			<%
																			}
																			%>
																		</div>
																	</div>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-bs-dismiss="modal">Close</button>
																</div>
															</form>
														</div>
													</div>
												</div></td>
										
										<%
										}
										%>
										
										
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
				<!-- End Recent Sales -->
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
		$('table').DataTable();
		// Get the modal element
		const modal = document.getElementById('addPatientModal');

		// Add an event listener to the modal to clear the fields when it is shown
		modal.addEventListener('shown.bs.modal', function() {
			// Clear the fields in the modal
			document.querySelectorAll('#addPatientModal input').forEach(
					function(input) {
						input.value = '';
					});
		});
		function search() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("search-input");
			filter = input.value.toUpperCase();
			table = document.getElementById("patientListTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
</body>

</html>