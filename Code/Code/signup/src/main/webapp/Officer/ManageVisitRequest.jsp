<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Visit Request</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light">
        <button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left" style="color: white;">Officer Panel</button>
    </nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Manage Visit Request</h1>

        <!-- View Visitor Form -->
        <form id="viewRecordForm" onsubmit="return searchVisitor()" method="post" action="ManageVisitRequest">
            <div class="form-group">
                <label for="visitorName">Enter Visitor Name:</label>
                <input type="text" class="form-control" id="visitorName" name="visitorName" required>
            </div>
            <button type="submit" class="btn btn-primary">Search Visitor</button>
        </form>

        <!-- Display Matched Visitors -->
        <div id="matchedVisitors" class="mt-4" style="display: none;">
            <h4>Matched Visitors:</h4>
            <select class="form-control" id="selectedVisitor" name="selectedVisitor" required>
                <!-- Options will be dynamically populated based on search results -->
            </select>

            <!-- Combine display form with the search form -->
            <button type="button" class="btn btn-success mt-2" onclick="showVisitorRecord()">View Visitor Record</button>
        </div>

        <!-- Display Visitor Record -->
        <div id="visitorRecord" class="mt-4" style="display: none;">
            <!-- Display visitor record here -->
            <!-- You may use a table or other HTML elements to display the record -->

    <form id="editVisitorForm" onsubmit="return editVisitor()" style="display: none;">
    <label for="editVisitorID">Edit Visitor ID:</label>
    <input type="text" class="form-control" id="editVisitorID" name="editVisitorID" required>

    <label for="editVisitorRequestStatus">Edit Visitor Request Status:</label>
    <select class="form-control" id="editVisitorRequestStatus" name="editVisitorRequestStatus" required>
        <option value="approved">Approved</option>
        <option value="denied">Denied</option>
    </select>

    <!-- Add any other visitor-specific fields here -->

    <button type="submit" class="btn btn-success mt-2">Edit Visitor</button>
</form>

        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- Your other scripts go here -->
    <!-- Add JavaScript functions for searching and editing visitors -->
    <script>
    
    function searchVisitor() {
    var visitorName = document.getElementById("visitorName").value;

    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Set up the request
    xhr.open('POST', '<%= request.getContextPath() %>/Officer/ManageVisitRequest', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

    // Set up the callback function for when the request is complete
    xhr.onload = function () {
        if (xhr.status >= 200 && xhr.status < 300) {
            try {
                var data = JSON.parse(xhr.responseText);

                // Check if the data contains matched visitors
                if (data && data.matchedVisitors) {
                    // Populate the select dropdown with matching visitors
                    var selectDropdown = document.getElementById("selectedVisitor");
                    selectDropdown.innerHTML = "";
                    for (var i = 0; i < data.matchedVisitors.length; i++) {
                        var option = document.createElement("option");
                        option.value = data.matchedVisitors[i];
                        option.text = data.matchedVisitors[i];
                        selectDropdown.appendChild(option);
                    }

                    // Show the matched visitors section
                    document.getElementById("matchedVisitors").style.display = "block";
                } else {
                    console.error('No matched visitors found.');
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

    // Send the request with the visitorName in the body
    xhr.send('visitorName=' + encodeURIComponent(visitorName));

    // Prevent form submission
    return false;
}
    
    function showVisitorRecord() {
        var selectedVisitor = document.getElementById("selectedVisitor").value;

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/ManageVisitRequest2', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    console.log('Raw response:', xhr.responseText); // Debugging line

                    var data = JSON.parse(xhr.responseText);

                    // Check if the data contains the visitor record
                    if (data && data.status === "success" && data.visitorRecord) {

                        visitorData = data.visitorRecord;

                        // Display the visitor record
                        var visitorRecordDiv = document.getElementById("visitorRecord");

                        // Check if visitorRecordDiv is found
                        if (visitorRecordDiv) {
                            console.log('Visitor Record Div:', visitorRecordDiv);

                            // Update style only if visitorRecordDiv is not null
                            visitorRecordDiv.style.display = "block";
                        } else {
                            console.error('Visitor Record Div not found.');
                        }

                        // Show the edit visitor form
                        var editVisitorForm = document.getElementById("editVisitorForm");
                        if (editVisitorForm) {
                            editVisitorForm.style.display = "block";

                            // Populate input fields with visitor data
                            document.getElementById("editVisitorID").value = visitorData.vid;
                            document.getElementById("editVisitorRequestStatus").value = visitorData.vstatus;
                        } else {
                            console.error('Edit Visitor Form not found.');
                        }

                    } else {
                        console.error('No valid visitor record found or unexpected response.');
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

        // Send the request with the selectedVisitor in the body
        xhr.send('selectedVisitor=' + encodeURIComponent(selectedVisitor));

        // Prevent form submission
        return false;
    }



    function editVisitor() {
        // Get edited visitor data from input fields
        var editedVisitor = {
            editedVisitorID: document.getElementById("editVisitorID").value,
            editedVisitorStatus: document.getElementById("editVisitorRequestStatus").value
        };

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/ManageVisitRequest3', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    var data = JSON.parse(xhr.responseText);

                    // Check the status returned from the servlet
                    if (data && data.status === "success") {
                        // Display a success message using SweetAlert
                        Swal.fire({
                            title: "Success!",
                            text: "Visitor updated successfully!",
                            icon: "success",
                        });
                    } else {
                        // Display an error message using SweetAlert
                        Swal.fire({
                            title: "Error!",
                            text: "Failed to update visitor. Please try again.",
                            icon: "error",
                        });
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

        // Send the request with the edited visitor data in the body
        xhr.send(
            "editVisitorID=" + encodeURIComponent(editedVisitor.editedVisitorID) +
            "&editVisitorRequestStatus=" + encodeURIComponent(editedVisitor.editedVisitorStatus)
        );

        // Prevent form submission
        return false;
    }
    
    function editPrisoner() {
        // Get edited prisoner data from input fields
        var editedPrisoner = {
            editedPrisonerID: document.getElementById("editPrisonerID").value,
            editedPrisonerStatus: document.getElementById("editPrisonerRequestStatus").value
        };

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/MedicalRequest3', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    var data = JSON.parse(xhr.responseText);

                    // Check the status returned from the servlet
                    if (data && data.status === "success") {
                        // Display a success message using SweetAlert
                        Swal.fire({
                            title: "Success!",
                            text: "Prisoner updated successfully!",
                            icon: "success",
                        });
                    } else {
                        // Display an error message using SweetAlert
                        Swal.fire({
                            title: "Error!",
                            text: "Failed to update prisoner. Please try again.",
                            icon: "error",
                        });
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

        // Send the request with the edited prisoner data in the body
        xhr.send(
            "editPrisonerID=" + encodeURIComponent(editedPrisoner.editedPrisonerID) +
            "&editPrisonerRequestStatus=" + encodeURIComponent(editedPrisoner.editedPrisonerStatus)
        );

        // Prevent form submission
        return false;
    }



    </script>
    </body>
</html>