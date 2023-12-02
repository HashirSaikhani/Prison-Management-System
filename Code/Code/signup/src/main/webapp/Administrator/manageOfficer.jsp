<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Manage Officer</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11">
    <!-- Link to custom styles -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/Administrator/styles/admin.css">
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Administrator/AdministratorHome.jsp'" class="btn btn-primary-left" style="color: white;">Admini Panel</button>
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Manage Officer</h1>

        <!-- Manage Officer Form -->
        <form id="manageOfficerForm" onsubmit="return searchOfficer()">
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
            <button type="button" class="btn btn-info mt-2" onclick="viewOfficerRecord()">View Officer Record</button>
        </div>

        <!-- Display Officer Record -->
        <div id="officerRecord" class="mt-4" style="display: none;">
            <h4>Officer Record:</h4>
            <!-- Your logic to display the record of the selected officer goes here -->
            <p id="recordDetails"></p>
            <button type="button" class="btn btn-success mt-2" onclick="updateOfficerRecord()">Update Record</button>
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

        // Make an AJAX call to the server to search for matching officers
        fetch("${pageContext.request.contextPath}/Administrator/manageOfficer", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
            },
            body: "officerName=" + encodeURIComponent(officerName),
        })
            .then(response => response.json())
            .then(data => {
                // Populate the select dropdown with matching officers
                var selectDropdown = document.getElementById("selectedOfficer");
                selectDropdown.innerHTML = "";

                if (data.length > 0) {
                    for (var i = 0; i < data.length; i++) {
                        var option = document.createElement("option");
                        option.value = data[i];
                        option.text = data[i];
                        selectDropdown.appendChild(option);
                    }

                    // Show the matched officers section
                    document.getElementById("matchedOfficers").style.display = "block";
                } else {
                    // Handle the case where no matching officers were found
                    alert("No matching officers found");
                }
            })
            .catch(error => {
                console.error("Error fetching data:", error);
            });

        // Prevent form submission
        return false;
    }



        function viewOfficerRecord() {
            var selectedOfficer = document.getElementById("selectedOfficer").value;

            // Your logic to retrieve and display the record of the selected officer goes here
            // For demonstration purposes, let's assume we have static record details
            var recordDetails = "Name: " + selectedOfficer + "<br>Rank: Rank details<br>Department: Department details";

            // Display the officer record
            document.getElementById("recordDetails").innerHTML = recordDetails;
            document.getElementById("officerRecord").style.display = "block";
        }

        function updateOfficerRecord() {
            var selectedOfficer = document.getElementById("selectedOfficer").value;

            // Your logic to update the record of the selected officer goes here
            // For demonstration purposes, let's assume the record is updated successfully
            var isUpdated = true;

            if (isUpdated) {
                showSuccessAlert("Successfully Updated!");
            } else {
                showErrorAlert("Failed to update officer record.");
            }
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
                title: 'Oops...',
                text: message,
            });
        }
    </script>
</body>
</html>
