<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Visitor</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Prisoner/styles/prisoner.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Prisoner/PrisonerHome.jsp'" class="btn btn-primary-left" style="color: white;">Prisoner Panel</button>
</nav>

<!-- Content -->
<div class="container mt-4">
    <h1 class="mb-4">Request Visitor</h1>

    <!-- Request Visitor Form -->
    <form id="requestVisitorForm" onsubmit="return validateForm()" method="post" action="RequestVisitor">
        <div class="form-group">
            <label for="prisonerName">Prisoner Name</label>
            <input type="text" class="form-control" id="prisonerName" name="prisonerName" required>
        </div>

        <div class="form-group">
            <label for="visitorType">Visitor Type</label>
            <select class="form-control" id="visitorType" name="visitorType" required>
                <!-- Options will be dynamically populated based on available visitor types -->
                <option value="Family">Family</option>
                <option value="Friend">Friend</option>
                <option value="Legal Representative">Legal Representative</option>
                <option value="Religious Leader">Religious Leader</option>
                <!-- Add more visitor types as needed -->
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Request Visitor</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2 JS -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">

<!-- Custom JavaScript for form validation and SweetAlert -->
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var status = "<%= request.getAttribute("status") %>";
        if (status === "success") {
            swal("Congrats", "Visitor request submitted Successfully", "success");
        } else if (status === "failed") {
            swal("Sorry", "Failed to submit visitor request", "error");
        } else if (status === "invalidInput") {
            swal("Sorry", "Please fill in all the fields", "error");
        }
    });
</script>
</body>
</html>
