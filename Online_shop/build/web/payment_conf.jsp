<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry = "";
        
        String order_num = session.getAttribute("order_num").toString();
        int cnum1 = Integer.parseInt(request.getParameter("cnum1"));
        int cnum4 = Integer.parseInt(request.getParameter("cnum4"));
        String owner_name = String.valueOf(request.getParameter("owner_name"));
        
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
            qry="insert into order_trans (order_num, cnum1, cnum4,"
                    + "owner_name)"
                    + "value (?,?,?,?)";
            st=con.prepareStatement(qry);
            
            st.setString(1, order_num);
            st.setInt(2, cnum1);
            st.setInt(3, cnum4);
            st.setString(4, owner_name);
            
            int ra = st.executeUpdate();
            if(ra>0)
            {
                response.sendRedirect("final_prod.jsp");
            }
            else
            {
                out.print("Payment Failed!!!");
            }
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }
%>