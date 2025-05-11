/*
 * 1. UCAKLAR (Tan�m) ? TEKNIK_BAKIM_KAYITLARI (Hareket)
 * Yeni bir u�ak eklendi�inde, otomatik olarak teknik bak�m kayd� olu�turulsun
*/
CREATE OR REPLACE TRIGGER trg_ucak_insert
AFTER INSERT ON UCAKLAR
FOR EACH ROW
BEGIN
    INSERT INTO TEKNIK_BAKIM_KAYITLARI (
        ucakID, personelID, islemTipi, aciklama
    ) VALUES (
        :NEW.ucakID, NULL, '�lk Kay�t', 'U�ak sisteme eklendi'
    );
END;
/

/*
 * 2. UCUSLAR (Tan�m) ? KAPILAR (Hareket)
 * Yeni bir u�u� eklendi�inde otomatik olarak bir kap� atamas� yap�ls�n
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
 * 3. YOLCULAR (Tan�m) ? BILETLER (Hareket)
 * Yeni bir yolcu eklendi�inde sistemde �rnek bir bilet tan�m� girilsin
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
 * 4. CHECKINLER (Tan�m) ? BAGAJLAR (Hareket)
 * Yeni bir check-in yap�ld���nda bagaj bilgisi otomatik girilsin
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
 * 5. YOLCULAR (Tan�m) ? VIP_HIZMETLER (Hareket)
 * Yeni bir yolcu kayd� yap�ld���nda varsay�lan VIP hizmet tan�mlans�n
*/
CREATE OR REPLACE TRIGGER trg_yolcu_vip
AFTER INSERT ON YOLCULAR
FOR EACH ROW
BEGIN
    INSERT INTO VIP_HIZMETLER (yolcuID, hizmetTipi)
    VALUES (:NEW.yolcuID, 'Bekleme Salonu Eri�imi');
END;
/


SELECT * FROM user_errors WHERE name = 'TRG_UCAK_INSERT' AND type = 'TRIGGER';
