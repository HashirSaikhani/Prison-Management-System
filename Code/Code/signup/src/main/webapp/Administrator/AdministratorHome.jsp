<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Administrator Home</title>
    <!-- Link to custom styles -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>

	<div class="banner">
    <div class="navbar">
     <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-left">Log out</button></li>
    </ul>
    </div>
    
    <!-- Content -->
    <div class="content">
        <h1>Administrator Home</h1>

        <!-- Buttons -->
            <button class="btn btn-info" onclick="redirectToViewRecord()"><span class="custom-span"></span>View Prisoner Record</button>
            <button class="btn btn-info" onclick="redirectToAddPrisoner()"><span class="custom-span"></span>Add Prisoner</button>
            <button class="btn btn-info" onclick="redirectToRemovePrisoner()"><span class="custom-span"></span>Remove Prisoner</button>
            <button class="btn btn-info" onclick="redirectToManageOfficer()"><span class="custom-span"></span>Manage Officer</button>
            <button class="btn btn-info" onclick="redirectToCellAllocation()"><span class="custom-span"></span>Cell Allocation</button>
            <button class="btn btn-info" onclick="redirectToAssignDuties()"><span class="custom-span"></span>Assign Duties</button>
     
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
