<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Update Prisoner Record</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Officer/styles/officer.css">
</head>
<body>
	<div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Officer/OfficerHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h2>Update Prisoner Record</h2>

        <!-- View Prisoner Record Form -->
        <form id="viewRecordForm" onsubmit="return searchPrisoner()" method="post" action="UpdatePrisonerRecord">
      
                <label for="prisonerName">Enter Prisoner Name:</label>
                <input type="text" id="prisonerName" name="prisonerName" required><br>
         
            <button type="submit" class="btn btn-info"><span class="custom-span"></span>Search Prisoner</button>
        </form>

        <!-- Display Matched Prisoners -->
        <div id="matchedPrisoners" style="display: none;">
            <h4>Matched Prisoners:</h4>
            <select id="selectedPrisoner" name="selectedPrisoner" required>
                <!-- Options will be dynamically populated based on search results -->
            </select>

            <!-- Combine display form with the search form -->
            <br>
            <button type="button" class="btn btn-info" onclick="showPrisonerRecord()"><span class="custom-span"></span>View Prisoner Record</button>
        </div>

        <!-- Display Prisoner Record -->
        <div id="prisonerRecord" style="display: none;">
            <!-- Display prisoner record here -->
            <!-- You may use a table or other HTML elements to display the record -->
        </div>


        <form id="editPrisonerForm" onsubmit="return editPrisoner()" style="display: none;">
        <div class="btn-group-horizontal">
    <label for="editPrisonerID">Edit Prisoner ID:</label>
    <input type="text" id="editPrisonerID" name="editPrisonerID" required>

    <label for="editPrisonerName">Edit Prisoner Name:</label>
    <input type="text" id="editPrisonerName" name="editPrisonerName" required>

    <label for="editPrisonerSentence">Edit Prisoner Sentence:</label>
    <input type="text" id="editPrisonerSentence" name="editPrisonerSentence" required>

    <label for="editPrisonerCrime">Edit Prisoner Crime:</label>
    <input type="text" id="editPrisonerCrime" name="editPrisonerCrime" required>

    <label for="editPrisonerRoomID">Edit Prisoner Room ID:</label>
    <input type="text" id="editPrisonerRoomID" name="editPrisonerRoomID" required>
    </div>>

    <!-- Add other fields as needed for editing prisoner information -->

    <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Edit Prisoner</button>
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
    

    <script>
    
    function searchPrisoner() {
        var prisonerName = document.getElementById("prisonerName").value;

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/UpdatePrisonerRecord', true);
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
     
    function showPrisonerRecord() {
        var selectedPrisoner = document.getElementById("selectedPrisoner").value;

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/UpdatePrisonerRecord2', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    console.log('Raw response:', xhr.responseText); // Debugging line

                    var data = JSON.parse(xhr.responseText);

                    // Check if the data contains the prisoner record
                    if (data && data.status === "success" && data.prisonerRecord) {

                        prisonerData = data.prisonerRecord;

                        // Display the prisoner record
                        var prisonerRecordDiv = document.getElementById("prisonerRecord");
                        prisonerRecordDiv.innerHTML = "<h4>Prisoner Record:</h4>" +
                            "ID: " + data.prisonerRecord.pid +
                            "<br>Name: " + data.prisonerRecord.pname +
                            "<br>Sentence: " + data.prisonerRecord.psentence +
                            "<br>Crime: " + data.prisonerRecord.crime +
                            "<br>Room ID: " + data.prisonerRecord.roomId +
                            "<br>";

                        // Show the prisoner record section
                        prisonerRecordDiv.style.display = "block";

                        // Show the edit prisoner form
                        var editPrisonerForm = document.getElementById("editPrisonerForm");
                        editPrisonerForm.style.display = "block";

                        // Populate input fields with prisoner data
                        var prisonerData = data.prisonerRecord;
                        document.getElementById("editPrisonerID").value = prisonerData.pid;
                        document.getElementById("editPrisonerName").value = prisonerData.pname;
                        document.getElementById("editPrisonerSentence").value = prisonerData.psentence;
                        document.getElementById("editPrisonerCrime").value = prisonerData.pcrime;
                        document.getElementById("editPrisonerRoomID").value = prisonerData.proomId;

                    } else {
                        console.error('No valid prisoner record found or unexpected response.');
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

        // Send the request with the selectedPrisoner in the body
        xhr.send('selectedPrisoner=' + encodeURIComponent(selectedPrisoner));

        // Prevent form submission
        return false;
    }

       
    function editPrisoner() {
        // Get edited prisoner data from input fields
        var editedPrisoner = {
            editedPrisonerID: document.getElementById("editPrisonerID").value,
            editedPrisonerName: document.getElementById("editPrisonerName").value,
            editedPrisonerSentence: document.getElementById("editPrisonerSentence").value,
            editedPrisonerCrime: document.getElementById("editPrisonerCrime").value,
            editedPrisonerRoomID: document.getElementById("editPrisonerRoomID").value
        };

        // Create a new XMLHttpRequest object
        var xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/UpdatePrisonerRecord3', true);
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
            "&editPrisonerName=" + encodeURIComponent(editedPrisoner.editedPrisonerName) +
            "&editPrisonerSentence=" + encodeURIComponent(editedPrisoner.editedPrisonerSentence) +
            "&editPrisonerCrime=" + encodeURIComponent(editedPrisoner.editedPrisonerCrime) +
            "&editPrisonerRoomID=" + encodeURIComponent(editedPrisoner.editedPrisonerRoomID)
        );

        // Prevent form submission
        return false;
    }

    </script>
</body>
</html>
