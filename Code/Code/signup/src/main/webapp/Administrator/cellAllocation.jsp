<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cell Allocation</title>
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
    
      <div style="position: absolute; top: 5px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>


    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Cell Allocation</h1>

        <!-- Cell Allocation Form -->
<form id="cellAllocationForm" onsubmit="return displayMatchedPrisoners()" method="post" action="cellAllocation">
    <div class="form-group">
        <label for="prisonerName">Enter Prisoner Name:</label>
        <input type="text" class="form-control" id="prisonerName" name="prisonerName" required>
    </div>
    <button type="submit" class="btn btn-primary">Search Prisoner</button>
</form>

<!-- Display Matched Prisoners -->
<div id="matchedPrisoners" class="mt-4" style="display: none;">
    <h4>Matched Prisoners:</h4>
    <select class="form-control" id="selectedPrisoner" name="selectedPrisoner" required>
        <!-- Options will be dynamically populated based on search results -->
    </select>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- Custom JavaScript for form validation and SweetAlert -->
<script>
    function displayMatchedPrisoners(prisoners) {
        var matchedPrisonersSelect = document.getElementById("selectedPrisoner");
        matchedPrisonersSelect.innerHTML = ""; // Clear previous content

        for (var i = 0; i < prisoners.length; i++) {
            var option = document.createElement("option");
            option.value = prisoners[i];
            option.text = prisoners[i];
            matchedPrisonersSelect.appendChild(option);
        }

        // Show the matched prisoners section
        document.getElementById("matchedPrisoners").style.display = "block";
        return false; // Prevent form submission
    }
</script>

       

       

        <script>

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
