<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Assigned Duty</title>
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
        <h1 class="mb-4">View Assigned Duty</h1>

        <!-- View Officer Duties Form -->
        <form id="viewDutiesForm" onsubmit="return showOfficerRecord()" method="post" action="viewDuties">
       
                <label for="officerId">Enter Officer ID:</label>
                <input type="text" id="officerId" name="officerId" required><br>
       
            <button type="submit" class="btn btn-info"><span class="custom-span"></span>Search Duty</button>
        </form>

        <!-- Display Officer Duties -->
        <div id="officerDuties" style="display: none;">
            
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
  
    function showOfficerRecord() {
        const selectedOfficer = document.getElementById("officerId").value;

        // Create a new XMLHttpRequest object
        const xhr = new XMLHttpRequest();

        // Set up the request
        xhr.open('POST', '<%= request.getContextPath() %>/Officer/viewDuties', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        // Log the raw response for debugging
        console.log('Raw response before request:', xhr.responseText);

        // Set up the callback function for when the request is complete
        xhr.onload = function () {
            console.log('Raw response after request:', xhr.responseText);

            if (xhr.status >= 200 && xhr.status < 300) {
                try {
                    const data = JSON.parse(xhr.responseText);
                    console.log('Parsed JSON data:', data);

                    // Check if the data contains the officer record
                    if (data && data.status === "success" && data.officerRecord) {
                        var officerRecordDiv = document.getElementById("officerDuties");
                        officerRecordDiv.innerHTML = "<h4>Officer Record:</h4>" +
                            "<br>Name: " + data.officerRecord.oname +
                            "<br>Duty: " + data.officerRecord.oduty +
                            "<br>";
                        // Show the officer details section
                        officerRecordDiv.style.display = "block";
                    } else if (data && data.status === "notFound") {
                        // Show SweetAlert indicating officer not found
                        Swal.fire({
                            icon: 'error',
                            title: 'Officer Not Found',
                            text: 'No record found for the provided Officer ID',
                        });
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
        xhr.send('officerId=' + encodeURIComponent(selectedOfficer));

        // Prevent form submission
        return false;
    }

    </script>
</body>
</html>
