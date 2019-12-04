<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        PreparedStatement st2= null;
        PreparedStatement st3= null;
        ResultSet rs = null;
        ResultSet rs2 = null;
        ResultSet rs3 = null;
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
            
            rs = st.executeQuery();
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
         meta character set 
        <meta charset="UTF-8">
         Site Title 
        <title>Order</title>

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
                            <h1>Order Confirmation</h1>
                             <nav class="d-flex align-items-center justify-content-start">
                                 <a href="index.jsp">Home<i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                 <a href="order_smry.jsp">Confirmation</a>
                            </nav>
                        </div>
                    </div>
                </div>
            </section>
            <!-- End Banner Area -->

		<!-- Start Checkout Area -->
                    <div class="container">
<%
                if(rs.next())
                {
                    do
                    {
%>
			<p class="text-center">Thank you. Your order has been received.</p>
			<div class="row mt-50">
				<div class="col-md-4">
					<h3 class="billing-title mt-20 pl-15">Order Info</h3>
					<table class="order-rable">
						<tr>
							<td>Order number</td>
							<td>: <%=rs.getString("order_num")%></td>
<%
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
            
            rs2 = st2.executeQuery();
            if(rs2.next())
            {
                do
                {   
%>
						</tr>
						<tr>
							<td>Date</td>
							<td>: Oct 03, 2017</td>
						</tr>
						<tr>
							<td>Total</td>
							<td>: USD 2210</td>
						</tr>
						<tr>
							<td>Payment method</td>
							<td>: Card payments</td>
						</tr>
					</table>
				</div>
				<div class="col-md-4">
					<h3 class="billing-title mt-20 pl-15">Billing Address</h3>
					<table class="order-rable">
						<tr>
							<td>Street</td>
							<td>: <%=rs2.getString("add1")%></td>
						</tr>
						<tr>
							<td>City</td>
							<td>: <%=rs2.getString("city")%></td>
						</tr>
						<tr>
							<td>Country</td>
							<td>: <%=rs2.getString("country")%></td>
						</tr>
						<tr>
							<td>Postcode</td>
							<td>: <%=rs2.getInt("pin")%></td>
						</tr>
					</table>
				</div>
				<div class="col-md-4">
					<h3 class="billing-title mt-20 pl-15">Shipping Address</h3>
					<table class="order-rable">
						<tr>
							<td>Street</td>
							<td>: <%=rs2.getString("add1")%></td>
						</tr>
						<tr>
							<td>City</td>
							<td>: <%=rs2.getString("city")%></td>
						</tr>
						<tr>
							<td>Country</td>
							<td>: <%=rs2.getString("country")%></td>
						</tr>
						<tr>
							<td>Postcode</td>
							<td>: <%=rs2.getInt("pin")%></td>
						</tr>
					</table>
				</div>
			</div>
<%
                }
                while(rs2.next());
            }
        }
        catch(Exception e)
        {
            out.print("Error : "+e.getMessage());
        }
        try
        {
            qry3="select * from order_prod where order_num=?";
            st3=con.prepareStatement(qry3);

            st3.setString(1, order_num);
            
            rs3 = st3.executeQuery();
%>
		</div>
		<!-- End Checkout Area -->
		<!-- Start Billing Details Form -->
		<div class="container">
			<div class="billing-form">
				<div class="row">
					<div class="col-12">
						<div class="order-wrapper mt-50">
							<h3 class="billing-title mb-10">Your Order</h3>
							<div class="order-list">
								<div class="list-row d-flex justify-content-between">
									<div>Product</div>
									<div>Total</div>
								</div>
<%
                                                            if(rs3.next())
                                                            {
                                                                do
                                                                {
%>
								<div class="list-row d-flex justify-content-between">
                                                                    <div class="col-9">
                                                                            <%=rs3.getString("prod_name")%>
                                                                    </div>
                                                                    <div class="col-1">
                                                                            x <%=rs3.getInt("quant")%>
                                                                    </div>
                                                                        <% int prod_total = (rs3.getInt("costprice")*rs3.getInt("quant"));%>
                                                                    <div>
                                                                            Rs. <%out.println(prod_total);%>
                                                                    </div>
								</div>
<%
                                                                gt+=prod_total;
                                                                }while(rs3.next());
                                                            }   
%>
								<div class="list-row d-flex justify-content-between">
									<h6>Subtotal</h6>
									<div>Rs. <%out.println(gt);%></div>
								</div>
								<div class="list-row d-flex justify-content-between">
									<h6>Shipping</h6>
									<div>Flat rate: $50.00</div>
								</div>
								<div class="list-row border-bottom-0 d-flex justify-content-between">
									<h6>Total</h6>
									<div class="total">Rs. <%out.println(gt);%></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
            <footer class="footer-area section-gap">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3  col-md-6 col-sm-6">
                            <div class="single-footer-widget">
                                <h6>About Us</h6>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.
                                </p>
                            </div>
                        </div>
                        <div class="col-lg-3  col-md-6 col-sm-6">
                            <div class="single-footer-widget">
                                <h6>Newsletter</h6>
                                <p>Stay update with our latest</p>
                                <div class="" id="mc_embed_signup">

                                        <form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

                                        <div class="d-flex flex-row">

                                            <input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '" required="" type="email">


                                                <button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
                                                <div style="position: absolute; left: -5000px;">
                                                    <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                                                </div>
                                            
                                            <!-- <div class="col-lg-4 col-md-4">
                                                <button class="bb-btn btn"><span class="lnr lnr-arrow-right"></span></button>
                                            </div>  -->
                                        </div>      
                                        <div class="info"></div>
                                        </form>
                                </div>
                                </div>
                        </div>                      
                        <div class="col-lg-3  col-md-6 col-sm-6">
                            <div class="single-footer-widget mail-chimp">
                                <h6 class="mb-20">Instragram Feed</h6>
                                <ul class="instafeed d-flex flex-wrap">
                                    <li><img src="img/i1.jpg" alt=""></li>
                                    <li><img src="img/i2.jpg" alt=""></li>
                                    <li><img src="img/i3.jpg" alt=""></li>
                                    <li><img src="img/i4.jpg" alt=""></li>
                                    <li><img src="img/i5.jpg" alt=""></li>
                                    <li><img src="img/i6.jpg" alt=""></li>
                                    <li><img src="img/i7.jpg" alt=""></li>
                                    <li><img src="img/i8.jpg" alt=""></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="single-footer-widget">
                                <h6>Follow Us</h6>
                                <p>Let us be social</p>
                                <div class="footer-social d-flex align-items-center">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-dribbble"></i></a>
                                    <a href="#"><i class="fa fa-behance"></i></a>
                                </div>
                            </div>
                        </div>                          
                    </div>
                    <div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p class="footer-text m-0">Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a></p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </footer>   
            <!-- End footer Area -->        

            <script src="js/vendor/jquery-2.2.4.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
            <script src="js/vendor/bootstrap.min.js"></script>
            <script src="js/jquery.ajaxchimp.min.js"></script>
            <script src="js/jquery.nice-select.min.js"></script>
            <script src="js/jquery.sticky.js"></script>
            <script src="js/ion.rangeSlider.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>            
            <script src="js/main.js"></script>
        </body>
    </html>
<% 
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
%>      