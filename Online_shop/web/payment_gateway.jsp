<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        Connection con=null;
        PreparedStatement st=null;
        ResultSet rs=null;

        String gt = session.getAttribute("gt").toString();
        long order_num;
        order_num=0L;
        
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
            order_num = time;
            session.setAttribute("order_num", order_num);
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
    
%>


    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Payment Gateway</title>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/styles.css">
        <link rel="stylesheet" type="text/css" href="assets/css/demo.css">
    </head>
    <body>
        <div class="container-fluid">
            <div class="creditCardForm">
                <div class="heading">
                    <h1>Confirm Purchase</h1>
                </div>
                <div class="payment">
                    <form action="payment_conf.jsp" method="post">
                        <input type="text" hidden name="order_num" value="<% out.print(order_num);%>">
                        <div>
                            Total payment : Rs. <% out.print(gt);%><br>
                        </div>
                        <div class="form-group" id="card-number-field">
                            <label for="cardNumber">Card Number</label>
                            <div class="row">
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="cardNumber" name="cnum1">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="cardNumber" name="cnum2">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="cardNumber" name="cnum3">
                                </div>
                                <div class="col-md-3">
                                    <input type="text" class="form-control" id="cardNumber" name="cnum4">
                                </div>
                            </div>
                        </div>
                        <div class="form-group owner">
                            <label for="owner">Owner</label>
                            <input type="text" class="form-control" id="owner" name="owner_name">
                        </div>
                        <div class="form-group CVV">
                            <label for="cvv">CVV</label>
                            <input type="text" class="form-control" id="cvv" name="cvv">
                        </div>
                        <div class="form-group" id="expiration-date">
                            <label>Expiration Date</label>
                            <select>
                                <option value="01">January</option>
                                <option value="02">February </option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                            <select>
                                <option value="16"> 2018</option>
                                <option value="17"> 2019</option>
                                <option value="18"> 2020</option>
                                <option value="19"> 2021</option>
                                <option value="20"> 2022</option>
                                <option value="21"> 2023</option>
                                <option value="21"> 2024</option>
                                <option value="21"> 2025</option>
                                <option value="21"> 2026</option>
                                <option value="21"> 2027</option>
                            </select>
                        </div>
                        <div class="form-group" id="credit_cards">
                            <img src="assets/images/visa.jpg" id="visa">
                            <img src="assets/images/mastercard.jpg" id="mastercard">
                            <img src="assets/images/amex.jpg" id="amex">
                        </div>
                        <div class="form-group" id="pay-now">
                            <button type="submit" class="btn btn-default" id="confirm-purchase">Confirm</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.payform.min.js" charset="utf-8"></script>
        <script src="assets/js/script.js"></script>
    </body>
    </html>
