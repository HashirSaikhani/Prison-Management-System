<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Record Visitors - Officer Panel</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css"> <!-- Assuming you have a separate CSS file for officer styles -->
</head>
<body>

  <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
</nav>
    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Record Visitors</h1>

        <!-- Record Visitors Form -->
        <form id="recordVisitorsForm" onsubmit="return recordVisitors()">
            <div class="form-group">
                <label for="visitorName">Enter Visitor Name:</label>
                <input type="text" class="form-control" id="visitorName" name="visitorName" required>
            </div>
            <button type="submit" class="btn btn-primary">Retrieve Prisoners</button>
        </form>

        <!-- Display Prisoners List -->
        <div id="prisonersList" class="mt-4" style="display: none;">
            <h4>Select Prisoners:</h4>
            <select multiple class="form-control" id="selectedPrisoners" name="selectedPrisoners" required>
                <!-- Options will be dynamically populated based on retrieved prisoners -->
            </select>
            <button type="button" class="btn btn-info mt-2" onclick="printRecord()">Print Record</button>
        </div>

        <!-- Display Visitor's Record -->
        <div id="visitorRecord" class="mt-4" style="display: none;">
            <h4>Visitor's Record:</h4>
            <!-- Your logic to display the record of the selected visitor and prisoners goes here -->
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
        function recordVisitors() {
            var visitorName = document.getElementById("visitorName").value;

            // Your logic to retrieve a list of prisoners based on the visitor's name goes here
            // For demonstration purposes, let's assume we have a static list of prisoners
            var prisoners = ["Prisoner1", "Prisoner2", "Prisoner3"];

            // Populate the select dropdown with prisoners
            var selectDropdown = document.getElementById("selectedPrisoners");
            selectDropdown.innerHTML = "";
            for (var i = 0; i < prisoners.length; i++) {
                var option = document.createElement("option");
                option.value = prisoners[i];
                option.text = prisoners[i];
                selectDropdown.appendChild(option);
            }

            // Show the prisoners list section
            document.getElementById("prisonersList").style.display = "block";

            // Prevent form submission
            return false;
        }

        function printRecord() {
            var visitorName = document.getElementById("visitorName").value;
            var selectedPrisoners = document.getElementById("selectedPrisoners").selectedOptions;

            // Your logic to handle the print action for the selected visitor and prisoners goes here
            // You can use AJAX to communicate with the server and generate/print the visitor's record

            // Display a success message (for demonstration purposes)
            var recordDetails = "Visitor: " + visitorName + "<br>Selected Prisoners: ";
            for (var i = 0; i < selectedPrisoners.length; i++) {
                recordDetails += selectedPrisoners[i].text + ", ";
            }

            // Remove the trailing comma and display the record
            recordDetails = recordDetails.slice(0, -2);
            document.getElementById("recordDetails").innerHTML = recordDetails;
            document.getElementById("visitorRecord").style.display = "block";
        }
    </script>
</body>
</html>
