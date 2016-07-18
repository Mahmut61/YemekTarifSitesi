<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tarifler.aspx.cs" Inherits="Tarifler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section id="portfolio">
        <div class="container">
            <div class="center">
               <h2>Tarifler</h2>
                <center>
                    <p class="lead" style="text-align:center">
            <asp:DataList ID="ddlKategoriler" runat="server" RepeatColumns="6" OnItemCommand="ddlKategoriler_ItemCommand">
                <ItemTemplate>
                    <asp:Button ID="btnKategori" CssClass="btn btn-default active"  runat="server" Text='<%#Eval("KategoriAd") %>' CommandName="kategori" CommandArgument='<%#Eval("KategoriID") %>'></asp:Button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </ItemTemplate>
            </asp:DataList>
               </p>
                </center>
               
            </div>
                               <div class="row">
                <div class="portfolio-items">
                     <asp:DataList ID="dlstTarifler" runat="server" RepeatColumns="4" Width="510px" Height="600px" OnItemCommand="dlstTarifler_ItemCommand">
                         <ItemTemplate>
                    <div class="portfolio-item apps col-xs-12 col-sm-4 col-md-3">
                        <div class="recent-work-wrap">
                            <%--<img class="img-responsive" src='<%#Eval("urunresimyolu1") %>' width="500px" height="500px" alt="">--%>
                            <asp:ImageButton ID="imgResim1" ImageUrl='<%#Eval("YemekFoto") %>' CssClass="img-responsive" AlternateText='<%#Eval("YemekAdi") %>' CommandName="resimdetay" CommandArgument='<%#Eval("YemekID") %>' runat="server" Width="300px" Height="270px"></asp:ImageButton>
                            <div class="overlay">
                                <div class="recent-work-inner">
                                    <h3><a href="#"><%#Eval("YemekAdi") %></a></h3>
                                    <a class="preview" href='<%#Eval("YemekFoto") %>' rel="prettyPhoto"><i class="fa fa-eye"></i> Görüntüle</a>
                                </div> 
                                <br /><br /><br />
                                <center><asp:Button ID="btnTarifeGit" runat="server" Text="Tarife Git" CommandName="tarifdetay" CommandArgument='<%#Eval("YemekID") %>'></asp:Button></center>
                            </div>
                        </div>
                    </div><!--/.portfolio-item-->
                         </ItemTemplate>
                     </asp:DataList> 
                    </div>
            </div>
        </div>
    </section>

</asp:Content>

