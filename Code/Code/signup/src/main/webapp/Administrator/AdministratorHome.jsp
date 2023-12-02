<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Administrator Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left" style="color: white;">Admin Panel</button>
      <div style="position: absolute; top: 10px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Administrator Home</h1>

        <!-- Buttons -->
        <div class="btn-group-horizontal">
            <button class="btn btn-primary" onclick="redirectToViewRecord()">View Prisoner Record</button>
            <button class="btn btn-primary" onclick="redirectToAddPrisoner()">Add Prisoner</button>
            <button class="btn btn-primary" onclick="redirectToRemovePrisoner()">Remove Prisoner</button>
            <button class="btn btn-primary" onclick="redirectToManageOfficer()">Manage Officer</button>
            <button class="btn btn-primary" onclick="redirectToCellAllocation()">Cell Allocation</button>
            <button class="btn btn-primary" onclick="redirectToAssignDuties()">Assign Duties</button>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for redirection -->
    <script>
        function redirectToViewRecord() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/viewRecord.jsp';
        }

        function redirectToAddPrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/addPrisoner.jsp';
        }

        function redirectToRemovePrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/removePrisoner.jsp';
        }

        function redirectToManageOfficer() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/manageOfficer.jsp';
        }

        function redirectToCellAllocation() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/cellAllocation.jsp';
        }

        function redirectToAssignDuties() {
            window.location.href = '<%= request.getContextPath() %>/Administrator/assignDuties.jsp';
        }
    </script>
</body>
</html>
