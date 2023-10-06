
<%@page import="com.hms.beans.Patient"%>
<%@page import="java.util.ArrayList"%>
<%
for (Patient u : ul) {
%>
<div class="modal" id="viewPatientModal<%=u.getIdpatient()%>">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<!-- Modal header -->
			<div class="modal-header">
				<h5 class="modal-title">View Patient</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<!-- Modal body -->
			<form action="/hms/AddPatient" method="post">
				<div class="modal-body">
					<div class="form-group row">
						<label for="email" class="col-sm-3 col-form-label">Name</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Name" value="<%=u.getName()%>" required disabled>
						</div>
					</div>
					<div class="form-group row">
						<label for="identificationcard" class="col-sm-3 col-form-label">Identification
							Card No.</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="identificationcard"
								name="identificationcard" placeholder="Identification Card"
								value="<%=u.getIc()%>" required disabled>
						</div>
					</div>
					<div class="form-group row">
						<label for="gender" class="col-sm-3 col-form-label">Gender</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="gender" name="gender"
								placeholder="Gender" value="<%=u.getGender()%>" required
								disabled>
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
						<label for="nationality" class="col-sm-3 col-form-label">Nationality</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="nationality"
								name="nationality" placeholder="Nationality"
								value="<%=u.getNationality()%>" required disabled>
						</div>

					</div>
					<div class="form-group row">
						<label for="dateOfBirth" class="col-sm-3 col-form-label">Date
							of Birth</label>
						<div class="col-sm-9">
							<input type="date" class="form-control" id="date" name="date"
								value="<%=u.getDateofbirth()%>" required disabled>
						</div>
					</div>

					<div class="form-group row">
						<label for="inputAddress3" class="col-sm-3 col-form-label">Address</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="address"
								name="address" placeholder="address" value="<%=u.getAddress()%>"
								required disabled>
						</div>

					</div>
					<div class="form-group row">
						<label for="appointmentDate" class="col-sm-3 col-form-label">Appointment
							Date</label>
						<div class="col-sm-9">
							<input type="datetime-local" class="form-control"
								id="datetime-local" name="appointmentDate"
								value="<%=u.getAppointmentDate()%>" required disabled>
						</div>
					</div>
					<div class="form-group row">
						<label for="status" class="col-sm-3 col-form-label">Health
							Status</label>
						<div class="col-sm-9">
							<%
							if (u.getStatus() == 1) {
							%>
							<input type="text" class="form-control" id="status" name="status"
								value="Red Zone" required disabled>
							<%
							} else {
							%>
							<input type="text" class="form-control" id="status" name="status"
								value="Green Zone" required disabled>
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
</div>
<%
}
%>
