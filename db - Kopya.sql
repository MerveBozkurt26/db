-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                8.0.30 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- futbol için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `futbol` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `futbol`;

-- tablo yapısı dökülüyor futbol.lig
CREATE TABLE IF NOT EXISTS `lig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lig_ad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor futbol.mevki
CREATE TABLE IF NOT EXISTS `mevki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mevki_ad` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor futbol.oyuncu
CREATE TABLE IF NOT EXISTS `oyuncu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(30) NOT NULL,
  `soyad` varchar(30) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `takim_id` int NOT NULL,
  `mevki_id` int NOT NULL,
  `boy` double NOT NULL,
  `kilo` tinyint NOT NULL,
  `forma_no` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oyuncu_takim` (`takim_id`),
  KEY `FK_oyuncu_mevki` (`mevki_id`),
  CONSTRAINT `FK_oyuncu_mevki` FOREIGN KEY (`mevki_id`) REFERENCES `mevki` (`id`),
  CONSTRAINT `FK_oyuncu_takim` FOREIGN KEY (`takim_id`) REFERENCES `takim` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

-- tablo yapısı dökülüyor futbol.takim
CREATE TABLE IF NOT EXISTS `takim` (
  `id` int NOT NULL AUTO_INCREMENT,
  `takim_ad` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `lig_id` int NOT NULL,
  `kurulus_yil` date NOT NULL,
  `renkler` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sampiyonluk_sayisi` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_takim_lig` (`lig_id`),
  CONSTRAINT `FK_takim_lig` FOREIGN KEY (`lig_id`) REFERENCES `lig` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Veri çıktısı seçilmemişti

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
