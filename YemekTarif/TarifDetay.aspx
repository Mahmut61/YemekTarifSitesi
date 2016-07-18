<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TarifDetay.aspx.cs" Inherits="TarifDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
        <br />
        <br />
        <br />
        <asp:DataList ID="dlstTarifDetay" runat="server">
            <ItemTemplate>
                <div style="font-family: Calibri">
                    <span style="color: #3274d0; font-size: 23px; font-family: inherit; font-weight: bolder; float: left; margin-top: -11px">
                        <%# Eval("YemekAdi")%>
                    </span>
                    <br />
                    <span style="color: #dd7700; font-size: 13px; font-family: inherit">Ekleyen:
                            <%# Eval("Gonderen")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span style="color: #dd7700; font-size: 13px; font-family: inherit">Eklenme tarihi:
                            <%# Eval("Tarih")%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="imgLike" runat="server" ImageUrl="images/services/like.png" ToolTip="Beğeni Sayısı" />
                    <%--beğeni ikonu--%>
                    <asp:Label ID="lblBegeniSay" runat="server" Text='<%# Eval("YemekPuanSayisi") %>'></asp:Label>
                    &nbsp
                <asp:Image ID="imgFavorite" runat="server" ImageUrl="images/services/comment.png" ToolTip="Yorum Sayısı" />
                    <%--favori ikonu--%>
                    <asp:Label ID="lblFavSay" runat="server" Text='<%# Eval("YemekYorumSayisi") %>'></asp:Label>
                    &nbsp
                </div>
                <hr style="margin-right: 18px; color: #eee" /><%--Ayraç--%>
                <asp:Image ID="imgYemekFoto" runat="server" Width="660px" Height="450px" ImageUrl='<%#Eval("YemekFoto") %>' />
                <br />
                <br />
                <span style="font-family: Calibri; color: #3274d0">Malzemeler:
                            <br />
                </span>
                <%#Eval("Malzeme") %>
                <br />
                <span style="font-family: Calibri; color: #3274d0">Yapılışı:
                </span>
                <div style="height: auto; width: 650px">
                    <%#Eval("Yapilis") %>
                </div>
                </div>
            </ItemTemplate>
            <SeparatorTemplate>
            </SeparatorTemplate>
        </asp:DataList>
        <asp:Panel ID="pnlYorumYap" runat="server">
               
            <br />
            <span style="margin-right: 20px; margin-left: 71px; margin-top: 0px;">
                 <%--<h4 style="font-family: Calibri; color: #3274d0; font-size: medium; float:left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YORUM YAP&nbsp;--%>
                </h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBegen" runat="server" Text="Beğen" CssClass="btn-info" OnClick="btnBegen_Click"/>
                &nbsp;<span>
                    <asp:Label ID="lblDurum" runat="server" Text=""></asp:Label>
                </span>&nbsp; </span>
            <br />
            <div class="yorum">
                <br />
                <asp:TextBox ID="txtYorum" CssClass="unwatermarked" Width="654px" runat="server" TextMode="MultiLine" BackColor="#EAEAEA" BorderColor="#B2B2B2" BorderStyle="Solid" Height="65px" />
                <br />
                <h3 style="margin-right:520px">
                    <asp:Button ID="btnYorumGonder" runat="server" Text="Yorumu Gönder"
                   CssClass="btn-info" OnClick="btnYorumGonder_Click" />
                </h3>
                <hr style="margin-right: 10px; margin-bottom: 10px; color: #d0d0d0" />
                </div>
        </asp:Panel>
        <div style="margin-right:12px">
            <asp:Panel ID="pnlYorumlar" runat="server">
                <asp:DataList ID="dlstYorumlar" runat="server">
                  <ItemTemplate>
                        <div style="width:94%;height:auto;font-size:12px;font-family:Calibri;padding:10px;padding-bottom:23px !important;text-transform:lowercase;background-color:#f0f0d7;border-bottom:1px solid #666666;width:660px;">
                            <span><a style="color: indianred">
                                <%--QUERY STRİNG--%>
                                <asp:Image ID="imgFoto" runat="server" ImageUrl='<%#Eval("ProfilFoto") %>' Width="30px" Height="35px" />
                                <%#Eval("KullaniciAdi") %>
                            </a></span>diyor ki:
                            <br />
                            <br />
                            "<%#Eval("YorumMetni") %>"
                            <br />
                            <span style="float: right">
                                <%#Eval("YorumTarihi") %> tarihinde gönderildi.
                            </span>                
                        </div>
                    </ItemTemplate>
            </asp:DataList>
            
        </asp:Panel>
        </div>
        
    </center>
</asp:Content>

