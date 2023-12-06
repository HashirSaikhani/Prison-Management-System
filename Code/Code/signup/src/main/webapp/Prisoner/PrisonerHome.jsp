<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/Prisoner/styles/prisoner.css">
</head>
<body>

    <!-- Navbar -->
    
    <div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-left" style="color: white;">Logout</button></li>
    </ul>
    </div>
   
    <!-- Content -->
    <div class="content">
        <h1 class="mb-4">Prisoner Homepage</h1>

        <!-- Buttons -->
   
            <button class="btn btn-info" onclick="redirectToViewRecord()"><span class="custom-span"></span>Request for Medical Attention</button>
            <button class="btn btn-info" onclick="redirectToAddPrisoner()"><span class="custom-span"></span>Request for Work Assignment</button>
            <button class="btn btn-info" onclick="redirectToRemovePrisoner()"><span class="custom-span"></span>Request for Visitors</button>
            <button class="btn btn-info" onclick="redirectToManageOfficer()"><span class="custom-span"></span>File Complaint</button>
          
    </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for redirection -->
    <script>
    
    
        function redirectToViewRecord() {
            window.location.href = '<%= request.getContextPath() %>/Prisoner/RequestMedicalAttention.jsp';
        }

        function redirectToAddPrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Prisoner/RequestWorkAssignment.jsp';
        }

        function redirectToRemovePrisoner() {
            window.location.href = '<%= request.getContextPath() %>/Prisoner/RequestVisitor.jsp';
        }

        function redirectToManageOfficer() {
            window.location.href = '<%= request.getContextPath() %>/Prisoner/FileComplaint.jsp';
        }

     
        
    </script>
</body>
</html>
