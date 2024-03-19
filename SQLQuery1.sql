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