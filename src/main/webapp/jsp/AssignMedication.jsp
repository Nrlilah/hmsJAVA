<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hms.beans.Patient"%>
<%@page import="com.hms.beans.MedicationList"%>
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
			<h1>Patient Medication <%=session.getAttribute("patientID")%></h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="Welcome.jsp">Home</a></li>
					<li class="breadcrumb-item active">Patient Medication</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->
		<section class="section">
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
										ArrayList<MedicationList> ml = (ArrayList<MedicationList>) session.getAttribute("MedicationListListData");
										for (MedicationList m : ml) {
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
											<input type="text" class="form-control" name="Dosage" placeholder="Dosage per consumption">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputText" class="col-sm-2 col-form-label">Frequency</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="Frequency" placeholder="Consumption per day(s)">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputDate" class="col-sm-2 col-form-label">Start
											Date & Time</label>
										<div class="col-sm-10">
											<input type="datetime-local" class="form-control"
												name="startDateTime">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputDate" class="col-sm-2 col-form-label">End
											Date & Time</label>
										<div class="col-sm-10">
											<input type="datetime-local" class="form-control"
												name="endDateTime">
										</div>
									</div>
									<div class="row mb-3">
										<label for="inputPassword" class="col-sm-2 col-form-label">Notes</label>
										<div class="col-sm-10">
											<textarea class="form-control" style="height: 100px" name="notes"></textarea>
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

				</div>
			</div>
		</section>