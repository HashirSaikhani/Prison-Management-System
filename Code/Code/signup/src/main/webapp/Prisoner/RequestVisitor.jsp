<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Visitor - Prisoner Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Prisoner/styles/prisoner.css"> <!-- Assuming you have a separate CSS file for prisoner styles -->
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Prisoner/PrisonerHome.jsp'" class="btn btn-primary-left" style="color: white;">Prisoner Panel</button>
    
</nav>
    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Request Visitor</h1>

        <!-- Request Visitor Form -->
        <form id="requestVisitorForm" onsubmit="return requestVisitor()">
            <div class="form-group">
                <label for="visitorName">Visitor Name:</label>
                <input type="text" class="form-control" id="visitorName" name="visitorName" required>
            </div>
            <button type="submit" class="btn btn-primary">Confirm Request</button>
        </form>

        <!-- Check Status Form -->
        <form id="checkStatusForm" class="mt-4" onsubmit="return checkStatus()">
            <button type="submit" class="btn btn-info">Check Request Status</button>
        </form>

        <!-- Display Request Status -->
        <div id="statusDisplay" class="mt-4" style="display: none;">
            <h4>Request Status:</h4>
            <p id="statusDetails"></p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script>
        function requestVisitor() {
            var visitorName = document.getElementById("visitorName").value;

            // Your logic to send the visitor request confirmation goes here
            // For demonstration purposes, let's assume a successful confirmation
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                Swal.fire({
                    title: 'Request Confirmed!',
                    text: 'Your request for a visitor has been confirmed. Please wait for further instructions.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 3000
                });
            } else {
                Swal.fire({
                    title: 'Confirmation Failed!',
                    text: 'Failed to confirm the visitor request. Please try again.',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: 3000
                });
            }

            // Prevent form submission
            return false;
        }

        function checkStatus() {
            // Your logic to retrieve the status of the visitor request goes here
            // For demonstration purposes, let's assume we have a static status
            var status = "Pending";

            // Display the request status
            document.getElementById("statusDetails").innerHTML = "Status: " + status;
            document.getElementById("statusDisplay").style.display = "block";

            // Prevent form submission
            return false;
        }
    </script>
</body>
</html>
