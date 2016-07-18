using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KategoriDuzenle : System.Web.UI.Page
{
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataBagla();
        }
    }
    private void DataBagla()
    {
        #region ADO.Net
        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter("Select * from Kategoriler where Silindi=0", conn);
        //try
        //{
        //    da.Fill(dt);
        //    gvKategoriler.DataSource = dt;
        //    gvKategoriler.DataBind();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); } 
        #endregion
        var Categories = (from k in ent.Kategoriler
                          where k.Silindi == false
                          select k).ToList();
        gvKategoriler.DataSource = Categories;
        gvKategoriler.DataBind();
    }
    protected void gvKategoriler_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvKategoriler.EditIndex = e.NewEditIndex;
        DataBagla();
    }
    protected void gvKategoriler_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvKategoriler.EditIndex = -1;
        DataBagla();
    }
    protected void gvKategoriler_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int KategoriID = Convert.ToInt32(gvKategoriler.DataKeys[e.RowIndex].Value);
        TextBox KategoriAdi = (TextBox)gvKategoriler.Rows[e.RowIndex].FindControl("txtKategoriAd");
        bool Sonuc = KategoriGuncelle(KategoriID, KategoriAdi.Text);
        if (Sonuc)
        {
            gvKategoriler.EditIndex = -1;
            DataBagla();
        }
    }
    protected void gvKategoriler_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int KategoriID = Convert.ToInt32(gvKategoriler.DataKeys[e.RowIndex].Value);
        if (KategoriSil(KategoriID))
        {
            DataBagla();
        }
    }
    protected void lbKategoriEkle_Click(object sender, EventArgs e)
    {
        gvKategoriler.ShowFooter = true;
        DataBagla();
    }
    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        TextBox Adi = (TextBox)gvKategoriler.FooterRow.FindControl("txtAd");
        bool Sonuc = KategoriEkle(Adi.Text);
        if (Sonuc)
        {
            gvKategoriler.ShowFooter = false;
            DataBagla();
        }
    }
    private bool KategoriGuncelle(int KategoriID, string KategoriAd)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("Update Kategoriler Set KategoriAd=@KategoriAd where KategoriID=@KategoriID", conn);
        //comm.Parameters.Add("@KategoriAd", SqlDbType.VarChar).Value = KategoriAd;
        //comm.Parameters.Add("@KategoriID", SqlDbType.Int).Value = KategoriID;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    Sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }
        //return Sonuc; 
        #endregion
        bool Sonuc = false;
        var degisen = (from k in ent.Kategoriler
                       where k.KategoriID == KategoriID
                       select k).FirstOrDefault();
        degisen.KategoriAd = KategoriAd.ToString();
        try
        {
            ent.SaveChanges();
            Sonuc = true;
        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
        return Sonuc;
    }
    private bool KategoriSil(int KategoriID)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("Update Kategoriler Set Silindi=1 where KategoriID=@KategoriID", conn);
        //comm.Parameters.Add("@KategoriID", SqlDbType.Int).Value = KategoriID;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    Sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }
        //return Sonuc; 
        #endregion
        bool Sonuc = false;
        var SilinenID = (from k in ent.Kategoriler
                         where k.KategoriID == KategoriID && k.Silindi == false
                         select k).FirstOrDefault();
        ent.Kategoriler.Remove(SilinenID);
        try
        {
            ent.SaveChanges();
            Sonuc = true;
        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
        return Sonuc;
    }
    private bool KategoriEkle(string Adi)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("Insert into Kategoriler(KategoriAd) values(@KategoriAd) ", conn);
        //comm.Parameters.Add("@KategoriAd", SqlDbType.VarChar).Value = Adi;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    Sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }
        //return Sonuc; 
        #endregion
        bool Sonuc = false;
        Kategoriler k = new Kategoriler();
        k.KategoriAd = Adi;
        ent.Kategoriler.Add(k);
        try
        {
            ent.SaveChanges();
            Sonuc = true;
        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
        return Sonuc;
    }
}