<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Visit</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor2.css">
</head>
<body>
	<div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    </ul>
    </div>  


<!-- Content -->
    <div class="content">
        <h1>Request Visit</h1>


    <!-- Request Visit Form -->
    <form id="requestVisitForm" onsubmit="return validateForm()" method="post" action="RequestVisit">
        <div class="form-group">
            <label for="visitorName">Your Name</label>
            <input type="text" id="visitorName" name="visitorName" required>
        </div>
        <div class="form-group">
            <label for="prisonerName">Prisoner Name</label>
            <input type="text" id="prisonerName" name="prisonerName" required>
        </div>
        <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Request Visit</button>
    </form>
</div>
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
