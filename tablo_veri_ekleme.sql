BEGIN
    VeriGirisi.UcakEkle('Boeing 737', 180);
    VeriGirisi.UcakEkle('Airbus A320', 150);
    VeriGirisi.UcakEkle('Embraer E190', 100);
END;
/
BEGIN
  VeriGirisi.UcusEkle(1, 1001, 'IST', TO_DATE('2025-06-01 08:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-01 10:45', 'YYYY-MM-DD HH24:MI'));
  VeriGirisi.UcusEkle(2, 1002, 'ESB', TO_DATE('2025-06-01 12:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-01 13:10', 'YYYY-MM-DD HH24:MI'));
  VeriGirisi.UcusEkle(3, 1003, 'ADB', TO_DATE('2025-06-02 07:15', 'YYYY-MM-DD HH24:MI'), TO_DATE('2025-06-02 08:45', 'YYYY-MM-DD HH24:MI'));
END;
/
BEGIN
  VeriGirisi.PersonelEkle('Ali', 'Demir', 'Pilot', 'U�u� Ekibi');
  VeriGirisi.PersonelEkle('Ay�e', 'Y�lmaz', 'Hostes', 'Kabin Ekibi');
  VeriGirisi.PersonelEkle('Mehmet', 'Kaya', 'Teknisyen', 'Bak�m');
END;
/
BEGIN
  VeriGirisi.YolcuEkle('12345678901', 'Zeynep', '�elik', TO_DATE('1990-04-15', 'YYYY-MM-DD'), 'T.C.');
  VeriGirisi.YolcuEkle('23456789012', 'Bahar', 'Kayhan', TO_DATE('2003-03-12', 'YYYY-MM-DD'), 'ABD');
  VeriGirisi.YolcuEkle('34567890123', 'Merve', 'Ayd�n', TO_DATE('2000-12-30', 'YYYY-MM-DD'), 'T.C.');
END;
/
BEGIN
  VeriGirisi.BiletEkle(1, 1, 12, 750, 1);
  VeriGirisi.BiletEkle(2, 2, 5, 1200, 2);
  VeriGirisi.BiletEkle(3, 3, 22, 500, 1);
END;
/
BEGIN
  VeriGirisi.KapiEkle('A1', '1', 'A��k', 1);
  VeriGirisi.KapiEkle('B3', '2', 'A��k', 2);
  VeriGirisi.KapiEkle('C2', '1', 'Kapal�', 3);
END;
/
BEGIN
  VeriGirisi.CheckinEkle(1, 1, TO_DATE('2025-06-01 06:30', 'YYYY-MM-DD HH24:MI'));
  VeriGirisi.CheckinEkle(2, 2, TO_DATE('2025-06-01 10:30', 'YYYY-MM-DD HH24:MI'));
  VeriGirisi.CheckinEkle(3, 3, TO_DATE('2025-06-02 05:45', 'YYYY-MM-DD HH24:MI'));
END;
/
BEGIN
  VeriGirisi.BagajEkle(1, 23, 'BG12345');
  VeriGirisi.BagajEkle(2, 18, 'BG23456');
  VeriGirisi.BagajEkle(3, 27, 'BG34567');
END;
/
BEGIN
  VeriGirisi.TeknikBakimKayitEkle(1, 3, 'Motor Kontrol');
  VeriGirisi.TeknikBakimKayitEkle(2, 3, 'Yak�t Sistemi Bak�m�');
  VeriGirisi.TeknikBakimKayitEkle(3, 3, 'G�vde Kontrol�');
END;
/
BEGIN
  VeriGirisi.BagajIslemEkle(1, 'Y�klendi');
  VeriGirisi.BagajIslemEkle(2, 'Yolda');
  VeriGirisi.BagajIslemEkle(3, 'Teslim Edildi');
END;
/
BEGIN
  VeriGirisi.VipHizmetEkle(1, 'Lounge Eri�imi');
  VeriGirisi.VipHizmetEkle(2, '�ncelikli Check-in');
  VeriGirisi.VipHizmetEkle(3, '�zel Transfer');
END;
/
BEGIN
  VeriGirisi.KayipEsyaEkle(TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'Siyah s�rt �antas�', 'Teslim Edilmedi');
  VeriGirisi.KayipEsyaEkle(TO_DATE('2025-05-09', 'YYYY-MM-DD'), 'K�rm�z� bavul', 'Teslim Edildi');
  VeriGirisi.KayipEsyaEkle(TO_DATE('2025-05-08', 'YYYY-MM-DD'), 'Laptop �antas�', 'Teslim Edildi');
END;
/

