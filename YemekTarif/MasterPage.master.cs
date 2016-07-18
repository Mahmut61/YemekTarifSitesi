using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=Yemek;uid=sa;pwd=61");
    SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //MenuGetir();
            if (Session["uye"] !=null)
            {
                lblKullanici.Text = Session["uye"].ToString();
                pnlAdmin.Visible = false;
                pnlNormal.Visible = false;
                pnlKullanici.Visible = true;
            }
            else if (Session["uyeAdmin"] != null)
            {
                lblKullanici.Text = Session["uyeAdmin"].ToString();
                pnlAdmin.Visible = true;
                pnlNormal.Visible = false;
                pnlKullanici.Visible = false;
            }
        }
    }
    //private void MenuGetir()
    //{
    //    DataTable dtt = new DataTable();
    //    SqlDataAdapter da = new SqlDataAdapter("select * from Menu", conn);
    //    da.Fill(dtt);
    //}
    protected void lbCikisAdmin_Click(object sender, EventArgs e)
    {
        Session.Remove("uyeAdmin");
        pnlAdmin.Visible = false;
        pnlKullanici.Visible = false;
        pnlNormal.Visible = true;
        Response.Redirect("AnaSayfa.aspx");
    }
    protected void lbKullaniciCikis_Click(object sender, EventArgs e)
    {
        Session.Remove("uye");
        pnlAdmin.Visible = false;
        pnlKullanici.Visible = false;
        pnlNormal.Visible = true;
        Response.Redirect("AnaSayfa.aspx");
    }
}
