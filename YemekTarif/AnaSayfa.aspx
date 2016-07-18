<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AnaSayfa.aspx.cs" Inherits="AnaSayfa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section id="main-slider" class="no-margin">
        <div class="carousel slide">
            <ol class="carousel-indicators">
                <li data-target="#main-slider" data-slide-to="0" class="active"></li>
                <li data-target="#main-slider" data-slide-to="1"></li>
                <li data-target="#main-slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="item active" style="background-image: url(images/slider/bg1.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Yemek Tarif Sitemize HoşGeldiniz...</h1>
                                    <h2 class="animation animated-item-2">Sayfamızdaki yemek tariflerini görebilir, kullanabilir ve kendinize özgü yemek tarifleri ekleyebilirsiniz...</h2>
                                    <a class="btn-slide animation animated-item-3" href="Tarifler.aspx">Tariflere Git</a>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/yemekler/bulgur.png" class="img-responsive" width="500px" height="500px" style="margin-top:20px">
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(images/slider/bg2.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Yemek Tarif Sitemize HoşGeldiniz...</h1>
                                    <h2 class="animation animated-item-2">Sayfamıza üye olabilir, yemek tariflerini beğenebilir, yorum yapabilirsiniz...</h2>
                                    <a class="btn-slide animation animated-item-3" href="Tarifler.aspx">Tariflere Git</a>
                                </div>
                            </div>

                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/yemekler/evbaklavasi.png" class="img-responsive" width="500px" height="500px" style="margin-top:20px">
                                </div>
                            </div>

                        </div>
                    </div>
                </div><!--/.item-->

                <div class="item" style="background-image: url(images/slider/bg3.jpg)">
                    <div class="container">
                        <div class="row slide-margin">
                            <div class="col-sm-6">
                                <div class="carousel-content">
                                    <h1 class="animation animated-item-1">Yemek Tarif Sitemize HoşGeldiniz...</h1>
                                    <h2 class="animation animated-item-2">Sayfamıza yemek önerilerinde bulunabilirsiniz...</h2>
                                    <a class="btn-slide animation animated-item-3" href="Tarifler.aspx">Tariflere Git</a>
                                </div>
                            </div>
                            <div class="col-sm-6 hidden-xs animation animated-item-4">
                                <div class="slider-img">
                                    <img src="images/yemekler/guvec.png" class="img-responsive" width="500px" height="500px" style="margin-top:20px">
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/.item-->
            </div><!--/.carousel-inner-->
        </div><!--/.carousel-->
        <a class="prev hidden-xs" href="#main-slider" data-slide="prev">
            <i class="fa fa-chevron-left"></i>
        </a>
        <a class="next hidden-xs" href="#main-slider" data-slide="next">
            <i class="fa fa-chevron-right"></i>
        </a>
    </section>
            <!--/#main-slider-->
            <!--/#feature-->
            
</asp:Content>

