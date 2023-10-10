<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.User"%>
<%@page import="com.hms.beans.Patient"%>
<%@page import="com.hms.beans.MedicationList"%>
<%@page import="com.hms.beans.PredicamentList"%>
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
			<h1>Scheduling</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">Scheduling</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-8">
					<div class="row">

						<!-- User Masterdata -->
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
																		function(
																				e) {
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
																												"td:eq(4)")
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
										Queue List <span>| Masterdata</span>
									</h5>

									<table id="patientListTable"
										class="table table-borderless datatable">
										<thead>
											<tr>
												<th scope="col">ID.</th>
												<th scope="col">Appointment Date</th>
												<th scope="col">Name</th>
												<th scope="col">Gender</th>
												<th scope="col">Health Status</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<Patient> pa = (ArrayList<Patient>) session.getAttribute("patientAssignedlist");
											for (Patient p : pa) {
											%>
											<tr>
												<td><%=p.getIc()%></td>
												<td><%=p.getAppointmentDate()%></td>
												<td><%=p.getName()%></td>
												<td><%=p.getGender()%></td>
												<%
												if (p.getStatus() == 1) {
												%>
												<td><span class="badge bg-danger">Red Zone</span></td>
												<%
												} else if (p.getStatus() == 2) {
												%>
												<td><span class="badge bg-success">Green Zone</span></td>
												<%
												} else {
												%>
												<td><span class="badge bg-secondary">Discharged</span></td>
												<%
												}
												%>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#viewPatientModal<%=p.getIdpatient()%>">More
														Detail</a>
													<div class="modal"
														id="viewPatientModal<%=p.getIdpatient()%>">
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
																					value="<%=p.getName()%>" required disabled>
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
																					value="<%=p.getIc()%>" required disabled>
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="gender" class="col-sm-3 col-form-label">Gender</label>
																			<div class="col-sm-9">
																				<input type="text" class="form-control" id="gender"
																					name="gender" placeholder="Gender"
																					value="<%=p.getGender()%>" required disabled>
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="phoneNum" class="col-sm-3 col-form-label">Phone
																				No.</label>
																			<div class="col-sm-9">
																				<input type="text" class="form-control"
																					id="phoneNum" name="phoneNum"
																					placeholder="Phone No."
																					value="<%=p.getPhonenumber()%>" required disabled>
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="nationality"
																				class="col-sm-3 col-form-label">Nationality</label>
																			<div class="col-sm-9">
																				<input type="text" class="form-control"
																					id="nationality" name="nationality"
																					placeholder="Nationality"
																					value="<%=p.getNationality()%>" required disabled>
																			</div>

																		</div>
																		<div class="form-group row">
																			<label for="dateOfBirth"
																				class="col-sm-3 col-form-label">Date of
																				Birth</label>
																			<div class="col-sm-9">
																				<input type="date" class="form-control" id="date"
																					name="date" value="<%=p.getDateofbirth()%>"
																					required disabled>
																			</div>
																		</div>

																		<div class="form-group row">
																			<label for="inputAddress3"
																				class="col-sm-3 col-form-label">Address</label>
																			<div class="col-sm-9">
																				<input type="text" class="form-control" id="address"
																					name="address" placeholder="address"
																					value="<%=p.getAddress()%>" required disabled>
																			</div>

																		</div>
																		<div class="form-group row">
																			<label for="appointmentDate"
																				class="col-sm-3 col-form-label">Appointment
																				Date</label>
																			<div class="col-sm-9">
																				<input type="datetime-local" class="form-control"
																					id="datetime-local" name="appointmentDate"
																					value="<%=p.getAppointmentDate()%>" required
																					disabled>
																			</div>
																		</div>
																		<div class="form-group row">
																			<label for="status" class="col-sm-3 col-form-label">Health
																				Status</label>
																			<div class="col-sm-9">
																				<%
																				if (p.getStatus() == 1) {
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
						<!-- End User Masterdata -->
					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-4">

					<!-- Queue -->
					<div class="card">
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

						<div class="card-body">
							<h5 class="card-title">
								Queue <span>| Masterdata</span>
							</h5>

							<div class="activity">

								<%
								ArrayList<String> pt = (ArrayList<String>) session.getAttribute("patientTime");
								ArrayList<Patient> pq = (ArrayList<Patient>) session.getAttribute("patientQueue");
								for (int i = 0; i < pq.size(); i++) {
								%>
								<div class="activity-item d-flex">
									<div class="activite-label"><%=(pt.get(i))%></div>
									<i
										class='bi bi-circle-fill activity-badge text-success align-self-start'></i>
									<div class="activity-content"><%=(pq.get(i)).getName()%></div>
								</div>
								<%
								}
								%>
								<!-- End activity item-->
							</div>

						</div>
					</div>
					<!-- End Recent Activity -->
				</div>
				<!-- End Right side columns -->
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
	function search() {
		var input, filter, table, tr, td, i, txtValue;
		input = document.getElementById("search-input");
		filter = input.value.toUpperCase();
		table = document.getElementById("patientListTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[2];
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