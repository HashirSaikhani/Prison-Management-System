<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css">
</head>
<body>

    <div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-left">Log out</button></li>
    </ul>
    </div>
    <!-- Content -->
    <div class="content">
        <h1>Officer Homepage</h1>

        <!-- Buttons -->
        <div class="btn-group-horizontal">
            <button class="btn btn-indfo" onclick="redirectToViewRecord()"><span class="custom-span"></span>View Duties</button><br>
            <button class="btn btn-info" onclick="redirectToAddPrisoner()"><span class="custom-span"></span>Permit Medical Request</button><br>
            <button class="btn btn-info" onclick="redirectToRemovePrisoner()"><span class="custom-span"></span>View Visitor Record</button><br>
            <button class="btn btn-info" onclick="redirectToManageOfficer()"><span class="custom-span"></span>Update Prisoner Record</button><br>
            <button class="btn btn-info" onclick="redirectToCellAllocation()"><span class="custom-span"></span>Manage Visit Request</button>

        </div>
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
            window.location.href = '<%= request.getContextPath() %>/Officer/viewVisitorRecord.jsp';
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
