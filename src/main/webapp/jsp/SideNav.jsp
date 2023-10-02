<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-heading">Functions</li>
		<li class="nav-item"><a class="nav-link " href="Welcome.jsp">
				<i class="bi bi-card-list"></i> <span>Patient Registration</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			href="Welcome.jsp"> <i class="bi bi-card-list"></i> <span>Patient
					Medication</span>
		</a></li>
		<li class="nav-item"><a class="nav-link collapsed"
			href="Welcome.jsp"> <i class="bi bi-calendar"></i> <span>Scheduling</span>
		</a></li>
		<!-- End Profile Page Nav -->
		<!-- End Dashboard Nav -->
	</ul>

</aside>
<script>
	function setActiveClass() {
		const pageUrl = window.location.href;
		const pageName = pageUrl.substring(pageUrl.lastIndexOf("/") + 1);
		alert(pageName);
		const navigationMenuItem = document
				.querySelector(`nav a[href="${pageName}"]`);
		navigationMenuItem.classList.add("active");
	}

	window.onload = setActiveClass;
</script>