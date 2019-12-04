            <!-- Start Header Area -->
                <jsp:include page="user_header.jsp"/>
            <!-- End Header Area -->
            
            <!-- Start Main Area -->
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <jsp:include page="user_sidebar.jsp"/>
                    </div>
                    <div class="col-md-9">
                        <form action="imguplode.jsp">
                            <div class="form-group">
                                <label>Select the image : </label>
                                <input type="file" class="form-control" id="image" name="image">
                                <button type="submit" class="btn btn-default">Insert Image</button>
                            </div>
                            <
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Main Area -->
            
            <!-- start footer Area -->
                <jsp:include page="user_footer.jsp"/>
            <!-- End footer Area -->    