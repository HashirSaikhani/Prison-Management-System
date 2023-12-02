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
<<<<<<< HEAD
    <link rel="stylesheet" href="styles/admin.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <a class="navbar-brand text-white" href="#">
            Prison Management System
        </a>
    </nav>
=======
      <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left" style="color: white;">Admin Panel</button>
</nav>

>>>>>>> 9f38be96cc019d5a3ef3260dce7abea6951dea4e

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Cell Allocation</h1>

        <!-- Cell Allocation Form -->
      <form id="cellAllocationForm" onsubmit="return searchPrisoner()" method="post" action="cellAllocation">
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
                    <!-- Options will be dynamically populated based on the list of allocated cells -->
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

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Administrator/cellAllocation', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    var data = JSON.parse(xhr.responseText);

                    // Check if the data contains matched prisoners
                    if (data && data.matchedPrisoners) {
                        // Populate the select dropdown with matching prisoners
                        var selectDropdown = document.getElementById("selectedPrisoner");
                        selectDropdown.innerHTML = "";
                        for (var i = 0; i < data.matchedPrisoners.length; i++) {
                            var option = document.createElement("option");
                            option.value = data.matchedPrisoners[i];
                            option.text = data.matchedPrisoners[i];
                            selectDropdown.appendChild(option);
                        }

                        // Show the matched prisoners section
                        document.getElementById("matchedPrisoners").style.display = "block";

                        // Check if allocatedCellIds are available
                        if (data.allocatedCellIds) {
                            // Populate the numOfCells dropdown dynamically
                            populateNumOfCellsDropdown(data.allocatedCellIds);
                        } else {
                            console.error('Allocated cell IDs not available.');
                        }
                    } else {
                        console.error('No matched prisoners found.');
                    }
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
            } else {
                console.error('Request failed with status:', xhr.status);
            }
        };

        // Set up the callback function for network errors
        xhr.onerror = function () {
            console.error('Network error occurred');
        };

        // Send the request with the prisonerName in the body
        xhr.send('prisonerName=' + encodeURIComponent(prisonerName));

        // Prevent form submission
        return false;
    }

<<<<<<< HEAD
        
        function populateNumOfCellsDropdown(allocatedCellIds) {
            // Your implementation to populate the numOfCells dropdown based on allocatedCellIds
            var numOfCellsDropdown = document.getElementById("numOfCells");
            numOfCellsDropdown.innerHTML = "";

            for (var i = 0; i < allocatedCellIds.length; i++) {
                var option = document.createElement("option");
                option.value = allocatedCellIds[i];
                option.text = "Cell " + allocatedCellIds[i];
                numOfCellsDropdown.appendChild(option);
            }
        }

        
        function allocateCell() {
            var selectedPrisoner = document.getElementById("selectedPrisoner").value;
            var selectedCell = document.getElementById("numOfCells").value;

            // Create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/cellAllocation', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        var data = JSON.parse(xhr.responseText);

                        // Check if the data contains allocation information
                        if (data && data.success) {
                            // Display success message using SweetAlert2 or any other method
                            showSuccessAlert('Cell allocated successfully');

                            // Optionally, you can update the UI or perform other actions
                            // For example, hide the matched prisoners section
                            document.getElementById("matchedPrisoners").style.display = "none";

                            // Clear the selected prisoner and cell in the form
                            document.getElementById("selectedPrisoner").value = "";
                            document.getElementById("numOfCells").value = "";

                            // Optionally, update other parts of the UI based on your requirements
                        } else {
                            console.error('Cell allocation failed.');
                        }
                    } catch (error) {
                        console.error('Error parsing JSON:', error);
                    }
                } else {
                    console.error('Request failed with status:', xhr.status);
                }
            };

            // Set up the callback function for network errors
            xhr.onerror = function () {
                console.error('Network error occurred');
            };

            // Prepare the request body with selected prisoner and cell
            var requestBody = 'selectedPrisoner=' + encodeURIComponent(selectedPrisoner) +
                              '&selectedCell=' + encodeURIComponent(selectedCell);

            // Send the request
            xhr.send(requestBody);

            // Prevent form submission
            return false;
        }
=======
        <script>
>>>>>>> 9f38be96cc019d5a3ef3260dce7abea6951dea4e

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
