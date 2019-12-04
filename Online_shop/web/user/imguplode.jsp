<%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@page import="java.sql.*,java.util.*,java.io.*"%>
<%
    
        Connection con=null;
        PreparedStatement st=null;
        String qry="";
        
        FileInputStream fis=null;
        String myloc=request.getParameter("myimg"); 
    
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
            File image= new File(myloc);
            qry = insert into product
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

        
        
        
        File image= new File(myloc);
        pstmt = conn.prepareStatement("insert into image(firstname, lastname, email,image) " + "values(?,?,?,?)");
        fis=new FileInputStream(image);
        pstmt.setBinaryStream(3, (InputStream) fis, (int) (image.length()));
        int count = pstmt.executeUpdate();
        if(count>0)
        {
        out.println("insert successfully");
        }
        else
        {
        out.println("not successfully");
        }
        }
        catch(Exception ex)
        {
        ex.printStackTrace();
        }
        finally{
        try{
        if(rs!=null){
        rs.close();
        rs= null;
        }
        if(pstmt !=null)
        {
        pstmt.close();
        pstmt=null;
        }
        if(conn!=null)
        {
        conn.close();
        conn=null;
        }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        }
%>
    </body>
</html>