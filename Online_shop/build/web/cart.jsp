<%@page import="java.sql.*,java.util.*" %>
<%
        Connection con= null;
        PreparedStatement st= null;
        ResultSet rs= null;
        String qry = "";
        
        String url = request.getHeader("referer");
        String email = session.getAttribute("guest_id").toString();
        int gt=0;
        
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
            qry = "select * from cart where email=?";
            st=con.prepareStatement(qry);
            
            st.setString(1, email);
            
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
        <title>Cart</title>

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

            <!-- Start Cart Area -->
            <div class="container">
                <div class="cart-title">
                    <input type="hidden" name="url" size="60" value="<% out.println(url);%>" />
                    <div class="row">
                        <div class="col-md-6">
                            <h6 class="ml-15">Product</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Price</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Quantity</h6>
                        </div>
                        <div class="col-md-2">
                            <h6>Total</h6>
                        </div>
                    </div>
                </div>
<%
            if(rs.next())
            {
                do
                {
%>
                <div class="cart-single-item">
                    <div class="row align-items-center">
                        <div class="col-md-6 col-12">
                            <div class="product-item d-flex align-items-center">
                                <img src="<%=rs.getString("prod_path")%>" class="img-fluid" alt="">
                                <h6><%=rs.getString("prod_name")%></h6>
                            </div>
                        </div>
                        <div class="col-md-2 col-6">
                            <div class="price"><%=rs.getString("costprice")%></div>
                        </div>
                        <div class="col-md-2 col-6">
                            <div class="quantity-container d-flex align-items-center mt-15">
                                <input type="text" class="quantity-amount" value="<%=rs.getString("quant")%>" />
                                <div class="arrow-btn d-inline-flex flex-column">
                                    <button class="increase arrow" type="button" title="Increase Quantity"><span class="lnr lnr-chevron-up"></span></button>
                                    <button class="decrease arrow" type="button" title="Decrease Quantity"><span class="lnr lnr-chevron-down"></span></button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-2 col-12">
                            <% int total = (rs.getInt("costprice")*rs.getInt("quant"));%>
                            <div class="total"><%out.println(total);%></div>
                        </div>
                    </div>
                </div>
<%
                gt+=total;
                }
                while(rs.next());
            }
%>
                <div class="cupon-area d-flex align-items-center justify-content-between flex-wrap">
                    <a href="#" class="view-btn color-2"><span>Update Cart</span></a>
                    <div class="cuppon-wrap d-flex align-items-center flex-wrap">
                        <div class="cupon-code">
                            <input type="text">
                            <button class="view-btn color-2"><span>Apply</span></button>
                        </div>
                        <a href="#" class="view-btn color-2 have-btn"><span>Have a Coupon?</span></a>
                    </div>
                </div>
                <div class="subtotal-area d-flex align-items-center justify-content-end">
                    <div class="title text-uppercase">Subtotal</div>
                    <div class="subtotal">
                       Rs. <% out.println(gt);%>
                    </div>
                </div>
                <div class="shipping-area d-flex justify-content-end">
                    <div class="tile text-uppercase">Shipping</div>
                    <form action="user_check.jsp" method="post" class="d-inline-flex flex-column align-items-end">
                        <ul class="d-flex flex-column align-items-end">
                            <li class="filter-list">
                                <label for="flat-rate">Flat Rate:<span>$5.00</span></label>
                                <input class="pixel-radio" type="radio" id="flat-rate" name="brand">
                            </li>
                            <li class="filter-list">
                                <label for="free-shipping">Free Shipping</label>
                                <input class="pixel-radio" type="radio" id="free-shipping" name="brand">
                            </li>
                            <li class="filter-list">
                                <label for="flat-rate-2">Flat Rate:<span>$10.00</span></label>
                                <input class="pixel-radio" type="radio" id="flat-rate-2" name="brand">
                            </li>
                            <li class="filter-list">
                                <label for="local-delivery">Local Delivery:<span>$2.00</span></label>
                                <input class="pixel-radio" type="radio" id="local-delivery" name="brand">
                            </li>
                            <li class="calculate">Calculate Shipping</li>
                        </ul>
                        <div class="sorting">
                            <select>
                                <option value="1">Bangladesh</option>
                                <option value="1">India</option>
                                <option value="1">Srilanka</option>
                            </select>
                        </div>
                        <div class="sorting mt-20">
                            <select>
                                <option value="1">Select a State</option>
                                <option value="1">Select a State</option>
                                <option value="1">Select a State</option>
                            </select>
                        </div>
                            <input type="text" placeholder="Postcode/Zipcode" onfocus="this.placeholder=''" onblur="this.placeholder = 'Postcode/Zipcode'" class="common-input mt-10">
                        <div>
                            <button type="submit" class="btn btn-default">Checkout</button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- End Cart Area -->

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