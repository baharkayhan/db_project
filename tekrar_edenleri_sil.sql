CREATE OR REPLACE PACKAGE tekrar_kayit_temizle AS
    PROCEDURE sil_ucaklar_tekrar;
    PROCEDURE sil_ucuslar_tekrar;
    PROCEDURE sil_personel_tekrar;
    PROCEDURE sil_yolcular_tekrar;
    PROCEDURE sil_biletler_tekrar;
    PROCEDURE sil_kapilar_tekrar;
    PROCEDURE sil_checkinler_tekrar;
    PROCEDURE sil_bagajlar_tekrar;
    PROCEDURE sil_teknik_bakim_tekrar;
    PROCEDURE sil_bagaj_islemleri_tekrar;
    PROCEDURE sil_vip_hizmetler_tekrar;
    PROCEDURE sil_kayip_esyalar_tekrar;
END tekrar_kayit_temizle;
/

CREATE OR REPLACE PACKAGE BODY tekrar_kayit_temizle AS

    PROCEDURE sil_ucaklar_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT ucakModeli, kapasite, MIN(ucakID) AS keep_id
            FROM UCAKLAR
            GROUP BY ucakModeli, kapasite
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT ucakID FROM UCAKLAR
                WHERE ucakModeli = rec.ucakModeli AND kapasite = rec.kapasite AND ucakID != rec.keep_id
            ) LOOP
                UPDATE UCUSLAR SET ucakID = rec.keep_id WHERE ucakID = dup.ucakID;
                UPDATE TEKNIK_BAKIM_KAYITLARI SET ucakID = rec.keep_id WHERE ucakID = dup.ucakID;
                DELETE FROM UCAKLAR WHERE ucakID = dup.ucakID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_ucuslar_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT ucusID, hedefHavalimani, MIN(ucusID) AS keep_id
            FROM UCUSLAR
            GROUP BY ucusID, hedefHavalimani
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT ucusID FROM UCUSLAR
                WHERE ucusID = rec.ucusID AND hedefHavalimani = rec.hedefHavalimani AND ucusID != rec.keep_id
            ) LOOP
                UPDATE BILETLER SET ucusID = rec.keep_id WHERE ucusID = dup.ucusID;
                UPDATE KAPILAR SET ucusID = rec.keep_id WHERE ucusID = dup.ucusID;
                DELETE FROM UCUSLAR WHERE ucusID = dup.ucusID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_personel_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT ad, soyad, gorev, departman, MIN(personelID) AS keep_id
            FROM PERSONEL
            GROUP BY ad, soyad, gorev, departman
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT personelID FROM PERSONEL
                WHERE ad = rec.ad AND soyad = rec.soyad AND gorev = rec.gorev AND departman = rec.departman AND personelID != rec.keep_id
            ) LOOP
                UPDATE TEKNIK_BAKIM_KAYITLARI SET personelID = rec.keep_id WHERE personelID = dup.personelID;
                DELETE FROM PERSONEL WHERE personelID = dup.personelID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_yolcular_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT tcNO, MIN(yolcuID) AS keep_id
            FROM YOLCULAR
            GROUP BY tcNO
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT yolcuID FROM YOLCULAR
                WHERE tcNO = rec.tcNO AND yolcuID != rec.keep_id
            ) LOOP
                UPDATE BILETLER SET yolcuID = rec.keep_id WHERE yolcuID = dup.yolcuID;
                UPDATE VIP_HIZMETLER SET yolcuID = rec.keep_id WHERE yolcuID = dup.yolcuID;
                DELETE FROM YOLCULAR WHERE yolcuID = dup.yolcuID;
            END LOOP;
        END LOOP;
    END;
    
    PROCEDURE sil_biletler_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT yolcuID, ucusID, koltukNO, fiyat, sinif, MIN(biletID) AS keep_id
            FROM BILETLER
            GROUP BY yolcuID, ucusID, koltukNO, fiyat, sinif
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT biletID FROM BILETLER
                WHERE yolcuID = rec.yolcuID
                AND ucusID = rec.ucusID
                AND koltukNO = rec.koltukNO
                AND fiyat = rec.fiyat
                AND sinif = rec.sinif
                AND biletID != rec.keep_id
            ) LOOP
                UPDATE CHECKINLER
                SET biletID = rec.keep_id
                WHERE biletID = dup.biletID;
                DELETE FROM BILETLER WHERE biletID = dup.biletID;
            END LOOP;
        END LOOP;
    END sil_biletler_tekrar;

    
    PROCEDURE sil_kapilar_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT kapiNO, kat, durum, ucusID, MIN(kapiID) AS keep_id
            FROM KAPILAR
            GROUP BY kapiNO, kat, durum, ucusID
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT kapiID FROM KAPILAR
                WHERE kapiNO = rec.kapiNO AND kat = rec.kat AND durum = rec.durum AND ucusID = rec.ucusID AND kapiID != rec.keep_id
            ) LOOP
                UPDATE CHECKINLER SET kapiID = rec.keep_id WHERE kapiID = dup.kapiID;
                DELETE FROM KAPILAR WHERE kapiID = dup.kapiID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_checkinler_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT biletID, kapiID, checkinSaati, MIN(checkinID) AS keep_id
            FROM CHECKINLER
            GROUP BY biletID, kapiID, checkinSaati
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT checkinID FROM CHECKINLER
                WHERE biletID = rec.biletID AND kapiID = rec.kapiID AND checkinSaati = rec.checkinSaati AND checkinID != rec.keep_id
            ) LOOP
                UPDATE BAGAJLAR SET checkinID = rec.keep_id WHERE checkinID = dup.checkinID;
                DELETE FROM CHECKINLER WHERE checkinID = dup.checkinID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_bagajlar_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT checkinID, agirlik, etiketNO, MIN(bagajID) AS keep_id
            FROM BAGAJLAR
            GROUP BY checkinID, agirlik, etiketNO
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT bagajID FROM BAGAJLAR
                WHERE checkinID = rec.checkinID AND agirlik = rec.agirlik AND etiketNO = rec.etiketNO AND bagajID != rec.keep_id
            ) LOOP
                UPDATE BAGAJ_ISLEMLERI SET bagajID = rec.keep_id WHERE bagajID = dup.bagajID;
                DELETE FROM BAGAJLAR WHERE bagajID = dup.bagajID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_teknik_bakim_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT ucakID, personelID, islemTipi, aciklama, MIN(bakimID) AS keep_id
            FROM TEKNIK_BAKIM_KAYITLARI
            GROUP BY ucakID, personelID, islemTipi, aciklama
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT bakimID FROM TEKNIK_BAKIM_KAYITLARI
                WHERE ucakID = rec.ucakID AND personelID = rec.personelID AND islemTipi = rec.islemTipi AND aciklama = rec.aciklama AND bakimID != rec.keep_id
            ) LOOP
                DELETE FROM TEKNIK_BAKIM_KAYITLARI WHERE bakimID = dup.bakimID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_bagaj_islemleri_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT bagajID, durum, MIN(bagajIslemID) AS keep_id
            FROM BAGAJ_ISLEMLERI
            GROUP BY bagajID, durum
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT bagajIslemID FROM BAGAJ_ISLEMLERI
                WHERE bagajID = rec.bagajID AND durum = rec.durum AND bagajIslemID != rec.keep_id
            ) LOOP
                DELETE FROM BAGAJ_ISLEMLERI WHERE bagajIslemID = dup.bagajIslemID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_vip_hizmetler_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT yolcuID, hizmetTipi, MIN(hizmetID) AS keep_id
            FROM VIP_HIZMETLER
            GROUP BY yolcuID, hizmetTipi
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT hizmetID FROM VIP_HIZMETLER
                WHERE yolcuID = rec.yolcuID AND hizmetTipi = rec.hizmetTipi AND hizmetID != rec.keep_id
            ) LOOP
                DELETE FROM VIP_HIZMETLER WHERE hizmetID = dup.hizmetID;
            END LOOP;
        END LOOP;
    END;

    PROCEDURE sil_kayip_esyalar_tekrar IS
    BEGIN
        FOR rec IN (
            SELECT ucusID, bulunmaTarihi, tanim, teslimDurumu, MIN(esyaID) AS keep_id
            FROM KAYIP_ESYALAR
            GROUP BY ucusID, bulunmaTarihi, tanim, teslimDurumu
            HAVING COUNT(*) > 1
        ) LOOP
            FOR dup IN (
                SELECT esyaID FROM KAYIP_ESYALAR
                WHERE ucusID = rec.ucusID AND bulunmaTarihi = rec.bulunmaTarihi AND tanim = rec.tanim AND teslimDurumu = rec.teslimDurumu AND esyaID != rec.keep_id
            ) LOOP
                DELETE FROM KAYIP_ESYALAR WHERE esyaID = dup.esyaID;
            END LOOP;
        END LOOP;
    END;

END tekrar_kayit_temizle;
/
SELECT * FROM user_errors WHERE name = 'TEKRAR_KAYIT_TEMIZLE';