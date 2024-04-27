-- SOAL NO 3 dalam Join Tabel

SELECT
         pesanan.id AS pesanan_id,
       pesanan.tanggal AS tanggal_pesanan,
        pesanan.total AS total_pesanan,
        pelanggan.nama AS nama_pelanggan,
         produk.kode AS kode_produk,
         produk.nama AS nama_produk,
         jenis_produk.nama AS jenis_produk,
       pesanan_items.qty AS jumlah_item,
         pesanan_items.harga AS harga_per_item
   FROM
         pesanan
    INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
    INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
    INNER JOIN produk ON pesanan_items.produk_id = produk.id
    INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;


-- SOAL NO 4 VIEW tabel :Menampilkan data dengan perbedaan antara tabel yang sama
CREATE VIEW pesanan_view AS
SELECT
    pesanan.id AS pesanan_id,
    pesanan.tanggal AS tanggal_pesanan,
    pesanan.total AS total_pesanan,
    pelanggan.nama AS nama_pelanggan,
    produk.kode AS kode_produk,
    produk.nama AS nama_produk,
    jenis_produk.nama AS jenis_produk,
    pesanan_items.qty AS jumlah_item,
    pesanan_items.harga AS harga_per_item
FROM
    pesanan
INNER JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
INNER JOIN pesanan_items ON pesanan.id = pesanan_items.pesanan_id
INNER JOIN produk ON pesanan_items.produk_id = produk.id
INNER JOIN jenis_produk ON produk.jenis_produk_id = jenis_produk.id;

-- INSERT DATA 3 RECORD
    START TRANSACTION;
     INSERT INTO produk VALUES (29,'L114','Kopi ABC',4000,6000,12,2,'','',4),
   (30,'THP003','Teh Green Tea',5000,7000,15,2,'','',4),
   31,'L115','Kopi white ',6000,7000,20,2,'','Kopi luwak',4);
    SELECT * FROM produk;

-- UPDATE DATA STOK MENJADI 30 PCS
    START TRANSACTION;
    UPDATE produk set stok =30 WHERE id=31;
     SELECT * FROM produk;

-- BUAT SAVEPOINT UPDATE PRODUK
    START TRANSACTION;

-- Hapus salah satu data pembayaran
> DELETE FROM pembayaran
    -> WHERE id=5;
     SELECT * FROM produk;

      ROLLBACK TO Hapus_Pembayaran;

 START TRANSACTION ;
 UPDATE kartu set iuran = 3000 WHERE id=7;
 select * from kartu;
  COMMIT;


