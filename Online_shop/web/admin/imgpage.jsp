<%@page import="java.sql.*,java.util.*"%>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";

        int prod_code = Integer.parseInt(request.getParameter("prod_code"));
    
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
            qry="select * from products where prod_code=?";
            st=con.prepareStatement(qry);

            st.setInt(1, prod_code);

            rs=st.executeQuery();
            if(rs.next())
            {
                
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
                        <form action="imguplode.jsp" enctype="multipart/form-data" method="post">
                            
                            <input type="hidden" name="prod_code" id="prod_code" value="<% out.print(prod_code);%>" readonly/>
                            <div>
                                <h3>Image Insertion</h3><br>
                            </div>
                            <div class="form-group">
                                <label for="prod_image">Select the image : </label>
                                <input type="file" class="form-control" id="prod_image" name="prod_image" size="50">
                            </div>
                            <button type="submit" class="btn btn-default">Insert Image</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="admin_footer.jsp"/>
            <!-- End footer Area -->
<%
              }
            else
              {
                  out.println("Record not Found");
              }
         }
         catch(Exception e)
         {
              out.println("Query error:"+e.getMessage());              
         }
            
         finally
         {
             try
             {
                 st.close();
                 con.close();
                 rs.close();
             }
             catch(Exception e)
             {
                 out.println("error in close:"+e.getMessage());
             }
         }
%>