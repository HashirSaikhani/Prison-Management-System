<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Prisoner - Administrator Home Hashir</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/admin.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand text-white" href="#">
           Prison Management System
        </a>
    </nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Add Prisoner</h1>

        <!-- Add Prisoner Form -->
        <form id="addPrisonerForm" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="crime">Crime</label>
                <input type="text" class="form-control" id="crime" name="crime" required>
            </div>
            <div class="form-group">
                <label for="sentence">Sentence</label>
                <input type="text" class="form-control" id="sentence" name="sentence" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Prisoner</button>
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
        function validateForm() {
            var firstName = document.getElementById("firstName").value;
            var lastName = document.getElementById("lastName").value;
            var crime = document.getElementById("crime").value;
            var sentence = document.getElementById("sentence").value;

            // Check if fields are empty or incorrect
            if (firstName.trim() === "" || lastName.trim() === "" || crime.trim() === "" || !isNaN(crime) || sentence.trim() === "" || isNaN(sentence)) {
                showErrorAlert("Please fill in all fields correctly.");
                return false;
            }

            // Your additional validation logic can go here

            // If all validation passed, you can submit the form
            return true;
        }

        function showErrorAlert(message) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: message,
            });
        }
    </script>
</body>
</html>
