<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TarifOnay.aspx.cs" Inherits="TarifOnay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div style="margin-left:200px;">
    <asp:GridView ID="gvYemekler" runat="server" CellPadding="4" DataKeyNames="YemekID" ForeColor="#333333" GridLines="None" Width="800px" AutoGenerateColumns="False" OnRowCancelingEdit="gvYemekler_RowCancelingEdit" OnRowEditing="gvYemekler_RowEditing" OnRowDeleting="gvYemekler_RowDeleting" OnRowUpdating="gvYemekler_RowUpdating">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField HeaderText="Seç" SelectText="&gt;&gt;" ShowSelectButton="True" />
            <asp:BoundField DataField="YemekID" HeaderText="YemekID" Visible="False">
            <ItemStyle Width="0px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Yemek Adı">
                <EditItemTemplate>
                    <asp:TextBox ID="txtYemekAdi" runat="server" Text='<%# Bind("YemekAdi") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("YemekAdi") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Malzeme">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMalzeme" runat="server" Text='<%# Bind("Malzeme") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Malzeme") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Yapılış">
                <EditItemTemplate>
                    <asp:TextBox ID="txtYapilis" runat="server" Text='<%# Bind("Yapilis") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Yapilis") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="120px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Gönderen">
                <EditItemTemplate>
                    <asp:TextBox ID="txtGonderen" runat="server" Text='<%# Bind("Gonderen") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Gonderen") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="100px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Onay">
                <EditItemTemplate>
                    <asp:TextBox ID="txtOnay" runat="server" Text='<%# Bind("Onay") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Onay") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="lbGuncelle" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelle"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="lbVazgec" runat="server" CausesValidation="False" CommandName="Cancel" Text="Vazgeç"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="lbDuzenle" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Width="80px" />
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="lbSil" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    </div>
</asp:Content>

