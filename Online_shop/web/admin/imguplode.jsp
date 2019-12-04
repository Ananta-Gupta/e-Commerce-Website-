<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.io.output.*" %>
<%
        Connection con=null;
        PreparedStatement st=null;
        String qry="";
        
       // int prod_code = Integer.parseInt(request.getParameter("prod_code"));
        
        File file;
        int maxFileSize = 5000 * 1024;
        int maxMemSize = 5000 * 1024;

        String filePath = "D:\\Java_Project\\Online_shop\\Images\\";
        String filePath1="";
        String [ ][ ] names=new String[4][2];
        String filenm="";


        String contentType = request.getContentType();
        if ((contentType.indexOf("multipart/form-data") >= 0))
        {
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File("c:\\uploads"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax( maxFileSize );
        
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
            List fileItems = upload.parseRequest(request);
            Iterator i = fileItems.iterator();

            int k=0;
            while(i.hasNext()) 
            {
                FileItem fi = (FileItem)i.next();

                if ( !fi.isFormField () )
                {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    //filePath1= filePath + (int) (Math.random() * 1*2*3*4*5*6*7*8*9) + fileName;
                    //out.println(filePath1);
                    filenm="img"+ (int) (Math.random() * 1*2*3*4*5*6*7*8*9) +".jpg";
                    filePath1= filePath+filenm;
                    file=new File(filePath1);
                    //out.println(filePath1);
                    fi.write(file ) ;

                    //out.println("Uploaded Filename: " + filePath1+ "<br>");


                    names[k][0]=fieldName;
                    names[k][1]=filePath1;
                    k++;

                }
                else
                {
                        names[k][0]=fi.getFieldName();
                        names[k][1]=fi.getString();
                        k++;
                }

             }
        
            names[k][0]="ImagePath";
            names[k][1]="images/"+filenm;

        qry="update products set prod_path=? where prod_code=?";
        st=con.prepareStatement(qry);

        st.setString(1,names[2][1]);
        st.setInt(2,Integer.parseInt(names[0][1]));

        int ra=st.executeUpdate();

        if(ra>0)
        {
            response.sendRedirect("prod_view.jsp");
        }
        for(int r=0;r<4;r++)
        {
           for ( int c=0;c<2;c++)
           {
                out.print( "&nbsp;" + names[r][c] + "&nbsp;");
            }
            out.println("<br/>");
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
  }
    else
    {
    out.println("Error in file upload.");
    }
%>