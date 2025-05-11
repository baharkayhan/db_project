CREATE OR REPLACE PACKAGE VeriSil AS
    PROCEDURE UcakSil(p_ucakID IN NUMBER);
    PROCEDURE UcusSil(p_ucusID IN NUMBER);
    PROCEDURE PersonelSil(p_personelID IN NUMBER);
    PROCEDURE YolcuSil(p_yolcuID IN NUMBER);
    PROCEDURE BiletSil(p_biletID IN NUMBER);
    PROCEDURE KapiSil(p_kapiID IN NUMBER);
    PROCEDURE CheckinSil(p_checkinID IN NUMBER);
    PROCEDURE BagajSil(p_bagajID IN NUMBER);
    PROCEDURE TeknikBakimKayitSil(p_bakimID IN NUMBER);
    PROCEDURE BagajIslemSil(p_bagajIslemID IN NUMBER);
    PROCEDURE VipHizmetSil(p_hizmetID IN NUMBER);
    PROCEDURE KayipEsyaSil(p_esyaID IN NUMBER);
END VeriSil;
/

CREATE OR REPLACE PACKAGE BODY VeriSil AS

    PROCEDURE UcakSil(p_ucakID IN NUMBER) IS
    BEGIN
        DELETE FROM UCAKLAR WHERE ucakID = p_ucakID;
    END;

    PROCEDURE UcusSil(p_ucusID IN NUMBER) IS
    BEGIN
        DELETE FROM UCUSLAR WHERE ucusID = p_ucusID;
    END;

    PROCEDURE PersonelSil(p_personelID IN NUMBER) IS
    BEGIN
        DELETE FROM PERSONEL WHERE personelID = p_personelID;
    END;

    PROCEDURE YolcuSil(p_yolcuID IN NUMBER) IS
    BEGIN
        DELETE FROM YOLCULAR WHERE yolcuID = p_yolcuID;
    END;

    PROCEDURE BiletSil(p_biletID IN NUMBER) IS
    BEGIN
        DELETE FROM BILETLER WHERE biletID = p_biletID;
    END;

    PROCEDURE KapiSil(p_kapiID IN NUMBER) IS
    BEGIN
        DELETE FROM KAPILAR WHERE kapiID = p_kapiID;
    END;

    PROCEDURE CheckinSil(p_checkinID IN NUMBER) IS
    BEGIN
        DELETE FROM CHECKINLER WHERE checkinID = p_checkinID;
    END;

    PROCEDURE BagajSil(p_bagajID IN NUMBER) IS
    BEGIN
        DELETE FROM BAGAJLAR WHERE bagajID = p_bagajID;
    END;

    PROCEDURE TeknikBakimKayitSil(p_bakimID IN NUMBER) IS
    BEGIN
        DELETE FROM TEKNIK_BAKIM_KAYITLARI WHERE bakimID = p_bakimID;
    END;

    PROCEDURE BagajIslemSil(p_bagajIslemID IN NUMBER) IS
    BEGIN
        DELETE FROM BAGAJ_ISLEMLERI WHERE bagajIslemID = p_bagajIslemID;
    END;

    PROCEDURE VipHizmetSil(p_hizmetID IN NUMBER) IS
    BEGIN
        DELETE FROM VIP_HIZMETLER WHERE hizmetID = p_hizmetID;
    END;

    PROCEDURE KayipEsyaSil(p_esyaID IN NUMBER) IS
    BEGIN
        DELETE FROM KAYIP_ESYALAR WHERE esyaID = p_esyaID;
    END;

END VeriSil;
/

SELECT * FROM user_errors WHERE name = 'VERISIL';