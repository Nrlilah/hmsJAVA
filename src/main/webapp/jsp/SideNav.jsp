<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
    <ul class="sidebar-nav" id="sidebar-nav">
        <li class="nav-heading">Functions</li>
        <li class="nav-item"><a class="nav-link" id="registration-link" href="Welcome.jsp">
            <i class="bi bi-card-list"></i> <span>Patient Registration</span>
        </a></li>
        <li class="nav-item"><a class="nav-link collapsed" id="medication-link" href="PatientMedication.jsp">
            <i class="bi bi-card-list"></i> <span>Patient Medication</span>
        </a></li>
        <li class="nav-item"><a class="nav-link collapsed" id="scheduling-link" href="Scheduling.jsp">
            <i class="bi bi-calendar"></i> <span>Scheduling</span>
        </a></li>
        <li class="nav-item"><a class="nav-link collapsed" id="administration-link" href="Administration.jsp">
            <i class="bi bi-gear"></i> <span>System Administration</span>
        </a></li>
    </ul>
</aside>
<script>
    function setActiveClass() {
        const pageUrl = window.location.href;
        const pageName = pageUrl.substring(pageUrl.lastIndexOf("/") + 1);
        
        // Get all navigation links by id
        const registrationLink = document.getElementById("registration-link");
        const medicationLink = document.getElementById("medication-link");
        const schedulingLink = document.getElementById("scheduling-link");
        const administrationLink = document.getElementById("administration-link");
        
        // Remove the "active" class from all links
        registrationLink.classList.remove("active");
        medicationLink.classList.remove("active");
        schedulingLink.classList.remove("active");
        administrationLink.classList.remove("active");
        
        // Find the link that matches the current page and add the "active" class
        switch (pageName) {
            case "Welcome.jsp":
                registrationLink.classList.add("active");
                break;
            case "PatientMedication.jsp":
                medicationLink.classList.add("active");
                break;
            case "Scheduling.jsp":
                schedulingLink.classList.add("active");
                break;
            case "Administration.jsp":
                administrationLink.classList.add("active");
                break;
        }
    }
    
    window.onload = setActiveClass;
</script>
