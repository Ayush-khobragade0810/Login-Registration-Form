<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%
        String pval = request.getParameter("Register");
        Connection con = null;
        PreparedStatement ps1=null,ps2=null,psCheck=null;
        ResultSet rs = null;
        
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            out.println("Database connected successfully123!");
            // Establish the connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root");
            out.println("Database connection successful 456!");
            if ("Register".equals(pval)) {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("userpassword");
                if(username != null && email !=null && password != null){
                        // Prepare and execute the SQL query
                        ps1=con.prepareStatement("INSERT INTO login (username,email,userpassword) VALUES(?,?,?)");
                        ps1.setString(1,username);
                        ps1.setString(2,email);
                        ps1.setString(3,password);
    
                    int result = ps1.executeUpdate();
                    if (result > 0) {
                        out.println("<h1>Registration successful!</h1>");
                    } //end of inner if
                    else {
                        out.println("<h1>Registration failed.</h1>");
                    }//end of inner else 
                    }//end of outer if
            }
        }//end of try 
        catch (Exception e) {
            out.println("<h1>Error: " + e.getMessage() + "</h1>");
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null)  rs.close();
            if (ps1 != null) ps1.close();
            if (ps2 != null) ps2.close();
            if (con != null) con.close();
        }
    %>