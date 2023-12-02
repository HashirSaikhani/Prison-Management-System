<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="Officer/styles/officer.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand text-white" href="#">
           Prison Management System
        </a>
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
            window.location.href = 'Officer/viewDuties.jsp';
        }

        function redirectToAddPrisoner() {
            window.location.href = 'Officer/PermitMedicalRequest.jsp';
        }

        function redirectToRemovePrisoner() {
            window.location.href = 'Officer/RecordVisitors.jsp';
        }

        function redirectToManageOfficer() {
            window.location.href = 'Officer/UpdatePrisonerRecord.jsp';
        }

        function redirectToCellAllocation() {
            window.location.href = 'Officer/ManageVisitRequest.jsp';
        }

        
    </script>
</body>
</html>
