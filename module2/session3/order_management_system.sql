CREATE TABLE `tb_produk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(256) NOT NULL,
  `harga` double NOT NULL,
  `jumlah_stok` int(10) NOT NULL,
  `tanggal_submit` datetime NOT NULL DEFAULT current_timestamp(),
  `tanggal_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tb_pelanggan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_pelanggan` varchar(256) NOT NULL,
  `kontak_pelanggan` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
CREATE UNIQUE INDEX kontak_pelanggan ON tb_pelanggan(`kontak_pelanggan`);

CREATE TABLE `tb_transaksi` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(10) NOT NULL,
  `tanggal_beli` datetime NOT NULL DEFAULT current_timestamp(),
  `total_bayar` double NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_pelanggan`) REFERENCES tb_pelanggan(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tb_detail_transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_produk` int(10) NOT NULL,
  `diskon` double NOT NULL,
  `harga_setiap_produk` double NOT NULL,
  `kuantitas` int(10) NOT NULL,
  FOREIGN KEY (`id_transaksi`) REFERENCES tb_transaksi(`id`),
  FOREIGN KEY (`id_produk`) REFERENCES tb_produk(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO tb_produk(id,nama_produk,harga,jumlah_stok) VALUES
(1,"Nasi Goreng Gila",20000,150),
(2,"Ice Water",7000,600),
(3,"Spaghetti",40000,60),
(4,"Green Tea Latte",18000,300),
(5,"Kebab Turki",30000,70),
(6,"Orange Juice",15000,250),
(7,"Cordon Bleu",32000,50),
(8,"Risotto",45000,50);

INSERT INTO tb_pelanggan (id,nama_pelanggan,kontak_pelanggan) VALUES
(1,'Budiawan','+6212345678'),
(2,'Mary Jones','+6287654321');

INSERT INTO tb_transaksi (id,id_pelanggan,total_bayar) VALUES
(1,1,27000),
(2,2,58000),
(3,1,55000),
(4,1,27000),
(5,2,54000);

INSERT INTO tb_detail_transaksi (id_transaksi,id_produk,diskon,harga_setiap_produk,kuantitas) VALUES
(1,1,0,20000,1), (1,2,0,7000,1), 
(2,3,0,40000,1), (2,4,0,18000,1),
(3,3,0,40000,1), (3,6,0,15000,1),
(4,1,0,20000,1), (4,2,0,7000,1),
(5,7,0,32000,1), (5,4,0,18000,1);

SELECT tb_transaksi.id, tb_transaksi.tanggal_beli, tb_pelanggan.nama_pelanggan, tb_pelanggan.kontak_pelanggan, tb_transaksi.total_bayar, GROUP_CONCAT(tb_produk.nama_produk)
FROM tb_transaksi
LEFT JOIN tb_detail_transaksi ON tb_transaksi.id = tb_detail_transaksi.id_transaksi
LEFT JOIN tb_pelanggan ON tb_transaksi.id_pelanggan = tb_pelanggan.id
LEFT JOIN tb_produk ON tb_produk.id = tb_detail_transaksi.id_produk
GROUP BY tb_transaksi.id;