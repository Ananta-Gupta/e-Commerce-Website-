package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;
import java.util.Date;

public final class common_005flogin_005fheader_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String email = session.getAttribute("email").toString();

      out.write("\n");
      out.write("<header class=\"default-header\">\n");
      out.write("    <div class=\"menutop-wrap\">\n");
      out.write("        <div class=\"menu-top container\">\n");
      out.write("            <div class=\"d-flex justify-content-between align-items-center\">\n");
      out.write("                <ul class=\"list\">\n");
      out.write("                    <li><a href=\"tel:+91-9840363028\">+91-98040363028</a></li>\n");
      out.write("                    <li><a href=\"mailto:gupta.officials@gmail.com\">gupta.officials@gmail.com</a></li>\t\t\t\t\t\t\t\t\n");
      out.write("                </ul>\n");
      out.write("                <ul class=\"list\">\n");
      out.write("                    <li>");
out.print(email);
      out.write("</li>\n");
      out.write("                    <li><a href=\"user/userpage.jsp\">Login</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <nav class=\"navbar navbar-expand-lg  navbar-light\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"index.jsp\">\n");
      out.write("                <img src=\"img/logo.png\" alt=\"\">  Fashion Mart\n");
      out.write("            </a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarSupportedContent\" aria-controls=\"navbarSupportedContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("              <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("            </button>\n");
      out.write("            <div class=\"collapse navbar-collapse justify-content-end align-items-center\" id=\"navbarSupportedContent\">\n");
      out.write("                <ul class=\"navbar-nav\">\n");
      out.write("                    <li><a href=\"#home\">Home</a></li>\n");
      out.write("                    <li><a href=\"#catagory\">Category</a></li>\n");
      out.write("                    <li><a href=\"#men\">Men</a></li>\n");
      out.write("                    <li><a href=\"#women\">Women</a></li>\n");
      out.write("                    <li><a href=\"#latest\">latest</a></li>\n");
      out.write("                        <!-- Dropdown -->\n");
      out.write("                    <li class=\"dropdown\">\n");
      out.write("                        <a class=\"dropdown-toggle\" href=\"#\" id=\"navbardrop\" data-toggle=\"dropdown\">\n");
      out.write("                          Pages\n");
      out.write("                        </a>\n");
      out.write("                        <div class=\"dropdown-menu\">\n");
      out.write("                            <a class=\"dropdown-item\" href=\"category.jsp\">Category</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"cart.jsp\">Cart</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"checkout.jsp\">Checkout</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"confermation.jsp\">Confermation</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"user/userlogin.jsp\">Login</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"tracking.html\">Tracking</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"generic.html\">Generic</a>\n");
      out.write("                            <a class=\"dropdown-item\" href=\"elements.html\">Elements</a>\n");
      out.write("                        </div>\n");
      out.write("                    </li>\t\t\t\t\t\t\t\t\t\n");
      out.write("                </ul>\n");
      out.write("            </div>\t\t\t\t\t\t\n");
      out.write("        </div>\n");
      out.write("    </nav>\n");
      out.write("</header>");
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
