<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Visitor Record</title>
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
        <h1>View Visitor Record</h1>

        <!-- View Visitor Record Form -->
        <form id="viewRecordForm" onsubmit="return searchVisitor()" method="post" action="viewRecord">
        
                <label for="visitorName">Enter Visitor Name:</label>
                <input type="text" id="visitorName" name="visitorName" required><br>
       
            <button type="submit" class="btn btn-info"><span class="custom-span"></span>Search Visitor</button>
        </form>

        <!-- Display Matched Visitors -->
        <div id="matchedVisitors" style="display: none;">
            <h4>Matched Visitors:</h4>
            <select id="selectedVisitor" name="selectedVisitor" required>
                <!-- Options will be dynamically populated based on search results -->
            </select>

            <!-- Combine display form with the search form -->
            <br>
            <button type="button" class="btn btn-info" onclick="showVisitorRecord()"><span class="custom-span"></span>View Visitor Record</button>
        </div>

        <!-- Display Visitor Record -->
        <div id="visitorRecord" style="display: none;">
            <!-- Display visitor record here -->
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
    <!-- Your other scripts if any -->
    
   <script> 
    function searchVisitor() {
    var visitorName = document.getElementById("visitorName").value;

    // Create a new XMLHttpRequest object
    var xhr = new XMLHttpRequest();

    // Set up the request
    xhr.open('POST', '<%= request.getContextPath() %>/Officer/viewVisitorRecord', true);
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
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/viewVisitorRecord2', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    console.log('Raw response:', xhr.responseText); // Debugging line

                    var data = JSON.parse(xhr.responseText);

                    // Check if the data contains the visitor record
                    if (data && data.status === "success" && data.visitorRecord) {
                        // Display the visitor record
                        var visitorRecordDiv = document.getElementById("visitorRecord");
                        visitorRecordDiv.innerHTML = "<h4>Visitor Record:</h4>" +
                            "ID: " + data.visitorRecord.vid +
                            "<br>Name: " + data.visitorRecord.vname +
                            "<br>Prisoner to Visit: " + data.visitorRecord.vpname +
                            "<br>Visit Request Status: " + data.visitorRecord.vstatus +
                            "<br>";

                        // Show the visitor record section
                        visitorRecordDiv.style.display = "block";
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


    
    
    
    
    
    
    </script> 
</body>
</html>
