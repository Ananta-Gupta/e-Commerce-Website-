<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        ResultSet rs = null;
        String qry="";
        int gt=0;
        
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
            qry="select * from user_add where email=?";
            st=con.prepareStatement(qry);
                
            st.setString(1, email);
            
            rs=st.executeQuery();
            if(rs.next())
            {
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
        <title>Checkout</title>

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
                            <h1>Product Checkout</h1>
                             <nav class="d-flex align-items-center justify-content-start">
                                <a href="index.html">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                <a href="checkout.html">Product Checkout</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->
            
            <!-- Start Checkout Area -->
            <div class="container">
                <div class="checkput-login">
                    <div class="top-title">
                        <p>Returning Customer? <a data-toggle="collapse" href="#checkout-login" aria-expanded="false" aria-controls="checkout-login">Click here to login</a></p>
                    </div>
                    <div class="collapse" id="checkout-login">
                        <div class="checkout-login-collapse d-flex flex-column">
                            <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.</p>
                            <form action="#" class="d-block">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <input type="text" placeholder="Username or Email*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Username or Email*'" required class="common-input mt-10">

                                    </div>
                                    <div class="col-lg-4">
                                        <input type="password" placeholder="Password*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Password*'" required class="common-input mt-10">
                                    </div>
                                </div>
                                <div class="d-flex align-items-center flex-wrap">
                                    <button class="view-btn color-2 mt-20 mr-20"><span>Login</span></button>
                                    <div class="mt-20">
                                        <input type="checkbox" class="pixel-checkbox" id="login-1">
                                        <label for="login-1">Remember me</label>
                                    </div>
                                </div>
                            </form>
                            <a href="#" class="mt-10">Lost your password?</a>
                        </div>
                    </div>
                </div>
                <div class="checkput-login mt-20">
                    <div class="top-title">
                        <p>Have a coupon? <a data-toggle="collapse" href="#checkout-cupon" aria-expanded="false" aria-controls="checkout-cupon">Click here to enter your code</a></p>
                    </div>
                    <div class="collapse" id="checkout-cupon">
                        <div class="checkout-login-collapse d-flex flex-column">
                            <form action="#" class="d-block">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <input type="text" placeholder="Enter coupon code" onfocus="this.placeholder=''" onblur="this.placeholder = 'Enter coupon code'" required class="common-input mt-10">
                                    </div>
                                </div>
                                <button class="view-btn color-2 mt-20"><span>Apply Coupon</span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Checkout Area -->
            
            <!-- Start Billing Details Form -->
            <div class="container">
                <form action="payment_gateway.jsp" method="post" class="billing-form">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <h3 class="billing-title mt-20 mb-10">Billing Details</h3>
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="First name*" onfocus="this.placeholder=''" onblur="this.placeholder = 'First name*'" required class="common-input" value="<%=rs.getString("Fname")%>">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Last name*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Last name*'" required class="common-input" value="<%=rs.getString("Lname")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Company Name" onfocus="this.placeholder=''" onblur="this.placeholder = 'Company Name'" required class="common-input" value="<%=rs.getString("Company")%>">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Phone number*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Phone number*'" required class="common-input" value="<%=rs.getString("Mobno")%>">
                                </div>
                                <div class="col-lg-6">
                                    <input type="email" placeholder="Email Address*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Email Address*'" required class="common-input" value="<%=rs.getString("email")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Country*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Town/City*'" required class="common-input" value="<%=rs.getString("Country")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Address line 01*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Address line 01*'" required class="common-input" value="<%=rs.getString("Add1")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Address line 02*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Address line 02*'" required class="common-input" value="<%=rs.getString("Add2")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Town/City*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Town/City*'" required class="common-input" value="<%=rs.getString("City")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="District*" onfocus="this.placeholder=''" onblur="this.placeholder = 'Town/City*'" required class="common-input" value="<%=rs.getString("Dist")%>">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" placeholder="Postcode/ZIP" onfocus="this.placeholder=''" onblur="this.placeholder = 'Postcode/ZIP'" class="common-input" value="<%=rs.getString("Pin")%>">
                                </div>
                            </div>
                            <h3 class="billing-title mt-20 mb-10">Billing Details</h3>
                            <div class="mt-20">
                                <input type="checkbox" class="pixel-checkbox" id="login-6">
                                <label for="login-6">Ship to a different address?</label>
                            </div>
                            <textarea placeholder="Order Notes" onfocus="this.placeholder=''" onblur="this.placeholder = 'Order Notes'" class="common-textarea"></textarea>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="order-wrapper mt-50">
                                <h3 class="billing-title mb-10">Your Order</h3>
                                <div class="order-list">
                                    <div class="list-row d-flex justify-content-between">
                                        <div>Product</div>
                                        <div>Total</div>
                                    </div>
<%
                            }
                            else{}
                        }
                        catch(Exception e)
                        {
                            out.println("Error : "+e.getMessage());
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
%>
                                    <div class="list-row d-flex justify-content-between">
                                        <div class="col-8"><%=rs.getString("prod_name")%></div>
                                        <div class="col-2">x <%=rs.getInt("quant")%></div>
                                        <% int total = (rs.getInt("costprice")*rs.getInt("quant"));%>
                                            <div class="col-2"><%out.println(total);%></div>
                                    </div>
<%
                                    gt+=total;
                                    }
                                    while(rs.next());
                                    session.setAttribute("gt", gt);
                                }
%>
                                    <div class="list-row d-flex justify-content-between">
                                        <h6>Subtotal</h6>
                                        <div>Rs. <% out.println(gt);%></div>
                                        <input type="text" hidden name="gt" value="<% out.println(gt);%>">
                                    </div>
                                    <div class="list-row d-flex justify-content-between">
                                        <h6>Shipping</h6>
                                        <div>Flat rate: Rs. 50.00</div>
                                    </div>
                                    <div class="list-row d-flex justify-content-between">
                                        <h6>Total</h6>
                                        <div class="total">Rs. <% out.println(gt);%></div>
                                    </div>
                                    <div class="d-flex align-items-center mt-10">
                                        <input class="pixel-radio" type="radio" id="check" name="cod">
                                        <label for="check" class="bold-lable">Cash/Card on Delivery</label>
                                    </div>
                                    <p class="payment-info">Please keep the cash/card at the time of delivery.</p>
                                    <div class="d-flex justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <input class="pixel-radio" type="radio" id="paypal" name="cpay">
                                            <label for="paypal" class="bold-lable">Card Payment</label>
                                        </div>
                                        <img src="img/organic-food/pm.jpg" alt="" class="img-fluid">
                                    </div>
                                    <p class="payment-info">Pay via Credit/Debit card online.</p>
                                    <div class="mt-20 d-flex align-items-start">
                                        <input type="checkbox" class="pixel-checkbox" id="login-4">
                                        <label for="login-4">I've read and accept the <a href="#" class="terms-link">terms & conditions*</a></label>
                                    </div>
                                    <button class="view-btn color-2 w-100 mt-20"><span>Proceed to pay</span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!-- End Billing Details Form -->

            <!-- Start Most Search Product Area -->
            <section class="section-half">
                <div class="container">
                    <div class="organic-section-title text-center">
                        <h3>Most Searched Products</h3>
                    </div>
                    <div class="row mt-30">
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r1.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Blueberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r2.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Cabbage</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r3.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Raspberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r4.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Kiwi</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r5.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore Bell Pepper</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r6.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Blackberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r7.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Brocoli</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r8.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Carrot</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $120.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r9.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Strawberry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r10.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Prixma MG2 Light Inkjet</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r11.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Cherry</a>
                                    <div class="price"><span class="lnr lnr-tag"></span> $240.00 <del>$340.00</del></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <div class="single-search-product d-flex">
                                <a href="#"><img src="img/r12.jpg" alt=""></a>
                                <div class="desc">
                                    <a href="#" class="title">Pixelstore fresh Beans</a>
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

            <script src="js/vendor/jquery-2.2.4.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
            <script src="js/vendor/bootstrap.min.js"></script>
            <script src="js/jquery.ajaxchimp.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
            <script src="js/jquery.sticky.js"></script>
            <script src="js/ion.rangeSlider.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/main.js"></script>  
        </body>
    </html>
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