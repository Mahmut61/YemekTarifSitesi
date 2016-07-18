<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UyeOl.aspx.cs" Inherits="UyeOl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" style="margin-top:20px">
        <label for="inputEmail">Ad Soyad</label><br />
        <asp:TextBox ID="txtAdSoyad" CssClass="form-control" runat="server" required autofocus Width="300px"></asp:TextBox>
         <label for="inputEmail">Kullanıcı Adı</label><br />
        <asp:TextBox ID="txtKullanici" CssClass="form-control" runat="server" required autofocus Width="300px"></asp:TextBox>
        <label for="inputPassword">Şifre</label>
        <asp:TextBox ID="txtSifre" CssClass="form-control" runat="server" TextMode="Password" required Width="300px" ></asp:TextBox>
         <label for="inputEmail">Telefon</label><br />
        <asp:TextBox ID="txtTelefon" CssClass="form-control" runat="server" required autofocus Width="300px"></asp:TextBox>
         <label for="inputEmail">Adres</label><br />
        <asp:TextBox ID="txtAdres" CssClass="form-control" runat="server" required autofocus Width="300px" Height="50px" TextMode="MultiLine"></asp:TextBox>
        <%--<asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem Value="1" Selected="True">Kadın</asp:ListItem>
        <asp:ListItem Value="1">Erkek</asp:ListItem>
        </asp:RadioButtonList>--%>
        <asp:RadioButton ID="rbKadin" runat="server" Text="Kadın" GroupName="1" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<asp:RadioButton ID="rbErkek" runat="server" Text="Erkek"  GroupName="1" />
        <br />
        <asp:Label ID="lblDurum" runat="server" Text="" Visible="false" ></asp:Label>
          <div style="margin-left:50px">
              <asp:Button ID="btnKaydol" runat="server" Text="Kaydol" CssClass="btn btn-primary btn-lg" OnClick="btnKaydol_Click" />
          </div>
    </div>
    <br />
</asp:Content>

