<%@page import="java.sql.*,java.util.*" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        //ResultSet rs= null;
        String qry = "";
        
        String catid = session.getAttribute("catid").toString();
        String email = session.getAttribute("guest_id").toString();
        int prod_code = Integer.parseInt(request.getParameter("prod_code"));
        String prod_name = String.valueOf(request.getParameter("prod_name"));
        int costprice = Integer.parseInt(request.getParameter("costprice"));
        int quant = Integer.parseInt(request.getParameter("quant"));
        String prod_path = String.valueOf(request.getParameter("prod_path"));
        
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
            qry="insert into cart (email, prod_code, prod_name, costprice, quant, prod_path)"
                    + "value (?,?,?,?,?,?)";
            st=con.prepareStatement(qry);
            
            st.setString(1, email);
            st.setInt(2, prod_code);
            st.setString(3, prod_name);
            st.setInt(4, costprice);
            st.setInt(5, quant);
            st.setString(6, prod_path);
            
            int ra=st.executeUpdate();
            if(ra>0)
            {
                response.sendRedirect("men_category.jsp?catid="+catid);
            }
            else
            {
                out.println("Insertion Failed");
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