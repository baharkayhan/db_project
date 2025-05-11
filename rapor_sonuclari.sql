SET SERVEROUTPUT ON;

BEGIN
    UcusGoreBiletListesi(1); 
END;
/

BEGIN
    KayipEsyaRaporu('Teslim Edilmedi');
END;
/

BEGIN
    PersonelListele(NULL, 'Bakým');
END;
/

BEGIN
    UcusTarihArasi(TO_DATE('01-06-2025','DD-MM-YYYY'), TO_DATE('03-06-2025','DD-MM-YYYY'));
END;
/

