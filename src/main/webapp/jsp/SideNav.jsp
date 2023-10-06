<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
	<ul class="sidebar-nav" id="sidebar-nav">
		<li class="nav-heading">Functions</li>
		<%
		try {
			if (session.getAttribute("USERaccessLevel").equals("0")) {
		%>
		<li class="nav-item"><a class="nav-link collapsed"
			id="registration-link" href="Welcome.jsp"> <i
				class="bi bi-card-list"></i> <span>Patient Registration</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="scheduling-link" href="PatientAssignation.jsp"> <i
				class="bi bi-calendar"></i> <span>Patient Assignation</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="medication-link" href="Medication.jsp"> <i
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
			id="scheduling-link" href="PatientAssignation.jsp"> <i
				class="bi bi-calendar"></i> <span>Patient Assignation</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="medication-link" href="Medication.jsp"> <i
				class="bi bi-card-list"></i> <span>Patient Medication</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="scheduling-link" href="Scheduling.jsp"> <i
				class="bi bi-calendar"></i> <span>Scheduling</span>
		</a></li>
		<%
		} else {
		%>
		<li class="nav-item"><a class="nav-link collapsed"
			id="registration-link" href="Welcome.jsp"> <i
				class="bi bi-card-list"></i> <span>Patient Registration</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			id="scheduling-link" href="PatientAssignation.jsp"> <i
				class="bi bi-calendar"></i> <span>Patient Assignation</span>
		</a></li>
		<%
		}
		} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("Login.jsp");
		}
		%>
	</ul>
</aside>
<script>
	const sidebarNavUl = document.querySelector("#sidebar-nav");
	sidebarNavUl.classList.remove("collapse");
</script>
