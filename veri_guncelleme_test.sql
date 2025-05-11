BEGIN
    VeriGuncelle.UcakGuncelle(2, 'Airbus A320 Neo', 150);

    VeriGuncelle.UcusGuncelle(3, 3, 20250511, 'Berlin Havalimaný',
        TO_DATE('2025-06-01 08:30', 'YYYY-MM-DD HH24:MI'),
        TO_DATE('2025-06-01 11:00', 'YYYY-MM-DD HH24:MI'));

    VeriGuncelle.PersonelGuncelle(3, 'Yusuf', 'Kaya', 'Teknisyen', 'Bakým');

    VeriGuncelle.YolcuGuncelle(1, '23456789012', 'Baharr', 'Kayhann',
        TO_DATE('2003-03-12', 'YYYY-MM-DD'), 'T.C.');

    VeriGuncelle.BiletGuncelle(1, 1, 1, 12, 1500, 1);

    VeriGuncelle.KapiGuncelle(1, 'A3', '2', 'Açýk', 1);

    VeriGuncelle.CheckinGuncelle(1, 1, 1, SYSDATE);

    VeriGuncelle.BagajGuncelle(1, 1, 23, 'BG123456');

    VeriGuncelle.TeknikBakimKayitGuncelle(1, 1, 1, 'Motor Bakýmý');

    VeriGuncelle.BagajIslemGuncelle(1, 1, 'Teslim Edildi');

    VeriGuncelle.VipHizmetGuncelle(1, 1, 'Lounge Eriþimi');

    VeriGuncelle.KayipEsyaGuncelle(1, 2, 
        TO_DATE('2025-05-10', 'YYYY-MM-DD'),
        'Siyah Cüzdan', 'Teslim Edilmedi');
END;
/


SELECT * FROM UCUSLAR;
SELECT * FROM UCAKLAR;
SELECT * FROM PERSONEL;
SELECT * FROM YOLCULAR;
SELECT * FROM BILETLER;
SELECT * FROM KAPILAR;
SELECT * FROM CHECKINLER;
SELECT * FROM BAGAJLAR;
SELECT * FROM TEKNIK_BAKIM_KAYITLARI;
SELECT * FROM BAGAJ_ISLEMLERI;
SELECT * FROM VIP_HIZMETLER;
SELECT * FROM KAYIP_ESYALAR;