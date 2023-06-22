USE tokobuku;

#VIEW DATA BUKU DI ADMIN
CREATE VIEW data_produk
	AS SELECT id_produk, nama_produk, harga_produk, berat_produk, foto_produk
    FROM produk;
SELECT * FROM data_produk;

#VIEW DATA PEMBELIAN DI ADMIN
CREATE VIEW data_pembelian
	AS SELECT * FROM pembelian JOIN pelanggan ON pelanggan_id=id_pelanggan;
SELECT * FROM data_pembelian;

#STORED PROCEDURE HAPUS DATA PELANGGAN DI ADMIN
DELIMITER //
CREATE PROCEDURE hapus_pelanggan(IN idPelanggan INT(11))
BEGIN
    DELETE FROM pelanggan WHERE id_pelanggan = idPelanggan;
END //
DELIMITER ;
CALL hapus_pelanggan('1');