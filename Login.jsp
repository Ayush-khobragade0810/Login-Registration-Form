<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%
    String pval = request.getParameter("action"); // Common parameter for Register or Login
    Connection con = null;
    PreparedStatement ps1 = null, ps2 = null, psCheck = null;
    ResultSet rs = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "root");

            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("userpassword");

            if (username != null && !username.trim().isEmpty() && 
                email != null && !email.trim().isEmpty() && 
                password != null && !password.trim().isEmpty()) {

                // Check if user already exists
                psCheck = con.prepareStatement("SELECT * FROM login WHERE email = ?");
                psCheck.setString(1, email);
                rs = psCheck.executeQuery();
        } 
    
        else if ("login".equals(pval)) { // Login logic
             email = request.getParameter("email");
            password = request.getParameter("userpassword");

            if (email != null && !email.trim().isEmpty() && 
                password != null && !password.trim().isEmpty()) {

                ps2 = con.prepareStatement("SELECT * FROM login WHERE email = ? AND userpassword = ?");
                ps2.setString(1, email);
                ps2.setString(2, password);

                rs = ps2.executeQuery();
                if (rs.next()) {
                    out.println("<h1>Login successful!</h1>");
                } else {
                    out.println("<h2>Invalid Email or Password</h2>");
                }
            } else {
                out.println("<h2>Email and Password cannot be empty!</h2>");
            }
        }

    } catch (Exception e) {
        out.println("<h1>Error: " + e.getMessage() + "</h1>");
        e.printStackTrace();
    } finally {
        // Close resources
        if (rs != null) rs.close();
        if (ps1 != null) ps1.close();
        if (ps2 != null) ps2.close();
        if (psCheck != null) psCheck.close();
        if (con != null) con.close();
    }
%>
