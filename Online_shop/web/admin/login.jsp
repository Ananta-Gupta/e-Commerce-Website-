<%@page import="java.sql.*,java.util.*"%>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";

        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
    
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fashion_mart","root","");
        }
        catch(ClassNotFoundException e)
        {
            out.println("Driver Error"+e.getMessage());
            return;
        }
        catch(SQLException e)
        {
            out.println("DSN Error"+e.getMessage());
            return;
        }
        
        try
        {
            qry="select * from admin where user=? and pass=?";
            st=con.prepareStatement(qry);
            
            st.setString(1, user);
            st.setString(2, pass);
            
            rs=st.executeQuery();
            if(rs.next())
            {
                response.sendRedirect("adminpage.jsp");
            }
            else
            {
                response.sendRedirect("adminlogin.jsp");
            }
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
%>