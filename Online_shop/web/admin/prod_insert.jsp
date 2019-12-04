            <!-- Start Header Area -->
                <jsp:include page="admin_header.jsp"/>
            <!-- End Header Area -->
            
            <!-- Start Main Area -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="admin_sidebar.jsp"/>
                    </div>
                    <div class="col-md-9">
                        <form action="addprod.jsp">
                            <h3>Product Insert</h3>
                            <div class="form-group">
                                <label for="prod_code">Product Code :</label>
                                <input type="text" class="form-control" id="prod_code" name="prod_code">
                            </div>
                            <div class="form-group">
                                <label for="prod_name">Product Name :</label>
                                <input type="text" class="form-control" id="prod_name" name="prod_name">
                            </div>
                            <div class="form-group">
                                <label for="brand">Brand :</label>
                                <input type="text" class="form-control" id="brand" name="brand">
                            </div>
                            <div class="form-group">
                                <label for="size">Size :</label>
                                <input type="text" class="form-control" id="size" name="size">
                            </div>
                            <div class="form-group">
                                <label for="color">Color :</label>
                                <input type="text" class="form-control" id="color" name="color">
                            </div>
                            <div class="form-group">
                                <label for="mrpprice">MRP Price :</label>
                                <input type="text" class="form-control" id="mrpprice" name="mrpprice">
                            </div>
                            <div class="form-group">
                                <label for="costprice">Cost Price :</label>
                                <input type="text" class="form-control" id="costprice" name="costprice">
                            </div>
                            <div class="form-group">
                                <label for="gst">GST :</label>
                                <input type="text" class="form-control" id="gst" name="gst">
                            </div>
                            <div class="form-group">
                                <label for="discp">Description :</label>
                                <textarea class="form-control" rows="5" id="discp" name="discp"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="status">Status :</label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="a" checked>   Available
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="status" value="out">   Out of stock
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Insert</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="admin_footer.jsp"/>
            <!-- End footer Area -->