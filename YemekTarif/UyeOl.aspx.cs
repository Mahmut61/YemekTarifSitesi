using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UyeOl : System.Web.UI.Page
{

    // SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    //SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnKaydol_Click(object sender, EventArgs e)
    {
        if (rbErkek.Checked || rbKadin.Checked)
        {
            if (UyeVarmi(txtKullanici.Text, txtAdSoyad.Text))
            {
                lblDurum.Visible = true;
                lblDurum.Text = "Girdiğiniz kullanıcı zaten kayıtlı!";
                txtKullanici.Focus();
            }
            else
            {
                if (UyeEkle())
                {
                    Response.Redirect("Giris.aspx");
                }
            }
        }
        else
        {
            lblDurum.Visible = true;
            lblDurum.Text = "Cinsiyet Seçili Değil!";
        }
    }
    private bool UyeEkle()
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("insert into Kullanicilar(AdSoyad,KullaniciAdi,Sifre,Yetki,Telefon,Adres,Cinsiyet) values(@AdSoyad,@KullaniciAdi,@Sifre,@Yetki,@Telefon,@Adres,@Cinsiyet)", conn);
        //comm.Parameters.Add("@AdSoyad", SqlDbType.VarChar).Value = txtAdSoyad.Text;
        //comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = txtKullanici.Text;
        //comm.Parameters.Add("@Sifre", SqlDbType.VarChar).Value = txtSifre.Text;
        //comm.Parameters.Add("@Yetki", SqlDbType.VarChar).Value = 2;
        //comm.Parameters.Add("@Telefon", SqlDbType.VarChar).Value = txtTelefon.Text;
        //comm.Parameters.Add("@Adres", SqlDbType.VarChar).Value = txtAdres.Text;
        //string Cinsiyet = "";
        //if (rbErkek.Checked)
        //{
        //    Cinsiyet = rbErkek.Text;
        //}
        //else if (rbErkek.Checked)
        //{
        //    Cinsiyet = rbKadin.Text;
        //}
        //comm.Parameters.Add("@Cinsiyet", SqlDbType.VarChar).Value = Cinsiyet.ToString();
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
        //return Sonuc; 
        #endregion
        bool Sonuc = false;
        Kullanicilar k = new Kullanicilar();
        k.AdSoyad = txtAdSoyad.Text;
        k.KullaniciAdi = txtKullanici.Text;
        k.Sifre = txtSifre.Text;
        k.Yetki = "2";
        k.Telefon = txtTelefon.Text;
        k.Adres = txtAdres.Text;
        string Cinsiyet = "";
        if (rbErkek.Checked)
        {
            Cinsiyet = rbErkek.Text;
        }
        else if (rbErkek.Checked)
        {
            Cinsiyet = rbKadin.Text;
        }
        k.Cinsiyet = Cinsiyet;
        k.ProfilFoto = "images/kullanicilar/kullanici.jpg";
        k.GonderdigiTarifSayisi = 0;
        k.Puan = 0;
        k.YorumSayisi = 0;
        k.Silindi = false;
        ent.Kullanicilar.Add(k);
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
    private bool UyeVarmi(string KullaniciAd, string AdSoyad)
    {
        #region ADO.Net
        //bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("select Count(*) from Kullanicilar where Silindi=0 and KullaniciAdi=@KullaniciAdi and AdSoyad=@AdSoyad", conn);
        //comm.Parameters.Add("@KullaniciAdi", SqlDbType.VarChar).Value = KullaniciAd;
        //comm.Parameters.Add("@AdSoyad", SqlDbType.VarChar).Value = AdSoyad;
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    int Sayisi = Convert.ToInt32(comm.ExecuteScalar());
        //    if (Sayisi > 0)
        //    {
        //        Sonuc = true;
        //    }
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }
        //return Sonuc; 
        #endregion
        var kullanici = (from k in ent.Kullanicilar
                         where k.Silindi == false && k.KullaniciAdi == KullaniciAd && k.AdSoyad == AdSoyad
                         select k).FirstOrDefault();
        if (kullanici != null) return true;
        return false;
    }
}