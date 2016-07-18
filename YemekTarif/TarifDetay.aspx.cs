using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TarifDetay : System.Web.UI.Page
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    YemekTarifEntities ent = new YemekTarifEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlYorumlar.Visible = true;
            UrunDetayGetir();
            YorumlariGetir();
            if (Session["uye"] != null || Session["uyeAdmin"] != null)
            {
                pnlYorumYap.Visible = true;
            }
            else
            {
                pnlYorumYap.Visible = false;
            }
        }
    }
    private void UrunDetayGetir()
    {
        DataTable dt = new DataTable();
        int id = Convert.ToInt32(Request.QueryString["yemekid"]);
        //SqlCommand comm = new SqlCommand("select * from Yemekler where YemekID=@ID and Onay=1 and Silindi=0", conn);
        //comm.Parameters.Add("@ID", SqlDbType.Int).Value = id;
        //if (conn.State == ConnectionState.Closed) { conn.Open(); }
        //SqlDataReader dr;
        //try
        //{
        //    dr = comm.ExecuteReader();
        //    dlstTarifDetay.DataSource = dr;
        //    dlstTarifDetay.DataBind();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }

        var Uruns = (from urun in ent.Yemekler
                     where urun.Silindi == false && urun.Onay == true && urun.YemekID==id
                     select urun).ToList();
        dlstTarifDetay.DataSource = Uruns;
        dlstTarifDetay.DataBind();
    }
    private void YorumlariGetir()
    {
        DataTable dt = new DataTable();
        int id = Convert.ToInt32(Request.QueryString["yemekid"]);
        SqlDataAdapter da = new SqlDataAdapter("select * from Yorumlar inner join Kullanicilar on Yorumlar.KullaniciID=Kullanicilar.KullaniciID inner join Yemekler on Yemekler.YemekID=Yorumlar.YemekID where Yorumlar.YemekID=@ID and Yorumlar.Silindi=0 order by YorumTarihi desc", conn);
        da.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = id;
        da.Fill(dt);
        dlstYorumlar.DataSource = dt;
        dlstYorumlar.DataBind();

        //var Uruns = (from urun in ent.Yorumlar
        //             where urun.Silindi == false && urun.YemekID == id
        //             select urun).ToList();
        //dlstTarifDetay.DataSource = Uruns;
        //dlstTarifDetay.DataBind();
    }
    protected void btnYorumGonder_Click(object sender, EventArgs e)
    {
        if (YorumEkle())
        {
            YemekYorumSayisiGuncelle();
            Response.Redirect("TarifDetay.aspx?yemekid=" + Convert.ToInt32(Request.QueryString["yemekid"]));
        }

    }
    private bool YorumEkle()
    {
        bool Sonuc = false;
        //SqlCommand comm = new SqlCommand("insert into Yorumlar(YemekID,KullaniciID,YorumMetni,YorumTarihi) values(@YemekID,@KullaniciID,@YorumMetni,@YorumTarihi)", conn);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["yemekid"]);
        //comm.Parameters.Add("@KullaniciID", SqlDbType.Int).Value = Convert.ToInt32(Session["uyeID"]);
        //comm.Parameters.Add("@YorumMetni", SqlDbType.VarChar).Value = txtYorum.Text;
        //comm.Parameters.Add("@YorumTarihi", SqlDbType.DateTime).Value = DateTime.Now;
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

        Yorumlar y = new Yorumlar();
        y.YemekID = Convert.ToInt32(Request.QueryString["yemekid"]);
        y.KullaniciID = Convert.ToInt32(Session["uyeID"]);
        y.YorumMetni = txtYorum.Text;
        y.YorumTarihi = DateTime.Now;
        ent.Yorumlar.Add(y);
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
    protected void btnBegen_Click(object sender, EventArgs e)
    {
        if (BegeniKontrol())
        {
            lblDurum.Text = "Daha Önceden beğenmişsiniz!!!";
        }
        else
        {
            Begen();
            YemekBegeniSayisiGuncelle();
            Response.Redirect("TarifDetay.aspx?yemekid=" + Convert.ToInt32(Request.QueryString["yemekid"]));
        }
    }
    public bool BegeniKontrol()
    {
        bool Sonuc = false;
        SqlCommand comm = new SqlCommand("select Count(*) from YemekBegeni inner join Yemekler on YemekBegeni.YemekID=Yemekler.YemekID inner join Kullanicilar on Kullanicilar.KullaniciID=YemekBegeni.KullaniciID where Kullanicilar.KullaniciID=@KullaniciID and YemekBegeni.YemekID=@YemekID", conn);
        comm.Parameters.Add("@KullaniciID", SqlDbType.Int).Value = Convert.ToInt32(Session["uyeID"]);
        comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["yemekid"]);
        if (conn.State == ConnectionState.Closed) conn.Open();
        int Sayisi = Convert.ToInt32(comm.ExecuteScalar());
        if (Sayisi > 0)
        {
            Sonuc = true;
        }
        conn.Close();
        return Sonuc;
    }
    public void Begen()
    {
        //SqlCommand comm = new SqlCommand("insert into YemekBegeni(YemekID,KullaniciID) values(@YemekID,@KullaniciID)", conn);
        //comm.Parameters.Add("@KullaniciID", SqlDbType.Int).Value = Convert.ToInt32(Session["uyeID"]);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["yemekid"]);
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    comm.ExecuteNonQuery();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }
        YemekBegeni y = new YemekBegeni();
        y.YemekID = Convert.ToInt32(Request.QueryString["yemekid"]);
        y.KullaniciID = Convert.ToInt32(Session["uyeID"]);
        ent.YemekBegeni.Add(y);
        try
        {
            ent.SaveChanges();
        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
    }
    private void YemekBegeniSayisiGuncelle()
    {
        //SqlCommand comm = new SqlCommand("update Yemekler Set YemekPuanSayisi=YemekPuanSayisi + 1 where YemekID=@YemekID", conn);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["yemekid"]);
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    comm.ExecuteNonQuery();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }

        int degisenID = Convert.ToInt32(Request.QueryString["yemekid"]);
        var degisen = (from y in ent.Yemekler
                       where y.YemekID == degisenID
                       select y).FirstOrDefault();
        degisen.YemekPuanSayisi = degisen.YemekPuanSayisi + 1;
        try
        {
            ent.SaveChanges();

        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
    }
    private void YemekYorumSayisiGuncelle()
    {
        //SqlCommand comm = new SqlCommand("update Yemekler Set YemekYorumSayisi=YemekYorumSayisi + 1 where YemekID=@YemekID", conn);
        //comm.Parameters.Add("@YemekID", SqlDbType.Int).Value = Convert.ToInt32(Request.QueryString["yemekid"]);
        //if (conn.State == ConnectionState.Closed) conn.Open();
        //try
        //{
        //    comm.ExecuteNonQuery();
        //}
        //catch (SqlException ex)
        //{
        //    string hata = ex.Message;
        //}
        //finally { conn.Close(); }

        int degisenID = Convert.ToInt32(Request.QueryString["yemekid"]);
        var degisen = (from y in ent.Yemekler
                       where y.YemekID == degisenID
                       select y).FirstOrDefault();
        degisen.YemekYorumSayisi = degisen.YemekYorumSayisi+1;
        try
        {
            ent.SaveChanges();

        }
        catch (Exception ex)
        {
            string hata = ex.Message;
        }
    }
}