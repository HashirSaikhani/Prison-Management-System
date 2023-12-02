<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cell Allocation</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="styles/admin.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='AdministratorHome.jsp'" class="btn btn-primary-left"style="color: white;">Admin Panel</button>
</nav>


    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Cell Allocation</h1>

        <!-- Display Matched Prisoners -->
        <div id="matchedPrisoners" class="mt-4">
            <h4>Matched Prisoners:</h4>
            <c:if test="${not empty matchedPrisoners}">
                <select class="form-control" id="selectedPrisoner" name="selectedPrisoner" required>
                    <c:forEach var="prisoner" items="${matchedPrisoners}">
                        <option value="${prisoner}">${prisoner}</option>
                    </c:forEach>
                </select>
                <button type="button" class="btn btn-info mt-2" onclick="allocateCell()">Allocate Cell</button>
            </c:if>
            <c:if test="${empty matchedPrisoners}">
                <p>No matching prisoners found.</p>
            </c:if>
        </div>
    </div>

     <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src= "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script>
        // Your JavaScript logic for handling cell allocation can go here
        function allocateCell() {
            // Placeholder function for demonstration purposes
            showSuccessAlert("Cell allocated successfully!");
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
