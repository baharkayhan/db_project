CREATE OR REPLACE PACKAGE VeriGirisi AS
    PROCEDURE UcakEkle(p_ucakModeli IN VARCHAR2, p_kapasite IN NUMBER);
    PROCEDURE UcusEkle(p_ucakID IN NUMBER, p_ucusKodu IN NUMBER, p_hedefHavalimani IN VARCHAR2, p_kalkisSaati IN DATE, P_varisSaati IN DATE);
    PROCEDURE PersonelEkle(p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_gorev IN VARCHAR2, p_departman IN VARCHAR2);
    PROCEDURE YolcuEkle(p_tcNO IN VARCHAR2, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_dogumTarihi IN DATE, p_uyruk IN VARCHAR2);
    PROCEDURE BiletEkle(p_yolcuID IN NUMBER, p_ucusID IN NUMBER, p_koltukNo IN NUMBER, p_fiyat IN NUMBER, p_sinif IN NUMBER);
    PROCEDURE KapiEkle(p_kapiNO IN VARCHAR2, p_kat IN VARCHAR2, p_durum IN VARCHAR2, p_ucusID IN NUMBER);
    PROCEDURE CheckinEkle(p_biletID IN NUMBER, p_kapiID IN NUMBER, p_checkinSaati IN DATE);
    PROCEDURE BagajEkle(p_checkinID IN NUMBER, p_agirlik IN NUMBER, p_etiketNO IN VARCHAR2);
    PROCEDURE TeknikBakimKayitEkle(p_ucakID IN NUMBER, p_personelID IN NUMBER, p_islemTipi IN VARCHAR2);
    PROCEDURE BagajIslemEkle(p_bagajID IN NUMBER, p_durum IN VARCHAR2);
    PROCEDURE VipHizmetEkle(p_yolcuID IN NUMBER, p_hizmetTipi IN VARCHAR2);
    PROCEDURE KayipEsyaEkle(p_ucusID IN NUMBER, p_bulunmaTarihi IN DATE, p_tanim IN VARCHAR2, p_teslimDurumu IN VARCHAR2);
END VeriGirisi;
/
CREATE OR REPLACE PACKAGE BODY VeriGirisi AS
    PROCEDURE UcakEkle(p_ucakModeli IN VARCHAR2, p_kapasite IN NUMBER) IS
    BEGIN
        INSERT INTO UCAKLAR(ucakModeli, kapasite)
        VALUES(p_ucakModeli, p_kapasite);
    END;
    
    PROCEDURE UcusEkle(p_ucakID IN NUMBER, p_ucusKodu IN NUMBER, p_hedefHavalimani IN VARCHAR2, p_kalkisSaati IN DATE, P_varisSaati IN DATE) IS
    BEGIN
        INSERT INTO UCUSLAR(ucakID, ucusKodu, hedefHavalimani, kalkisSaati, varisSaati)
        VALUES(p_ucakID, p_ucusKodu, p_hedefHavalimani, p_kalkisSaati, P_varisSaati);
    END;
    
    PROCEDURE PersonelEkle(p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_gorev IN VARCHAR2, p_departman IN VARCHAR2) IS
    BEGIN
        INSERT INTO PERSONEL(ad, soyad, gorev, departman)
        VALUES(p_ad, p_soyad, p_gorev, p_departman);
    END;
    
    PROCEDURE YolcuEkle(p_tcNO IN VARCHAR2, p_ad IN VARCHAR2, p_soyad IN VARCHAR2, p_dogumTarihi IN DATE, p_uyruk IN VARCHAR2) IS
    BEGIN
        INSERT INTO YOLCULAR(tcNO, ad, soyad, dogumTarihi, uyruk) 
        VALUES(p_tcNO, p_ad, p_soyad, p_dogumTarihi, p_uyruk);
    END;
    
    PROCEDURE BiletEkle(p_yolcuID IN NUMBER, p_ucusID IN NUMBER, p_koltukNo IN NUMBER, p_fiyat IN NUMBER, p_sinif IN NUMBER) IS
    BEGIN
        INSERT INTO BILETLER(yolcuID, ucusID, koltukNo, fiyat, sinif)
        VALUES(p_yolcuID, p_ucusID, p_koltukNo, p_fiyat, p_sinif);
    END;
    
    PROCEDURE KapiEkle(p_kapiNO IN VARCHAR2, p_kat IN VARCHAR2, p_durum IN VARCHAR2, p_ucusID IN NUMBER) IS
    BEGIN
        INSERT INTO KAPILAR(kapiNO, kat, durum, ucusID)
        VALUES(p_kapiNO, p_kat, p_durum, p_ucusID);
    END;
    
    PROCEDURE CheckinEkle(p_biletID IN NUMBER, p_kapiID IN NUMBER, p_checkinSaati IN DATE) IS
    BEGIN
        INSERT INTO CHECKINLER(biletID, kapiID, checkinSaati)
        VALUES(p_biletID, p_kapiID, p_checkinSaati);
    END;
    
    PROCEDURE BagajEkle(p_checkinID IN NUMBER, p_agirlik IN NUMBER, p_etiketNO IN VARCHAR2) IS
    BEGIN
        INSERT INTO BAGAJLAR(checkinID, agirlik, etiketNO)
        VALUES(p_checkinID, p_agirlik, p_etiketNO);
    END;
    
    PROCEDURE TeknikBakimKayitEkle(p_ucakID IN NUMBER, p_personelID IN NUMBER, p_islemTipi IN VARCHAR2) IS
    BEGIN
        INSERT INTO TEKNIK_BAKIM_KAYITLARI(ucakID, personelID, islemTipi)
        VALUES(p_ucakID, p_personelID, p_islemTipi);
    END;
    
    PROCEDURE BagajIslemEkle(p_bagajID IN NUMBER, p_durum IN VARCHAR2) IS
    BEGIN
        INSERT INTO BAGAJ_ISLEMLERI(bagajID, durum)
        VALUES(p_bagajID, p_durum);
    END;
    
    PROCEDURE VipHizmetEkle(p_yolcuID IN NUMBER, p_hizmetTipi IN VARCHAR2) IS
    BEGIN
        INSERT INTO VIP_HIZMETLER(yolcuID, hizmetTipi)
        VALUES(p_yolcuID, p_hizmetTipi);
    END;
    
    PROCEDURE KayipEsyaEkle(p_ucusID IN NUMBER, p_bulunmaTarihi IN DATE, p_tanim IN VARCHAR2, p_teslimDurumu IN VARCHAR2) IS
    BEGIN
        INSERT INTO KAYIP_ESYALAR(ucusID, bulunmaTarihi, tanim, teslimDurumu)
        VALUES(p_ucusID, p_bulunmaTarihi, p_tanim, p_teslimDurumu);
    END;
    
END VeriGirisi;
/




ALTER PACKAGE VERIGIRISI COMPILE BODY;
SELECT * FROM user_errors WHERE name = 'VERIGIRISI';
SELECT * FROM user_errors WHERE name = 'VERIGIRISI';
