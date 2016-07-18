<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Giris.aspx.cs" Inherits="Giris" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--<section id="contact-page">
        <div class="container">
        <br />
        <br />
            <div class="row contact-wrap"> 
                <div class="status alert alert-success" style="display: none"></div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">
                    <div class="col-sm-5 col-sm-offset-1">
                        <div class="form-group">
                            <label>Kullanıcı Adı *</label>
                               <asp:TextBox ID="txtAd" CssClass="form-control" runat="server" required="required"></asp:TextBox>
                             </div>
                        <div class="form-group">
                            <label>Şifre *</label>
                            <asp:TextBox ID="txtSifre" CssClass="form-control" runat="server" required="required" TextMode="Password"></asp:TextBox>
                          
                        </div>
                        <div style="margin-left:100px">
                            <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" CssClass="btn btn-primary btn-lg" OnClick="btnGiris_Click"></asp:Button>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnKayitOl" runat="server" Text="Kayıt Ol" CssClass="btn btn-primary btn-lg"></asp:Button>
                            </div>          
                    </div>
                </form> 
            </div><!--/.row-->
        </div><!--/.container-->
    </section>--%>
        <div class="container" style="margin-left:350px;margin-top:20px">
        <h2 class="form-signin-heading">Lütfen Giriş Yapınız</h2>
        <label for="inputEmail">Kullanıcı Adı</label>
        <asp:TextBox ID="txtAd" CssClass="form-control" runat="server" required autofocus Width="300px" ValidationGroup="1"></asp:TextBox><br />
        <label for="inputPassword">Şifre</label>
        <asp:TextBox ID="txtSifre" CssClass="form-control" runat="server" TextMode="Password" required Width="300px" ValidationGroup="1"></asp:TextBox>
          <div style="margin-left:80px">
              <asp:Button ID="btnGir" runat="server" Text="GirişYap" CssClass="btn btn-primary btn-lg" OnClick="btnGir_Click" ValidationGroup="1" />
          </div>
    </div> <!-- /container -->
    <br /><br /><br /><br /><br /><br /><br />
</asp:Content>

