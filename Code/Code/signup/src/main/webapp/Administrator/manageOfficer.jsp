<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Officer</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left" style="color: white;">Admin Panel</button>
    </nav>

    <!-- Content -->
<div class="container mt-4">
    <h1 class="mb-4">Manage Officer</h1>

    <!-- View Officer Record Form -->
    <form id="viewRecordForm" onsubmit="return searchOfficer()" method="post" action="viewRecord">
        <div class="form-group">
            <label for="officerName">Enter Officer Name:</label>
            <input type="text" class="form-control" id="officerName" name="officerName" required>
        </div>
        <button type="submit" class="btn btn-primary">Search Officer</button>
    </form>

    <!-- Display Matched Officers -->
    <div id="matchedOfficers" class="mt-4" style="display: none;">
        <h4>Matched Officers:</h4>
        <select class="form-control" id="selectedOfficer" name="selectedOfficer" required>
            <!-- Options will be dynamically populated based on search results -->
        </select>

        <!-- Combine display form with the search form -->
        <button type="button" class="btn btn-success mt-2" onclick="showOfficerRecord()">View Officer Record</button>
    </div>

    <!-- Display Officer Record -->
    <div id="officerRecord" class="mt-4" style="display: none;">
        <!-- Display officer record here -->
        <h4>Officer Record:</h4>
        <div id="officerInfo">
            <!-- Officer information will be displayed here -->
        </div>

        <!-- Editable fields for Officer information -->
        <div id="editableFields" style="display: none;">
            <label for="editOfficerName">Edit Officer Name:</label>
            <input type="text" class="form-control" id="editOfficerName" name="editOfficerName" required>

            <label for="editOfficerEmail">Edit Officer Email:</label>
            <input type="text" class="form-control" id="editOfficerEmail" name="editOfficerEmail" required>

            <label for="editOfficerPassword">Edit Officer Password:</label>
            <input type="password" class="form-control" id="editOfficerPassword" name="editOfficerPassword" required>

            <label for="editOfficerMobile">Edit Officer Mobile:</label>
            <input type="text" class="form-control" id="editOfficerMobile" name="editOfficerMobile" required>

            <label for="editOfficerType">Edit Officer Type:</label>
            <input type="text" class="form-control" id="editOfficerType" name="editOfficerType" required>

            <label for="editOfficerDuty">Edit Officer Duty:</label>
            <input type="text" class="form-control" id="editOfficerDuty" name="editOfficerDuty" required>

            <!-- Add other editable fields as needed -->

            <!-- Button to submit changes -->
            <button type="button" class="btn btn-primary mt-2" onclick="updateRecord()">Submit Changes</button>
        </div>

        <!-- Button to toggle between display and edit mode -->
        <button type="button" class="btn btn-warning mt-2" onclick="toggleEditMode()">Edit Officer Record</button>
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
        function searchOfficer() {
        	console.log('sheach function called');
            var officerName = document.getElementById("officerName").value;

            // Create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/manageOfficer', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        var data = JSON.parse(xhr.responseText);

                        // Check if the data contains matched officers
                        if (data && data.matchedOfficers) {
                            // Populate the select dropdown with matching officers
                            var selectDropdown = document.getElementById("selectedOfficer");
                            selectDropdown.innerHTML = "";
                            for (var i = 0; i < data.matchedOfficers.length; i++) {
                                var option = document.createElement("option");
                                option.value = data.matchedOfficers[i];
                                option.text = data.matchedOfficers[i];
                                selectDropdown.appendChild(option);
                            }

                            // Show the matched officers section
                            document.getElementById("matchedOfficers").style.display = "block";
                        } else {
                            console.error('No matched officers found.');
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

            // Send the request with the officerName in the body
            xhr.send('officerName=' + encodeURIComponent(officerName));

            // Prevent form submission
            return false;
        }

        function showOfficerRecord() {
            var selectedOfficer = document.getElementById("selectedOfficer").value;

            // Create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/manageOfficer2', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
    try {
        console.log('Raw response:', xhr.responseText);

        var data = JSON.parse(xhr.responseText);

        // Check if the data contains the officer record
        if (data && data.status === "success" && data.officerRecord) {
            // Display the officer record
            var officerInfoDiv = document.getElementById("officerRecord");
            
            // Check if officerInfoDiv exists before accessing its properties
            if (officerInfoDiv) {
                officerInfoDiv.innerHTML = 
                    "ID: " + data.officerRecord.oid +
                    "<br>Name: " + data.officerRecord.oname +
                    "<br>Email: " + data.officerRecord.oemail +
                    "<br>Password: " + data.officerRecord.opwd +
                    "<br>Mobile: " + data.officerRecord.omobile +
                    "<br>Duty: " + data.officerRecord.oduty +
                    "<br>";

                // Show the officer record section
                officerInfoDiv.style.display = "block";

                // Hide the editable fields initially
                var editableFieldsDiv = document.getElementById("editableFields");
                if (editableFieldsDiv) {
                    editableFieldsDiv.style.display = "none";
                }
            } else {
                console.error('Element with ID "officerInfo" not found.');
            }
        } else {
            console.error('No valid officer record found or unexpected response.');
        }
    } catch (error) {
        console.error('Error handling response:', error);
    }
};

            // Set up the callback function for network errors
            xhr.onerror = function () {
                console.error('Network error occurred');
            };

            // Send the request with the selectedOfficer in the body
            xhr.send('selectedOfficer=' + encodeURIComponent(selectedOfficer));

            // Prevent form submission
            return false;
        }



        // Toggle between display and edit mode
        function toggleEditMode() {
        	console.log('toggle function called');
            var officerInfoDiv = document.getElementById("officerInfo");
            var editableFieldsDiv = document.getElementById("editableFields");

            if (officerInfoDiv.style.display === "block") {
                // Switch to edit mode
                officerInfoDiv.style.display = "none";
                editableFieldsDiv.style.display = "block";

                // Populate editable fields with current values
                var officerName = document.getElementById("officerName").innerText.trim();
                document.getElementById("editOfficerName").value = officerName;

                // Add similar lines for other editable fields
            } else {
                // Switch to display mode
                officerInfoDiv.style.display = "block";
                editableFieldsDiv.style.display = "none";
            }
        }

     // Function to handle submitting changes
        function updateRecord() {
        	console.log('updateRecord function called');
            // Get values from editable fields
            var editedOfficerName = document.getElementById("editOfficerName").value;

            // Add similar lines for other editable fields

            // Perform the update by sending data to the server
            var xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/manageOfficer3', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        console.log('Raw response:', xhr.responseText); // Debugging line

                        var data = JSON.parse(xhr.responseText);

                        // Check if the update was successful
                        if (data && data.status === "success") {
                            // Show a success message (you can use SweetAlert or other methods)
                            alert('Officer record updated successfully!');
                            
                            // Refresh the displayed officer record with the updated information
                            showOfficerRecord();
                        } else {
                            console.error('Update failed or unexpected response.');
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

            // Send the request with the edited data in the body
            // You need to modify this line to include other editable fields
            xhr.send('editedOfficerName=' + encodeURIComponent(editedOfficerName));

            // Prevent form submission
            return false;
        }

    </script>
</body>
</html>
