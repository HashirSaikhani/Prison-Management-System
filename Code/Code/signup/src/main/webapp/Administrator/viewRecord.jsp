<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Prisoner Record</title>
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
        <h1>View Prisoner Record</h1>

        <!-- View Prisoner Record Form -->
        <form id="viewRecordForm" onsubmit="return searchPrisoner()" method="post" action="viewRecord">
                <label for="prisonerName">Enter Prisoner Name:</label>
                <input type="text" class="form-control" id="prisonerName" name="prisonerName" required><br>
            <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Search Prisoner</button>
        </form>

        <!-- Display Matched Prisoners -->
        <div id="matchedPrisoners" style="display: none;">
            <h4>Matched Prisoners:</h4>
            <select id="selectedPrisoner" name="selectedPrisoner" required>
                <!-- Options will be dynamically populated based on search results -->
            </select>

            <!-- Combine display form with the search form -->
            <br>
            <button type="button" class="btn btn-primary" onclick="showPrisonerRecord()"><span class="custom2-span"></span>View Prisoner Record</button>
        </div>

        <!-- Display Prisoner Record -->
        <div id="prisonerRecord" style="display: none;">
            <!-- Display prisoner record here -->
            <!-- You may use a table or other HTML elements to display the record -->
        </div>
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
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/viewRecord', true);
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
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/viewRecord2', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        console.log('Raw response:', xhr.responseText); // Debugging line

                        var data = JSON.parse(xhr.responseText);

                        // Check if the data contains the prisoner record
                        if (data && data.status === "success" && data.prisonerRecord) {
                            // Display the prisoner record
                            var prisonerRecordDiv = document.getElementById("prisonerRecord");
                            prisonerRecordDiv.innerHTML = "<h4>Prisoner Record:</h4>" +
                                "ID: " + data.prisonerRecord.pid +
                                "<br>Name: " + data.prisonerRecord.pname +
                                "<br>Sentence: " + data.prisonerRecord.psentence +
                                " years<br>Crime: " + data.prisonerRecord.pcrime +
                                "<br>";

                            // Show the prisoner record section
                            prisonerRecordDiv.style.display = "block";
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



    </script>
</body>
</html>
