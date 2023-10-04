<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.hms.beans.Patient"%>
<%@page import="com.hms.beans.User"%>
<%@page import="java.util.ArrayList"%>

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
			<h1>Patient Assignation</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">Patient Assignation</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section dashboard">
			<div class="row">

				<!-- Left side columns -->
				<div class="col-lg-12">
					<div class="row">
						<!-- Table -->
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
												<th scope="col"></th>
												<th scope="col"></th>
												<th scope="col">Status Progress</th>
											</tr>
										</thead>
										<tbody>
											<%
											ArrayList<Patient> pl = (ArrayList<Patient>) session.getAttribute("PatientData");
											for (Patient p : pl) {
											%>
											<tr>
												<td><%=p.getIc()%></td>
												<td><%=p.getName()%></td>
												<td><%=p.getGender()%></td>

												<%
												if (p.getStatus() == 1) {
												%>
												<td><span class="badge bg-danger">Red Zone</span></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#assignPatientModal<%=p.getIc()%>">Assign
														Patient</a></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
												<td><%=p.getStatusprogress()%></td>
												<%
												} else if (p.getStatus() == 2) {
												%>
												<td><span class="badge bg-success">Green Zone</span></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#assignPatientModal<%=p.getIc()%>">Assign
														Patient</a></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
												<td><%=p.getStatusprogress()%></td>
												<%
												} else {
												%>
												<td><span class="badge bg-secondary">Discharged</span></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#assignPatientModal<%=p.getIc()%>">Assign
														Patient</a></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
												<td><%=p.getStatusprogress()%></td>
												<%
												}
												}
												%>

											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End Table -->
						<!-- 						<div class="col-xxl-4 col-md-6"> -->
						<!-- 							<div class="card info-card customers-card"> -->

						<!-- 								<div class="card-body"> -->
						<!-- 									<h5 class="card-title"> -->
						<!-- 										<span></span> -->
						<!-- 									</h5> -->

					</div>


					<!-- End Add Account Modal Button Card -->

				</div>
				<!-- End Left side columns -->

			</div>
			<%
			for (Patient p : pl) {
			%>
			<div class="modal" id="assignPatientModal<%=p.getIc()%>">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">
						<form action="/hms/PatientAssignation" method="post" class="mx-3">
							<!-- Modal header -->
							<div class="modal-header">
								<h5 class="modal-title">Assign Patient</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<br>

							<!-- Modal body -->
							<div class="form-group row">
								<label for="doctor" class="col-sm-2 col-form-label">Doctor</label>
								<div class="col-sm-9">
									<input type="hidden" name="patientAssignedIC"
										value="<%=p.getIc()%>" placeholder="patientAssignedIC">
									<select class="form-select" id="doctor" name="doctor"
										aria-label="doctor">
										<%
										ArrayList<User> ul = (ArrayList<User>) session.getAttribute("UserData");
										for (User u : ul) {
											if (u.getAccessLevel() == 2) {
										%>
										<option><%=u.getName()%>
										</option>
										<%
										}
										}
										%>
									</select>
								</div>
							</div>
							<br>
							<!-- Modal Footer -->
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
			<%
			}
			%>
		</section>
	</main>

	<%@ include file="Footer.jsp"%>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<%@ include file="ScriptResources.jsp"%>

	<script>
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