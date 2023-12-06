<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Officer</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>
    <div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <h2>Manage Officer</h2>

        <!-- View Officer Record Form -->
        <form id="viewRecordForm" onsubmit="return searchOfficer()" method="post" action="viewRecord">
                <label for="officerName">Enter Officer Name:</label>
                <input type="text" class="form-control" id="officerName" name="officerName" required><br>
                <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Search Officer</button>
        </form>

        <!-- Display Matched Officers -->
        <div id="matchedOfficers" style="display: none;">
            <h4>Matched Officers:</h4>
            <select id="selectedOfficer" name="selectedOfficer" required>
                <!-- Options will be dynamically populated based on search results -->
            </select>
        </div>
        <!-- Combine display form with the search form -->
            <button type="button" class="btn btn-primary" onclick="showOfficerRecord()"><span class="custom2-span"></span>View Officer Record</button>

        <!-- Display Officer Record -->
        <div id="officerRecord" class="mt-4" style="display: none;">
            <!-- Display officer record here -->
            <!-- You may use a table or other HTML elements to display the record -->
        </div>
    
    <!-- Edit Officer Form -->
<form id="editOfficerForm" onsubmit="return editOfficer()" style="display: none;">


     <label for="editOfficerID">Edit Officer ID:</label>
    <input type="text" id="editOfficerID" name="editOfficerID" required>
     
    <label for="editOfficerName">Edit Officer Name:</label>
    <input type="text" id="editOfficerName" name="editOfficerName" required>

    <label for="editOfficerEmail">Edit Officer Email:</label>
    <input type="text" id="editOfficerEmail" name="editOfficerEmail" required>

    <label for="editOfficerPassword">Edit Officer Password:</label>
    <input type="password" id="editOfficerPassword" name="editOfficerPassword" required>

    <label for="editOfficerMobile">Edit Officer Mobile:</label>
    <input type="text" id="editOfficerMobile" name="editOfficerMobile" required>

    <label for="editOfficerDuty">Edit Officer Duty:</label>
    <input type="text" id="editOfficerDuty" name="editOfficerDuty" required>

     <br>
    <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Edit Officer</button>
</form>

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
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        console.log('Raw response:', xhr.responseText); // Debugging line

                        var data = JSON.parse(xhr.responseText);

                        // Check if the data contains the officer record
                        if (data && data.status === "success" && data.officerRecord) {
                        	
                        	officerData = data.officerRecord;
                        	
                            // Display the officer record
                            var officerRecordDiv = document.getElementById("officerRecord");
                            officerRecordDiv.innerHTML = "<h4>Officer Record:</h4>" +
                                "ID: " + data.officerRecord.oid +
                                "<br>Name: " + data.officerRecord.oname +
                                "<br>Email: " + data.officerRecord.oemail +
                                "<br>Password: " + data.officerRecord.opwd +
                                "<br>Mobile: " + data.officerRecord.omobile +
                                "<br>Duty: " + data.officerRecord.oduty +
                                "<br>";

                            // Show the officer record section
                            officerRecordDiv.style.display = "block";
                            
                            // Show the edit officer form
                            var editOfficerForm = document.getElementById("editOfficerForm");
                            editOfficerForm.style.display = "block";

                            // Populate input fields with officer data
                            var officerData = data.officerRecord;
                            document.getElementById("editOfficerID").value = officerData.oid;
                            document.getElementById("editOfficerName").value = officerData.oname;
                            document.getElementById("editOfficerEmail").value = officerData.oemail;
                            document.getElementById("editOfficerPassword").value = officerData.opwd;
                            document.getElementById("editOfficerMobile").value = officerData.omobile;
                            document.getElementById("editOfficerDuty").value = officerData.oduty;
                        } else {
                            console.error('No valid officer record found or unexpected response.');
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

            // Send the request with the selectedOfficer in the body
            xhr.send('selectedOfficer=' + encodeURIComponent(selectedOfficer));

            // Prevent form submission
            return false;
        }
        
        
     
        function editOfficer() {
            // Get edited officer data from input fields
            console.log("1");
            
            var editedOfficer = {
            	editedOfficerID: document.getElementById("editOfficerID").value,
                editedOfficerName: document.getElementById("editOfficerName").value,
                editedOfficerEmail: document.getElementById("editOfficerEmail").value,
                editedOfficerPassword: document.getElementById("editOfficerPassword").value,
                editedOfficerMobile: document.getElementById("editOfficerMobile").value,
                editedOfficerDuty: document.getElementById("editOfficerDuty").value
            };

            // Create a new XMLHttpRequest object
            var xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/manageOfficer3', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            console.log("2");

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        var data = JSON.parse(xhr.responseText);
                        console.log("3");

                        // Check the status returned from the servlet
                        if (data && data.status === "success") {
                            console.log("4");
                            // Display a success message using SweetAlert
                            Swal.fire({
                                title: "Success!",
                                text: "Officer updated successfully!",
                                icon: "success",
                            });
                        } else {
                            // Display an error message using SweetAlert
                            Swal.fire({
                                title: "Error!",
                                text: "Failed to update officer. Please try again.",
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

            console.log("5");
            
            
         // Send the request with the edited officer data in the body
           xhr.send("editOfficerID=" + encodeURIComponent(editedOfficer.editedOfficerID) +
    "&editOfficerName=" + encodeURIComponent(editedOfficer.editedOfficerName) +
    "&editOfficerEmail=" + encodeURIComponent(editedOfficer.editedOfficerEmail) +
    "&editOfficerPassword=" + encodeURIComponent(editedOfficer.editedOfficerPassword) +
    "&editOfficerMobile=" + encodeURIComponent(editedOfficer.editedOfficerMobile) +
    "&editOfficerDuty=" + encodeURIComponent(editedOfficer.editedOfficerDuty));

            console.log("6");

            // Prevent form submission
            return false;
        }



    </script>
</body>
</html>
