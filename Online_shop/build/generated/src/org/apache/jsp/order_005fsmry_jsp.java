package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Date;

public final class order_005fsmry_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

        Connection con= null;
        PreparedStatement st= null;
        PreparedStatement st2= null;
        PreparedStatement st3= null;
        ResultSet rs = null;
        String qry="";
        String qry2="";
        String qry3="";
        int gt=0;
        
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
            qry="select * from order_trans where order_num=?";
            st=con.prepareStatement(qry);
            
            st.setString(1, order_num);
            
            rs=st.executeQuery();

      out.write("\n");
      out.write("\n");
      out.write("    <!DOCTYPE html>\n");
      out.write("    <html lang=\"zxx\" class=\"no-js\">\n");
      out.write("    <head>\n");
      out.write("        <!-- Mobile Specific Meta -->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <!-- Favicon-->\n");
      out.write("        <link rel=\"shortcut icon\" href=\"img/fav.png\">\n");
      out.write("        <!-- Author Meta -->\n");
      out.write("        <meta name=\"author\" content=\"CodePixar\">\n");
      out.write("        <!-- Meta Description -->\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <!-- Meta Keyword -->\n");
      out.write("        <meta name=\"keywords\" content=\"\">\n");
      out.write("         meta character set \n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("         Site Title \n");
      out.write("        <title>Order</title>\n");
      out.write("\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700\" rel=\"stylesheet\"> \n");
      out.write("            <!--\n");
      out.write("            CSS\n");
      out.write("            ============================================= -->\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/linearicons.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/owl.carousel.css\">            \n");
      out.write("            <link rel=\"stylesheet\" href=\"css/font-awesome.min.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/nice-select.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/ion.rangeSlider.css\" />\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/ion.rangeSlider.skinFlat.css\" />\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/bootstrap.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"css/main.css\">\n");
      out.write("        </head>\n");
      out.write("        \n");
      out.write("        <body>\n");
      out.write("            \n");
      out.write("            <!-- Start Header Area -->\n");
      out.write("                ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "common_header.jsp", out, false);
      out.write("\n");
      out.write("            <!-- End Header Area -->\n");
      out.write("\n");
      out.write("            <!-- Start Banner Area -->\n");
      out.write("            <section class=\"banner-area organic-breadcrumb\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"breadcrumb-banner d-flex flex-wrap align-items-center\">\n");
      out.write("                        <div class=\"col-first\">\n");
      out.write("                            <h1>Order Confirmation</h1>\n");
      out.write("                             <nav class=\"d-flex align-items-center justify-content-start\">\n");
      out.write("                                 <a href=\"index.jsp\">Home<i class=\"fa fa-caret-right\" aria-hidden=\"true\"></i></a>\n");
      out.write("                                 <a href=\"order_smry.jsp\">Confirmation</a>\n");
      out.write("                            </nav>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("            <!-- End Banner Area -->\n");
      out.write("\n");
      out.write("\t\t<!-- Start Checkout Area -->\n");
      out.write("                    <div class=\"container\">\n");

                if(rs.next())
                {
                    do
                    {

      out.write("\n");
      out.write("\t\t\t<p class=\"text-center\">Thank you. Your order has been received.</p>\n");
      out.write("\t\t\t<div class=\"row mt-50\">\n");
      out.write("\t\t\t\t<div class=\"col-md-4\">\n");
      out.write("\t\t\t\t\t<h3 class=\"billing-title mt-20 pl-15\">Order Info</h3>\n");
      out.write("\t\t\t\t\t<table class=\"order-rable\">\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Order number</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("order_num"));
      out.write("</td>\n");

                    }
                    while(rs.next());
                }
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }
        try
        {
            qry2="select * from user_add where email=?";
            st2=con.prepareStatement(qry2);

            st2.setString(1, email);
            
            rs=st2.executeQuery();
            if(rs.next())
            {
                do
                {   

      out.write("\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Date</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: Oct 03, 2017</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Total</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: USD 2210</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Payment method</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: Card payments</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"col-md-4\">\n");
      out.write("\t\t\t\t\t<h3 class=\"billing-title mt-20 pl-15\">Billing Address</h3>\n");
      out.write("\t\t\t\t\t<table class=\"order-rable\">\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Street</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("add1"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>City</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("city"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Country</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("country"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Postcode</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getInt("pin"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"col-md-4\">\n");
      out.write("\t\t\t\t\t<h3 class=\"billing-title mt-20 pl-15\">Shipping Address</h3>\n");
      out.write("\t\t\t\t\t<table class=\"order-rable\">\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Street</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("add1"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>City</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("city"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Country</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getString("country"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t<td>Postcode</td>\n");
      out.write("\t\t\t\t\t\t\t<td>: ");
      out.print(rs.getInt("pin"));
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");

                }
                while(rs.next());
            }
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }
        try
        {
            qry3="select * from order_prod where order_num=?";
            st3=con.prepareStatement(qry2);

            st3.setString(1, email);
            
            rs=st3.executeQuery();

      out.write("\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- End Checkout Area -->\n");
      out.write("\t\t<!-- Start Billing Details Form -->\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<div class=\"billing-form\">\n");
      out.write("\t\t\t\t<div class=\"row\">\n");
      out.write("\t\t\t\t\t<div class=\"col-12\">\n");
      out.write("\t\t\t\t\t\t<div class=\"order-wrapper mt-50\">\n");
      out.write("\t\t\t\t\t\t\t<h3 class=\"billing-title mb-10\">Your Order</h3>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"order-list\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"list-row d-flex justify-content-between\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div>Product</div>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div>Total</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");

                                                            if(rs.next())
                                                            {
                                                                do
                                                                {

      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"list-row d-flex justify-content-between\">\n");
      out.write("                                                                    <div class=\"col-9\">\n");
      out.write("                                                                            ");
      out.print(rs.getString("prod_name"));
      out.write("\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                    <div class=\"col-1\">\n");
      out.write("                                                                            x ");
      out.print(rs.getInt("quant"));
      out.write("\n");
      out.write("                                                                    </div>\n");
      out.write("                                                                        ");
 int prod_total = (rs.getInt("costprice")*rs.getInt("quant"));
      out.write("\n");
      out.write("                                                                    <div>\n");
      out.write("                                                                            Rs. ");
out.println(prod_total);
      out.write("\n");
      out.write("                                                                    </div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");

                                                                gt+=prod_total;
                                                                }while(rs.next());
                                                            }   

      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"list-row d-flex justify-content-between\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h6>Subtotal</h6>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div>Rs. ");
out.println(gt);
      out.write("</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"list-row d-flex justify-content-between\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h6>Shipping</h6>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div>Flat rate: $50.00</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"list-row border-bottom-0 d-flex justify-content-between\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<h6>Total</h6>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"total\">Rs. ");
out.println(gt);
      out.write("</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t\t<!-- End Billing Details Form -->\n");
      out.write("\n");
      out.write("            <!-- Start Most Search Product Area -->\n");
      out.write("            <section class=\"section-half\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"organic-section-title text-center\">\n");
      out.write("                        <h3>Most Searched Products</h3>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"row mt-30\">\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r1.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Blueberry</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $240.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r2.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Cabbage</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $189.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r3.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Raspberry</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $189.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r4.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Kiwi</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $189.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r5.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore Bell Pepper</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $120.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r6.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Blackberry</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $120.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r7.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Brocoli</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $120.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r8.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Carrot</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $120.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r9.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Strawberry</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $240.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r10.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Prixma MG2 Light Inkjet</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $240.00</div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r11.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Cherry</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $240.00 <del>$340.00</del></div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-4 col-sm-6\">\n");
      out.write("                            <div class=\"single-search-product d-flex\">\n");
      out.write("                                <a href=\"#\"><img src=\"img/r12.jpg\" alt=\"\"></a>\n");
      out.write("                                <div class=\"desc\">\n");
      out.write("                                    <a href=\"#\" class=\"title\">Pixelstore fresh Beans</a>\n");
      out.write("                                    <div class=\"price\"><span class=\"lnr lnr-tag\"></span> $240.00 <del>$340.00</del></div>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </section>\n");
      out.write("            <!-- End Most Search Product Area -->\n");
      out.write("\n");
      out.write("            <!-- start footer Area -->      \n");
      out.write("            <footer class=\"footer-area section-gap\">\n");
      out.write("                <div class=\"container\">\n");
      out.write("                    <div class=\"row\">\n");
      out.write("                        <div class=\"col-lg-3  col-md-6 col-sm-6\">\n");
      out.write("                            <div class=\"single-footer-widget\">\n");
      out.write("                                <h6>About Us</h6>\n");
      out.write("                                <p>\n");
      out.write("                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.\n");
      out.write("                                </p>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3  col-md-6 col-sm-6\">\n");
      out.write("                            <div class=\"single-footer-widget\">\n");
      out.write("                                <h6>Newsletter</h6>\n");
      out.write("                                <p>Stay update with our latest</p>\n");
      out.write("                                <div class=\"\" id=\"mc_embed_signup\">\n");
      out.write("\n");
      out.write("                                        <form target=\"_blank\" novalidate=\"true\" action=\"https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01\" method=\"get\" class=\"form-inline\">\n");
      out.write("\n");
      out.write("                                        <div class=\"d-flex flex-row\">\n");
      out.write("\n");
      out.write("                                            <input class=\"form-control\" name=\"EMAIL\" placeholder=\"Enter Email\" onfocus=\"this.placeholder = ''\" onblur=\"this.placeholder = 'Enter Email '\" required=\"\" type=\"email\">\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                <button class=\"click-btn btn btn-default\"><i class=\"fa fa-long-arrow-right\" aria-hidden=\"true\"></i></button>\n");
      out.write("                                                <div style=\"position: absolute; left: -5000px;\">\n");
      out.write("                                                    <input name=\"b_36c4fd991d266f23781ded980_aefe40901a\" tabindex=\"-1\" value=\"\" type=\"text\">\n");
      out.write("                                                </div>\n");
      out.write("                                            \n");
      out.write("                                            <!-- <div class=\"col-lg-4 col-md-4\">\n");
      out.write("                                                <button class=\"bb-btn btn\"><span class=\"lnr lnr-arrow-right\"></span></button>\n");
      out.write("                                            </div>  -->\n");
      out.write("                                        </div>      \n");
      out.write("                                        <div class=\"info\"></div>\n");
      out.write("                                        </form>\n");
      out.write("                                </div>\n");
      out.write("                                </div>\n");
      out.write("                        </div>                      \n");
      out.write("                        <div class=\"col-lg-3  col-md-6 col-sm-6\">\n");
      out.write("                            <div class=\"single-footer-widget mail-chimp\">\n");
      out.write("                                <h6 class=\"mb-20\">Instragram Feed</h6>\n");
      out.write("                                <ul class=\"instafeed d-flex flex-wrap\">\n");
      out.write("                                    <li><img src=\"img/i1.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i2.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i3.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i4.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i5.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i6.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i7.jpg\" alt=\"\"></li>\n");
      out.write("                                    <li><img src=\"img/i8.jpg\" alt=\"\"></li>\n");
      out.write("                                </ul>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-lg-3 col-md-6 col-sm-6\">\n");
      out.write("                            <div class=\"single-footer-widget\">\n");
      out.write("                                <h6>Follow Us</h6>\n");
      out.write("                                <p>Let us be social</p>\n");
      out.write("                                <div class=\"footer-social d-flex align-items-center\">\n");
      out.write("                                    <a href=\"#\"><i class=\"fa fa-facebook\"></i></a>\n");
      out.write("                                    <a href=\"#\"><i class=\"fa fa-twitter\"></i></a>\n");
      out.write("                                    <a href=\"#\"><i class=\"fa fa-dribbble\"></i></a>\n");
      out.write("                                    <a href=\"#\"><i class=\"fa fa-behance\"></i></a>\n");
      out.write("                                </div>\n");
      out.write("                            </div>\n");
      out.write("                        </div>                          \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"footer-bottom d-flex justify-content-center align-items-center flex-wrap\">\n");
      out.write("                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\n");
      out.write("                        <p class=\"footer-text m-0\">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a></p>\n");
      out.write("                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </footer>   \n");
      out.write("            <!-- End footer Area -->        \n");
      out.write("\n");
      out.write("            <script src=\"js/vendor/jquery-2.2.4.min.js\"></script>\n");
      out.write("            <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js\" integrity=\"sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4\" crossorigin=\"anonymous\"></script>\n");
      out.write("            <script src=\"js/vendor/bootstrap.min.js\"></script>\n");
      out.write("            <script src=\"js/jquery.ajaxchimp.min.js\"></script>\n");
      out.write("            <script src=\"js/jquery.nice-select.min.js\"></script>\n");
      out.write("            <script src=\"js/jquery.sticky.js\"></script>\n");
      out.write("            <script src=\"js/ion.rangeSlider.js\"></script>\n");
      out.write("            <script src=\"js/jquery.magnific-popup.min.js\"></script>\n");
      out.write("            <script src=\"js/owl.carousel.min.js\"></script>            \n");
      out.write("            <script src=\"js/main.js\"></script>\n");
      out.write("        </body>\n");
      out.write("    </html>\n");
 
        }
    catch(Exception e)
    {
        out.print("Error : "+e.getMessage());
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

      out.write("      ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
