CREATE OR REPLACE PACKAGE VeriGuncelle AS
    PROCEDURE UcakGuncelle(p_ucakID IN NUMBER, p_ucakModeli IN VARCHAR2, p_kapasite IN NUMBER);
    PROCEDURE UcusGuncelle(p_ucusID IN NUMBER, p_ucakID IN NUMBER, p_ucusKodu IN NUMBER, p_hedefHavalimani IN VARCHAR2, p_kalkisSaati IN DATE, p_varisSaati IN DATE);
    PROCEDURE PersonelGuncelle(p_personelID IN NUMBER, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_gorev IN VARCHAR2, p_departman IN VARCHAR2);
    PROCEDURE YolcuGuncelle(p_yolcuID IN NUMBER, p_tcNO IN VARCHAR2, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_dogumTarihi IN DATE, p_uyruk IN VARCHAR2);
    PROCEDURE BiletGuncelle(p_biletID IN NUMBER, p_yolcuID IN NUMBER, p_ucusID IN NUMBER, p_koltukNo IN NUMBER, p_fiyat IN NUMBER, p_sinif IN NUMBER);
    PROCEDURE KapiGuncelle(p_kapiID IN NUMBER, p_kapiNO IN VARCHAR2, p_kat IN VARCHAR2, p_durum IN VARCHAR2, p_ucusID IN NUMBER);
    PROCEDURE CheckinGuncelle(p_checkinID IN NUMBER, p_biletID IN NUMBER, p_kapiID IN NUMBER, p_checkinSaati IN DATE);
    PROCEDURE BagajGuncelle(p_bagajID IN NUMBER, p_checkinID IN NUMBER, p_agirlik IN NUMBER, p_etiketNO IN VARCHAR2);
    PROCEDURE TeknikBakimKayitGuncelle(p_bakimID IN NUMBER, p_ucakID IN NUMBER, p_personelID IN NUMBER, p_islemTipi IN VARCHAR2);
    PROCEDURE BagajIslemGuncelle(p_bagajIslemID IN NUMBER, p_bagajID IN NUMBER, p_durum IN VARCHAR2);
    PROCEDURE VipHizmetGuncelle(p_hizmetID IN NUMBER, p_yolcuID IN NUMBER, p_hizmetTipi IN VARCHAR2);
    PROCEDURE KayipEsyaGuncelle(p_esyaID IN NUMBER, p_ucusID IN NUMBER, p_bulunmaTarihi IN DATE, p_tanim IN VARCHAR2, p_teslimDurumu IN VARCHAR2);
END VeriGuncelle;
/

CREATE OR REPLACE PACKAGE BODY VeriGuncelle AS

    PROCEDURE UcakGuncelle(p_ucakID IN NUMBER, p_ucakModeli IN VARCHAR2, p_kapasite IN NUMBER) IS
    BEGIN
        UPDATE UCAKLAR
        SET ucakModeli = p_ucakModeli, kapasite = p_kapasite
        WHERE ucakID = p_ucakID;
    END;

    PROCEDURE UcusGuncelle(p_ucusID IN NUMBER, p_ucakID IN NUMBER, p_ucusKodu IN NUMBER, p_hedefHavalimani IN VARCHAR2, p_kalkisSaati IN DATE, p_varisSaati IN DATE) IS
    BEGIN
        UPDATE UCUSLAR
        SET ucakID = p_ucakID, ucusKodu = p_ucusKodu, hedefHavalimani = p_hedefHavalimani, kalkisSaati = p_kalkisSaati, varisSaati = p_varisSaati
        WHERE ucusID = p_ucusID;
    END;

    PROCEDURE PersonelGuncelle(p_personelID IN NUMBER, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_gorev IN VARCHAR2, p_departman IN VARCHAR2) IS
    BEGIN
        UPDATE PERSONEL
        SET ad = p_ad, soyad = p_soyad, gorev = p_gorev, departman = p_departman
        WHERE personelID = p_personelID;
    END;

    PROCEDURE YolcuGuncelle(p_yolcuID IN NUMBER, p_tcNO IN VARCHAR2, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_dogumTarihi IN DATE, p_uyruk IN VARCHAR2) IS
    BEGIN
        UPDATE YOLCULAR
        SET tcno = p_tcno, ad = p_ad, soyad = p_soyad, dogumtarihi = p_dogumtarihi, uyruk = p_uyruk
        WHERE yolcuID = p_yolcuID;
    END;

    PROCEDURE BiletGuncelle(p_biletID IN NUMBER, p_yolcuID IN NUMBER, p_ucusID IN NUMBER, p_koltukNo IN NUMBER, p_fiyat IN NUMBER, p_sinif IN NUMBER) IS
    BEGIN
        UPDATE BILETLER
        SET yolcuID = p_yolcuID, ucusID = p_ucusID, koltukNo = p_koltukNo, fiyat = p_fiyat, sinif = p_sinif
        WHERE biletID = p_biletID;
    END;

    PROCEDURE KapiGuncelle(p_kapiID IN NUMBER, p_kapiNO IN VARCHAR2, p_kat IN VARCHAR2, p_durum IN VARCHAR2, p_ucusID IN NUMBER) IS
    BEGIN
        UPDATE KAPILAR
        SET kapiNO = p_kapiNO, kat = p_kat, durum = p_durum, ucusID = p_ucusID
        WHERE kapiID = p_kapiID;
    END;

    PROCEDURE CheckinGuncelle(p_checkinID IN NUMBER, p_biletID IN NUMBER, p_kapiID IN NUMBER, p_checkinSaati IN DATE) IS
    BEGIN
        UPDATE CHECKINLER
        SET biletID = p_biletID, kapiID = p_kapiID, checkinSaati = p_checkinSaati
        WHERE checkinID = p_checkinID;
    END;

    PROCEDURE BagajGuncelle(p_bagajID IN NUMBER, p_checkinID IN NUMBER, p_agirlik IN NUMBER, p_etiketNO IN VARCHAR2) IS
    BEGIN
        UPDATE BAGAJLAR
        SET checkinID = p_checkinID, agirlik = p_agirlik, etiketNO = p_etiketNO
        WHERE bagajID = p_bagajID;
    END;

    PROCEDURE TeknikBakimKayitGuncelle(p_bakimID IN NUMBER, p_ucakID IN NUMBER, p_personelID IN NUMBER, p_islemTipi IN VARCHAR2) IS
    BEGIN
        UPDATE TEKNIK_BAKIM_KAYITLARI
        SET ucakID = p_ucakID, personelID = p_personelID, islemTipi = p_islemTipi
        WHERE bakimID = p_bakimID;
    END;

    PROCEDURE BagajIslemGuncelle(p_bagajIslemID IN NUMBER, p_bagajID IN NUMBER, p_durum IN VARCHAR2) IS
    BEGIN
        UPDATE BAGAJ_ISLEMLERI
        SET bagajID = p_bagajID, durum = p_durum
        WHERE bagajIslemID = p_bagajIslemID;
    END;

    PROCEDURE VipHizmetGuncelle(p_hizmetID IN NUMBER, p_yolcuID IN NUMBER, p_hizmetTipi IN VARCHAR2) IS
    BEGIN
        UPDATE VIP_HIZMETLER
        SET yolcuID = p_yolcuID, hizmetTipi = p_hizmetTipi
        WHERE hizmetID = p_hizmetID;
    END;

    PROCEDURE KayipEsyaGuncelle(p_esyaID IN NUMBER, p_ucusID IN NUMBER, p_bulunmaTarihi IN DATE, p_tanim IN VARCHAR2, p_teslimDurumu IN VARCHAR2) IS 
    BEGIN
        UPDATE KAYIP_ESYALAR
        SET ucusID = p_ucusID, bulunmaTarihi = p_bulunmaTarihi, tanim = p_tanim, teslimDurumu = p_teslimDurumu
        WHERE esyaID = p_esyaID;
    END;

END VeriGuncelle;
/

ALTER PACKAGE VERIGIRISI COMPILE BODY;

SELECT * FROM user_errors WHERE name = 'VERIGUNCELLE';