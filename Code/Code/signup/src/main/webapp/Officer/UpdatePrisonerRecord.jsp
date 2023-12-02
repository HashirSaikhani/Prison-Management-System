<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update Prisoner Record - Officer Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/officer.css"> <!-- Assuming you have a separate CSS file for officer styles -->
</head>
<body>

   <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Officer Panel</button>
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Update Prisoner Record</h1>

        <!-- Update Prisoner Record Form -->
        <form id="updateRecordForm" onsubmit="return updatePrisonerRecord()">
            <!-- Your logic to retrieve a list of prisoners goes here -->
            <!-- For demonstration purposes, let's assume we have a static list of prisoners -->
            <div class="form-group">
                <label for="prisonerName">Select Prisoner:</label>
                <select class="form-control" id="prisonerName" name="prisonerName" required>
                    <option value="Prisoner1">Prisoner1</option>
                    <option value="Prisoner2">Prisoner2</option>
                    <option value="Prisoner3">Prisoner3</option>
                    <!-- Add more options based on the list of prisoners -->
                </select>
            </div>
            <div class="form-group">
                <label for="updatedRecord">Enter Updated Record:</label>
                <textarea class="form-control" id="updatedRecord" name="updatedRecord" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Record</button>
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
        function updatePrisonerRecord() {
            var prisonerName = document.getElementById("prisonerName").value;
            var updatedRecord = document.getElementById("updatedRecord").value;

            // Your logic to update the record of the selected prisoner goes here
            // For demonstration purposes, let's assume a successful update
            var success = true;

            // Display a success or failure message using SweetAlert
            if (success) {
                Swal.fire({
                    title: 'Prisoner Record Updated!',
                    text: 'The record for ' + prisonerName + ' has been successfully updated.',
                    icon: 'success',
                    showConfirmButton: false,
                    timer: 2000
                });
            } else {
                Swal.fire({
                    title: 'Update Failed!',
                    text: 'Failed to update the prisoner record.',
                    icon: 'error',
                    showConfirmButton: false,
                    timer: 2000
                });
            }

            // Prevent form submission
            return false;
        }
    </script>
</body>
</html>
