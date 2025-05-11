/*
 * 1. UCAKLAR (Taným) ? TEKNIK_BAKIM_KAYITLARI (Hareket)
 * Yeni bir uçak eklendiðinde, otomatik olarak teknik bakým kaydý oluþturulsun
*/
CREATE OR REPLACE TRIGGER trg_ucak_insert
AFTER INSERT ON UCAKLAR
FOR EACH ROW
BEGIN
    INSERT INTO TEKNIK_BAKIM_KAYITLARI (
        ucakID, personelID, islemTipi, aciklama
    ) VALUES (
        :NEW.ucakID, NULL, 'Ýlk Kayýt', 'Uçak sisteme eklendi'
    );
END;
/

/*
 * 2. UCUSLAR (Taným) ? KAPILAR (Hareket)
 * Yeni bir uçuþ eklendiðinde otomatik olarak bir kapý atamasý yapýlsýn
*/
CREATE OR REPLACE TRIGGER trg_ucus_kapi
AFTER INSERT ON UCUSLAR
FOR EACH ROW
BEGIN
    INSERT INTO KAPILAR (
        kapiNO, kat, durum, ucusID
    ) VALUES (
        'A1', '1', 'Beklemede', :NEW.ucusID
    );
END;
/

/*
 * 3. YOLCULAR (Taným) ? BILETLER (Hareket)
 * Yeni bir yolcu eklendiðinde sistemde örnek bir bilet tanýmý girilsin
*/
CREATE OR REPLACE TRIGGER trg_yolcu_bilet
AFTER INSERT ON YOLCULAR
FOR EACH ROW
BEGIN
    INSERT INTO BILETLER (
        yolcuID, ucusID, koltukNO, fiyat, sinif
    ) VALUES (
        :NEW.yolcuID, 1, 1, 1000, 1
    );
END;
/


/*
 * 4. CHECKINLER (Taným) ? BAGAJLAR (Hareket)
 * Yeni bir check-in yapýldýðýnda bagaj bilgisi otomatik girilsin
*/

CREATE OR REPLACE TRIGGER trg_checkin_bagaj
AFTER INSERT ON CHECKINLER
FOR EACH ROW
BEGIN
    INSERT INTO BAGAJLAR (
        checkinID, agirlik, etiketNO
    ) VALUES (
        :NEW.checkinID, 15, 'ETK' || :NEW.checkinID
    );
END;
/

/*
 * 5. YOLCULAR (Taným) ? VIP_HIZMETLER (Hareket)
 * Yeni bir yolcu kaydý yapýldýðýnda varsayýlan VIP hizmet tanýmlansýn
*/
CREATE OR REPLACE TRIGGER trg_yolcu_vip
AFTER INSERT ON YOLCULAR
FOR EACH ROW
BEGIN
    INSERT INTO VIP_HIZMETLER (yolcuID, hizmetTipi)
    VALUES (:NEW.yolcuID, 'Bekleme Salonu Eriþimi');
END;
/


SELECT * FROM user_errors WHERE name = 'TRG_UCAK_INSERT' AND type = 'TRIGGER';
