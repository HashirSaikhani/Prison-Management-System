<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Officer Home</title>
    <!-- Link to custom styles -->
    <link rel="stylesheet" href="<%= request.getContextPath() %>/Visitor/styles/visitor2.css">


</head>
<body>

    <!-- Navbar -->
   <div class="banner">
    <div class="navbar">
    <ul>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/Visitor/VisitorHome.jsp'" class="btn btn-primary-left">HOME</button></li>
    <li><button onclick="window.location.href='<%= request.getContextPath() %>/login.jsp'" class="btn btn-primary-left">Log out</button></li>
    </ul>
    </div>  
    


    <!-- Content -->
    <div class="content">
        <h1>Visitor Homepage</h1>

        <!-- Buttons -->
            <button class="btn btn-info" onclick="redirectToViewRecord()">Request to Visit<span class="custom-span"></span></button>
            <button class="btn btn-info" onclick="redirectToAddPrisoner()"><span class="custom-span"></span>View Request</button>
           
        
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
