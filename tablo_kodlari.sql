CREATE TABLE UCAKLAR(
    ucakID              NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    ucakModeli          VARCHAR2(50) NOT NULL,
    kapasite            NUMBER
);

CREATE TABLE UCUSLAR(
    ucusID              NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    ucakID              NUMBER REFERENCES UCAKLAR(ucakID),
    ucusKodu            NUMBER NOT NULL,
    hedefHavalimani     VARCHAR2(100) NOT NULL,
    kalkisSaati         DATE,
    varisSaati          DATE
);

CREATE TABLE PERSONEL(
    personelID          NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    ad                  VARCHAR2(50) NOT NULL,
    soyad               VARCHAR2(50) NOT NULL,
    gorev               VARCHAR2(50),
    departman           VARCHAR2(50)
);

CREATE TABLE YOLCULAR(
    yolcuID             NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    tcNO                VARCHAR2(11) UNIQUE NOT NULL,
    ad                  VARCHAR2(50),
    soyad               VARCHAR2(50) NOT NULL,
    dogumTarihi         date,
    uyruk               VARCHAR2(20),
    
    CONSTRAINT tc_kimlik_no_uzunluk CHECK (
        LENGTH(tcNO) = 11 AND REGEXP_LIKE(tcNO, '^[0-9]+$')
    )
);

CREATE TABLE BILETLER(
    biletID             NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    yolcuID             NUMBER REFERENCES YOLCULAR(yolcuID) NOT NULL,
    ucusID              NUMBER REFERENCES UCUSLAR(ucusID),
    koltukNO            NUMBER NOT NULL,
    fiyat               NUMBER,
    sinif               NUMBER
);

CREATE TABLE KAPILAR(
    kapiID              NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,              
    kapiNO              VARCHAR2(5) NOT NULL,
    kat                 VARCHAR2(5),
    durum               VARCHAR2(20),
    ucusID              NUMBER REFERENCES UCUSLAR(ucusID)
);

CREATE TABLE CHECKINLER(
    checkinID           NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    biletID             NUMBER REFERENCES BILETLER(biletID) NOT NULL,
    kapiID              NUMBER REFERENCES KAPILAR(kapiID),
    checkinSaati        DATE
);

CREATE TABLE BAGAJLAR(
    bagajID             NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    checkinID           REFERENCES CHECKINLER(checkinID),
    agirlik             NUMBER,
    etiketNO            VARCHAR2(10)   
);

CREATE TABLE TEKNIK_BAKIM_KAYITLARI(
    bakimID             NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    ucakID              NUMBER REFERENCES UCAKLAR(ucakID),
    personelID          NUMBER REFERENCES PERSONEL(personelID),
    islemTipi           VARCHAR2(50),
    aciklama            VARCHAR2(100)
);

CREATE TABLE BAGAJ_ISLEMLERI(
    bagajIslemID        NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    bagajID             NUMBER REFERENCES BAGAJLAR(bagajID) NOT NULL,
    durum               VARCHAR2(50)
);

CREATE TABLE VIP_HIZMETLER(
    hizmetID            NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    yolcuID             NUMBER REFERENCES YOLCULAR(yolcuID) NOT NULL,
    hizmetTipi          VARCHAR2(50)
);

CREATE TABLE KAYIP_ESYALAR(
    esyaID              NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    ucusID              NUMBER REFERENCES UCUSLAR(ucusID),
    bulunmaTarihi       DATE,
    tanim               VARCHAR2(100),
    teslimDurumu        VARCHAR2(50)
);

--ALTER TABLE KAPILAR ADD ucusID NUMBER;
--ALTER TABLE KAPILAR ADD CONSTRAINT fk_ucusID FOREIGN KEY (ucusID) REFERENCES UCUSLAR(ucusID);
