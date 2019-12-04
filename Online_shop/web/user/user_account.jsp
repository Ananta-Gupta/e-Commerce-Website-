<%@page import="java.sql.*,java.util.*"%>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";

        //int userid = Integer.parseInt(request.getParameter("userid"));
        String email= session.getAttribute("email").toString();
        
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
            qry="select * from users where email=?";
            st=con.prepareStatement(qry);

            st.setString(1, email);

            rs=st.executeQuery();
            if(rs.next())
            {
%>
            <!-- Start Header Area -->
                <jsp:include page="user_header.jsp"/>
            <!-- End Header Area -->
            
            <!-- Start Main Area -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="user_sidebar.jsp"/>
                    </div>
                    <div class="col-md-9">
                        <form action="#" method="post">
                            <h3>User Details</h3>
                            <input hidden type="text" name="email" value="<% out.println(email);%>" size="30">
                            <div class="form-group">
                                <label for="userid">User Id :</label>
                                <input type="text" class="form-control" id="userid" name="userid" value="<%out.print(rs.getString("username"));%>" readonly="Readable">
                            </div>
                            <div class="form-group">
                                <label for="prod_code">Name : </label>
                                <input type="text" class="form-control" id="name" name="name" value="<%=rs.getString("name")%>">
                            </div>
                            <div class="form-group">
                                <label for="email">Email :</label>
                                <input type="text" class="form-control" id="email" name="email" value="<%=rs.getString("email")%>" readonly="Readable">
                            </div>
                            <div class="form-group">
                                <label for="mob_no">Mobile Number :</label>
                                <input type="text" class="form-control" id="mob_no" name="mob_no" value="<%=rs.getString("mob_no")%>">
                            </div>
                            <div class="form-group">
                                <label for="username">Username :</label>
                                <input type="text" class="form-control" id="username" name="username" value="<%=rs.getString("username")%>">
                            </div>
                            <button type="submit" class="btn btn-default">Update</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="user_footer.jsp"/>
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