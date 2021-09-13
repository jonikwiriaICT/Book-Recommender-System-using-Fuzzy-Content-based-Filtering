<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultUserMaster.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-content">
        <!--MainContent-->
        <div id="MainContent" class="main-content" role="main">
            <!--Breadcrumb-->
            <div class="bredcrumbWrap">
                <div class="container breadcrumbs">
                    <a href="index.html" title="Back to the home page">Home</a><span aria-hidden="true">›</span><span>Short Description</span>
                </div>
            </div>
            <!--End Breadcrumb-->

            <div id="ProductSection-product-template" class="product-template__container prstyle1 container">
                <!--product-single-->
                <div class="product-single">
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                            <div class="product-details-img">
                                <div class="product-thumb">
                                    <div id="gallery" class="product-dec-slider-2 product-tab-left">
                                        <asp:DataList ID="dtPictures" runat="server">
                                            <ItemTemplate>
                                                <a data-image="<%#Eval("ImagProfile") %>" data-zoom-image="<%#Eval("ImagProfile") %>" class="slick-slide slick-cloned" data-slick-index="-4" aria-hidden="true" tabindex="-1">
                                                    <img class="blur-up lazyload" src="<%#Eval("ImagProfile") %>" alt="" />
                                                </a>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                                <div class="zoompro-wrap product-zoom-right pl-20">
                                    <asp:DataList ID="dtZoomPicture" runat="server">
                                        <ItemTemplate>

                                            <div class="zoompro-span">
                                                <img class="zoompro blur-up lazyload" data-zoom-image="<%#Eval("ImgProfile") %>" alt="" src="<%#Eval("ImgProfile") %>" />
                                            </div>
                                            <div class="product-labels"><span class="lbl on-sale">Sale</span><span class="lbl pr-label1">new</span></div>
                                            <div class="product-buttons">

                                                <a href="#" class="btn prlightbox" title="Zoom"><i class="icon anm anm-expand-l-arrows" aria-hidden="true"></i></a>
                                            </div>

                                        </ItemTemplate>
                                    </asp:DataList>
                                </div>


                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                            <asp:DataList ID="dtDescription" runat="server">
                                <ItemTemplate>
                                    <div class="product-single__meta">
                                        <h1 class="product-single__title">
                                            <%#Eval("ProductName") %>
                                        </h1>
                                        <p class="product-single__price product-single__price-product-template">
                                            <span class="visually-hidden">Regular price</span>
                                            <span class="product-price__price product-price__price-product-template product-price__sale product-price__sale--single">
                                                <span id="ProductPrice-product-template"><span class="money">N <%#Eval("Price") %></span></span>
                                            </span>
                                        </p>
                                        <div class="product-single__description rte">
                                            <p>
                                                <%#Eval("ProductDescription") %>
                                            </p>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <!--End-product-single-->
                    <!--Product Fearure-->
                    <div class="prFeatures">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="assets/images/credit-card.png" alt="Safe Payment" title="Safe Payment" />
                                <div class="details">
                                    <h3>Safe Payment</h3>
                                    Pay with the world's most payment methods.
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="assets/images/shield.png" alt="Confidence" title="Confidence" />
                                <div class="details">
                                    <h3>Confidence</h3>
                                    Protection covers your purchase and personal data.
                                </div>
                            </div>
                            <div class="col-12 col-sm-6 col-md-3 col-lg-3 feature">
                                <img src="assets/images/worldwide.png" alt="Worldwide Delivery" title="Worldwide Delivery" />
                                <div class="details">
                                    <h3>Worldwide Delivery</h3>
                                    FREE &amp; fast shipping to over 200+ countries &amp; regions.
                                </div>
                            </div>

                        </div>
                    </div>
                    <!--End Product Fearure-->
                    <!--Product Tabs-->
                    <div class="tabs-listing">
                        <ul class="product-tabs">
                            <li rel="tab1"><a class="tablink">Product Details</a></li>
                        </ul>
                        <div class="tab-container">
                            <div id="tab1" class="tab-content">
                                <div class="product-description rte">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--End Recently Product Slider-->
                </div>
                <!--#ProductSection-product-template-->
            </div>
            <!--MainContent-->
        </div>
</asp:Content>

