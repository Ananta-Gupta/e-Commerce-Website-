<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        //ResultSet rs = null;
        //String qry="";
        
        long guest_id;
        guest_id=0L;
        
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
            Date date = new Date();
            long time = date.getTime();
            guest_id = time;
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
        
        try
        {
            String email= session.getAttribute("email").toString();
             session.setAttribute("guest_id", email); 
        }    
        catch(Exception e)
        {
             session.setAttribute("guest_id", guest_id); 
        }
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
		<title>Fashion Mart</title>

		<link href="https://fonts.googleapis.com/css?family=Poppins:100,200,400,300,500,600,700" rel="stylesheet"> 
			<!--
			CSS
			============================================= -->
			<link rel="stylesheet" href="css/linearicons.css">
			<link rel="stylesheet" href="css/font-awesome.min.css">
			<link rel="stylesheet" href="css/nice-select.css">
                        <link rel="stylesheet" href="css/ion.rangeSlider.css" />
                        <link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/main.css">
		</head>
		<body>

			<!-- Start Header Area -->
<%
                    try
                        {
                            String email= session.getAttribute("email").toString(); 
%>
                            <jsp:include page="common_login_header.jsp"/>
<%
                        }    
                        catch(Exception e)
                        { 
%>
                             <jsp:include page="common_header.jsp"/>
<%
                        }
%>
			<!-- End Header Area -->

			<!-- start banner Area -->
			<section class="banner-area relative" id="home">
				<div class="container-fluid">
					<div class="row fullscreen align-items-center justify-content-center">
						<div class="col-lg-6 col-md-12 d-flex align-self-end img-right no-padding">
							<img class="img-fluid" src="img/header-img.png" alt="">
						</div>
						<div class="banner-content col-lg-6 col-md-12">
							<h1 class="title-top"><span>Flat</span> 75%Off</h1>
							<h1 class="text-uppercase">
								It?s Happening <br>
								this Season!
							</h1>
							<button class="primary-btn text-uppercase"><a href="#">Purchase Now</a></button>
						</div>							
					</div>
				</div>
			</section>
			<!-- End banner Area -->	

			<!-- Start category Area -->
			<section class="category-area section-gap section-gap" id="catagory">
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-40">
							<div class="title text-center">
								<h1 class="mb-10">Shop for Different Categories</h1>
								<p>Who are in extremely love with eco friendly system.</p>
							</div>
						</div>
					</div>					
					<div class="row">
						<div class="col-lg-8 col-md-8 mb-10">
							<div class="row category-bottom">
								<div class="col-lg-6 col-md-6 mb-30">
									<div class="content">
                                                                            <a href="category.html" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/women.png" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Product for Women</h3>
									      </div>
									    </a>
									</div>
								</div>
								<div class="col-lg-6 col-md-6 mb-30">
									<div class="content">
									    <a href="#" target="_blank">
                                                                                <div class="content-overlay"></div>
                                                                                  <img class="content-image img-fluid d-block mx-auto" src="img/kids.png" alt="">
                                                                                <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Product for Kids</h3>
									      </div>
									    </a>
									</div>
								</div>
								<div class="col-lg-12">
									<div class="content">
										<a href="#" target="_blank">
									      <div class="content-overlay"></div>
									  		 <img class="content-image img-fluid d-block mx-auto" src="img/c3.jpg" alt="">
									      <div class="content-details fadeIn-bottom">
									        <h3 class="content-title">Shop Now</h3>
									      </div>
									    </a>
									</div>
							  	</div>																
							</div>							
						</div>
						<div class="col-lg-4 col-md-4 mb-10">
						  <div class="content">
						    <a href="#" target="_blank">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/men.png" alt="">
						      <div class="content-details fadeIn-bottom">
						        <h3 class="content-title">Product For Men</h3>
						      </div>
						    </a>
						  </div>
						</div>						
					</div>
				</div>	
			</section>
			<!-- End category Area -->
			
			<!-- Start men-product Area -->
			<section class="men-product-area section-gap relative" id="men">
				<div class="overlay overlay-bg"></div>
				<div class="container">
					<div class="row d-flex justify-content-center">
						<div class="menu-content pb-40">
							<div class="title text-center">
								<h1 class="text-white mb-10">New released Products for Men</h1>
								<p class="text-white">Who are in extremely love with eco friendly system.</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l1.png" alt="">
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
						  		<h5 class="text-white">Half Sleeve T-Shirt</h5>
						  		<h3 class="text-white">231</h3>
						   </div>
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l2.png" alt="">
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
						  		<h5 class="text-white">Long Sleeve T-Shirt</h5>
						  		<h3 class="text-white">349</h3>
						   </div>							  
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l3.png" alt="">
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
						  		<h5 class="text-white">Hoodie</h5>
						  		<h3 class="text-white">499</h3>
						   </div>							  
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
					      	<div class="content-overlay"></div>
					  		 <img class="content-image img-fluid d-block mx-auto" src="img/l4.png" alt="">
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
						  		<h5 class="text-white">Sleeveless T-Shirt</h5>
						  		<h3 class="text-white">199</h3>
						    </div>							  					  
						</div>																		
					</div>
				</div>	
			</section>
			<!-- End men-product Area -->

			<!-- Start women-product Area -->
			<section class="women-product-area section-gap" id="women">
				<div class="container">
					<div class="countdown-content pb-40">
						<div class="title text-center">
							<h1 class="mb-10">New released Products for Women</h1>
							<p>Who are in extremely love with eco friendly system.</p>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l5.png" alt="">
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
						  		<h5>Half Sleeve T-Shirt</h5>
						  		<h3>149</h3>
						   </div>						  
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l6.png" alt="">
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
						  		<h5>Long Sleeve T-Shirt</h5>
						  		<h3>199</h3>
						   </div>						  
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l7.png" alt="">
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
						  		<h5>Pack of 4 T-Shirts</h5>
						  		<h3>499</h3>
						   </div>						  
						</div>	
						<div class="col-lg-3 col-md-6 single-product">
						  <div class="content">
						      <div class="content-overlay"></div>
						  		 <img class="content-image img-fluid d-block mx-auto" src="img/l8.png" alt="">
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
						  		<h5>Crop Top</h5>
						  		<h3>299</h3>
						   </div>						  
						</div>																			
					</div>
				</div>	
			</section>
			<!-- End women-product Area -->
			
			<!-- Start Count Down Area -->
			<div class="countdown-area">
				<div class="container">
					<div class="countdown-content">
						<div class="title text-center">
							<h1 class="mb-10">Exclusive Hot Deal Ends in:</h1>
							<p>Who are in extremely love with eco friendly system.</p>
						</div>
					</div>
					<div class="row">
						<div class="col-xl-4 col-lg-4"></div>
						<div class="col-xl-6 col-lg-7">
							<div class="countdown d-flex justify-content-center justify-content-md-end" id="js-countdown">
								<div class="countdown-item">
									<div class="countdown-timer js-countdown-days time" aria-labelledby="day-countdown">

									</div>

									<div class="countdown-label" id="day-countdown">Days</div>
								</div>

								<div class="countdown-item">
									<div class="countdown-timer js-countdown-hours" aria-labelledby="hour-countdown">

									</div>

									<div class="countdown-label" id="hour-countdown">Hours</div>
								</div>

								<div class="countdown-item">
									<div class="countdown-timer js-countdown-minutes" aria-labelledby="minute-countdown">

									</div>

									<div class="countdown-label" id="minute-countdown">Minutes</div>
								</div>

								<div class="countdown-item">
									<div class="countdown-timer js-countdown-seconds" aria-labelledby="second-countdown">

									</div>

									<div class="countdown-label text" id="second-countdown">Seconds</div>
								</div>
								<a href="#" class="view-btn primary-btn2"><span>Shop Now</span></a>
								<img src="img/cd.png" class="img-fluid cd-img" alt="">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- End Count Down Area -->

			<!-- Start related-product Area --> 
			<section class="related-product-area section-gap" id="latest">
				<div class="container">
					<div class="related-content">
						<div class="title text-center">
							<h1 class="mb-10">Related Searched Products</h1>
							<p>Who are in extremely love with eco friendly system.</p>
						</div>
					</div>					
					<div class="row">
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r1.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r2.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r3.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r4.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>	
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r5.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r6.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r7.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6 mb-20">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r8.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>	
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r9.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r10.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r11.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>		
						<div class="col-lg-3 col-md-4 col-sm-6">
							<div class="single-related-product d-flex">
								<a href="#"><img src="img/r12.jpg" alt=""></a>
								<div class="desc">
									<a href="#" class="title">Black lace Heels</a>
									<div class="price"><span class="lnr lnr-tag"></span> $189.00</div>
								</div>
							</div>							
						</div>																		
					</div>
			</section>
			<!-- End related-product Area -->
	
			<!-- Start brand Area -->
			<section class="brand-area pb-100">
				<div class="container">
					<div class="row logo-wrap">
							<a class="col single-img" href="#">
								<img class="d-block mx-auto" src="img/puma.png" alt="">
							</a>
							<a class="col single-img" href="#">
								<img class="d-block mx-auto" src="img/adidas.png" alt="">
							</a>
							<a class="col single-img" href="#">
								<img class="d-block mx-auto" src="img/br3.png" alt="">
							</a>
							<a class="col single-img" href="#">
								<img class="d-block mx-auto" src="img/br4.png" alt="">
							</a>
							<a class="col single-img" href="#">
								<img class="d-block mx-auto" src="img/br5.png" alt="">
							</a>
					</div>	
				</div>	
			</section>
			<!-- End brand Area -->

			<!-- start footer Area -->		
			<footer class="footer-area section-gap">
				<div class="container">
					<div class="row">
						<div class="col-lg-3  col-md-6 col-sm-6">
							<div class="single-footer-widget">
								<h6>About Us</h6>
								<p>
									From selling globally to locally, from making money on your site to expanding your business, Fashion Mart has a lot of opportunities for you to explore.
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