<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Medical Requests - Officer Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css"><!-- Assuming you have a separate CSS file for officer styles -->
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Officer Panel</button>
    
       
      <div style="position: absolute; top: 10px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Medical Requests</h1>

        <!-- View Medical Requests Form -->
        <form id="viewRequestsForm" onsubmit="return viewMedicalRequests()">
            <button type="submit" class="btn btn-primary">View Medical Requests</button>
        </form>

        <!-- Display Medical Requests -->
        <div id="medicalRequests" class="mt-4" style="display: none;">
            <h4>Medical Requests:</h4>
            <select class="form-control" id="selectedRequest" name="selectedRequest" required>
                <!-- Options will be dynamically populated based on medical requests -->
            </select>
            <button type="button" class="btn btn-success mt-2" onclick="permitRequest()">Permit Request</button>
            <button type="button" class="btn btn-danger mt-2" onclick="rejectRequest()">Reject Request</button>
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
        function viewMedicalRequests() {
            // Your logic to retrieve a list of medical requests goes here
            // For demonstration purposes, let's assume we have a static list of requests
            var requests = ["Request1", "Request2", "Request3"];

            // Populate the select dropdown with medical requests
            var selectDropdown = document.getElementById("selectedRequest");
            selectDropdown.innerHTML = "";
            for (var i = 0; i < requests.length; i++) {
                var option = document.createElement("option");
                option.value = requests[i];
                option.text = requests[i];
                selectDropdown.appendChild(option);
            }

            // Show the medical requests section
            document.getElementById("medicalRequests").style.display = "block";

            // Prevent form submission
            return false;
        }

        function permitRequest() {
            var selectedRequest = document.getElementById("selectedRequest").value;

            // Your logic to handle the permit action for the selected request goes here
            // You can use AJAX to communicate with the server and update the status of the request

            // Display a success message (for demonstration purposes)
            Swal.fire({
                title: 'Request Permitted!',
                icon: 'success',
                showConfirmButton: false,
                timer: 1500
            });
        }

        function rejectRequest() {
            var selectedRequest = document.getElementById("selectedRequest").value;

            // Your logic to handle the reject action for the selected request goes here
            // You can use AJAX to communicate with the server and update the status of the request

            // Display a success message (for demonstration purposes)
            Swal.fire({
                title: 'Request Rejected!',
                icon: 'error',
                showConfirmButton: false,
                timer: 1500
            });
        }
    </script>
</body>
</html>
