/*Bir index, veritabanýnda bir tabloya ait sütun(lar) üzerinde oluþturulan arama kolaylaþtýrýcý bir yapýdýr. 
Ana amacý: veriye daha hýzlý eriþmektir.*/

--ucusKodu üzerinde sýk arama veya filtreleme yapýlýyorsa bu index hýz kazandýrýr (tekil index)
CREATE INDEX idx_ucus_kodu ON UCUSLAR(ucusKodu);

--Yolcu ad ve soyadýna göre sorgular yapýldýðýnda bu index performansý artýrýr (bileþik index)
CREATE INDEX idx_ad_soyad ON YOLCULAR(ad, soyad);

--Yolcu ve uçuþ bilgilerine göre bilet sorgusu yapýlacaksa idealdir (bileþik index)
CREATE INDEX idx_bilet_yolcu_ucus ON BILETLER(yolcuID, ucusID);

-- Uçuþ saatleri sýralý sorgular için (tekil index)
CREATE INDEX idx_kalkis_saati ON UCUSLAR(kalkisSaati);

