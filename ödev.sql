create database school_library;
create table uyeler(
uyeNo int not null Primary key identity(1,1),
uyeAdi nvarchar (50) not null,
uyeSoyadý nvarchar(30) not null,
eposta nvarchar(50) not null,
cinsiyet char(2),
telefon int
);

use school_library
create table adresler(
adresNo int not null Primary key identity(1,1),
sehir nvarchar (50),
mahalle nvarchar(30),
binaNo int,
cadde nvarchar(200),
ulke nvarchar(50),
postaKodu int
);

alter table uyeler add adresNo int constraint fk_uyeler_adresler foreign key (adresNo) references adresler (adresNo);

create table kutuphane(
kutuphaneNo int not null identity (1,1) primary key,
kutuphaneIsmi nvarchar(50),
acýklama nvarchar(500),
adresNo int constraint fk_adresler_kutuphane foreign key (adresNo) references adresler (adresNo)
);

create table emanet(
emanetNo int not null identity (1,1) primary key,
emanetTarihi datetime,
teslimTarihi datetime,
uyeNo int constraint fk_uye_emanet foreign key (uyeNo) references uyeler (uyeNo),
kutuphaneNo int constraint fk_kutuphane_emanet foreign key (kutuphaneNo) references kutuphane (kutuphaneNo),
ISBM nvarchar(50) constraint fk_kitaplar_emanet foreign key (ISBM) references kitaplar (ISBM),
);

create table kitaplar(
ISBM nvarchar(50) not null primary key,
kitapAdi nvarchar(100),
sayfaSayisi int,
yayinTarihi datetime,
);

create table kategoriler(
kategoriNo int not null primary key identity (1,1),
kategoriAdi nvarchar(50),
);

create table yazarlar(
yazarNo int not null primary key,
yazarAdı nvarchar(50),
yazarSoyadı nvarchar(30),
);

create table bulunur1(
miktar int not null primary key identity (1,1),
kutuphaneNo int constraint fk_kutuphane_bulunur1 foreign key (kutuphaneNo) references kutuphane (kutuphaneNo),
ISBM nvarchar(50) constraint fk_kitaplar_bulunur1 foreign key (ISBM) references kitaplar (ISBM),
);

create table bulunur2(
bulunurNo int not null primary key identity (1,1),
kategoriNo int constraint fk_kategoriler_bulunur2 foreign key (kategoriNo) references kategoriler (kategoriNo),
ISBM nvarchar(50) constraint fk_kitaplar_bulunur2 foreign key (ISBM) references kitaplar (ISBM),
);

create table yazar(
yazar nvarchar(50) primary key,
ISBM nvarchar(50) constraint fk_kitaplar_yazar foreign key (IsBM) references kitaplar,
yazarNo int constraint fk_yaarlar_yazar foreign key (yazarNo) references yazarlar (yazarNo),
);
