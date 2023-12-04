<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Visit</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
</nav>

<!-- Content -->
<div class="container mt-4">
    <h1 class="mb-4">Request Visit</h1>

    <!-- Request Visit Form -->
    <form id="requestVisitForm" onsubmit="return validateForm()" method="post" action="RequestVisit">
        <div class="form-group">
            <label for="visitorName">Your Name</label>
            <input type="text" class="form-control" id="visitorName" name="visitorName" required>
        </div>
        <div class="form-group">
            <label for="prisonerName">Prisoner Name</label>
            <input type="text" class="form-control" id="prisonerName" name="prisonerName" required>
        </div>
        <button type="submit" class="btn btn-primary">Request Visit</button>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2 JS -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- Custom JavaScript for form validation and SweetAlert -->
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var status = "<%= request.getAttribute("status") %>";
        if (status === "success") {
            swal("Success", "Your visit request has been sent", "success");
        } else if (status === "failed") {
            swal("Error", "Failed to send the visit request", "error");
        }
    });
</script>
</body>
</html>
