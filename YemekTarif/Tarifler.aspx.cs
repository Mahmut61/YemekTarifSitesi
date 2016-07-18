using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tarifler : System.Web.UI.Page
{
    DataTable dt = new DataTable();
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    //SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UrunleriGetir();
            KategorileriGetir();
        }
    }
    private void UrunleriGetir()
    {
        #region ADO.Net
        //SqlDataAdapter da = new SqlDataAdapter("select * from Yemekler Urunler where Onay=1 and Silindi=0",conn);
        //da.Fill(dt);
        //dlstTarifler.DataSource = dt;
        //dlstTarifler.DataBind(); 
        #endregion
        var Uruns = (from urun in ent.Yemekler
                     where urun.Silindi == false && urun.Onay==true
                     select urun).ToList();
        dlstTarifler.DataSource = Uruns;
        dlstTarifler.DataBind();
    }
    private void KategorileriGetir()
    {
        #region ADO.Net
        //DataTable dtt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter("select * from Kategoriler where Silindi=0", conn);
        //da.Fill(dtt);
        //ddlKategoriler.DataSource = dtt;
        //ddlKategoriler.DataBind(); 
        #endregion
        var Categories = (from k in ent.Kategoriler
                     where k.Silindi == false
                     select k).ToList();
        ddlKategoriler.DataSource = Categories;
        ddlKategoriler.DataBind();

    }
    private void UrunleriGetirByID(int kategoriid)
    {
        #region ADO.Net
        //SqlCommand comm = new SqlCommand("select * from Urunler where Silindi=0 and urunkategorino=@ID",conn);
        //comm.Parameters.Add("@ID",SqlDbType.Int).Value = kategoriid;
        //if (conn.State == ConnectionState.Closed) { conn.Open(); }
        //SqlDataReader dr;
        //try
        //{
        //    dr = comm.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        dlstTarifler.DataSource = dr;
        //        dlstTarifler.DataBind();
        //    }
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}

        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter("select * from Yemekler where Onay=1 and Silindi=0 and KategoriID=@ID", conn);
        //da.SelectCommand.Parameters.Add("@ID",SqlDbType.Int).Value=kategoriid;
        //da.Fill(dt);
        //dlstTarifler.DataSource = dt;
        //dlstTarifler.DataBind(); 
        #endregion
        var Uruns = (from urun in ent.Yemekler
                     where urun.Silindi == false && urun.Onay == true && urun.KategoriID==kategoriid
                     select urun).ToList();
        dlstTarifler.DataSource = Uruns;
        dlstTarifler.DataBind();
    }
    protected void dlstTarifler_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "tarifdetay")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("TarifDetay.aspx?yemekid=" + id);
        }
    }
    protected void ddlKategoriler_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "kategori")
        {
            int kategoriid = Convert.ToInt32(e.CommandArgument);
            UrunleriGetirByID(kategoriid);
        }
    }
}