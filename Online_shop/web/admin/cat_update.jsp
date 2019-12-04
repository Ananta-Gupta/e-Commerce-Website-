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
                        <form>
                            <h3>Category Update</h3>
                            <div class="form-group">
                                <label for="catid">Category Id :</label>
                                <input type="text" class="form-control" id="catid" name="catid">
                            </div>
                            <div class="form-group">
                                <label for="catname">Category Name :</label>
                                <input type="text" class="form-control" id="catname" name="catname">
                            </div>
                            <div class="form-group">
                                <label for="status">Status :</label>
                                <label class="radio-inline">
                                    <input type="radio" name="optradio" checked>   Available
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="optradio">   Out of stock
                                </label>
                            </div>
                            <div class="form-group">
                                <label for="discp">Description :</label>
                                <textarea class="form-control" rows="5" id="discp" name="discp"></textarea>
                            </div>
                            <button type="submit" class="btn btn-default">Update</button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="admin_footer.jsp"/>
            <!-- End footer Area -->