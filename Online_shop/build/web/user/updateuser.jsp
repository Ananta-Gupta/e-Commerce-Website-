<%@page import="java.sql.*,java.util.*"%>
<%
    
        Connection con=null;
        PreparedStatement st=null;
        String qry="";
        
        int userid = Integer.parseInt(request.getParameter("userid"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mob_no = request.getParameter("mob_no");
        String username = request.getParameter("username");
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
            qry="update users set name=?, email=?, mob_no=?, username=?,"
                    + "pass=? where userid=?";
            st=con.prepareStatement(qry);

            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, mob_no);
            st.setString(4, username);
            st.setString(5, pass);
            st.setInt(6, userid);
            
            int ra=st.executeUpdate();

            if(ra>0)
            {
                response.sendRedirect("user_account.jsp");
            }
            else
            {
                out.println("UPDATION FAILED");
            }
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }

        finally
        {
            try
            {
                st.close();
                con.close();
            }
            catch(Exception e)
            {
                out.println("Error in close:"+e.getMessage());
            }
        }
%>