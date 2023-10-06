<!-- ======= Header ======= -->
<%@ include file="validationNotNull.jsp"%>
<header id="header" class="header fixed-top d-flex align-items-center">

	<div class="d-flex align-items-center justify-content-between">
		<a href="Welcome.jsp" class="logo d-flex align-items-center"> <img
			src="../img/favicon.png" alt=""> <span
			class="d-none d-lg-block">HMS</span>
		</a> <i class="bi bi-list toggle-sidebar-btn"></i>
	</div>
	<!-- End Logo -->

	<div class="search-bar">
		<form class="search-form d-flex align-items-center" method="POST"
			action="#">
			<input id="search-input" type="text" name="query"
				placeholder="Search" onkeyup="search()" title="Enter search keyword">
			<button type="submit" title="Search">
				<i class="bi bi-search"></i>
			</button>
		</form>
	</div>
	<!-- End Search Bar -->

	<nav class="header-nav ms-auto">
		<ul class="d-flex align-items-center">

			<li class="nav-item d-block d-lg-none"><a
				class="nav-link nav-icon search-bar-toggle " href="#"> <i
					class="bi bi-search"></i>
			</a></li>
			<!-- End Search Icon-->


			<li class="nav-item dropdown pe-3"><a
				class="nav-link nav-profile d-flex align-items-center pe-0" href="#"
				data-bs-toggle="dropdown"> <img src="../img/profile-img.jpg"
					alt="Profile" class="rounded-circle"><span
					class="d-none d-md-block dropdown-toggle ps-2"><%=session.getAttribute("USERname")%></span>
			</a> <!-- End Profile Iamge Icon -->

				<ul
					class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
					<li class="dropdown-header">
						<h6><%=session.getAttribute("USERname")%></h6> <span><%=session.getAttribute("USERrole")%></span>
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>


					<li><a class="dropdown-item d-flex align-items-center"
						href="Profile.jsp"> <i class="bi bi-gear"></i> <span>Account
								Settings</span>
					</a></li>
					<li>
						<hr class="dropdown-divider">
					</li>
					<li>
						<hr class="dropdown-divider">
					</li>

					<li><a href="Login.jsp"
						class="dropdown-item d-flex align-items-center" href="#"> <i
							class="bi bi-box-arrow-right"></i> <span>Sign Out</span>
					</a></li>

				</ul> <!-- End Profile Dropdown Items --></li>
			<!-- End Profile Nav -->

		</ul>
	</nav>
	<!-- End Icons Navigation -->

</header>
<!-- End Header -->
<!-- </body>
</html> -->