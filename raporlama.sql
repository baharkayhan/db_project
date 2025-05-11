-- 1. ucusID ye g�re biletlerin listesi
CREATE OR REPLACE PROCEDURE UcusGoreBiletListesi(
    v_ucusID IN UCUSLAR.ucusID%TYPE
)
IS
BEGIN
    FOR r IN (
        SELECT b.biletID, y.ad, y.soyad, u.ucusID, b.koltukNO
        FROM BILETLER b
        JOIN YOLCULAR y ON b.yolcuID = y.yolcuID
        JOIN UCUSLAR u ON b.ucusID = u.ucusID
        WHERE u.ucusID = v_ucusID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('BiletID: ' || r.biletID || ', Ad: ' || r.ad || ', Soyad: ' || r.soyad || ', U�u�ID: ' || r.ucusID || ', Koltuk No: ' || r.koltukNO);
    END LOOP;
END;
/

-- 2.Teslim durumuna g�re kay�p e�yalar 
CREATE OR REPLACE PROCEDURE KayipEsyaRaporu(v_durum IN VARCHAR2) IS
BEGIN
    FOR r IN (
        SELECT esyaID, ucusID, bulunmaTarihi, tanim, teslimDurumu
        FROM KAYIP_ESYALAR
        WHERE teslimDurumu = v_durum
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('E�yaID: ' || r.esyaID || ', UcusID: ' || r.ucusID || ', Tarih: ' || r.bulunmaTarihi || ', Tan�m: ' || r.tanim || ', Durum: ' || r.teslimDurumu);
    END LOOP;
END;
/

-- 3.Personel G�revi veya Departmana G�re Liste
CREATE OR REPLACE PROCEDURE PersonelListele(
    v_gorev IN VARCHAR2,
    v_departman IN VARCHAR2
)
IS
BEGIN
    FOR r IN (
        SELECT personelID, ad, soyad, gorev, departman
        FROM PERSONEL
        WHERE (v_gorev IS NULL OR gorev = v_gorev)
          AND (v_departman IS NULL OR departman = v_departman)
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.personelID || ', Ad: ' || r.ad || ', Soyad: ' || r.soyad || ', G�rev: ' || r.gorev || ', Departman: ' || r.departman);
    END LOOP;
END;
/

--4. Belirli Tarihler Aras�ndaki U�u�lar
CREATE OR REPLACE PROCEDURE UcusTarihArasi(
    v_baslangic DATE,
    v_bitis DATE
)
IS
BEGIN
    FOR r IN (
        SELECT ucusID, ucusKodu, hedefHavalimani, kalkisSaati, varisSaati
        FROM UCUSLAR
        WHERE kalkisSaati BETWEEN v_baslangic AND v_bitis
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('U�u�ID: ' || r.ucusID || ', Kod: ' || r.ucusKodu || ', Hedef: ' || r.hedefHavalimani || ', Kalk��: ' || r.kalkisSaati || ', Var��: ' || r.varisSaati);
    END LOOP;
END;
/



