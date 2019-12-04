<%@page import="java.sql.*,java.util.*"%>
<%
    
        Connection con=null;
        PreparedStatement st=null;
        String qry="";
        
        int prod_code = Integer.parseInt(request.getParameter("prod_code"));
        String prod_name = request.getParameter("prod_name");
        String brand = request.getParameter("brand");
        String size = request.getParameter("size");
        String color = request.getParameter("color");
        int mrpprice = Integer.parseInt(request.getParameter("mrpprice"));
        int costprice = Integer.parseInt(request.getParameter("costprice"));
        int gst = Integer.parseInt(request.getParameter("gst"));
        String discp = request.getParameter("discp");
        String status = request.getParameter("status");
    
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
            qry="update products set prod_name=?, brand=?, size=?, color=?,"
                    + "mrpprice=?, costprice=?, gst=?, discp=?, status=?"
                    + "where prod_code=?";
            st=con.prepareStatement(qry);

            //st.setInt(1, sno);
            st.setString(1, prod_name);
            st.setString(2, brand);
            st.setString(3, size);
            st.setString(4, color);
            st.setInt(5, mrpprice);
            st.setInt(6, costprice);
            st.setInt(7, gst);
            st.setString(8, discp);
            st.setString(9, status);
            st.setInt(10, prod_code);
            
            int ra=st.executeUpdate();

            if(ra>0)
            {
                response.sendRedirect("prod_view.jsp");
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