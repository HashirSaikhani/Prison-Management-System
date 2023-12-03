<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Prisoner</title>
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
        <h1 class="mb-4">Add Prisoner</h1>

        <!-- Add Prisoner Form -->
        <form id="addPrisonerForm" onsubmit="return validateForm()" method="post" action="addPrisoner">
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" class="form-control" id="Name" name="Name" required>
            </div>
             <label for="crime">Crime</label>
            <select class="form-control" id="crime" name="crime" required>
                    <!-- Options will be dynamically populated based on duties -->
                  
                    <option value="Murder">Murder</option>
                    <option value="Aggravated Assault">Aggravated Assault</option>
                    <option value="Robbery">Robbery</option>
                       <option value="Burglary">Burglary</option>
                    <option value="Manslaughter">Manslaughter</option>
                    <option value="Drug Trafficking">Drug Trafficking</option>
                     <option value="Gambling Fraud">Gambling Fraud</option>
                     <option value="Kidnapping">Kidnapping</option>
                    <option value="Armed Robbery">Armed Robbery</option>
                     <option value="Money Laundering">Money Laundering</option>
                     
                </select>
          
            <div class="form-group">
                <label for="sentence">Sentence</label>
                <input type="number" class="form-control" id="sentence" name="sentence" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Prisoner</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- SweetAlert2 JS -->
    <script src= "https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

    <!-- Custom JavaScript for form validation and SweetAlert -->
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function() {
            var status = "<%= request.getAttribute("status") %>";
            if (status === "success") {
                swal("Congrats", "Prisoner added Successfully", "success");
            } else if (status === "failed") {
                swal("Sorry", "Prisoner is not added", "error");
            } else if (status === "invalidEmail") {
                swal("Sorry", "Please Enter Email", "error");
            }
        });
    </script>
</body>
</html>
