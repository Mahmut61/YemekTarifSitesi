
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAd] [varchar](20) NOT NULL,
	[Silindi] [bit] NOT NULL CONSTRAINT [DF_Kategoriler_Silindi]  DEFAULT ((0)),
 CONSTRAINT [PK_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 11.7.2016 14:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](20) NOT NULL,
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](20) NOT NULL,
	[Yetki] [varchar](20) NOT NULL,
	[Telefon] [varchar](20) NOT NULL,
	[Adres] [varchar](20) NULL,
	[Cinsiyet] [varchar](20) NULL,
	[ProfilFoto] [varchar](max) NULL CONSTRAINT [DF_Kullanicilar_ProfilFoto]  DEFAULT ('images/kullanicilar/kullanici.jpg'),
	[GonderdigiTarifSayisi] [int] NULL CONSTRAINT [DF_Kullanicilar_GonderdigiTarifSayisi]  DEFAULT ((0)),
	[Puan] [int] NULL CONSTRAINT [DF_Kullanicilar_Puan]  DEFAULT ((0)),
	[YorumSayisi] [int] NULL CONSTRAINT [DF_Kullanicilar_YorumSayisi]  DEFAULT ((0)),
	[Silindi] [bit] NULL CONSTRAINT [DF_Kullanicilar_Silindi]  DEFAULT ((0)),
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YemekBegeni]    Script Date: 11.7.2016 14:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YemekBegeni](
	[BegeniID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
 CONSTRAINT [PK_YemekBegeni] PRIMARY KEY CLUSTERED 
(
	[BegeniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YemekFavori]    Script Date: 11.7.2016 14:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YemekFavori](
	[FavoriID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NULL,
	[KullaniciID] [int] NULL,
 CONSTRAINT [PK_YemekFavori] PRIMARY KEY CLUSTERED 
(
	[FavoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Yemekler]    Script Date: 11.7.2016 14:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yemekler](
	[YemekID] [int] IDENTITY(1,1) NOT NULL,
	[YemekAdi] [varchar](50) NOT NULL,
	[Malzeme] [varchar](max) NOT NULL,
	[Yapilis] [varchar](max) NOT NULL,
	[YemekFoto] [varchar](max) NULL,
	[KategoriID] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL CONSTRAINT [DF_Yemekler_Tarih]  DEFAULT (getdate()),
	[Gonderen] [varchar](20) NULL,
	[YemekPuanSayisi] [int] NULL CONSTRAINT [DF_Table_1_YemekPuan]  DEFAULT ((0)),
	[YemekYorumSayisi] [int] NULL CONSTRAINT [DF_Table_1_YemekYorum]  DEFAULT ((0)),
	[Onay] [bit] NOT NULL CONSTRAINT [DF_Yemekler_Onay]  DEFAULT ((0)),
	[Silindi] [bit] NOT NULL CONSTRAINT [DF_Yemekler_Silindi]  DEFAULT ((0)),
 CONSTRAINT [PK_Yemekler] PRIMARY KEY CLUSTERED 
(
	[YemekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 11.7.2016 14:20:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[YorumID] [int] IDENTITY(1,1) NOT NULL,
	[YemekID] [int] NOT NULL,
	[KullaniciID] [int] NOT NULL,
	[YorumMetni] [varchar](max) NULL,
	[YorumTarihi] [datetime] NOT NULL CONSTRAINT [DF_Yorumlar_YorumTarihi]  DEFAULT (getdate()),
	[Silindi] [bit] NOT NULL CONSTRAINT [DF_Yorumlar_Silindi]  DEFAULT ((0)),
 CONSTRAINT [PK_Yorumlar] PRIMARY KEY CLUSTERED 
(
	[YorumID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Kategoriler] ON 

INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (1, N'Tatlı', 0)
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (2, N'Et Yemekleri', 0)
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (3, N'Kızartma', 0)
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (4, N'Ana Yemek', 0)
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (5, N'Çorba', 0)
INSERT [dbo].[Kategoriler] ([KategoriID], [KategoriAd], [Silindi]) VALUES (6, N'İçecek', 1)
SET IDENTITY_INSERT [dbo].[Kategoriler] OFF
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (1, N'Mahmut Uzun', N'mahmut', N'61', N'1', N'5364568795', N'Beşiktaş-İstanbul', N'Erkek', N'images/kullanicilar/admin.jpg', 0, 0, 0, 0)
INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (2, N'Burak', N'Deneme', N'34', N'2', N'5321648956', N'Merter-İstanbul', N'Erkek', N'images/kullanicilar/kullanici.jpg', 8, 0, 0, 0)
INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (3, N'Gürkan Demirel', N'Gürkan', N'34', N'2', N'5326231546', N'Avcılar-İstanbul', N'Erkek', N'images/kullanicilar/kullanici.jpg', 0, 0, 0, 0)
INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (4, N'Burcu Kaya', N'Burcu', N'34', N'2', N'5326231541', N'Şişli-İstanbul', N'Kadın', N'images/kullanicilar/kullanici.jpg', 0, 0, 0, 0)
INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (5, N'Esra Yılmaz', N'Esra', N'34', N'2', N'5326231540', N'Gop-İstanbul', N'Kadın', N'images/kullanicilar/kullanici.jpg', 0, 0, 0, 0)
INSERT [dbo].[Kullanicilar] ([KullaniciID], [AdSoyad], [KullaniciAdi], [Sifre], [Yetki], [Telefon], [Adres], [Cinsiyet], [ProfilFoto], [GonderdigiTarifSayisi], [Puan], [YorumSayisi], [Silindi]) VALUES (6, N'Büşra Saral', N'Büşra', N'34', N'2', N'5326231540', N'Beşiktaş-İstanbul', N'Kadın', N'images/kullanicilar/kullanici.jpg', 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
SET IDENTITY_INSERT [dbo].[YemekBegeni] ON 

INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (1, 1, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (2, 2, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (3, 4, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (4, 5, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (5, 8, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (6, 11, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (7, 12, 2)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (8, 4, 1)
INSERT [dbo].[YemekBegeni] ([BegeniID], [YemekID], [KullaniciID]) VALUES (9, 14, 1)
SET IDENTITY_INSERT [dbo].[YemekBegeni] OFF
SET IDENTITY_INSERT [dbo].[YemekFavori] ON 

INSERT [dbo].[YemekFavori] ([FavoriID], [YemekID], [KullaniciID]) VALUES (1, 2, 2)
INSERT [dbo].[YemekFavori] ([FavoriID], [YemekID], [KullaniciID]) VALUES (2, 4, 2)
INSERT [dbo].[YemekFavori] ([FavoriID], [YemekID], [KullaniciID]) VALUES (3, 5, 2)
INSERT [dbo].[YemekFavori] ([FavoriID], [YemekID], [KullaniciID]) VALUES (4, 7, 2)
INSERT [dbo].[YemekFavori] ([FavoriID], [YemekID], [KullaniciID]) VALUES (5, 8, 2)
SET IDENTITY_INSERT [dbo].[YemekFavori] OFF
SET IDENTITY_INSERT [dbo].[Yemekler] ON 

INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (1, N'Makarna', N'Makarna,Su,Tereyağı', N'at ketıla bekle', N'images/yemekler/makarna.png', 4, CAST(N'2016-07-06 13:20:20.553' AS DateTime), N'Deneme', 1, 2, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (2, N'Güveç', N'Epeyce sebze, bi de et', N'alayını karıştır', N'images/yemekler/guvec.png', 4, CAST(N'2016-07-06 13:22:07.550' AS DateTime), N'Deneme', 1, 1, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (4, N'Baklava', N'Yağ, Bol şeker', N'At fava bekle', N'images/yemekler/evbaklavasi.png', 1, CAST(N'2016-07-06 13:23:39.040' AS DateTime), N'Deneme', 2, 2, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (5, N'Bulgur', N'Bulgur', N'Yap işte', N'images/yemekler/bulgur.png', 4, CAST(N'2016-07-06 13:27:06.503' AS DateTime), N'Deneme', 1, 2, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (7, N'Kızartma', N'Patates, yağ', N'At tavaya bekle', N'images/yemekler/kizartma.png', 3, CAST(N'2016-07-06 13:29:13.600' AS DateTime), N'Deneme', 0, 0, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (8, N'Fırında Tavuk', N'Tavuk, sos', N'Aban sosa, at fırına', N'images/yemekler/firindatavuk.jpg', 2, CAST(N'2016-07-06 13:30:22.417' AS DateTime), N'Deneme', 1, 0, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (9, N'Mercimek Çorbası', N'mercimek, yağ', N'at düdüklüye arkana yaslan', N'images/yemekler/mercimek-corbasi.jpg', 5, CAST(N'2016-07-06 13:32:03.660' AS DateTime), N'Deneme', 0, 0, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (11, N'Pancar Çorbası', N'pancar, yağ, mısır unu', N'Bolca su ile pişir ve karıştır', N'images/yemekler/dsc04595.jpg', 5, CAST(N'2016-07-06 13:35:08.320' AS DateTime), N'Deneme', 1, 0, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (12, N'Fırında Patlıcan', N'Bolca Patlıcan', N'Yapalım Gitsin', N'images/yemekler/patlican.png', 4, CAST(N'2016-07-07 13:58:40.000' AS DateTime), N'Deneme', 1, 1, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (13, N'Domates Çorbası', N'Bolca domates,kaşar,karabiber,pulbiber', N'Ketılda su ısıt, hepsini at ve karıştır.', N'images/yemekler/domates-çorbası-632x420.jpg', 5, CAST(N'2016-08-07 16:02:32.000' AS DateTime), N'Deneme', 0, 0, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (14, N'Kadayıf Tatlısı', N'Hazır Kadayıf,şeker,su', N'Su ile şekeri karıştır şerbet haline getir sonrada kadayıfa dök ve beklet', N'images/yemekler/kadayif_tatlisi.jpg', 1, CAST(N'2016-08-07 16:10:33.000' AS DateTime), N'mahmut', 1, 1, 1, 0)
INSERT [dbo].[Yemekler] ([YemekID], [YemekAdi], [Malzeme], [Yapilis], [YemekFoto], [KategoriID], [Tarih], [Gonderen], [YemekPuanSayisi], [YemekYorumSayisi], [Onay], [Silindi]) VALUES (15, N'Etli Kuru Fasulye', N'Et,kuru fasulye,salça', N'Yartım gitti', N'images/yemekler/url2.jpg', 2, CAST(N'2016-08-07 16:17:49.000' AS DateTime), N'Gürkan', 0, 0, 1, 0)
SET IDENTITY_INSERT [dbo].[Yemekler] OFF
SET IDENTITY_INSERT [dbo].[Yorumlar] ON 

INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (1, 1, 2, N'Şahane', CAST(N'2016-07-06 13:43:45.463' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (2, 2, 2, N'Müthiş', CAST(N'2016-07-06 13:43:58.450' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (3, 9, 2, N'Güzel', CAST(N'2016-07-06 13:44:39.843' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (4, 1, 2, N'Ehh İşte', CAST(N'2016-07-06 16:08:04.840' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (5, 4, 2, N'Enfes gözüküyor.', CAST(N'2016-07-07 14:37:00.097' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (6, 12, 2, N'Patlıcanı bol olmuş', CAST(N'2016-07-07 14:40:21.183' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (7, 5, 2, N'Bulgur Müthiş Gözüküyor', CAST(N'2016-07-07 20:42:41.897' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (8, 5, 2, N'Güzel gözüküyor...', CAST(N'2016-07-07 20:44:40.993' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (9, 4, 1, N'Beğenmenize sevindim.', CAST(N'2016-07-07 21:21:53.713' AS DateTime), 0)
INSERT [dbo].[Yorumlar] ([YorumID], [YemekID], [KullaniciID], [YorumMetni], [YorumTarihi], [Silindi]) VALUES (10, 14, 1, N'Tarifiniz için teşekkürler', CAST(N'2016-07-08 16:22:30.023' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Yorumlar] OFF
ALTER TABLE [dbo].[YemekBegeni]  WITH CHECK ADD  CONSTRAINT [FK_YemekBegeni_Kullanicilar] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[YemekBegeni] CHECK CONSTRAINT [FK_YemekBegeni_Kullanicilar]
GO
ALTER TABLE [dbo].[YemekBegeni]  WITH CHECK ADD  CONSTRAINT [FK_YemekBegeni_Yemekler] FOREIGN KEY([YemekID])
REFERENCES [dbo].[Yemekler] ([YemekID])
GO
ALTER TABLE [dbo].[YemekBegeni] CHECK CONSTRAINT [FK_YemekBegeni_Yemekler]
GO
ALTER TABLE [dbo].[YemekFavori]  WITH CHECK ADD  CONSTRAINT [FK_YemekFavori_Kullanicilar] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[YemekFavori] CHECK CONSTRAINT [FK_YemekFavori_Kullanicilar]
GO
ALTER TABLE [dbo].[YemekFavori]  WITH CHECK ADD  CONSTRAINT [FK_YemekFavori_Yemekler] FOREIGN KEY([YemekID])
REFERENCES [dbo].[Yemekler] ([YemekID])
GO
ALTER TABLE [dbo].[YemekFavori] CHECK CONSTRAINT [FK_YemekFavori_Yemekler]
GO
ALTER TABLE [dbo].[Yemekler]  WITH CHECK ADD  CONSTRAINT [FK_Yemekler_Kategoriler] FOREIGN KEY([KategoriID])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[Yemekler] CHECK CONSTRAINT [FK_Yemekler_Kategoriler]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Kullanicilar] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Kullanicilar]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [FK_Yorumlar_Yemekler] FOREIGN KEY([YemekID])
REFERENCES [dbo].[Yemekler] ([YemekID])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [FK_Yorumlar_Yemekler]
GO
USE [master]
GO
ALTER DATABASE [YemekTarif] SET  READ_WRITE 
GO
