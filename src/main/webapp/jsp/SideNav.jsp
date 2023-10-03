<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-heading">Functions</li>
		<%
		if (session.getAttribute("USERaccessLevel").equals("0")) {
		%>
		<li class="nav-item"><a class="nav-link" id="registration-link"
			href="Welcome.jsp"> <i class="bi bi-card-list"></i> <span>Patient
					Registration</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="medication-link" href="PatientMedication.jsp"> <i
				class="bi bi-card-list"></i> <span>Patient Medication</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="scheduling-link" href="Scheduling.jsp"> <i
				class="bi bi-calendar"></i> <span>Scheduling</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="administration-link" href="Administration.jsp"> <i
				class="bi bi-gear"></i> <span>System Administration</span>
		</a></li>
		<%
		} else if (session.getAttribute("USERaccessLevel").equals("2")) {
		%>
		<li class="nav-item"><a class="nav-link collapsed"
			id="medication-link" href="PatientMedication.jsp"> <i
				class="bi bi-card-list"></i> <span>Patient Medication</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="scheduling-link" href="Scheduling.jsp"> <i
				class="bi bi-calendar"></i> <span>Scheduling</span>
		</a></li>
		<%
		} else {
		%>
		<li class="nav-item"><a class="nav-link" id="registration-link"
			href="Welcome.jsp"> <i class="bi bi-card-list"></i> <span>Patient
					Registration</span>
		</a></li>
		<%
		}
		%>
	</ul>
</aside>
<script>
	alert(session.getAttribute("USERaccessLevel"));
</script>
