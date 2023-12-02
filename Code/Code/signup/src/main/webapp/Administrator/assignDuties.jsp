<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Assign Duties - Administrator Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>

     <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left" style="color: white;">Admin Panel</button>
      <div style="position: absolute; top: 10px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>


    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Assign Duties</h1>

        <!-- Assign Duties Form -->
        <form id="assignDutiesForm" onsubmit="return assignDuty()">
            <div class="form-group">
                <label for="officerName">Select Officer:</label>
                <select class="form-control" id="officerName" name="officerName" required>
                    <!-- Options will be dynamically populated based on officers -->
                    <option value="Officer1">Officer1</option>
                    <option value="Officer2">Officer2</option>
                    <option value="Officer3">Officer3</option>
                </select>
            </div>
            <div class="form-group">
                <label for="duty">Select Duty:</label>
                <select class="form-control" id="duty" name="duty" required>
                    <!-- Options will be dynamically populated based on duties -->
                    <option value="Patrol">Patrol</option>
                    <option value="Gate Security">Gate Security</option>
                    <option value="Office Duty">Office Duty</option>
                       <option value="Patrol">Food Inpsector</option>
                    <option value="Gate Security">Search Inspection</option>
                    <option value="Office Duty">Cell Surveillance</option>
                     <option value="Office Duty">Crises Intervention</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Assign Duty</button>
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
        function assignDuty() {
            var officerName = document.getElementById("officerName").value;
            var selectedDuty = document.getElementById("duty").value;

            // Your logic to assign duty to the officer goes here
            // For demonstration purposes, let's assume the duty is assigned successfully

            // Show success message
            showSuccessAlert("Duty assigned successfully!");

            // Prevent form submission
            return false;
        }

        function showSuccessAlert(message) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: message,
            });
        }
    </script>
</body>
</html>
