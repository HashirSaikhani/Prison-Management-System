<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Cell Allocation - Administrator Home </title>
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
    <button onclick="window.location.href='AdministratorHome.jsp'" class="btn btn-primary">Go to Administrator Home</button>
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
            </select>
            <div class="form-group">
                <label for="numOfCells">Select Cell to Allocate:</label>
                <select class="form-control" id="numOfCells" name="numOfCells" required>
                    <!-- Options will be dynamically populated based on the range of values -->
                </select>
            </div>
            <button type="button" class="btn btn-info mt-2" onclick="allocateCell()">Allocate Cell</button>
        </div>

        <!-- Cell Allocation Information -->
        <div id="cellAllocationInfo" class="mt-4" style="display: none;">
            <h4>Cell Allocation Information:</h4>
            <p id="cellInfoDetails"></p>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script>
        function searchPrisoner() {
            var prisonerName = document.getElementById("prisonerName").value;

            // Your logic to search for matching prisoners and populate the select dropdown goes here
            // For example, you can make an AJAX call to the server to get the list of matching prisoners

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

            // Populate the numOfCells dropdown dynamically
            populateNumOfCellsDropdown();

            // Prevent form submission
            return false;
        }

        function populateNumOfCellsDropdown() {
            var numOfCellsDropdown = document.getElementById("numOfCells");
            numOfCellsDropdown.innerHTML = "";

            // Set the range of values for the dropdown
            var minCells = 1;
            var maxCells = 3;

            // Populate options based on the range
            for (var i = minCells; i <= maxCells; i++) {
                var option = document.createElement("option");
                option.value = i;
                option.text = i.toString();
                numOfCellsDropdown.appendChild(option);
            }
        }

        function allocateCell() {
            var selectedPrisoner = document.getElementById("selectedPrisoner").value;
            var numOfCells = document.getElementById("numOfCells").value;

            // Your logic to allocate the specified number of cells goes here
            // For demonstration purposes, let's assume the cells are successfully allocated
            var successMessage = "Successfully Allocated ";

           

            showSuccessAlert(successMessage);
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
