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
   
    <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Prisoner/PrisonerHome.jsp'" class="btn btn-primary-left" style="color: white;">Prisoner Panel</button>
    
       
      <div style="position: absolute; top: 10px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>
    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Prisoner Homepage</h1>

        <!-- Buttons -->
        <div class="btn-group-horizontal">
            <button class="btn btn-primary" onclick="redirectToViewRecord()">Request for Medical Attention</button>
            <button class="btn btn-primary" onclick="redirectToAddPrisoner()">Request for Work Assignment</button>
            <button class="btn btn-primary" onclick="redirectToRemovePrisoner()">Request for Visitors</button>
            <button class="btn btn-primary" onclick="redirectToManageOfficer()">File Complaint</button>
          
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
