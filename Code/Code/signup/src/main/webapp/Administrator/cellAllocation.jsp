<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <a class="navbar-brand text-white" href="#">
            Prison Management System
        </a>
    </nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Cell Allocation</h1>

        <!-- Cell Allocation Form -->
        <form id="cellAllocationForm" onsubmit="return searchPrisoner()">
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
                <c:forEach var="prisoner" items="${matchedPrisoners}">
                    <option value="${prisoner}">${prisoner}</option>
                </c:forEach>
            </select>
            <button type="button" class="btn btn-info mt-2" onclick="allocateCell()">Allocate Cell</button>
        </div>

        <!-- Display Cell Allocation Result -->
        <div id="allocationResult" class="mt-4" style="display: none;">
            <h4>Cell Allocation Result:</h4>
            <p id="resultDetails"></p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script>
        function searchPrisoner() {
            // Your logic to search for matching prisoners and populate the select dropdown goes here
            // For demonstration purposes, let's assume we have a static list of prisoners
            var prisoners = ["Prisoner1", "Prisoner2", "Prisoner3"];

            // Populate the select dropdown with matching prisoners
            var selectDropdown = document.getElementById("selectedPrisoner");
            selectDropdown.innerHTML = "";
            for (var i = 0; i < prisoners.length; i++) {
                var option = document.createElement("option");
                option.value = prisoners[i];
                option.text = prisoners[i];
                selectDropdown.appendChild(option);
            }

            // Show the matched prisoners section
            document.getElementById("matchedPrisoners").style.display = "block";

            // Prevent form submission
            return false;
        }

        function allocateCell() {
            var selectedPrisoner = document.getElementById("selectedPrisoner").value;

            // Your logic to allocate a cell goes here
            // For demonstration purposes, let's assume we have 5 cells available
            var availableCells = 5;

            if (availableCells > 0) {
                // Allocate the cell and show success message
                availableCells--; // Decrease the count of available cells
                showSuccessAlert("Successfully Alloted");
                document.getElementById("resultDetails").innerHTML = "Cell Alloted to: " + selectedPrisoner;
            } else {
                // No cell available, show error message
                showErrorAlert("No cell available");
                document.getElementById("resultDetails").innerHTML = "No cell available for: " + selectedPrisoner;
            }

            // Show the allocation result section
            document.getElementById("allocationResult").style.display = "block";
        }

        function showSuccessAlert(message) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: message,
            });
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
