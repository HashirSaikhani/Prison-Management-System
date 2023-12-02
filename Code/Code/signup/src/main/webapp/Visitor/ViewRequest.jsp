<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Request - Visitor Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
     <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">

</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
</nav>
    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">View Request Status</h1>

        <!-- View Request Form -->
        <form id="viewRequestForm" onsubmit="return viewRequestStatus()">
            <div class="form-group">
                <label for="visitorName">Your Name:</label>
                <input type="text" class="form-control" id="visitorName" name="visitorName" required>
            </div>
            <button type="submit" class="btn btn-info">Check Status</button>
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
    function viewRequestStatus() {
        var visitorName = document.getElementById("visitorName").value;

        // Your logic to retrieve the status of the visit request goes here
        // For demonstration purposes, let's assume we have a static status
        var status = "Approved";

        // Display the request status
        document.getElementById("statusDetails").innerHTML = "Status: " + status;
        document.getElementById("statusDisplay").style.display = "block";

        // Prevent form submission
        return false;
    }
</script>
</body>
</html>