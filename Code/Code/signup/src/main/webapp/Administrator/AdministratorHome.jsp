<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Administrator Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/admin.css">
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
            window.location.href = 'viewRecord.jsp';
        }

        function redirectToAddPrisoner() {
            window.location.href = 'addPrisoner.jsp';
        }

        function redirectToRemovePrisoner() {
            window.location.href = 'removePrisoner.jsp';
        }

        function redirectToManageOfficer() {
            window.location.href = 'manageOfficer.jsp';
        }

        function redirectToCellAllocation() {
            window.location.href = 'cellAllocation.jsp';
        }

        function redirectToAssignDuties() {
            window.location.href = 'assignDuties.jsp';
        }
    </script>
</body>
</html>
