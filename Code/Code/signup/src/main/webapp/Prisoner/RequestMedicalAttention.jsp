<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Medical Attention - Prisoner Panel</title>
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
        <h1 class="mb-4">Request Medical Attention</h1>

        <!-- Request Medical Attention Form -->
        <form id="requestMedicalAttentionForm" onsubmit="return requestMedicalAttention()">
            <div class="form-group">
                <label for="diseaseType">Type of Disease:</label>
                <input type="text" class="form-control" id="diseaseType" name="diseaseType" required>
            </div>
            <div class="form-group">
                <label for="medicalInfo">Medical Information:</label>
                <textarea class="form-control" id="medicalInfo" name="medicalInfo" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit Request</button>
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
        function requestMedicalAttention() {
            var diseaseType = document.getElementById("diseaseType").value;
            var medicalInfo = document.getElementById("medicalInfo").value;

            // Your logic to save the medical request and generate a confirmation goes here
            // For demonstration purposes, let's assume a successful submission
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                Swal.fire({
                    title: 'Request Submitted!',
                    text: 'Your request for medical attention has been submitted. Please wait for confirmation.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 3000
                });
            } else {
                Swal.fire({
                    title: 'Submission Failed!',
                    text: 'Failed to submit the medical request. Please try again.',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: 3000
                });
            }

            // Prevent form submission
            return false;
        }

        function checkStatus() {
            // Your logic to retrieve the status of the medical request goes here
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
