CREATE TABLE `kandidat_pejabat` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` int NOT NULL,
  `partai` varchar(255) NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `grade_current` decimal(3,1)
);

CREATE TABLE `perserta` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nama_depan` varchar(255) NOT NULL,
  `nama_belakang` varchar(255) NOT NULL,
  `jenis_kelamin` int NOT NULL,
  `umur` int NOT NULL COMMENT 'check if(umur >= 17)'
);

CREATE TABLE `jenis_kelamin` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(255) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT (now())
);

CREATE TABLE `hasil_vote` (
  `id_kandidat_pejabat` int,
  `id_peserta` int,
  PRIMARY KEY (`id_kandidat_pejabat`, `id_peserta`)
);

ALTER TABLE `jenis_kelamin` ADD FOREIGN KEY (`id`) REFERENCES `kandidat_pejabat` (`jenis_kelamin`);

ALTER TABLE `jenis_kelamin` ADD FOREIGN KEY (`id`) REFERENCES `perserta` (`jenis_kelamin`);

ALTER TABLE `hasil_vote` ADD FOREIGN KEY (`id_kandidat_pejabat`) REFERENCES `kandidat_pejabat` (`id`);

ALTER TABLE `hasil_vote` ADD FOREIGN KEY (`id_peserta`) REFERENCES `perserta` (`id`);
