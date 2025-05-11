/*Bir index, veritaban�nda bir tabloya ait s�tun(lar) �zerinde olu�turulan arama kolayla�t�r�c� bir yap�d�r. 
Ana amac�: veriye daha h�zl� eri�mektir.*/

--ucusKodu �zerinde s�k arama veya filtreleme yap�l�yorsa bu index h�z kazand�r�r (tekil index)
CREATE INDEX idx_ucus_kodu ON UCUSLAR(ucusKodu);

--Yolcu ad ve soyad�na g�re sorgular yap�ld���nda bu index performans� art�r�r (bile�ik index)
CREATE INDEX idx_ad_soyad ON YOLCULAR(ad, soyad);

--Yolcu ve u�u� bilgilerine g�re bilet sorgusu yap�lacaksa idealdir (bile�ik index)
CREATE INDEX idx_bilet_yolcu_ucus ON BILETLER(yolcuID, ucusID);

-- U�u� saatleri s�ral� sorgular i�in (tekil index)
CREATE INDEX idx_kalkis_saati ON UCUSLAR(kalkisSaati);

