create database school_library;
create table uyeler(
uyeNo int not null Primary key identity(1,1),
uyeAdi nvarchar (50) not null,
uyeSoyad� nvarchar(30) not null,
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
ac�klama nvarchar(500),
adresNo int constraint fk_adresler_kutuphane foreign key (adresNo) references adresler (adresNo)
);

