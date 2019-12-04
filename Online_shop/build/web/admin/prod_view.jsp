<%@page import="java.sql.*, java.util.*" %>
<% 
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";

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
            qry = "select * from products order by prod_code";
            st=con.prepareStatement(qry);

            rs=st.executeQuery();
%>
            <!-- Start Header Area -->
                <jsp:include page="admin_header.jsp"/>
            <!-- End Header Area -->
            
            <!-- Start Main Area -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="admin_sidebar.jsp"/>
                    </div>
                    <div class="col-md-9">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product Code</th>
                                    <th>Product Name</th>
                                    <th>Brand</th>
                                    <th>Size</th>
                                    <th>Color</th>
                                    <th>MRP Price</th>
                                    <th>Cost Price</th>
                                    <th>GST</th>
                                    <th>Status</th>
                                    <th colspan="2">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
<%  
            if(rs.next())
            {
                do
                {
                    out.println("<tr>");
                    out.println("<td><center>"+rs.getInt("prod_code"));
                    out.println("<td>"+rs.getString("prod_name"));
                    out.println("<td>"+rs.getString("brand"));
                    out.println("<td>"+rs.getString("size"));
                    out.println("<td>"+rs.getString("color"));
                    out.println("<td>"+rs.getString("mrpprice"));
                    out.println("<td>"+rs.getString("costprice"));
                    out.println("<td>"+rs.getString("gst"));
                    out.println("<td>"+rs.getString("status"));
                    out.println("<td><a href='prod_update.jsp?prod_code="+rs.getString("prod_code")+"'>Update Details</a>");
                    out.println("<td><a href='imgpage.jsp?prod_code="+rs.getString("prod_code")+"'>Uplode Image</a>");
                    out.println("</tr>");
                } while(rs.next());
            }
%>                                    
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="admin_footer.jsp"/>
            <!-- End footer Area -->
<%
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
%>