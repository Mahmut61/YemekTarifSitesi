<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TarifEkle.aspx.cs" Inherits="TarifEkle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="margin-top:20px">
        <label for="inputEmail">Yemeğin Adı</label><br />
        <asp:TextBox ID="txtYemekAd" CssClass="form-control" runat="server" required autofocus Width="300px"></asp:TextBox>
         <label for="inputEmail">Malzemeler</label><br />
        <asp:TextBox ID="txtMalzeme" TextMode="MultiLine" CssClass="form-control" runat="server" required autofocus Width="300px"></asp:TextBox>
        <label for="inputEmail">Yapılışı</label><br />
        <asp:TextBox ID="txtYapilis" CssClass="form-control" runat="server" TextMode="MultiLine" required Width="300px" ></asp:TextBox>
         <label for="inputEmail">Fotoğraf</label><br />
        <asp:FileUpload ID="txtYemekFoto" runat="server" EnableTheming="true" required autofocus Width="300px" />
        <asp:Label ID="lblGizli" runat="server" Text="" Visible="true" ></asp:Label>
         <label for="inputEmail">Kategori</label><br />
        <asp:DropDownList ID="ddlKategori" runat="server" CssClass="form-control" required autofocus Width="300px"></asp:DropDownList>
        <asp:Label ID="lblDurum" runat="server" Text="" Visible="true" ></asp:Label>
          <div style="margin-left:50px">
              <asp:Button ID="btnTarifEkle" runat="server" Text="Ekle" CssClass="btn btn-primary btn-lg" Width="180px" OnClick="btnTarifEkle_Click" />
          </div>
    </div>
    <br />
</asp:Content>

