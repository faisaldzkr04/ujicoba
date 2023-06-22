use tokobuku;

#TRIGGER PENDAFTARAN PELANGGAN
delimiter -
create trigger insert_user before insert on pelanggan for each row
begin
	set new.gmail_pelanggan = lower(new.gmail_pelanggan);
    set new.password_pelanggan = replace(new.password_pelanggan,' ','');
    set new.nama_pelanggan = trim(new.nama_pelanggan);
    set new.telepon_pelanggan = concat('08',new.telepon_pelanggan);
end -
delimiter ;

#STORED PROCEDURE DAFTAR BUKU
delimiter -
create procedure daftar_buku()
begin
	declare a int default 1;
    
    buku_loop: loop
		set a = a + 1;
        select * from produk;
        leave buku_loop;
	end loop;
end -
delimiter ;
call daftar_buku();

#VIEW DATA PELANGGAN
create view data_pelanggan
	as select id_pelanggan, nama_pelanggan, gmail_pelanggan, telepon_pelanggan
    from pelanggan;
select * from data_pelanggan;