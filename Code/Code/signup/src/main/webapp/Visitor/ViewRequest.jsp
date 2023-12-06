<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>View Request Status</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor2.css">
</head>
<body>
    <div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    </ul>
    </div>

     <!-- Content -->
    <div class="content">
        <h1>View Request Status</h1>

        <!-- View Request Form -->
        <form id="viewRequestForm" onsubmit="return viewStatus()" method="post" action="viewRequest">
            <div class="form-group">
                <label for="visitorName">Enter Your Name:</label>
                <input type="text" id="visitorName" name="visitorName" required>
            </div>
            <button type="submit" class="btn btn-primary"><span class="custom-span"></span>View Request Status</button>
        </form>

        <!-- Display Request Status -->
        <div id="requestStatus" class="mt-4" style="display: none;"></div>
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
        function viewStatus() {
            const visitorName = document.getElementById("visitorName").value;

            // Create a new XMLHttpRequest object
            const xhr = new XMLHttpRequest();

            // Set up the request
            xhr.open('POST', '<%= request.getContextPath() %>/Visitor/ViewRequest', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            // Set up the callback function for when the request is complete
            xhr.onload = function () {
                if (xhr.status >= 200 && xhr.status < 300) {
                    try {
                        var data = JSON.parse(xhr.responseText);

                        // Check if the data contains the request status
                        if (data && data.status === "success" && data.visitorRecord) {
                            var requestStatusDiv = document.getElementById("requestStatus");
                            requestStatusDiv.innerHTML = "<h4>Request Status:</h4>" +
                                "<br>Your Request Status: " + data.visitorRecord.vstatus +
                                "<br>";
                            // Show the request status section
                            requestStatusDiv.style.display = "block";
                        } else if (data && data.status === "notFound") {
                            // Show a SweetAlert if the user is not found
                            Swal.fire({
                                icon: 'error',
                                title: 'User Not Found',
                                text: 'No record found for the entered name.',
                            });
                        } else {
                            console.error('No valid request status found or unexpected response.');
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
    </script>
</body>
</html>
