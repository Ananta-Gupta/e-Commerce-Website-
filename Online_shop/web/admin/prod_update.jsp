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
                        <form action="updateprod.jsp" method="post">
                            <h3>Product Update</h3>
                            <div class="form-group">
                                <label for="prod_code">Product Code :</label>
                                <input type="text" class="form-control" id="prod_code" name="prod_code" value="<%=rs.getInt("prod_code")%>" readonly="Readable">
                            </div>
                            <div class="form-group">
                                <label for="prod_name">Product Name :</label>
                                <input type="text" class="form-control" id="prod_name" name="prod_name" value="<%=rs.getString("prod_name")%>">
                            </div>
                            <div class="form-group">
                                <label for="brand">Brand :</label>
                                <input type="text" class="form-control" id="brand" name="brand" value="<%=rs.getString("brand")%>">
                            </div>
                            <div class="form-group">
                                <label for="size">Size :</label>
                                <input type="text" class="form-control" id="size" name="size" value="<%=rs.getString("size")%>">
                            </div>
                            <div class="form-group">
                                <label for="color">Color :</label>
                                <input type="text" class="form-control" id="color" name="color" value="<%=rs.getString("color")%>">
                            </div>
                            <div class="form-group">
                                <label for="mrpprice">MRP Price :</label>
                                <input type="text" class="form-control" id="mrpprice" name="mrpprice" value="<%=rs.getInt("mrpprice")%>">
                            </div>
                            <div class="form-group">
                                <label for="costprice">Cost Price :</label>
                                <input type="text" class="form-control" id="costprice" name="costprice" value="<%=rs.getInt("costprice")%>"> 
                            </div>
                            <div class="form-group">
                                <label for="gst">GST :</label>
                                <input type="text" class="form-control" id="gst" name="gst" value="<%=rs.getInt("gst")%>">
                            </div>
                            <div class="form-group">
                                <label for="discp">Description :</label>
                                <textarea class="form-control" rows="5" id="discp" name="discp" ><%=rs.getString("discp")%></textarea>
                            </div>
                            <div class="form-group">
                                <label for="status">Status :</label>
                                <label class="radio-inline">
                                <%
                                    if(rs.getString("status").compareTo("a")==0)
                                { %>
                                    <input type="radio" name="status" value="a" checked>   Available
                                <%
                                }
                                else
                                { %>
                                    <input type="radio" name="status" value="a">   Available
                                <% } %>
                                </label>
                                <label class="radio-inline">
                                <%
                                    if(rs.getString("status").compareTo("out")==0)
                                { %>
                                    <input type="radio" name="status" value="out" checked>   Out of stock
                                <%
                                }
                                else
                                { %>
                                    <input type="radio" name="status" value="out">   Out of stock
                                <% } %>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Update</button>
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