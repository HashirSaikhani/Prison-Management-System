<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">
 <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor.css">


</head>
<body>

    <!-- Navbar -->
   
      <nav class="navbar navbar-expand-lg navbar-light">
    <button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left" style="color: white;">Visitor Panel</button>
    
       
      <div style="position: absolute; top: 10px; right: 10px;">
  <button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-right" style="color: white;">Log out</button>
	</div>
    
</nav>

    <!-- Content -->
    <div class="container mt-4">
        <h1 class="mb-4">Visitor Homepage</h1>

        <!-- Buttons -->
        <div class="btn-group-horizontal">
            <button class="btn btn-primary" onclick="redirectToViewRecord()">Request to Visit</button>
            <button class="btn btn-primary" onclick="redirectToAddPrisoner()">View Request</button>
           
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <!-- Custom JavaScript for redirection -->
    <script>
    function redirectToViewRecord() {
        window.location.href = '<%= request.getContextPath() %>/Visitor/RequestVisit.jsp';
    }

    function redirectToAddPrisoner() {
        window.location.href = '<%= request.getContextPath() %>/Visitor/ViewRequest.jsp';
    }

     
        
    </script>
</body>
</html>
