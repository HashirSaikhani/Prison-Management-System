<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>File Complaint</title>
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
            <h1>File Complaint</h1>

            <!-- File Complaint Form -->
            <form id="fileComplaintForm" onsubmit="return validateForm()" method="post" action="FileComplaint">

                <label for="userName">Your Name</label>
                <input type="text" id="userName" name="userName" required>

                <label for="complaint">Complaint</label>
                <textarea id="complaint" name="complaint" rows="5" required></textarea><br>

                <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>File Complaint</button>
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
                    text: 'Complaint filed Successfully',
                });
            } else if (status === "failed") {
                Swal.fire({
                    icon: 'error',
                    title: 'Sorry',
                    text: 'Failed to file the complaint',
                });
            } else if (status === "invalidInput") {
                Swal.fire({
                    icon: 'error',
                    title: 'Sorry',
                    text: 'Please fill in all the fields',
                });
            } else if (status === "prisonerNotFound") {
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
