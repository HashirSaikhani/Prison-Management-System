<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Visit Record - Officer Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/officer.css"> <!-- Assuming you have a separate CSS file for officer styles -->
</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Officer Panel</button>
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Manage Visit Record</h1>

        <!-- Manage Visit Record Form -->
        <form id="manageVisitRecordForm" onsubmit="return manageVisitRecord()">
            <!-- Your logic to retrieve a list of pending visit requests goes here -->
            <!-- For demonstration purposes, let's assume we have a static list of requests -->
            <div class="form-group">
                <label for="pendingRequests">Select Pending Request:</label>
                <select class="form-control" id="pendingRequests" name="pendingRequests" required>
                    <option value="Request1">Request1</option>
                    <option value="Request2">Request2</option>
                    <option value="Request3">Request3</option>
                    <!-- Add more options based on the list of pending requests -->
                </select>
            </div>
            <div class="form-group">
                <label for="action">Select Action:</label>
                <select class="form-control" id="action" name="action" required>
                    <option value="accept">Accept</option>
                    <option value="reject">Reject</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script>
        function manageVisitRecord() {
            var selectedRequest = document.getElementById("pendingRequests").value;
            var selectedAction = document.getElementById("action").value;

            // Your logic to handle the accept or reject action for the selected visit request goes here
            // For demonstration purposes, let's assume a successful operation
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                var message = (selectedAction === 'accept') ? 'Record Accepted!' : 'Record Rejected!';
                Swal.fire({
                    title: message,
                    text: 'The visit record for ' + selectedRequest + ' has been ' + selectedAction + 'ed.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 2000
                });
            } else {
                Swal.fire({
                    title: 'Operation Failed!',
                    text: 'Failed to ' + selectedAction + ' the visit record.',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: 2000
                });
            }

            // Prevent form submission
            return false;
        }
    </script>
</body>
</html>
