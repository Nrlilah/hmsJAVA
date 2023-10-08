<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.Patient"%>
<%@ include file="validationNurse.jsp"%>
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
			<h1>Patient Medication</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">Patient Medication</li>
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


					</div>
					<div class="row"></div>
					<!-- End Left side columns -->



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

									<li><a class="dropdown-item zone" href="#">All</a></li>
									<li><a class="dropdown-item zone" href="#">Red Zone</a></li>
									<li><a class="dropdown-item zone" href="#">Green Zone</a></li>
									<li><a class="dropdown-item zone" href="#">Discharged</a></li>
								</ul>
							</div>

							<script>
								$(document)
										.ready(
												function() {
													// Function to handle filter select change
													$("#filterSelect")
															.change(
																	function() {
																		var filterOption = $(
																				this)
																				.val();// Get the selected filter option

																		// Loop through table rows and show/hide based on the selected option
																		$(
																				"#patientListTable tbody tr")
																				.each(
																						function() {
																							var status = $(
																									this)
																									.find(
																											"td:eq(3)")
																									.text()
																									.trim(); // Assuming the status is in the 4th column (index 3)

																							if (filterOption === "all"
																									|| filterOption === status
																											.toLowerCase()
																											.replace(
																													" ",
																													"")) {
																								$(
																										this)
																										.show(); // Show the row
																							} else {
																								$(
																										this)
																										.hide(); // Hide the row
																							}
																						});
																	});

													// Function to handle dropdown item click for sorting
													$(".zone")
															.click(
																	function(e) {
																		e
																				.preventDefault();

																		// Get the selected filter option text
																		var filterOption = $(
																				this)
																				.text()
																				.toLowerCase();

																		// Loop through table rows and show/hide based on the selected option
																		$(
																				"#patientListTable tbody tr")
																				.each(
																						function() {
																							var status = $(
																									this)
																									.find(
																											"td:eq(3)")
																									.text()
																									.trim()
																									.toLowerCase(); // Assuming the status is in the 4th column (index 3)

																							if (filterOption === "all"
																									|| filterOption === status) {
																								$(
																										this)
																										.show(); // Show the row
																							} else {
																								$(
																										this)
																										.hide(); // Hide the row
																							}
																						});
																	});
												});
							</script>
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
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<Patient> pal = (ArrayList<Patient>) session.getAttribute("patientAssignedlist");
										for (Patient u : pal) {
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
											<td scope="row"><a
												href="/hms/AssignMedication?patientID=<%=u.getIdpatient()%>&patientName=<%=u.getName()%>">Assign
													Medication</a></td>
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
								<!-- <div class="modal" id="viewPatientModal">
									<div class="modal-dialog modal-dialog-centered modal-lg">
										<div class="modal-content">
											Modal header
											<div class="modal-header">
												<h5 class="modal-title">Patient Detail</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>

											Modal body
											<form action="/hms/AddPatient" method="post">
												<div class="modal-body">
													<div class="form-group row">
														<label for="email" class="col-sm-2 col-form-label">Name</label>
														<div class="col-sm-10">
															<input type="text" class="form-control" id="name"
																name="name" placeholder="Name" required>
														</div>
													</div>
													<div class="form-group row">
														<label for="identificationcard"
															class="col-sm-2 col-form-label">Identification
															Card No.</label>
														<div class="col-sm-10">
															<input type="text" class="form-control"
																id="identificationcard" name="identificationcard"
																placeholder="Identification Card" required>
														</div>


														<fieldset class="form-group">
															<div class="row">
																<legend class="col-form-label col-sm-2 pt-0">Gender</legend>
																<div class="col-sm-10">
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="gender" id="gender1" value="Male" checked
																			required> <label class="form-check-label"
																			for="gridRadios1"> Male </label>
																	</div>
																	<div class="form-check">
																		<input class="form-check-input" type="radio"
																			name="gender" id="gender2" value="Female" required>
																		<label class="form-check-label" for="gridRadios2">
																			Female </label>
																	</div>
																</div>
														</fieldset>
													</div>
													<div class="form-group row">
														<label for="phoneNum" class="col-sm-2 col-form-label">Phone
															No.</label>
														<div class="col-sm-10">
															<input type="phonenumber" class="form-control"
																id="phoneNum" name="phoneNum" placeholder="Phone No."
																required>
														</div>
													</div>
													<div class="form-group row">
														<label for="nationality" class="col-sm-2 col-form-label">Nationality</label>
														<div class="col-sm-10">
															<input type="nationality" class="form-control"
																id="nationality" name="nationality"
																placeholder="Nationality" required>
														</div>

														<div class="form-group row">
															<label for="dateOfBirth" class="col-sm-2 col-form-label">Date
																of Birth</label>
															<div class="col-sm-10">
																<input type="date" class="form-control" id="date"
																	name="date" required>
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

															<div class="form-group row">
																<label for="appointmentDate"
																	class="col-sm-2 col-form-label">Appointment
																	Date</label>
																<div class="col-sm-10">
																	<input type="datetime-local" class="form-control"
																		id="datetime-local" name="appointmentDate" required>
																</div>
															</div>

															<fieldset class="form-group">
																<div class="row">
																	<legend class="col-form-label col-sm-2 pt-0">Status</legend>
																	<div class="col-sm-10">
																		<div class="form-check">
																			<input class="form-check-input" type="radio"
																				name="status" id="status1" value="1" checked
																				required> <label class="form-check-label"
																				for="gridRadios1"> Red Zone </label>
																		</div>
																		<div class="form-check">
																			<input class="form-check-input" type="radio"
																				name="status" id="status2" value="2" required>
																			<label class="form-check-label" for="gridRadios2">
																				Green Zone </label>
																		</div>
																	</div>
															</fieldset>
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
								</div> -->

							</div>

						</div>
					</div>
					<!-- End Recent Sales -->
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<%@ include file="Footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<%@ include file="ScriptResources.jsp"%>
	<!-- <script>
		// Get the modal element
		const modal = document.getElementById('addPatientModal');
		const modal = document.getElementById('assignMedicationModal');

		// Add an event listener to the modal to clear the fields when it is shown
		modal.addEventListener('shown.bs.modal', function() {
			// Clear the fields in the modal
			document.querySelectorAll('#addPatientModal input').forEach(
					function(input) {
						input.value = '';
					});
		});
	</script> -->
</body>

</html>
