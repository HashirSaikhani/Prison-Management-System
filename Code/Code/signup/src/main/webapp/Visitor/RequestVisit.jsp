<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Visit - Visitor Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
<<<<<<< HEAD
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">
 <!-- Assuming you have a separate CSS file for visitor styles -->
=======
   <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">

>>>>>>> 9f38be96cc019d5a3ef3260dce7abea6951dea4e
</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
    

</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Request Visit</h1>

        <!-- Request Visit Form -->
        <form id="requestVisitForm" onsubmit="return requestVisit()">
            <div class="form-group">
                <label for="visitorName">Your Name:</label>
                <input type="text" class="form-control" id="visitorName" name="visitorName" required>
            </div>
            <div class="form-group">
                <label for="prisonerSelect">Select Prisoner:</label>
                <select class="form-control" id="prisonerSelect" name="prisonerSelect" required>
                    <option value="Prisoner1">Prisoner1</option>
                    <option value="Prisoner2">Prisoner2</option>
                    <option value="Prisoner3">Prisoner3</option>
                    <!-- Add more options based on the list of prisoners -->
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Confirm Request</button>
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
        function requestVisit() {
            var visitorName = document.getElementById("visitorName").value;
            var selectedPrisoner = document.getElementById("prisonerSelect").value;

            // Your logic to send the visit request and generate a confirmation goes here
            // For demonstration purposes, let's assume a successful submission
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                Swal.fire({
                    title: 'Request Sent!',
                    text: 'Your request to visit ' + selectedPrisoner + ' has been sent. Please wait for confirmation.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 3000
                });
            } else {
                Swal.fire({
                    title: 'Submission Failed!',
                    text: 'Failed to submit the visit request. Please try again.',
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
