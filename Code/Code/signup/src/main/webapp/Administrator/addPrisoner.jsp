<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Add Prisoner</title>
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
        <h1>Add Prisoner</h1>

        <!-- Add Prisoner Form -->
        <form id="addPrisonerForm" onsubmit="return validateForm()" method="post" action="addPrisoner">
            <div class="form-group">
                <label for="Name">Name</label>
                <input type="text" id="Name" name="Name" required>
            </div>
             <label for="crime">Crime</label>
            <select id="crime" name="crime" required>
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
          
                <label for="sentence">Sentence</label>
                <input type="number" id="sentence" name="sentence" required><br>
            <button type="submit" class="btn btn-primary"><span class="custom2-span"></span>Add Prisoner</button>
        </form>
    </div>
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
