<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        PreparedStatement st2= null;
        PreparedStatement st3= null;
        ResultSet rs = null;
        String qry="";
        String qry2="";
        String qry3="";
        
        String order_num = session.getAttribute("order_num").toString();
        String email = session.getAttribute("email").toString();
        
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
            qry="select * from cart where email=?";
            st=con.prepareStatement(qry);
            
            st.setString(1, email);
            
            rs=st.executeQuery();
            if(rs.next())
            {
                do
                {
                    qry2="insert into order_prod (order_num, email, prod_code,"
                            + "prod_name, costprice, quant, prod_path)"
                            + "values(?,?,?,?,?,?,?)";
                    st2=con.prepareStatement(qry2);

                    st2.setString(1, order_num);
                    st2.setString(2, email);
                    st2.setInt(3, rs.getInt("prod_code"));
                    st2.setString(4, rs.getString("prod_name"));
                    st2.setInt(5, rs.getInt("costprice"));
                    st2.setInt(6, rs.getInt("quant"));
                    st2.setString(7, rs.getString("prod_path"));

                    int ra = st2.executeUpdate();
                    
                }while(rs.next());
            }
            
            qry3="delete from cart where email=?";
            st3=con.prepareStatement(qry3);
            
            st3.setString(1, email);
            
            int ra2 = st3.executeUpdate();
            if(ra2>0)
            {
                response.sendRedirect("order_smry.jsp");
            }
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }
%>