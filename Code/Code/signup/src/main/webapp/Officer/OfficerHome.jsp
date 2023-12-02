<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
    
    
</nav>
    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Officer Homepage</h1>

        <!-- Buttons -->
        <div class="btn-group-horizontal">
            <button class="btn btn-primary" onclick="redirectToViewRecord()">View Duties</button>
            <button class="btn btn-primary" onclick="redirectToAddPrisoner()">Permit Medical Request</button>
            <button class="btn btn-primary" onclick="redirectToRemovePrisoner()">Record Visitors</button>
            <button class="btn btn-primary" onclick="redirectToManageOfficer()">Update Prisoner Record</button>
            <button class="btn btn-primary" onclick="redirectToCellAllocation()">Manage Visit Request</button>

        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for redirection -->
    <script>
        function redirectToViewRecord() {
            window.location.href = '<%= request.getContextPath() %>/Officer/viewDuties.jsp';
        }

        function redirectToAddPrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Officer/PermitMedicalRequest.jsp';
        }

        function redirectToRemovePrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Officer/RecordVisitors.jsp';
        }

        function redirectToManageOfficer() {
            window.location.href = '<%= request.getContextPath() %>/Officer/UpdatePrisonerRecord.jsp';
        }

        function redirectToCellAllocation() {
            window.location.href = '<%= request.getContextPath() %>/Officer/ManageVisitRequest.jsp';
        }

        
    </script>
</body>
</html>
