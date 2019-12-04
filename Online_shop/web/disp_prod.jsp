<%@page import="java.sql.*, java.util.*" %>
<% 
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;
        String qry="";
        
        String guest_id = session.getAttribute("guest_id").toString();
        int prod_code = Integer.parseInt(request.getParameter("prod_code"));
        //int prod_code = 1;
        
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
            qry = "select * from products where prod_code=?";
            st=con.prepareStatement(qry);
            String path="";
            st.setInt(1, prod_code);
            
            rs=st.executeQuery();
            if(rs.next())
            {
                path="prod_code="+rs.getInt("prod_code")+"&prod_name="+rs.getString("prod_name");
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
        <title><%=rs.getString("prod_name")%></title>

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

            <!-- Start Product Details -->
            <div class="container">
                <div class="product-quick-view">
                    <div class="row align-items-center">
                        <div class="col-lg-6">
                            <div class="quick-view-carousel-details">
                                <div class="item" style="background: url(<%=rs.getString("prod_path")%>);"></div>
                                <div class="item" style="background: url(<%=rs.getString("prod_path")%>);"></div>
                                <div class="item" style="background: url(<%=rs.getString("prod_path")%>);"></div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="quick-view-content">
                                <form action="addtocart.jsp" method="post">
                                <div class="top"> 
                                    <h5 class="head"><%=rs.getString("brand")%></h5>
                                    <h3 class="head"><%=rs.getString("prod_name")%></h3>
                                    <div class="price d-flex align-items-center"><span class="lnr lnr-tag"></span><span class="ml-10">Rs. <%=rs.getString("costprice")%>  <h5><del>Rs. <%=rs.getString("mrpprice")%></del></h5></span></div>
                                    <div class="category">Category: <span>Household</span></div>
                                    <div class="available">Availibility: <span><%=rs.getString("status")%></span></div>
                                    <input type="hidden" class="form-control" id="prod_code" name="prod_code" value="<%=rs.getInt("prod_code")%>" readonly="Readable">
                                    <input type="hidden" class="form-control" id="prod_name" name="prod_name" value="<%=rs.getString("prod_name")%>" readonly="Readable">
                                    <input type="hidden" class="form-control" id="costprice" name="costprice" value="<%=rs.getInt("costprice")%>" readonly="Readable">
                                    <input type="hidden" class="form-control" id="prod_path" name="prod_path" value="<%=rs.getString("prod_path")%>" readonly="Readable">
                                </div>
                                <div class="middle">
                                    <p class="content"><%=rs.getString("discp")%></p>
                                </div>
                                <div>
                                    
                                    <div class="quantity-container d-flex align-items-center mt-15">
                                        Quantity:
                                        <input type="text" class="quantity-amount ml-15" value="1" name="quant" />
                                        <div class="arrow-btn d-inline-flex flex-column">
                                            <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                            <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                        </div>
                                    </div>
                                    <div class="d-flex mt-20">
                                        <button type="submit" class="btn btn-default">Add to Cart</button>
                                        <!--a href='addtocart.jsp' class="view-btn color-2">
                                        <span>Add to Cart</span></a>
                                        <a href="#" class="like-btn"><span class="lnr lnr-layers"></span></a>
                                        <a href="#" class="like-btn"><span class="lnr lnr-heart"></span></a-->
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="details-tab-navigation d-flex justify-content-center mt-30">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li>
                            <a class="nav-link" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-expanded="true">Description</a>
                        </li>
                        <li>
                            <a class="nav-link" id="specification-tab" data-toggle="tab" href="#specification" role="tab" aria-controls="specification">Specification</a>
                        </li>
                        <li>
                            <a class="nav-link" id="comments-tab" data-toggle="tab" href="#comments" role="tab" aria-controls="comments">Comments</a>
                        </li>
                        <li>
                            <a class="nav-link active" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews">Reviews</a>
                        </li>
                    </ul>
                </div>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade" id="description" role="tabpanel" aria-labelledby="description">
                        <div class="description">
                            <h6><%=rs.getString("discp")%></h6>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="specification" role="tabpanel" aria-labelledby="specification">
                        <div class="specification-table">
                            <div class="single-row">
                                <span>Width</span>
                                <span>128mm</span>
                            </div>
                            <div class="single-row">
                                <span>Height</span>
                                <span>508mm</span>
                            </div>
                            <div class="single-row">
                                <span>Depth</span>
                                <span>85mm</span>
                            </div>
                            <div class="single-row">
                                <span>Weight</span>
                                <span>52gm</span>
                            </div>
                            <div class="single-row">
                                <span>Quality checking</span>
                                <span>Yes</span>
                            </div>
                            <div class="single-row">
                                <span>Freshness Duration</span>
                                <span>03days</span>
                            </div>
                            <div class="single-row">
                                <span>When packeting</span>
                                <span>Without touch of hand</span>
                            </div>
                            <div class="single-row">
                                <span>Each Box contains</span>
                                <span>60pcs</span>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comments" role="tabpanel" aria-labelledby="comments">
                        <div class="review-wrapper">
                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="total-comment">
                                        <div class="single-comment">
                                            <div class="user-details d-flex align-items-center flex-wrap">
                                                <img src="img/organic-food/u1.png" class="img-fluid order-1 order-sm-1" alt="">
                                                <div class="user-name order-3 order-sm-2">
                                                    <h5>Blake Ruiz</h5>
                                                    <span>12th Feb, 2017 at 05:56 pm</span>
                                                </div>
                                                <a href="#" class="view-btn color-2 reply order-2 order-sm-3"><i class="fa fa-reply" aria-hidden="true"></i><span>Reply</span></a>
                                            </div>

                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                        <div class="single-comment reply-comment">
                                            <div class="user-details d-flex align-items-center flex-wrap">
                                                <img src="img/organic-food/u2.png" class="img-fluid order-1 order-sm-1" alt="">
                                                <div class="user-name order-3 order-sm-2">
                                                    <h5>Logan May</h5>
                                                    <span>12th Feb, 2017 at 05:56 pm</span>
                                                </div>
                                                <a href="#" class="view-btn color-2 reply order-2 order-sm-3"><i class="fa fa-reply" aria-hidden="true"></i><span>Reply</span></a>
                                            </div>
                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                        <div class="single-comment">
                                            <div class="user-details d-flex align-items-center flex-wrap">
                                                <img src="img/organic-food/u3.png" class="img-fluid order-1 order-sm-1" alt="">
                                                <div class="user-name order-3 order-sm-2">
                                                    <h5>Aaron Anderson</h5>
                                                    <span>12th Feb, 2017 at 05:56 pm</span>
                                                </div>
                                                <a href="#" class="view-btn color-2 reply order-2 order-sm-3"><i class="fa fa-reply" aria-hidden="true"></i><span>Reply</span></a>
                                            </div>
                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="add-review">
                                        <h3>Post a comment</h3>
                                        <form action="#" class="main-form">
                                            <input type="text" placeholder="Your Full name" onfocus="this.placeholder=''" onblur="this.placeholder = 'Your Full name'" required class="common-input">
                                            <input type="email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" placeholder="Email Address" onfocus="this.placeholder=''" onblur="this.placeholder = 'Email Address'" required class="common-input">
                                            <input type="text" placeholder="Phone Number" onfocus="this.placeholder=''" onblur="this.placeholder = 'Phone Number'" required class="common-input">
                                            <textarea placeholder="Messege" onfocus="this.placeholder=''" onblur="this.placeholder = 'Messege'" required class="common-textarea"></textarea>
                                            <button class="view-btn color-2"><span>Submit Now</span></button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade show active" id="reviews" role="tabpanel" aria-labelledby="reviews">
                        <div class="review-wrapper">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="review-stat d-flex align-items-center flex-wrap">
                                        <div class="review-overall">
                                            <h3>Overall</h3>
                                            <div class="main-review">4.0</div>
                                            <span>(03 Reviews)</span>
                                        </div>
                                        <div class="review-count">
                                            <h4>Based on 3 Reviews</h4>
                                            <div class="single-review-count d-flex align-items-center">
                                                <span>5 Star</span>
                                                <div class="total-star five-star d-flex align-items-center">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <span>01</span>
                                            </div>
                                            <div class="single-review-count d-flex align-items-center">
                                                <span>4 Star</span>
                                                <div class="total-star four-star d-flex align-items-center">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <span>01</span>
                                            </div>
                                            <div class="single-review-count d-flex align-items-center">
                                                <span>3 Star</span>
                                                <div class="total-star three-star d-flex align-items-center">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <span>01</span>
                                            </div>
                                            <div class="single-review-count d-flex align-items-center">
                                                <span>2 Star</span>
                                                <div class="total-star two-star d-flex align-items-center">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <span>00</span>
                                            </div>
                                            <div class="single-review-count d-flex align-items-center">
                                                <span>1 Star</span>
                                                <div class="total-star one-star d-flex align-items-center">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </div>
                                                <span>00</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="total-comment">
                                        <div class="single-comment">
                                            <div class="user-details d-flex align-items-center">
                                                <img src="img/organic-food/u1.png" class="img-fluid" alt="">
                                                <div class="user-name">
                                                    <h5>Blake Ruiz</h5>
                                                    <div class="total-star five-star d-flex align-items-center">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                        <div class="single-comment">
                                            <div class="user-details d-flex align-items-center">
                                                <img src="img/organic-food/u2.png" class="img-fluid" alt="">
                                                <div class="user-name">
                                                    <h5>Logan May</h5>
                                                    <div class="total-star four-star d-flex align-items-center">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                        <div class="single-comment">
                                            <div class="user-details d-flex align-items-center">
                                                <img src="img/organic-food/u3.png" class="img-fluid" alt="">
                                                <div class="user-name">
                                                    <h5>Aaron Anderson</h5>
                                                    <div class="total-star three-star d-flex align-items-center">
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </div>
                                            <p class="user-comment">
                                                Acres of Diamonds? you?ve read the famous story, or at least had it related to you. A farmer hears tales of diamonds and begins dreaming of vast riches. He sells his farm and hikes off over the horizon, never to be heard from again.
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="add-review">
                                        <h3>Add a Review</h3>
                                        <div class="single-review-count mb-15 d-flex align-items-center">
                                            <span>Your Rating:</span>
                                            <div class="total-star five-star d-flex align-items-center">
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                                <i class="fa fa-star" aria-hidden="true"></i>
                                            </div>
                                            <span>Outstanding</span>
                                        </div>
                                        <form action="#" class="main-form">
                                            <input type="text" placeholder="Your Full name" onfocus="this.placeholder=''" onblur="this.placeholder = 'Your Full name'" required class="common-input">
                                            <input type="email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$" placeholder="Email Address" onfocus="this.placeholder=''" onblur="this.placeholder = 'Email Address'" required class="common-input">
                                            <input type="text" placeholder="Phone Number" onfocus="this.placeholder=''" onblur="this.placeholder = 'Phone Number'" required class="common-input">
                                            <textarea placeholder="Review" onfocus="this.placeholder=''" onblur="this.placeholder = 'Review'" required class="common-textarea"></textarea>
                                            <button class="view-btn color-2"><span>Submit Now</span></button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Product Details -->
                    
            <!-- Start Most Search Product Area -->
            <section class="pt-100 pb-100">
                <div class="container">
                    <div class="organic-section-title text-center">
                        <h3>Most Searched Products</h3>
                    </div>
                    <div class="row mt-30">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r1.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Blueberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r2.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Cabbage</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r3.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Raspberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r4.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Kiwi</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r5.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore Bell Pepper</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r6.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Blackberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r7.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Brocoli</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r8.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Carrot</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r9.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Strawberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r10.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Prixma MG2 Light Inkjet</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r11.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Cherry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="02-11-product-details.html"><img src="img/r12.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="02-11-product-details.html" class="title">Pixelstore fresh Beans</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Most Search Product Area -->

            <!-- start footer Area -->
                <jsp:include page="common_footer.jsp"/>
            <!-- End footer Area -->
<%
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
%>