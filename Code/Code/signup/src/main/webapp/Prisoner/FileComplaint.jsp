<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>File Complaint - Prisoner Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/prisoner.css"> <!-- Assuming you have a separate CSS file for prisoner styles -->
</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='PrisonerHome.jsp'" class="btn btn-primary-left" style="color: white;">Prisoner Panel</button>
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">File Complaint</h1>

        <!-- File Complaint Form -->
        <form id="fileComplaintForm" onsubmit="return fileComplaint()">
            <div class="form-group">
                <label for="complaintName">Person's Name:</label>
                <input type="text" class="form-control" id="complaintName" name="complaintName" required>
            </div>
            <div class="form-group">
                <label for="complaintInfo">Complaint Information:</label>
                <textarea class="form-control" id="complaintInfo" name="complaintInfo" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Confirm Complaint</button>
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
        function fileComplaint() {
            var complaintName = document.getElementById("complaintName").value;
            var complaintInfo = document.getElementById("complaintInfo").value;

            // Your logic to send the complaint and generate a confirmation goes here
            // For demonstration purposes, let's assume a successful submission
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                Swal.fire({
                    title: 'Complaint Sent!',
                    text: 'Your complaint against ' + complaintName + ' has been sent. Thank you for reporting.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 3000
                });
            } else {
                Swal.fire({
                    title: 'Submission Failed!',
                    text: 'Failed to submit the complaint. Please try again.',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: 3000
                });
            }

            // Prevent form submission
            return false;
        }
    </script>
</body>
</html>
