<%@page import="java.sql.*,java.util.*" %>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";
        
        //int userid=0;
        String Fname = request.getParameter("Fname");
        String Lname = request.getParameter("Lname");
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
        
        /*try
        {
            qry="select * from users";
            st=con.prepareStatement(qry);

            rs=st.executeQuery();
            if(rs.last())
            {
                userid=rs.getInt("userid");
            }
            userid+=1;
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }*/
    
        try
        {
            qry="insert into users (Fname, Lname, email, mob_no, username, pass)"
                    + "values (?,?,?,?,?,?)";
            st=con.prepareStatement(qry);

            st.setString(1, Fname);
            st.setString(2, Lname);
            st.setString(3, email);
            st.setString(4, mob_no);
            st.setString(5, username);
            st.setString(6, pass);

            int ra=st.executeUpdate();
            if(ra>0)
            {
                response.sendRedirect("userlogin.jsp");
            }
            else
            {
                out.println("Insertaion Failed");
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