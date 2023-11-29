<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Record - Administrator Home Hashir</title>
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
        <h1 class="mb-4">View Record</h1>

        <!-- View Record Form -->
        <form id="viewRecordForm" onsubmit="return searchPrisoner()">
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
            <button type="button" class="btn btn-info mt-2" onclick="viewRecord()">View Record</button>
        </div>

        <!-- Display Prisoner Record -->
        <div id="prisonerRecord" class="mt-4" style="display: none;">
            <h4>Prisoner Record:</h4>
            <!-- Your logic to display the record of the selected prisoner goes here -->
            <p id="recordDetails"></p>
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

            // Prevent form submission
            return false;
        }

        function viewRecord() {
            var selectedPrisoner = document.getElementById("selectedPrisoner").value;

            // Your logic to retrieve and display the record of the selected prisoner goes here
            // For demonstration purposes, let's assume we have static record details
            var recordDetails = "Name: " + selectedPrisoner + "<br>Crime: Crime details<br>Sentence: Sentence details";

            // Display the prisoner record
            document.getElementById("recordDetails").innerHTML = recordDetails;
            document.getElementById("prisonerRecord").style.display = "block";
        }
    </script>
</body>
</html>
