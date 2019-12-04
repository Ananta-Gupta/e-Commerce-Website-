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
            qry = "select * from category";
            st=con.prepareStatement(qry);

            rs=st.executeQuery();
%>
    <!DOCTYPE html>
    <html lang="zxx" class="no-js">
    <head>
        <!-- Mobile Specific Meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon-->
        <link rel="shortcut icon" href="img/fav.png">
        <!-- Author Meta -->
        <meta name="author" content="CodePixar">
        <!-- Meta Description -->
        <meta name="description" content="">
        <!-- Meta Keyword -->
        <meta name="keywords" content="">
        <!-- meta character set -->
        <meta charset="UTF-8">
        <!-- Site Title -->
        <title>Category</title>

        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
            <!--
            CSS
            ============================================= -->
            <link rel="stylesheet" href="css/linearicons.css">
            <link rel="stylesheet" href="css/owl.carousel.css">            
            <link rel="stylesheet" href="css/font-awesome.min.css">
            <link rel="stylesheet" href="css/nice-select.css">
            <link rel="stylesheet" href="css/ion.rangeSlider.css" />
            <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
            <link rel="stylesheet" href="css/bootstrap.css">
            <link rel="stylesheet" href="css/main.css">
        </head>
        <body>

            <!-- Start Header Area -->
                <jsp:include page="common_header.jsp"/>
            <!-- End Header Area -->

            <!-- Start Banner Area -->
            <section class="banner-area organic-breadcrumb">
                <div class="container">
                    <div class="breadcrumb-banner d-flex flex-wrap align-items-center">
                        <div class="col-first">
                            <h1>Shop Category page</h1>
                             <nav class="d-flex align-items-center justify-content-start">
                                <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                <a href="category.html">Fashion Category</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->
            
            <div class="container">
                <div class="row">
                    <section class="lattest-product-area pb-40 category-list">
                        <div class="row">
                            <div class="col-md-4 single-product">
                                <div class="content">
                                    <div class="content-overlay"></div>
                                    <img class="content-image img-fluid d-block mx-auto" src="img/cat_men.png" alt="">
                                    <div class="content-details fadeIn-bottom">
                                        <div class="bottom d-flex align-items-center justify-content-center">
                                            <a href="men_category.jsp?catid=1"><span>Men</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 single-product">
                                <div class="content">
                                    <div class="content-overlay"></div>
                                    <img class="content-image img-fluid d-block mx-auto" src="img/women_cat.png" alt="">
                                    <div class="content-details fadeIn-bottom">
                                          <div class="bottom d-flex align-items-center justify-content-center">
                                            <a href="#"><span>Women</span></a>
                                          </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 single-product">
                                <div class="content">
                                    <div class="content-overlay"></div>
                                    <img class="content-image img-fluid d-block mx-auto" src="img/kid_cat.png" alt="">
                                    <div class="content-details fadeIn-bottom">
                                          <div class="bottom d-flex align-items-center justify-content-center">
                                              <a href="#"><span>Kids</span></a>
                                          </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            
            <!-- start footer Area -->
                <jsp:include page="common_footer.jsp"/>
            <!-- End footer Area -->
<%
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
%>