<%@page import="java.sql.*, java.util.*" %>
<% 
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";
        
        int catid = Integer.parseInt(request.getParameter("catid"));

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
            qry = "select * from products where catid=?";
            st=con.prepareStatement(qry);
            
            st.setInt(1, catid);
            
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
        <title>Men Category</title>

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
            <header class="default-header">
                <div class="menutop-wrap">
                    <div class="menu-top container">
                        <div class="d-flex justify-content-between align-items-center">
                            <ul class="list">
                                    <li><a href="tel:+91-9840363028">+91-98040363028</a></li>
                                    <li><a href="mailto:gupta.officials@gmail.com">gupta.officials@gmail.com</a></li>								
                            </ul>
                            <ul class="list">
                                <li><a href="user/login.jsp">login</a></li>
                            </ul>
                        </div>
                    </div>					
                </div>
                <nav class="navbar navbar-expand-lg  navbar-light">
                    <div class="container">
                        <a class="navbar-brand" href="index.jsp">
                            <img src="img/logo.png" alt="">  Fashion Mart
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                            <ul class="navbar-nav">
                                <li><a href="#home">Home</a></li>
                                <li><a href="#category">Category</a></li>
                                <li><a href="#men">Men</a></li>
                                <li><a href="#women">Women</a></li>
                                <li><a href="#latest">latest</a></li>
                                        <!-- Dropdown -->
                                    <li class="dropdown">
                                      <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                        Pages
                                      </a>
                                      <div class="dropdown-menu">
                                        <a class="dropdown-item" href="category.jsp">Category</a>
                                        <a class="dropdown-item" href="cart.jsp">Cart</a>
                                        <a class="dropdown-item" href="checkout.html">Checkout</a>
                                        <a class="dropdown-item" href="confermation.html">Confermation</a>
                                        <a class="dropdown-item" href="user/userlogin.jsp">Login</a>
                                        <a class="dropdown-item" href="tracking.html">Tracking</a>
                                        <a class="dropdown-item" href="generic.html">Generic</a>
                                        <a class="dropdown-item" href="elements.html">Elements</a>
                                    </div>
                                    </li>									
                            </ul>
                        </div>						
                    </div>
                </nav>
            </header>
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
            
            <!-- Start Filter Bar -->
                <div class="container">
                    <div class="row">
                            <div class="col-xl-9 col-lg-8 col-md-7">
                                    <!-- Start Filter Bar -->
                                    <div class="filter-bar d-flex flex-wrap align-items-center">
                                            <a href="#" class="grid-btn active"><i class="fa fa-th" aria-hidden="true"></i></a>
                                            <a href="#" class="list-btn"><i class="fa fa-th-list" aria-hidden="true"></i></a>
                                            <div class="sorting">
                                                    <select>
                                                            <option value="1">Default sorting</option>
                                                            <option value="1">Default sorting</option>
                                                            <option value="1">Default sorting</option>
                                                    </select>
                                            </div>
                                            <div class="sorting mr-auto">
                                                    <select>
                                                            <option value="1">Show 12</option>
                                                            <option value="1">Show 12</option>
                                                            <option value="1">Show 12</option>
                                                    </select>
                                            </div>
                                            <div class="pagination">
                                                    <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                                    <a href="#" class="active">1</a>
                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                                                    <a href="#">6</a>
                                                    <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                            </div>
                                    </div>
                                    <!-- End Filter Bar -->

                                    <!-- Start Best Seller -->
                                    <section class="lattest-product-area pb-40 category-list">
                                        <div class="row">
<%
                                        if(rs.next())
                                        {
                                            do{
                                                session.setAttribute("catid", catid);
%>
                                            <div class="col-xl-4 col-lg-6 col-md-12 col-sm-6 single-product">
                                                <div class="content">
                                                    <div class="content-overlay"></div>
                                                    <img class="content-image img-fluid d-block mx-auto" src="<%=rs.getString("prod_path")%>" alt="">
                                                    <div class="content-details fadeIn-bottom">
                                                        <div class="bottom d-flex align-items-center justify-content-center">
                                                            <a href="#"><span class="lnr lnr-heart"></span></a>
                                                            <a href="#"><span class="lnr lnr-layers"></span></a>
                                                            <a href="#"><span class="lnr lnr-cart"></span></a>
                                                            <a href="#" data-toggle="modal" data-target="#exampleModal"><span class="lnr lnr-frame-expand"></span></a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="price">
                                                    <h5><a href='disp_prod.jsp?prod_code=<%=rs.getInt("prod_code")%>'><%=rs.getString("prod_name")%></a></h5>
                                                    <h3>Rs. <%=rs.getInt("costprice")%></h3>
                                                    <h4><del>Rs. <%=rs.getInt("mrpprice")%></del></h4>
                                                </div>
                                            </div>
<%
                                            }while(rs.next());
                                        }
%>
                                        </div>
                                    </section>
                                    <!-- End Best Seller -->
                                    
                                    <!-- Start Filter Bar -->
                                    <div class="filter-bar d-flex flex-wrap align-items-center">
                                            <div class="sorting mr-auto">
                                                    <select>
                                                            <option value="1">Show 12</option>
                                                            <option value="1">Show 12</option>
                                                            <option value="1">Show 12</option>
                                                    </select>
                                            </div>
                                            <div class="pagination">
                                                    <a href="#" class="prev-arrow"><i class="fa fa-long-arrow-left" aria-hidden="true"></i></a>
                                                    <a href="#" class="active">1</a>
                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#" class="dot-dot"><i class="fa fa-ellipsis-h" aria-hidden="true"></i></a>
                                                    <a href="#">6</a>
                                                    <a href="#" class="next-arrow"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a>
                                            </div>
                                    </div>
                                    <!-- End Filter Bar -->
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-5">
                                    <div class="sidebar-categories">
                                            <div class="head">Browse Categories</div>
                                            <ul class="main-categories">
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#fruitsVegetable" aria-expanded="false" aria-controls="fruitsVegetable"><span class="lnr lnr-arrow-right"></span>Fruits and Vegetables<span class="number">(53)</span></a>
                                                            <ul class="collapse" id="fruitsVegetable" data-toggle="collapse" aria-expanded="false" aria-controls="fruitsVegetable">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>

                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#meatFish" aria-expanded="false" aria-controls="meatFish"><span class="lnr lnr-arrow-right"></span>Meat and Fish<span class="number">(53)</span></a>
                                                            <ul class="collapse" id="meatFish" data-toggle="collapse" aria-expanded="false" aria-controls="meatFish">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#cooking" aria-expanded="false" aria-controls="cooking"><span class="lnr lnr-arrow-right"></span>Cooking<span class="number">(53)</span></a>
                                                            <ul class="collapse" id="cooking" data-toggle="collapse" aria-expanded="false" aria-controls="cooking">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#beverages" aria-expanded="false" aria-controls="beverages"><span class="lnr lnr-arrow-right"></span>Beverages<span class="number">(24)</span></a>
                                                            <ul class="collapse" id="beverages" data-toggle="collapse" aria-expanded="false" aria-controls="beverages">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#homeClean" aria-expanded="false" aria-controls="homeClean"><span class="lnr lnr-arrow-right"></span>Home and Cleaning<span class="number">(53)</span></a>
                                                            <ul class="collapse" id="homeClean" data-toggle="collapse" aria-expanded="false" aria-controls="homeClean">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a href="#">Pest Control<span class="number">(24)</span></a></li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#officeProduct" aria-expanded="false" aria-controls="officeProduct"><span class="lnr lnr-arrow-right"></span>Office Products<span class="number">(77)</span></a>
                                                            <ul class="collapse" id="officeProduct" data-toggle="collapse" aria-expanded="false" aria-controls="officeProduct">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#beauttyProduct" aria-expanded="false" aria-controls="beauttyProduct"><span class="lnr lnr-arrow-right"></span>Beauty Products<span class="number">(65)</span></a>
                                                            <ul class="collapse" id="beauttyProduct" data-toggle="collapse" aria-expanded="false" aria-controls="beauttyProduct">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#healthProduct" aria-expanded="false" aria-controls="healthProduct"><span class="lnr lnr-arrow-right"></span>Health Products<span class="number">(29)</span></a>
                                                            <ul class="collapse" id="healthProduct" data-toggle="collapse" aria-expanded="false" aria-controls="healthProduct">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a href="#">Pet Care<span class="number">(29)</span></a></li>
                                                    <li class="main-nav-list"><a data-toggle="collapse" href="#homeAppliance" aria-expanded="false" aria-controls="homeAppliance"><span class="lnr lnr-arrow-right"></span>Home Appliances<span class="number">(15)</span></a>
                                                            <ul class="collapse" id="homeAppliance" data-toggle="collapse" aria-expanded="false" aria-controls="homeAppliance">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                                    <li class="main-nav-list"><a class="border-bottom-0" data-toggle="collapse" href="#babyCare" aria-expanded="false" aria-controls="babyCare"><span class="lnr lnr-arrow-right"></span>Baby Care<span class="number">(48)</span></a>
                                                            <ul class="collapse" id="babyCare" data-toggle="collapse" aria-expanded="false" aria-controls="babyCare">
                                                                    <li class="main-nav-list child"><a href="#">Frozen Fish<span class="number">(13)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Dried Fish<span class="number">(09)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Fresh Fish<span class="number">(17)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#">Meat Alternatives<span class="number">(01)</span></a></li>
                                                                    <li class="main-nav-list child"><a href="#" class="border-bottom-0">Meat<span class="number">(11)</span></a></li>
                                                            </ul>
                                                    </li>
                                            </ul>
                                    </div>
                                    <div class="sidebar-filter mt-50">
                                            <div class="top-filter-head">Product Filters</div>
                                            <div class="common-filter">
                                                    <div class="head">Active Filters</div>
                                                    <ul>
                                                            <li class="filter-list"><i class="fa fa-window-close" aria-hidden="true"></i>Gionee (29)</li>
                                                            <li class="filter-list"><i class="fa fa-window-close" aria-hidden="true"></i>Black with red (09)</li>
                                                    </ul>
                                            </div>
                                            <div class="common-filter">
                                                    <div class="head">Brands</div>
                                                    <form action="#">
                                                            <ul>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Micromax<span>(19)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
                                                            </ul>
                                                    </form>
                                            </div>
                                            <div class="common-filter">
                                                    <div class="head">Color</div>
                                                    <form action="#">
                                                            <ul>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">Black Leather<span>(29)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">Black with red<span>(19)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
                                                                    <li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">Spacegrey<span>(19)</span></label></li>
                                                            </ul>
                                                    </form>
                                            </div>
                                            <div class="common-filter">
                                                    <div class="head">Price</div>
                                                    <div class="price-range-area">
                                                            <div id="price-range"></div>
                                                            <div class="value-wrapper d-flex">
                                                                    <div class="price">Price:</div>
                                                                    <span>$</span><div id="lower-value"></div> <div class="to">to</div> 
                                                                    <span>$</span><div id="upper-value"></div>
                                                            </div>
                                                    </div>
                                            </div>
                                    </div>
                            </div>
                    </div>
                </div>
		
            <!-- Start Most Search Product Area -->
            
            <!-- start footer Area -->
                <jsp:include page="common_footer.jsp"/>
            <!-- End footer Area -->
<%
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
%>