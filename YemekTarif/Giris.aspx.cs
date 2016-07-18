using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Giris : System.Web.UI.Page
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    //SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private bool AdminGiris(string KullaniciAd, string KullaniciSifre)
    {
        #region ADO.Net
        //bool GirdiMi = false;
        //SqlCommand comm = new SqlCommand("select Count(*) from Kullanicilar where Silindi=0 and Yetki=1 and KullaniciAdi=@KullaniciAdi and Sifre=@Sifre", conn);
        //comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = KullaniciAd;
        //comm.Parameters.Add("@Sifre", SqlDbType.VarChar).Value = KullaniciSifre;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //int Sayisi = Convert.ToInt32(comm.ExecuteScalar());
        //if (Sayisi > 0)
        //{
        //    GirdiMi = true;
        //}
        //conn.Close();
        //return GirdiMi;
        #endregion
        var kullanici = (from uye in ent.Kullanicilar
                         where uye.KullaniciAdi == KullaniciAd && uye.Sifre == KullaniciSifre && uye.Yetki == "1"
                         select uye).FirstOrDefault();
        if (kullanici != null) return true;
        return false;
    }
    private bool KullaniciGiris(string KullaniciAd, string KullaniciSifre)
    {
        #region ADO.Net
        //bool GirdiMi = false;
        //SqlCommand comm = new SqlCommand("select Count(*) from Kullanicilar where Silindi=0 and Yetki=2 and KullaniciAdi=@KullaniciAdi and Sifre=@Sifre", conn);
        //comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = KullaniciAd;
        //comm.Parameters.Add("@Sifre", SqlDbType.VarChar).Value = KullaniciSifre;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //int Sayisi = Convert.ToInt32(comm.ExecuteScalar());
        //if (Sayisi > 0)
        //{
        //    GirdiMi = true;
        //}
        //conn.Close();
        //return GirdiMi;
        #endregion
        var kullanici = (from uye in ent.Kullanicilar
                         where uye.KullaniciAdi == KullaniciAd && uye.Sifre == KullaniciSifre && uye.Yetki == "2"
                         select uye).FirstOrDefault();
        if (kullanici != null) return true;
        return false;
    }
    protected void btnGir_Click(object sender, EventArgs e)
    {
        if (AdminGiris(txtAd.Text, txtSifre.Text))
        {
            Session["uyeAdmin"] = txtAd.Text;
            IDBul();
            Response.Redirect("AnaSayfa.aspx");
        }
        else if (KullaniciGiris(txtAd.Text, txtSifre.Text))
        {
            Session["uye"] = txtAd.Text;
            IDBul();
            Response.Redirect("AnaSayfa.aspx");
        }
    }
    private void IDBul()
    {
        #region ADO.Net
        //SqlCommand comm = new SqlCommand("select KullaniciID from Kullanicilar where Silindi=0 and KullaniciAdi=@KullaniciAdi", conn);
        //comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = txtAd.Text;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //int ID = Convert.ToInt32(comm.ExecuteScalar());
        //Session["uyeID"] = ID;
        //conn.Close();
        #endregion
        var ID = (from k in ent.Kullanicilar
                  where k.Silindi == false && k.KullaniciAdi == txtAd.Text
                  select k).FirstOrDefault();
        Session["uyeID"] = ID.KullaniciID;
    }
}