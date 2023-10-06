<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.Patient"%>
<%@page import="com.hms.beans.MedicationList"%>
<%@page import="com.hms.beans.Medication"%>
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
			<h1>
				<%=session.getAttribute("patientName")%></h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Medication.jsp">Back</a></li>
					<li class="breadcrumb-item active">Patient Medication</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section dashboard">
			<div class="row">
				<div class="col-lg-12">

					<div class="card">
						<div class="card-body">
							<h5 class="card-title">Medication</h5>


							<!-- General Form Elements -->
							<form action="/hms/AssignMedication" method="post">
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">Item</label>
									<div class="col-sm-10">
										<select class="form-select" name="medicationItem"
											aria-label="medicationItem">

											<%
											ArrayList<MedicationList> mll = (ArrayList<MedicationList>) session.getAttribute("MedicationListListData");
											for (MedicationList m : mll) {
											%>
											<option><%=m.getMedicationItem()%></option>
											<%
											}
											%>
										</select>
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">Dosage</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="Dosage"
											placeholder="Dosage per consumption">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">Frequency</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="Frequency"
											placeholder="Consumption per day(s)">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputDate" class="col-sm-2 col-form-label">Start
										Date & Time</label>
									<div class="col-sm-10">
										<input type="date" class="form-control" name="startDateTime">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputDate" class="col-sm-2 col-form-label">End
										Date & Time</label>
									<div class="col-sm-10">
										<input type="date" class="form-control" name="endDateTime">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputPassword" class="col-sm-2 col-form-label">Notes</label>
									<div class="col-sm-10">
										<textarea class="form-control" style="height: 100px"
											name="notes"></textarea>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label">Prescribe by</label>
									<div class="col-sm-10">
										<input type="text" class="form-control"
											value="<%=session.getAttribute("USERname")%>" disabled>
									</div>
								</div>
								<div class="row mb-3">
									<label class="col-sm-2 col-form-label"></label>
									<div class="col-sm-10"
										style="display: flex; justify-content: flex-end">
										<button type="submit" class="btn btn-primary float-right">Submit</button>
									</div>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>

					</div>

					<!-- Patient Medication List -->
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
									Patient Medication History <span>| Masterdata</span>
								</h5>
								<table id="medicineListTable"
									class="table table-borderless datatable">
									<thead>
										<tr>
											<th scope="col">Item</th>
											<th scope="col">Dosage (mg)</th>
											<th scope="col">Frequency</th>
											<th scope="col">Start Date & Time</th>
											<th scope="col">End Date & Time</th>
											<th scope="col">Duration (Day)</th>
											<th scope="col">Notes</th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<Medication> ml = (ArrayList<Medication>) session.getAttribute("MedicationListData");
										for (Medication m : ml) {
										%>
										<tr>
											<td><%=m.getMedicationItem()%></td>
											<td><%=m.getDosage()%></td>
											<td><%=m.getFrequency()%></td>
											<td><%=m.getStartdatetime()%></td>
											<td><%=m.getEnddatetime()%></td>
											<td><%=m.getDuration()%></td>
											<td><%=m.getNotes()%></td>

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
</body>
</html>