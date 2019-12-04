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
            qry = "select * from users order by userid";
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
                                    <th>User Id</th>
                                    <th>User Name</th>
                                    <th>Password</th>
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
                    out.println("<td><center>"+rs.getInt("userid"));
                    out.println("<td>"+rs.getString("username"));
                    out.println("<td>"+rs.getString("pass"));
                    out.println("<td><a href='prod_update.jsp?userid="+rs.getString("userid")+"'>Update</a>");
                    out.println("<td><a href='?userid="+rs.getString("userid")+"'>Uplode Image</a>");
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