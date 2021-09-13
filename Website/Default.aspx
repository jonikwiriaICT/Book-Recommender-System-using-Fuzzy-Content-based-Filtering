<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultUserMaster.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="slideshow slideshow-wrapper pb-section">
        <div class="home-slideshow" style="height:1500px">
            <div class="slide">
                <div class="blur-up lazyload">
                    <img class="blur-up lazyload" data-src="" style="height:100em" src="images/two.jpg" alt="Books Recommendation" title="Books Recommendation" />
                    <div class="slideshow__text-wrap slideshow__overlay classic middle">
                        <div class="slideshow__text-content middle">
                            <div class="container">
                                <div class="wrap-caption right">
                                    <h2 style="color:darkseagreen" class="h1 mega-title slideshow__title">Our Books</h2>
                                    <span style="color:white" class="mega-subtitle slideshow__subtitle">Programming Books</span>
                                    <span style="color:white" class="btn">New Books</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          
             
          
        </div>
    </div>
    <div class="section">
         <div class="container">
            <div class="row">
                <div class="col-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="section-header text-center">
                        <h2 class="h2">Fuzzy Content based Recommender Books</h2>
                        <p> These are our recommended books for you</p>
                    </div>

                    <div class="productSlider grid-products">
                        <asp:ListView ID="LVProducts" runat="server" OnItemCommand="dtSpouse_itemCommand">
                            <ItemTemplate>

                                <div class="col-12 item">
                                    <!-- start product image -->
                                    <div class="product-image">
                                        <!-- start product image -->
                                        <a href="Product-Details?ID=<%#Eval("ProductID")%>" class="grid-view-item__link">
                                            <!-- image -->
                                            <img class="primary blur-up lazyload" data-src="<%#Eval("Img Profile") %>" src="assets/images/product-images/product-image2.jpg" alt="image" title="product">
                                            <!-- End image -->
                                            <!-- Hover image -->
                                            <img class="hover blur-up lazyload" data-src="<%#Eval("Img Profile") %>" src="assets/images/product-images/product-image2-1.jpg" alt="image" title="product">
                                            <!-- End hover image -->
                                            <!-- Variant Image-->
                                            <img class="grid-view-item__image hover variantImg" src="<%#Eval("Img Profile") %>" alt="image" title="product">
                                            <!-- Variant Image-->
                                        </a>
                                        <!-- end product image -->

                                        <!-- Start product button -->
                                        <div class="variants add">
                                            <li class="add-cart active">
                                                <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="btn btn-addto-cart"
                                                    CommandName="btnAddToCart" CommandArgument='<%#Eval("ProductID")%>'>
                                                                                            <i class=" fa fa-shopping-cart"></i>&nbsp Add to Cart
                                                </asp:LinkButton>
                                            </li>


                                        </div>

                                        <!-- end product button -->
                                    </div>
                                    <!-- end product image -->

                                    <!--start product details -->
                                    <div class="product-details text-center">
                                        <!-- product name -->
                                        <div class="product-name">
                                            <a href="Product-Details?ID=<%#Eval("ProductID")%>"><%#Eval("Product Name") %></a>
                                        </div>
                                        <!-- End product name -->
                                        <!-- product price -->
                                        <div class="product-price">
                                            <span class="price">N<%#Eval("Price") %></span>
                                        </div>

                                    </div>
                                    <!-- End product details -->
                                </div>

                            </ItemTemplate>
                        </asp:ListView>
                    </div>



                    <div class="paginatoin-area">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dlPager"
                                    OnItemCommand="dlPager_ItemCommand">
                                    <ItemTemplate>
                                        <nav aria-label="Page navigation example" class="mt-50">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ">
                                                    <asp:LinkButton Enabled='<%#Eval("Enabled") %>' CssClass="page-link bg-dark text-white" runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo"></asp:LinkButton>

                                                </li>
                                            </ul>
                                        </nav>

                                    </ItemTemplate>
                                </asp:DataList>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <!--Main Content-->
                <div class="col-12 col-sm-12 col-md-12 col-lg-12 main-col">
                    <div class="category-description">
                        <h1>Our Books</h1>
                    </div>
                    <hr />
                    <div class="productList">
                        <div class="grid-products grid--view-items">
                            <div class="row">
                                <asp:ListView ID="ListProduct" runat="server" OnItemCommand="dtSpouses_itemCommand">
                                    <ItemTemplate>
                                        <div class="col-6 col-sm-6 col-md-4 col-lg-4 item">
                                            <!-- start product image -->
                                            <div class="product-image">
                                                <!-- start product image -->
                                                <a href="Product-Details?ID=<%#Eval("ProductID")%>">
                                                    <!-- image -->
                                                    <img class="primary blur-up lazyload" data-src="<%#Eval("Img Profile") %>" src="<%#Eval("Img Profile") %>" alt="image" title="product">
                                                    <!-- End image -->
                                                    <!-- Hover image -->
                                                    <img class="hover blur-up lazyload" data-src="<%#Eval("Img Profile") %>" src="<%#Eval("Img Profile") %>" alt="image" title="product">
                                                    <!-- End hover image -->
                                                    <!-- product label -->
                                                    <div class="product-labels rectangular"><span class="lbl on-sale">-16%</span> <span class="lbl pr-label1">new</span></div>
                                                    <!-- End product label -->
                                                </a>
                                                <!-- end product image -->

                                                <!-- Start product button -->
                                                <div class="variants add">
                                                    <li class="add-cart active">
                                                        <asp:LinkButton ID="lnkAddToCart" runat="server" CssClass="btn btn-addto-cart"
                                                            CommandName="btnAddToCarts" CommandArgument='<%#Eval("ProductID")%>'>
                                                                                            <i class=" fa fa-shopping-cart"></i>&nbsp Add to Cart
                                                        </asp:LinkButton>
                                                    </li>
                                                </div>

                                                <!-- end product button -->
                                            </div>
                                            <!-- end product image -->

                                            <!--start product details -->
                                            <div class="product-details text-center">
                                                <!-- product name -->
                                                <div class="product-name">
                                                    <a href="Product-Details?ID=<%#Eval("ProductID")%>"><%#Eval("Product Name") %></a>
                                                </div>
                                                <!-- End product name -->
                                                <!-- product price -->
                                                <div class="product-price">
                                                    <span class="price">N<%#Eval("Price") %></span>
                                                </div>

                                            </div>
                                            <!-- End product details -->
                                        </div>
                                    </ItemTemplate>

                                </asp:ListView>


                            </div>
                        </div>
                    </div>
                    <div class="paginatoin-area">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dgPage"
                                    OnItemCommand="dlPagers_ItemCommand">
                                    <ItemTemplate>
                                        <nav aria-label="Page navigation example" class="mt-50">
                                            <ul class="pagination justify-content-center">
                                                <li class="page-item ">
                                                    <asp:LinkButton Enabled='<%#Eval("Enabled") %>' CssClass="page-link bg-dark text-white" runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNos"></asp:LinkButton>

                                                </li>
                                            </ul>
                                        </nav>

                                    </ItemTemplate>
                                </asp:DataList>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
       
    </div>
</asp:Content>

