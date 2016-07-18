using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AnaSayfa : System.Web.UI.Page
{
    //SqlConnection conn = new SqlConnection("Data Source=Pc;Initial Catalog=YemekTarif;uid=sa;pwd=61");
    SqlConnection conn = new SqlConnection("Data Source=WISSEN43\\MSSQLYAZ8;Initial Catalog=YemekTarif;uid=sa;pwd=123458");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //SliderUrunGetir();
        }
    }
    private void SliderUrunGetir()
    {
        //DataTable dt = new DataTable();
        //SqlDataAdapter da = new SqlDataAdapter("select * from Yemekler Urunler where Onay=1 and Silindi=0 and YemekPuanSayisi>1", conn);
        //da.Fill(dt);
        //dlstSlider.DataSource = dt;
        //dlstSlider.DataBind();
    }
}