<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Request Work Assignment</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Prisoner/styles/prisoner.css">
</head>
<body>

	<div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Prisoner/PrisonerHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Request Work Assignment</h1>

        <!-- Request Work Assignment Form -->
        <form id="requestWorkAssignmentForm" onsubmit="return validateForm()" method="post" action="RequestWorkAssignment">
            <label for="prisonerName">Prisoner Name</label>
            <input type="text" id="prisonerName" name="prisonerName" required>

            <label for="workAssignment">Work Assignment</label>
            <select id="workAssignment" name="workAssignment" required>
                <!-- Options will be dynamically populated based on available work assignments -->
                <option value="Cleaning">Cleaning</option>
                <option value="Maintenance">Maintenance</option>
                <option value="Kitchen Duty">Kitchen Duty</option>
                <option value="Gardening">Gardening</option>
                <option value="Laundry">Laundry</option>
                <option value="Office Assistance">Office Assistance</option>
                <!-- Add more work assignments as needed -->
            </select><br>

            <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Request Work Assignment</button>
        </form>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Custom JavaScript for form validation and SweetAlert -->
<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var status = "<%= request.getAttribute("status") %>";
        if (status === "success") {
            Swal.fire({
                icon: 'success',
                title: 'Congrats',
                text: 'Work assignment requested Successfully',
            });
        } else if (status === "failed") {
            Swal.fire({
                icon: 'error',
                title: 'Sorry',
                text: 'Failed to request work assignment',
            });
        } else if (status === "invalidInput") {
            Swal.fire({
                icon: 'error',
                title: 'Sorry',
                text: 'Please fill in all the fields',
            });
        }
        else if (status === "prisonerNotFound") {
            Swal.fire({
                icon: 'error',
                title: 'Sorry',
                text: 'Prisoner not found. Please enter a valid name.',
            });
        }
    });
</script>
</body>
</html>
