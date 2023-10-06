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
				<div class="col-lg-7">
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

										<li><a class="dropdown-item" href="#">Ascending</a></li>
										<li><a class="dropdown-item" href="#">Descending</a></li>
									</ul>
								</div>

								<div class="card-body">
									<h5 class="card-title">
										Queue List <span>| Masterdata</span>
									</h5>

									<table id="userListTable"
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
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
												<%
												} else if (p.getStatus() == 2) {
												%>
												<td><span class="badge bg-success">Green Zone</span></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
												<%
												} else {
												%>
												<td><span class="badge bg-secondary">Discharged</span></td>
												<td scope="row"><a href="" data-bs-toggle="modal"
													data-bs-target="#addPatientModal">More Detail</a></td>
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
						<!-- End User Masterdata -->
					</div>
				</div>
				<!-- End Left side columns -->

				<!-- Right side columns -->
				<div class="col-lg-5">

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
</body>
</html>