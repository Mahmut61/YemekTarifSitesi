<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="KategoriDuzenle.aspx.cs" Inherits="KategoriDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <div style="margin-left: 200px;">
        <asp:GridView ID="gvKategoriler" runat="server" Width="400px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="KategoriID" ForeColor="#333333" GridLines="None" OnRowEditing="gvKategoriler_RowEditing" OnRowCancelingEdit="gvKategoriler_RowCancelingEdit" OnRowDeleting="gvKategoriler_RowDeleting" OnRowUpdating="gvKategoriler_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="KategoriID" HeaderText="Kategori ID" Visible="False" />
                <asp:TemplateField HeaderText="Kategori Ad">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtKategoriAd" runat="server" Text='<%# Bind("KategoriAd") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtAd" runat="server"></asp:TextBox>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("KategoriAd") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="120px" />
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="lbGuncelle" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lbVazgec" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-primary" OnClick="btnKaydet_Click" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbDuzenle" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbSil" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
        <asp:LinkButton ID="lbKategoriEkle" runat="server" OnClick="lbKategoriEkle_Click">Kategori Ekle</asp:LinkButton>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

