using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TarifEkle : System.Web.UI.Page
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    //SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            KategorileriGetir();
        }
    }
    private void KategorileriGetir()
    {
        #region ADO.Net
        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter("select * from Kategoriler where Silindi=0", conn);
        //da.Fill(dt);
        //ddlKategori.DataSource = dt;
        //ddlKategori.DataTextField = "KategoriAd";
        //ddlKategori.DataValueField = "KategoriID";
        //ddlKategori.DataBind(); 
        #endregion
        var Categories = (from k in ent.Kategoriler
                          where k.Silindi == false
                          select k).ToList();
        ddlKategori.DataTextField = "KategoriAd";
        ddlKategori.DataValueField = "KategoriID";
        ddlKategori.DataSource = Categories;
        ddlKategori.DataBind();

    }
    protected void btnTarifEkle_Click(object sender, EventArgs e)
    {
        if (txtYemekFoto.HasFile)
        {

            //txtYemekFoto.SaveAs("C:\\Users\\Zeynep\\Desktop\\Bootstrap\\Bootstrap Template\\bootstrap1\\images\\yemekler\\" + txtYemekFoto.FileName);
            txtYemekFoto.SaveAs("C:\\Users\\student.WISSEN43\\Desktop\\YemekTarif\\images\\yemekler\\" + txtYemekFoto.FileName);
            lblGizli.Text = "images/yemekler/" + txtYemekFoto.FileName;
            lblDurum.Text = "Fotoğraf başarı ile eklendi!";

            if (TarifEkleme())
            {
                Response.Redirect("Tarifler.aspx");
            }
            else { lblDurum.Text = "Bir Hata Oluştu"; }
        }
        else
        {
            lblDurum.Text = "Fotoğraf ekleme işlemi başarısız!";
        }
    }
    private bool TarifEkleme()
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("insert into Yemekler(YemekAdi,Malzeme,Yapilis,YemekFoto,KategoriID,Tarih,Gonderen,Onay) values(@YemekAdi,@Malzeme,@Yapilis,@YemekFoto,@KategoriID,@Tarih,@Gonderen,@Onay)", conn);
        //comm.Parameters.Add("@YemekAdi", SqlDbType.VarChar).Value = txtYemekAd.Text;
        //comm.Parameters.Add("@Malzeme", SqlDbType.VarChar).Value = txtMalzeme.Text;
        //comm.Parameters.Add("@Yapilis", SqlDbType.VarChar).Value = txtYapilis.Text;
        //comm.Parameters.Add("@YemekFoto", SqlDbType.VarChar).Value = lblGizli.Text;
        //comm.Parameters.Add("@KategoriID", SqlDbType.VarChar).Value = ddlKategori.SelectedValue;
        //comm.Parameters.Add("@Tarih", SqlDbType.VarChar).Value = DateTime.Now;
        //int Onay = 0;
        //string Gonderen = "";
        //if (Session["uye"] != null)
        //{
        //    Gonderen = Session["uye"].ToString();
        //    Onay = 0;
        //}
        //else if (Session["uyeAdmin"] != null)
        //{
        //    Gonderen = Session["uyeAdmin"].ToString();
        //    Onay = 1;
        //}
        //comm.Parameters.Add("@Gonderen", SqlDbType.VarChar).Value = Gonderen.ToString();
        //comm.Parameters.Add("@Onay", SqlDbType.VarChar).Value = Onay;
        //if (conn.State == ConnectionState.Closed) { conn.Open(); }
        //try
        //{
        //    Sonuc = Convert.ToBoolean(comm.ExecuteNonQuery());
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); } 
        #endregion
        bool Sonuc = false;
        Yemekler y = new Yemekler();
        y.YemekAdi = txtYemekAd.Text;
        y.Malzeme = txtMalzeme.Text;
        y.Yapilis = txtYapilis.Text;
        y.YemekFoto = lblGizli.Text;
        y.KategoriID = Convert.ToInt32(ddlKategori.SelectedValue);
        y.Tarih = DateTime.Now;
        int Onay = 0;
        string Gonderen = "";
        if (Session["uye"] != null)
        {
            Gonderen = Session["uye"].ToString();
            Onay = 0;
        }
        else if (Session["uyeAdmin"] != null)
        {
            Gonderen = Session["uyeAdmin"].ToString();
            Onay = 1;
        }
        y.Gonderen = Gonderen;
        y.YemekPuanSayisi = 0;
        y.YemekYorumSayisi = 0;
        y.Onay = Convert.ToBoolean(Onay);
        y.Silindi = false;
        ent.Yemekler.Add(y);
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