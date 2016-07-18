using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TarifOnay : System.Web.UI.Page
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    // SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
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
        //SqlDataAdapter da = new SqlDataAdapter("Select * from Yemekler where Silindi=0 order by Tarih Desc", conn);
        //try
        //{
        //    da.Fill(dt);
        //    gvYemekler.DataSource = dt;
        //    gvYemekler.DataBind();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); } 
        #endregion
        var Tarifler = (from tarif in ent.Yemekler
                        where tarif.Silindi == false
                        orderby tarif.Tarih descending
                        select tarif).ToList();

        gvYemekler.DataSource = Tarifler;
        gvYemekler.DataBind();
    }
    protected void gvYemekler_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvYemekler.EditIndex = e.NewEditIndex;
        DataBagla();
    }
    protected void gvYemekler_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvYemekler.EditIndex = -1;
        DataBagla();
    }
    protected void gvYemekler_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int YemekID = Convert.ToInt32(gvYemekler.DataKeys[e.RowIndex].Value);
        TextBox YemekAdi = (TextBox)gvYemekler.Rows[e.RowIndex].FindControl("txtYemekAdi");
        TextBox Malzeme = (TextBox)gvYemekler.Rows[e.RowIndex].FindControl("txtMalzeme");
        TextBox Yapilis = (TextBox)gvYemekler.Rows[e.RowIndex].FindControl("txtYapilis");
        TextBox Gonderen = (TextBox)gvYemekler.Rows[e.RowIndex].FindControl("txtGonderen");
        TextBox Onay = (TextBox)gvYemekler.Rows[e.RowIndex].FindControl("txtOnay");
        bool Sonuc = YemekGuncelle(YemekID, YemekAdi.Text, Malzeme.Text, Yapilis.Text, Gonderen.Text, Onay.Text);
        if (Sonuc)
        {
            gvYemekler.EditIndex = -1;
            DataBagla();
        }
    }
    private bool YemekGuncelle(int YemekID, string YemekAdi, string Malzeme, string Yapilis, string Gonderen, string Onay)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("Update Yemekler Set YemekAdi=@YemekAdi, Malzeme=@Malzeme, Yapilis=@Yapilis, Gonderen=@Gonderen,Onay=@Onay where YemekID=@YemekID", conn);
        //comm.Parameters.Add("@YemekAdi", SqlDbType.VarChar).Value = YemekAdi;
        //comm.Parameters.Add("@Malzeme", SqlDbType.VarChar).Value = Malzeme;
        //comm.Parameters.Add("@Yapilis", SqlDbType.VarChar).Value = Yapilis;
        //comm.Parameters.Add("@Gonderen", SqlDbType.VarChar).Value = Gonderen;
        //comm.Parameters.Add("@Onay", SqlDbType.Bit).Value = Convert.ToBoolean(Onay);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = YemekID;
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
        var degisen = (from y in ent.Yemekler
                       where y.YemekID == YemekID
                       select y).FirstOrDefault();
        degisen.YemekAdi = YemekAdi;
        degisen.Malzeme = Malzeme;
        degisen.Yapilis = Yapilis;
        degisen.Gonderen = Gonderen;
        degisen.Onay = Convert.ToBoolean(Onay);
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
    protected void gvYemekler_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int YemekID = Convert.ToInt32(gvYemekler.DataKeys[e.RowIndex].Value);
        if (YemekSil(YemekID))
        {
            DataBagla();
        }
    }
    private bool YemekSil(int YemekID)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("Update Yemekler Set Silindi=1 where YemekID=@YemekID", conn);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = YemekID;
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
        var silinen = (from y in ent.Yemekler
                       where y.YemekID == YemekID
                       select y).FirstOrDefault();
        ent.Yemekler.Remove(silinen);
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