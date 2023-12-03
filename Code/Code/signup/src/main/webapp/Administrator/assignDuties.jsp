<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Assign Duty</title>
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
        <h1 class="mb-4">Assign Duty</h1>

        <!-- Assign Duty Form -->
        <form id="assignDutyForm" onsubmit="return searchOfficer()" method="post" action="assignDuties">
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

            <!-- Select Duty Dropdown -->
            <label for="duty">Select Duty:</label>
            <select class="form-control" id="officerDuty" name="officerDuty" required>
                <option value="Patrol">Patrol</option>
                <option value="Gate Security">Gate Security</option>
                <option value="Office Duty">Office Duty</option>
                <option value="Food Inspector">Food Inspector</option>
                <option value="Search Inspection">Search Inspection</option>
                <option value="Cell Surveillance">Cell Surveillance</option>
                <option value="Crises Intervention">Crises Intervention</option>
            </select>

            <!-- Assign Duty Button -->
            <button type="button" class="btn btn-primary mt-2" onclick="assignDuties2()">Assign Duty</button>
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
            xhr.open('POST', '<%= request.getContextPath() %>/Administrator/assignDuties', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        var data = JSON.parse(xhr.responseText);

                     // Check if the data contains matched officers
                        if (data && data.matchedofficers) {
                            // Populate the select dropdown with matching officers
                            var selectDropdown = document.getElementById("selectedOfficer");
                            selectDropdown.innerHTML = "";
                            for (var i = 0; i < data.matchedofficers.length; i++) {
                                var option = document.createElement("option");
                                option.value = data.matchedofficers[i];
                                option.text = data.matchedofficers[i];
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

        function assignDuties2() {
            var selectedOfficer = document.getElementById("selectedOfficer").value;
            var selectedDuty = document.getElementById("officerDuty").value;

            // Create the request body
            var requestBody = new URLSearchParams();
            requestBody.append('officerName', selectedOfficer);
            requestBody.append('officerDuty', selectedDuty);

            // Make the fetch request
            fetch('<%= request.getContextPath() %>/Administrator/assignDuties2', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: requestBody,
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }

                // Check the content type
                const contentType = response.headers.get('content-type');
                if (contentType && contentType.indexOf('application/json') !== -1) {
                    return response.json();
                } else {
                    // Handle non-JSON response (e.g., display as plain text)
                    return response.text();
                }
            })
            .then(data => {
                console.log('Response from server:', data); // Log the response

                if (typeof data === 'object') {
                    // Check if the data contains the status
                    if (data.status !== undefined) {
                        // Display success or failure message
                        if (data.status === 'success') {
                            showSuccessAlert('Duty assigned successfully');
                        } else {
                            showErrorAlert('Duty assignment failed');
                        }
                    } else {
                        console.error('Response is missing the "status" field:', data);
                    }
                } else {
                    // Handle non-JSON response (plain text)
                    console.log('Plain text response from server:', data);
                    // You can handle plain text response as needed
                }
            })
            .catch(error => {
                console.error('Error during fetch:', error);
                showErrorAlert('An error occurred while processing your request');
            });

            // Prevent form submission
            return false;
        }


        function showSuccessAlert(message) {
            Swal.fire({
                icon: 'success',
                title: 'Success',
                text: message,
            });
        }

        function showErrorAlert(message) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: message,
            });
        }

    </script>
</body>
</html>
