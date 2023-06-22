use tokobuku;

# procedure untuk menambah data buku di admin
DELIMITER //
CREATE PROCEDURE tambahDataBuku(IN nama varchar(100), harga int, berat int, foto varchar(100),
deskripsi text, stok int(5))
	BEGIN
		insert into produk (nama_produk, harga_produk, berat_produk, foto_produk, deskripsi_produk, 
        stok_produk) values 
        (nama, harga, berat, foto, deskripsi, stok);
	END//
DELIMITER ;

# mengubah data buku dengan cover
DELIMITER //
CREATE PROCEDURE ubahDataBukuCover(in namap varchar(100), hargap int, beratp int, fotop varchar(100),
deskripsip text, stok int, id int)
	BEGIN
		update produk set nama_produk = namap, harga_produk = hargap, berat_produk = beratp,
        foto_produk = fotop, deskripsi_produk = deskripsip, stok_produk = stok 
        where id_produk = id;
	END//
DELIMITER ;

#mengubah data buku tanpa cover
DELIMITER //
CREATE PROCEDURE ubahDataBuku(in namap varchar(100), in hargap int, in beratp int, in deskripsip text,
 in stok int, in id int)
	BEGIN
		update produk set nama_produk = namap, harga_produk = hargap, berat_produk = beratp,
		deskripsi_produk = deskripsip, stok_produk = stok 
        where id_produk = id;
    END//
DELIMITER ;

#procedure menghapus data buku
DELIMITER //
CREATE PROCEDURE hapusDataBuku(in id int)
	begin
		delete from produk where id_produk = id;
    end//
DELIMITER ;

#procedure mengupdate data pelanggan
DELIMITER //
CREATE PROCEDURE updateDataPelanggan(in id int, email varchar(100), pass varchar(50),
nama varchar(100), telp varchar(25))
	BEGIN 
		update pelanggan set gmail_pelanggan = email, password_pelanggan = pass,
        nama_pelanggan = nama, telepon_pelanggan = telp where
        id_pelanggan = id;
    END//
DELIMITER ;

#trigger hapus pembelian
DELIMITER //
CREATE TRIGGER hapus_pembelian
BEFORE DELETE ON pelanggan
FOR EACH ROW
BEGIN
	delete from pembelian where pelanggan_id = old.id_pelanggan;
END //
DELIMITER ;