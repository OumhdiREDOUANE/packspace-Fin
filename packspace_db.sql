-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2025 at 01:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `packspace_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_blog` varchar(255) NOT NULL,
  `excerpt` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_avatar` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `status` enum('draft','published') NOT NULL DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image_blog`, `excerpt`, `content`, `author`, `author_avatar`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 'pp', 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758117159/niksvsltsuuxbmspafly.jpg', 'kjj', 'juhjj', 'hh', NULL, 'Guide', 'published', '2025-09-17 20:52:40', '2025-09-17 20:52:40'),
(2, 'lll', 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758117445/pcf4pwgopg7l2w9mh65k.jpg', 'hh', 'uyuu', 'hhh', NULL, 'Tutorial', 'draft', '2025-09-17 20:57:26', '2025-09-17 20:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` bigint(20) UNSIGNED NOT NULL,
  `description_categorie` varchar(255) NOT NULL,
  `name_categorie` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `public_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_categorie`, `description_categorie`, `name_categorie`, `url`, `public_id`, `created_at`, `updated_at`) VALUES
(1, 'Produits de carterie et cartes', 'Carterie', 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(2, 'Supports de communication', 'Communication', 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/depliants.jpg', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(3, 'Produits pour hôtellerie et restauration', 'Hôtellerie / Restauration', 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-99cd-08d91acb0a70/DEP_2PR_Cat_800x800_large.png', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(4, 'Emballages et packaging', 'Packaging', 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-99cd-08d91acb0a70/DEP_2PR_Cat_800x800_large.png', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(5, 'Signalétique et supports publicitaires', 'Signalétique', 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(6, 'Articles de papeterie', 'Papeterie', 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/80110000-568f-0050-2e3b-08d8e35ba304/FLY_Cat_800x800_large.png', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(7, 'Calendriers pour l\'année 2025', 'Calendriers 2025', 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-99cd-08d91acb0a70/DEP_2PR_Cat_800x800_large.png', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(8, 'Goodies et objets promotionnels', 'Goodies', 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', NULL, '2025-09-15 03:36:09', '2025-09-15 03:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `is_published` tinyint(1) NOT NULL DEFAULT 1,
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id_group` bigint(20) UNSIGNED NOT NULL,
  `name_group` varchar(255) NOT NULL,
  `description_group` text DEFAULT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id_group`, `name_group`, `description_group`, `categorie_id`, `created_at`, `updated_at`) VALUES
(1, 'Cartes de visite', 'Différents types de cartes de visite', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(2, 'Cartes de correspondance', 'Cartes de correspondance', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(3, 'Cartes de vœux', 'Cartes de vœux', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(4, 'Cartons d\'invitation', 'Cartons d\'invitation', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(5, 'Cartes postales', 'Cartes postales', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(6, 'Marque-pages', 'Marque-pages', 1, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(7, 'Flyers', 'Flyers publicitaires', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(8, 'Dépliants', 'Différents types de dépliants', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(9, 'Affiches', 'Affiches petit et grand format', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(10, 'Etiquettes', 'Etiquettes et stickers', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(11, 'Chevalets', 'Chevalets publicitaires', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(12, 'Brochures', 'Brochures piquées et dos carré collé', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(13, 'Tickets', 'Tickets', 2, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(14, 'Menus', 'Menus pour restaurants', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(15, 'Chevalets', 'Chevalets pour hôtellerie', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(16, 'Sets de table', 'Sets de table', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(17, 'Porte-additions', 'Porte-additions', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(18, 'Ronds de serviette', 'Ronds de serviette', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(19, 'Porte-cartes Magnétiques', 'Porte-cartes magnétiques', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(20, 'Cravates accroche portes', 'Cravates pour accroche-portes', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(21, 'Sous-verres', 'Sous-verres', 3, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(22, 'Etuis pliants', 'Etuis, boites et berlingots', 4, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(23, 'Sacs papiers de luxe', 'Sacs papiers de luxe', 4, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(24, 'Sacs Kraft', 'Sacs Kraft', 4, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(25, 'Bâches', 'Bâches publicitaires', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(26, 'X-Banners', 'X-Banners', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(27, 'Stop-Trottoirs', 'Stop-Trottoirs', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(28, 'Totems Rigides', 'Totems rigides', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(29, 'Photocalls', 'Photocalls', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(30, 'Beach Flags / Flying Banners', 'Beach flags et flying banners', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(31, 'Affiches grand format', 'Affiches grand format', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(32, 'Porte Affiches', 'Porte affiches', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(33, 'Roll-ups', 'Roll-ups', 5, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(34, 'Papiers à en-tête', 'Papiers à en-tête', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(35, 'Ordonnances', 'Ordonnances', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(36, 'Chemises à rabat', 'Chemises à rabat simple et double', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(37, 'Enveloppes', 'Enveloppes standard et luxe', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(38, 'Calendriers 2025', 'Calendriers pour 2025', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(39, 'Blocs-Notes', 'Blocs-notes', 6, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(40, 'Textile', 'Vêtements et accessoires textiles', 8, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(41, 'Tapis de Souris', 'Tapis de souris', 8, '2025-09-15 03:36:09', '2025-09-15 03:36:09'),
(42, 'Mugs', 'Mugs', 8, '2025-09-15 03:36:09', '2025-09-15 03:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `image_products`
--

CREATE TABLE `image_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(2048) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `image_products`
--

INSERT INTO `image_products` (`id`, `url`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f8040001-568f-0050-e0d1-08d8d6b037f0/CVc_1(1)_large.png', 1, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(2, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 1, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(3, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 2, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(4, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 2, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(6, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 4, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(7, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 5, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(8, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/a0060000-568f-0050-6eb2-08d8deaace17/CDC_Cat_800x800_large.png', 6, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(9, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CDV_Cat_800x800.jpg', 7, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(10, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/380e0000-568f-0050-4686-08d8e10c74ba/INV_Cat_800x800_large.png', 8, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(11, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/9c250000-568f-0050-0bf2-08d8d92a0ff4/CP_1_large.png', 9, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(12, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/a4170000-568f-0050-db9a-08d8d3f2fe34/MP_1_large.png', 10, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(13, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/MP_Cat_800x800.jpg', 10, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(14, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/80110000-568f-0050-2e3b-08d8e35ba304/FLY_Cat_800x800_large.png', 11, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(15, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-9612-08d91acae297/DEP_1PS_Cat_800x800_large.png', 12, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(16, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-99cd-08d91acb0a70/DEP_2PR_Cat_800x800_large.png', 13, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(17, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/depliants.jpg', 14, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(18, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/50000000-568f-0050-87d7-08d91acb2189/DEP_3PR_Cat_800x800_large.png', 15, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(19, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/7238c515-522b-4596-b5bc-f19a019552d8/AffPF_Cat_800x800_large.png', 16, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(20, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/AffGFp_Cat_800x800.jpg', 17, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(21, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f00f0000-568f-0050-44ad-08d9504d0c33/STK_Cat_800x800_large.png', 18, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(22, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/ETT_Cat_800x800.jpg', 18, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(23, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f00f0000-568f-0050-44ad-08d9504d0c33/STK_Cat_800x800_large.png', 19, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(24, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/98160000-568f-0050-83e8-08d90b842ecc/CHE_Cat_800x800_large.png', 20, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(25, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/6c0b0000-568f-0050-0944-08d92d0bd47d/BRP_Cat_800x800_large.png', 21, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(26, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/6c0b0000-568f-0050-0944-08d92d0bd47d/BRP_Cat_800x800_large.png', 22, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(27, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/5c1d0000-568f-0050-56d0-08d968ab322e/TCK_Cat_800x800_large.png', 23, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(28, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/9c090000-568f-0050-c7ee-08d93127052a/MenuPAP_Cat_800x800_large.png', 24, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(29, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/88140000-568f-0050-7122-08d9344f6a16/MenuP_Cat_800x800_large.png', 25, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(30, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/MenuD1P_Cat_800x800.jpg', 26, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(31, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/MenuD_Cat_800x800.jpg', 27, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(32, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/98160000-568f-0050-83e8-08d90b842ecc/CHE_Cat_800x800_large.png', 28, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(33, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/b8110000-568f-0050-8980-08d911c20bce/SDT_Cat_800x800_large.png', 29, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(34, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/581f0000-568f-0050-fb01-08d923ca8082/PAD_Cat_800x800_large.png', 30, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(35, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/9c030000-568f-0050-502e-08d8f9df580e/RDS_Cat_800x800_large.png', 31, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(36, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/Product_6c0a0000-568f-0050-dee6-08d92ec9d31e_xlarge.png', 32, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(37, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/c8010000-568f-0050-c0ad-08d8f96e2516/CAP_1(1)_large.png', 33, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(38, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/741a0000-568f-0050-e8be-08d93017df5e/SSV_Cat_800x800_large.png', 34, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(39, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/1e10eaf9-7130-4bb7-8ab8-4937fd0091f3/products/6f44e66c-b025-46b0-b2a4-399bf2ef270a/ETU_1_large.png', 35, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(40, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/b8070000-568f-0050-cc28-08d959dbd52d/BOI_Cat_800x800_large.png', 36, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(41, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/b8070000-568f-0050-3ecc-08d959e7d0b3/BER_Cat_800x800_large.png', 37, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(42, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/001e0000-568f-0050-bc46-08d9453e7c54/SPL_1(1)_large.png', 38, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(43, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/SK_Cat_800x800.jpg', 39, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(44, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Signalétique_Cat_800x800.jpg', 40, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(45, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Signalétique_Cat_800x800.jpg', 41, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(46, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f0120000-568f-0050-6bfe-08db08384b89/XBA_Cat_800x800_large.png', 42, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(47, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/STT_Cat_800x800.jpg', 43, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(48, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/bc0b0000-568f-0050-2855-08db13314dd3/TOTR_Cat_800x800_large.png', 44, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(49, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/PHC_Cat_800x800.jpg', 45, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(50, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f0120000-568f-0050-4a7c-08db0838bafc/BF_Cat_800x800_large.png', 46, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(51, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/AffGFp_Cat_800x800.jpg', 47, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(52, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/PA_Cat_800x800.jpg', 48, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(53, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/f0120000-568f-0050-4e34-08db0837adb6/ROL_Cat_800x800_large.png', 49, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(54, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/24160000-568f-0050-0e37-08d8e1bd57a9/PET_1(1)_large.png', 50, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(55, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/b8764d6e-4b63-4d2f-9d2a-44284bf89e0d/ORD_1_large.png', 51, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(56, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/70180000-568f-0050-47ae-08d8fe180395/CHDR_1_large.png', 52, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(57, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/681f0000-568f-0050-3627-08da1bd9cbed/CHSR_Cat_800x800_large.png', 53, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(58, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/ENV_Cat_800x800.jpg', 54, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(59, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/e0230000-568f-0050-c6dd-08d95161e08e/ENVl_Cat_800x800_large.png', 55, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(60, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CalCSPI_Cat_800x800.jpg', 56, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(61, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CalCS_Cat_800x800.jpg', 57, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(62, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/d8270000-568f-0050-ad92-08dbd57101ac/CalDP_Cat_800x800_large.png', 58, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(63, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/d8270000-568f-0050-8789-08dbd5778a64/CalR_Cat_800x800_large.png', 59, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(64, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/c40e0000-568f-0050-5ec7-08dbd6286972/CalM_Cat_800x800_large.png', 60, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(65, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/d8270000-568f-0050-628d-08dbd5786915/CalSM_Cat_800x800_large.png', 61, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(66, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/e4160000-568f-0050-7505-08d97f6dcbdf/BLCN_Cat_800x800_large.png', 62, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(67, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/TSF_Cat_800x800.jpg', 63, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(68, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/TSM_Cat_800x800.jpg', 64, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(69, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/0c0d0000-568f-0050-3ae9-08db83bc934b/POL_1_large.png', 65, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(70, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CASQ_Cat_800x800.jpg', 66, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(71, 'https://weprint.ma/files/subscribers/b68317fa-e2dd-459f-9125-1e59d93b4d95/sites/a01c0000-568f-0050-7472-08d81d12666c/products/0c0d0000-568f-0050-c037-08db83bdd779/CASQ_1_large.png', 66, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(72, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Goodies_Cat_800x800.jpg', 67, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(73, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/TOT_Cat_800x800.jpg', 68, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(74, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Goodies_Cat_800x800.jpg', 69, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(75, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Goodies_Cat_800x800.jpg', 70, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(76, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Goodies_Cat_800x800.jpg', 71, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(77, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/Goodies_Cat_800x800.jpg', 72, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(78, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/MUG_Cat_800x800.jpg', 73, '2025-09-15 12:50:50', '2025-09-15 12:50:50'),
(79, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 3, NULL, NULL),
(80, 'https://weprint.ma/files/skins/cfb4fd39-2077-4ba9-9bef-b4639b975999/images/CarteVisite_00.jpg', 3, NULL, NULL),
(81, 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758109198/qhgu1yfwopftbqddkpnw.jpg', 3, '2025-09-17 18:39:58', '2025-09-17 18:39:58'),
(82, 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758110335/boblyonk0mfw2khm3rio.jpg', 74, '2025-09-17 18:58:55', '2025-09-17 18:58:55'),
(83, 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758110338/sfkdjw312fuad1brgeqy.jpg', 74, '2025-09-17 18:58:59', '2025-09-17 18:58:59'),
(84, 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758110342/gljeuqawy3bzihfjosse.jpg', 74, '2025-09-17 18:59:03', '2025-09-17 18:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_19_014105_create_categories_table', 1),
(5, '2025_07_19_015636_create_groups_table', 1),
(6, '2025_07_20_094021_create_products_table', 1),
(7, '2025_07_20_094100_create_proprieters_table', 1),
(8, '2025_07_20_094141_create_options_table', 1),
(9, '2025_07_20_094142_create_product_options_table', 1),
(10, '2025_07_20_094227_create_order_products_table', 1),
(11, '2025_07_20_094243_create_paniers_table', 1),
(12, '2025_07_21_231347_order_product_product_options', 1),
(13, '2025_07_22_142116_panier_order_product', 1),
(14, '2025_07_22_210245_create_image_products_table', 1),
(15, '2025_07_27_045536_create_personal_access_tokens_table', 1),
(16, '2025_09_01_001143_create_faqs_table', 1),
(17, '2025_09_01_011555_create_blogs_table', 1),
(18, '2025_09_05_013714_create_settings_table', 1),
(19, '2025_09_11_032735_add_public_id_to_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id_option` bigint(20) UNSIGNED NOT NULL,
  `name_option` varchar(255) NOT NULL,
  `description_option` varchar(255) NOT NULL,
  `image_option` varchar(255) NOT NULL,
  `proprieter_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id_option`, `name_option`, `description_option`, `image_option`, `proprieter_id`, `created_at`, `updated_at`) VALUES
(1, 'A4', 'Format standard A4 (21x29,7 cm)', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 1, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(2, 'A5', 'Format A5 (14,8x21 cm)', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 1, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(3, 'A6', 'Format A6 (10,5x14,8 cm)', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 1, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(4, '10x15', 'Format 10x15 cm', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 1, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(5, 'Carré', 'Format carré', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 1, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(6, 'Recto', 'Impression uniquement sur le recto', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 2, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(7, 'Recto-Verso', 'Impression des deux côtés', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 2, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(8, '4/0', 'Quadrichromie recto seulement', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 2, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(9, '4/4', 'Quadrichromie recto-verso', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 2, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(10, 'Noir et blanc', 'Impression en noir et blanc', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 7, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(11, 'Couleurs CMJN', 'Impression en quadrichromie', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 7, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(12, 'Pantone', 'Couleurs Pantone spécifiques', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 7, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(13, 'RGB', 'Couleurs RVB', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 7, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(14, 'Bristol', 'Papier bristol épais', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 8, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(15, 'Couché', 'Papier couché brillant', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 8, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(16, 'Recyclé', 'Papier recyclé écologique', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 8, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(17, 'Kraft', 'Papier kraft naturel', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 8, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(18, 'PVC', 'Support en PVC', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 8, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(19, '80g', 'Grammage 80g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(20, '90g', 'Grammage 90g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(21, '135g', 'Grammage 135g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(22, '250g', 'Grammage 250g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(23, '300g', 'Grammage 300g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(24, '350g', 'Grammage 350g/m²', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 28, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(25, 'Brillant', 'Finition brillante', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 29, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(26, 'Mat', 'Finition mate', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 29, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(27, 'Soft Touch', 'Finition soft touch', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 29, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(28, 'Relief', 'Finition avec effet de relief', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 29, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(29, 'Pelliculage brillant', 'Pelliculage brillant de protection', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 32, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(30, 'Pelliculage mat', 'Pelliculage mat de protection', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 32, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(31, 'Sans pelliculage', 'Sans pelliculage', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 32, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(32, 'Vernis sélectif', 'Vernis sélectif sur zones spécifiques', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 34, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(33, 'Vernis total', 'Vernis sur toute la surface', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 34, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(34, 'Sans vernis', 'Sans traitement vernis', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 34, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(35, '100', 'Quantité de 100 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(36, '250', 'Quantité de 250 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(37, '500', 'Quantité de 500 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(38, '1000', 'Quantité de 1000 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(39, '2000', 'Quantité de 2000 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(40, '5000', 'Quantité de 5000 exemplaires', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 45, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(41, 'Pli simple', 'Pli simple', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 41, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(42, 'Pli roulé', 'Pli roulé', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 41, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(43, 'Pli croisé', 'Pli croisé', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 41, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(44, 'Pli accordéon', 'Pli accordéon', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 41, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(45, 'Agrafe', 'Reliure par agrafage', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 35, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(46, 'Spirale', 'Reliure spirale métallique', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 35, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(47, 'Carré collé', 'Reliure dos carré collé', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 35, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(48, 'Piqûre', 'Reliure par piqûre', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 35, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(49, 'Sans œillet', 'Sans œillet', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 39, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(50, 'Œillet métal argent', 'Œillet en métal argenté', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 39, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(51, 'Œillet métal or', 'Œillet en métal doré', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 39, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(52, 'Œillet plastique', 'Œillet en plastique', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 39, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(53, 'Coins droits', 'Coins droits standard', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 27, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(54, 'Coins arrondis', 'Coins arrondis', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 27, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(55, 'Coins personnalisés', 'Coins avec forme personnalisée', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 27, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(56, 'Sans fenêtre', 'Sans fenêtre', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 38, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(57, 'Fenêtre simple', 'Fenêtre simple', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 38, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(58, 'Fenêtre double', 'Fenêtre double', 'https://api.weprint.ma/revendeurs_apiv2/public/storage/assets/picto/AffGF_Format_A1_1.png', 38, '2025-09-15 03:53:03', '2025-09-15 03:53:03'),
(59, '100', 'hjhhh', 'https://res.cloudinary.com/dkiancbbn/image/upload/v1757968276/qoeevotxby6bvhsnnm1f.jpg', 50, '2025-09-16 03:31:16', '2025-09-16 03:31:16'),
(60, '200', 'ddd', 'https://res.cloudinary.com/dkiancbbn/image/upload/v1757968403/fcisewxgzvh3ervqtboz.jpg', 50, '2025-09-16 03:33:23', '2025-09-16 03:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `id_orderProduct` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `session_user` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('Not Registered','Registered','Validated') NOT NULL DEFAULT 'Not Registered',
  `prix_orderProduct` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_products`
--

INSERT INTO `order_products` (`id_orderProduct`, `uuid`, `session_user`, `user_id`, `status`, `prix_orderProduct`, `created_at`, `updated_at`) VALUES
(1, 'dd037c5d-92a8-404e-8a8b-b1227f9fcc80', 'c3d54799-6bc4-42f9-9215-4e4284f8d6c0', NULL, 'Not Registered', 28.60, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(2, '98339b7c-0a20-4f05-804e-5354e94b71aa', 'c3d54799-6bc4-42f9-9215-4e4284f8d6c0', NULL, 'Not Registered', 143.00, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(3, '2ada4e4e-1003-41c1-bb86-060d0f5fca30', 'bdc3af4c-7850-4c86-8c4b-b475efd1b030', 4, 'Validated', 154.40, '2025-09-16 19:36:33', '2025-09-16 23:10:23'),
(10, '614ada9c-dc94-49ab-ad10-3d0e0b1925cc', 'bdc3af4c-7850-4c86-8c4b-b475efd1b030', 4, 'Validated', 194.40, '2025-09-16 20:40:51', '2025-09-16 23:10:23'),
(11, '9c7e0432-e6b7-4fd1-9fca-f22e2536fcea', 'f2195592-068a-4462-8375-c346bbb299d5', NULL, 'Not Registered', 664.00, '2025-09-16 22:48:35', '2025-09-16 22:48:35'),
(12, '3770cb88-a1c4-43ac-9c2f-16db9d249d02', '3eb6298f-f685-41d5-8c16-7db80d4fc6a8', NULL, 'Not Registered', 170.40, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(14, '3221d4b0-6018-4c4d-8853-827d936e5bc2', '040d2a66-f0ca-438a-be0a-5d55ad71b884', 6, 'Validated', 234.40, '2025-09-17 19:06:57', '2025-09-17 19:51:30'),
(15, '00785b5b-e7f0-4c6d-8e14-5d7f23ecfcaf', '040d2a66-f0ca-438a-be0a-5d55ad71b884', 6, 'Validated', 370.40, '2025-09-17 19:08:09', '2025-09-17 19:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `order_product_product_options`
--

CREATE TABLE `order_product_product_options` (
  `order_product_id` bigint(20) UNSIGNED NOT NULL,
  `product_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product_product_options`
--

INSERT INTO `order_product_product_options` (`order_product_id`, `product_option_id`, `created_at`, `updated_at`) VALUES
(1, 165, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 166, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 167, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 169, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 168, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 170, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(1, 173, '2025-09-16 03:14:34', '2025-09-16 03:14:34'),
(2, 165, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 166, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 167, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 169, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 168, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 170, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(2, 173, '2025-09-16 03:15:03', '2025-09-16 03:15:03'),
(3, 213, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 165, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 166, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 167, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 168, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 169, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 170, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(3, 171, '2025-09-16 19:36:33', '2025-09-16 19:36:33'),
(10, 165, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 166, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 167, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 168, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 169, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 170, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 173, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(10, 213, '2025-09-16 22:43:36', '2025-09-16 22:43:36'),
(12, 186, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(12, 187, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(12, 188, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(12, 189, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(12, 190, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(12, 192, '2025-09-16 22:52:58', '2025-09-16 22:52:58'),
(14, 186, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(14, 187, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(14, 188, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(14, 189, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(14, 190, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(14, 193, '2025-09-17 19:06:57', '2025-09-17 19:06:57'),
(15, 186, '2025-09-17 19:08:27', '2025-09-17 19:08:27'),
(15, 187, '2025-09-17 19:08:27', '2025-09-17 19:08:27'),
(15, 188, '2025-09-17 19:08:27', '2025-09-17 19:08:27'),
(15, 189, '2025-09-17 19:08:27', '2025-09-17 19:08:27'),
(15, 190, '2025-09-17 19:08:27', '2025-09-17 19:08:27'),
(15, 194, '2025-09-17 19:08:27', '2025-09-17 19:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `paniers`
--

CREATE TABLE `paniers` (
  `id_panier` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Pending','Completed','Delivered','Cancelled') NOT NULL DEFAULT 'Pending',
  `prix_panier` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paniers`
--

INSERT INTO `paniers` (`id_panier`, `user_id`, `status`, `prix_panier`, `created_at`, `updated_at`) VALUES
(1, 4, 'Completed', 583.20, '2025-09-16 23:10:23', '2025-09-17 20:20:48'),
(2, 6, 'Pending', 604.80, '2025-09-17 19:51:30', '2025-09-17 19:51:30');

-- --------------------------------------------------------

--
-- Table structure for table `panier_order_product`
--

CREATE TABLE `panier_order_product` (
  `panier_id` bigint(20) UNSIGNED NOT NULL,
  `order_product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `panier_order_product`
--

INSERT INTO `panier_order_product` (`panier_id`, `order_product_id`) VALUES
(1, 3),
(1, 10),
(2, 14),
(2, 15);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 4, 'api-token', '491156ac9f6dae2122f7d04148ae495a505614a5be2b376fe07d7d8c2c72752a', '[\"*\"]', '2025-09-16 21:00:46', NULL, '2025-09-16 20:59:57', '2025-09-16 21:00:46'),
(5, 'App\\Models\\User', 4, 'api-token', '96b22c3ca9821332322563b3f5c6b0e855da311bd3b02071ab7b83ce3a30cda6', '[\"*\"]', '2025-09-17 06:08:43', NULL, '2025-09-16 23:03:07', '2025-09-17 06:08:43'),
(7, 'App\\Models\\User', 6, 'api-token', '88d75d3e964b58b4841c3b8830ae3890026784b1cf8e401d04f9e9eaf08b4520', '[\"*\"]', '2025-09-17 21:37:39', NULL, '2025-09-17 19:05:32', '2025-09-17 21:37:39'),
(8, 'App\\Models\\User', 4, 'api-token', '3e1fb0533e33af47d05401b9a0c092b8fb9b58ddb991eed221073f2f330d15be', '[\"*\"]', '2025-09-17 20:50:25', NULL, '2025-09-17 19:24:40', '2025-09-17 20:50:25');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `name_product` varchar(255) NOT NULL,
  `description_product` varchar(255) NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `name_product`, `description_product`, `categorie_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'Cartes de Visite Classiques', 'Cartes de visite classiques', 1, 1, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(2, 'Cartes de Visite Luxe', 'Cartes de visite luxe', 1, 1, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(3, 'Cartes de Visite Ultra Blanche', 'Cartes de visite ultra blanche', 1, NULL, '2025-09-15 03:36:10', '2025-09-17 18:40:56'),
(4, 'Cartes de visite rigide', 'Cartes de visite rigides', 1, 1, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(5, 'Cartes PVC Transparente', 'Cartes de visite en PVC transparent', 1, 1, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(6, 'Cartes de correspondance', 'Cartes de correspondance', 1, 2, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(7, 'Cartes de voeux', 'Cartes de vœux', 1, 3, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(8, 'Cartons d\'invitation', 'Cartons d\'invitation', 1, 4, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(9, 'Cartes postales', 'Cartes postales', 1, 5, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(10, 'Marque-pages', 'Marque-pages', 1, 6, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(11, 'Flyers', 'Flyers publicitaires', 2, 7, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(12, 'Dépliants 1 Pli Simple', 'Dépliants avec 1 pli simple', 2, 8, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(13, 'Dépliants 2 Plis Roulés', 'Dépliants avec 2 plis roulés', 2, 8, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(14, 'Dépliants 2 Plis Croisés', 'Dépliants avec 2 plis croisés', 2, 8, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(15, 'Dépliants 3 Plis Roulés', 'Dépliants avec 3 plis roulés', 2, 8, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(16, 'Affiches petit format', 'Affiches petit format', 2, 9, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(17, 'Affiches grand format', 'Affiches grand format', 2, 9, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(18, 'Tags / Etiquettes carton', 'Tags et étiquettes en carton', 2, 10, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(19, 'Stickers', 'Stickers', 2, 10, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(20, 'Chevalets', 'Chevalets publicitaires', 2, 11, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(21, 'Brochures Piquées', 'Brochures piquées', 2, 12, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(22, 'Brochures dos carré collé', 'Brochures dos carré collé', 2, 12, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(23, 'Tickets', 'Tickets', 2, 13, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(24, 'Menus / Page à page', 'Menus page à page', 3, 14, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(25, 'Menus piqués', 'Menus piqués', 3, 14, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(26, 'Menus Dépliants 1 Pli', 'Menus dépliants 1 pli', 3, 14, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(27, 'Menus Dépliant 2 Plis', 'Menus dépliants 2 plis', 3, 14, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(28, 'Chevalets', 'Chevalets pour hôtellerie', 3, 15, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(29, 'Sets de table', 'Sets de table', 3, 16, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(30, 'Porte-additions', 'Porte-additions', 3, 17, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(31, 'Ronds de serviette', 'Ronds de serviette', 3, 18, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(32, 'Porte-cartes Magnétiques', 'Porte-cartes magnétiques', 3, 19, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(33, 'Cravates accroche portes', 'Cravates accroche-portes', 3, 20, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(34, 'Sous-verres', 'Sous-verres', 3, 21, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(35, 'Etuis', 'Etuis', 4, 22, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(36, 'Boites', 'Boites', 4, 22, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(37, 'Berlingots', 'Berlingots', 4, 22, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(38, 'Sacs papiers de luxe', 'Sacs papiers de luxe', 4, 23, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(39, 'Sacs Kraft', 'Sacs Kraft', 4, 24, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(40, 'Bâches', 'Bâches publicitaires', 5, 25, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(41, 'Bâches Backlight', 'Bâches backlight', 5, 25, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(42, 'X-Banners', 'X-Banners', 5, 26, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(43, 'Stop-Trottoirs', 'Stop-Trottoirs', 5, 27, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(44, 'Totems Rigides', 'Totems rigides', 5, 28, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(45, 'Photocalls', 'Photocalls', 5, 29, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(46, 'Beach Flags / Flying Banners', 'Beach flags et flying banners', 5, 30, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(47, 'Affiches grand format', 'Affiches grand format', 5, 31, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(48, 'Porte Affiches', 'Porte affiches', 5, 32, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(49, 'Roll-ups', 'Roll-ups', 5, 33, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(50, 'Papiers à en-tête', 'Papiers à en-tête', 6, 34, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(51, 'Ordonnances', 'Ordonnances', 6, 35, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(52, 'Chemises à double rabat', 'Chemises à double rabat', 6, 36, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(53, 'Chemises à rabat simple', 'Chemises à rabat simple', 6, 36, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(54, 'Enveloppes Standard', 'Enveloppes standard', 6, 37, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(55, 'Enveloppes Luxe', 'Enveloppes luxe', 6, 37, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(56, 'Calendriers chevalets Spirales', 'Calendriers chevalets spirales', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(57, 'Calendriers chevalets simples', 'Calendriers chevalets simples', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(58, 'Calendriers de poche', 'Calendriers de poche', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(59, 'Calendriers rigides', 'Calendriers rigides', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(60, 'Calendriers muraux', 'Calendriers muraux', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(61, 'Calendriers sous-main', 'Calendriers sous-main', 6, 38, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(62, 'Blocs-Notes', 'Blocs-notes', 6, 39, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(63, 'T-shirts Femme', 'T-shirts pour femme', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(64, 'T-shirts Mixtes', 'T-shirts mixtes', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(65, 'Polos', 'Polos', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(66, 'Casquettes', 'Casquettes', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(67, 'Cabas', 'Cabas', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(68, 'Tote bags', 'Tote bags', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(69, 'Pochettes Zippées', 'Pochettes zippées', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(70, 'Pochons', 'Pochons', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(71, 'Sacs à dos avec cordes', 'Sacs à dos avec cordes', 8, 40, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(72, 'Tapis de Souris', 'Tapis de souris', 8, 41, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(73, 'Mugs', 'Mugs', 8, 42, '2025-09-15 03:36:10', '2025-09-15 03:36:10'),
(74, 'product', 'product', 7, NULL, '2025-09-17 18:58:51', '2025-09-17 18:58:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id_ProductOption` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `prix` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id_ProductOption`, `product_id`, `option_id`, `prix`, `created_at`, `updated_at`) VALUES
(165, 1, 1, 15.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(166, 1, 6, 12.50, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(167, 1, 10, 8.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(168, 1, 14, 20.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(169, 1, 25, 5.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(170, 1, 32, 7.50, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(171, 1, 45, 25.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(172, 1, 46, 45.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(173, 1, 47, 75.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(174, 1, 48, 120.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(175, 2, 1, 25.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(176, 2, 7, 18.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(177, 2, 11, 15.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(178, 2, 15, 35.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(179, 2, 26, 8.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(180, 2, 33, 10.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(181, 2, 45, 40.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(182, 2, 46, 70.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(183, 2, 47, 120.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(184, 2, 48, 200.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(185, 11, 1, 45.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(186, 11, 2, 35.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(187, 11, 7, 25.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(188, 11, 11, 20.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(189, 11, 15, 15.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(190, 11, 22, 18.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(191, 11, 45, 60.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(192, 11, 46, 100.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(193, 11, 47, 180.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(194, 11, 48, 350.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(195, 22, 1, 120.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(196, 22, 2, 85.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(197, 22, 7, 40.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(198, 22, 11, 35.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(199, 22, 21, 25.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(200, 22, 22, 30.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(201, 22, 45, 150.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(202, 22, 46, 250.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(203, 22, 47, 400.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(204, 25, 1, 65.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(205, 25, 2, 45.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(206, 25, 7, 30.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(207, 25, 11, 25.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(208, 25, 23, 40.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(209, 25, 45, 80.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(210, 25, 46, 140.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(211, 25, 47, 250.00, '2025-09-15 04:06:50', '2025-09-15 04:06:50'),
(212, 1, 59, 100.00, '2025-09-16 03:31:16', '2025-09-16 03:32:42'),
(213, 1, 60, 100.00, '2025-09-16 03:33:23', '2025-09-16 03:33:23');

-- --------------------------------------------------------

--
-- Table structure for table `proprieters`
--

CREATE TABLE `proprieters` (
  `id_proprieter` bigint(20) UNSIGNED NOT NULL,
  `name_proprieter` varchar(255) NOT NULL,
  `description_proprieter` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `proprieters`
--

INSERT INTO `proprieters` (`id_proprieter`, `name_proprieter`, `description_proprieter`, `created_at`, `updated_at`) VALUES
(1, 'format', 'Format', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(2, 'impression', 'Impression', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(3, 'spiral', 'Spirale', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(4, 'longuette', 'Longuette', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(5, 'nombre', 'Nombre de Feuilles', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(6, 'qtyLbr', 'Quantité total !', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(7, 'couleurs', 'Couleurs', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(8, 'matiere', 'Matière', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(9, 'contenance', 'contenance', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(10, 'simple_double', 'Simple/Double', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(11, 'papiercouverture', 'Papier couverture', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(12, 'socle', 'Socle', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(13, 'supportimpression', 'Support d\'impression', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(14, 'papierinterieur', 'Papier intérieur', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(15, 'taille', 'Taille', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(16, 'structure', 'Structure', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(17, 'support', 'Support', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(18, 'base', 'Base', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(19, 'marque', 'Choisissez la marque', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(20, 'modele', 'Modèle', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(21, 'pagesintérieur', 'Nombre de pages', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(22, 'formatenm', 'Format en mètres', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(23, 'numerotation', 'Numérotation', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(24, 'Impressionint', 'Impression intérieur', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(25, 'impressionsocle', 'Impression Socle', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(26, 'impressioncouverture', 'Impression couverture', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(27, 'coin', 'Type de coin', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(28, 'grammagepapier', 'Grammage de papier', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(29, 'finition', 'Finition', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(30, 'premium', 'Premium', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(31, 'pelliculagesocle', 'Pelliculage Socle', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(32, 'pelliculagecouv', 'Pelliculage Couverture', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(33, 'pelliculageint', 'Pelliculage Intérieur', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(34, 'vernis', 'Vernis', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(35, 'agrafage', 'Agrafage', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(36, 'longueurTickets', 'Longueur Tickets', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(37, 'souche', 'Souche', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(38, 'fenetre', 'Fenetre', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(39, 'oeuillets', 'Œillets', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(40, 'cordon', 'Cordon', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(41, 'pli', 'Pli', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(42, 'option-CDV', 'Option Carte de Visite', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(43, 'couleurspiral', 'Couleur Spirale', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(44, 'tailles', 'Tailles', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(45, 'qty', 'Quantité', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(46, 'epesseur', 'epaisseurW', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(47, 'papier', 'Papier', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(48, 'epaisseur', 'Epaisseur', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(49, 'tranche', 'Tranche', '2025-09-15 03:40:42', '2025-09-15 03:40:42'),
(50, 'Quantité', 'Quantité', '2025-09-16 03:25:01', '2025-09-16 03:25:01'),
(51, 'oper', 'ope', '2025-09-17 20:22:29', '2025-09-17 20:28:49');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contact_phone` varchar(255) NOT NULL,
  `contact_whatsapp` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `url_image_hero` text NOT NULL,
  `public_id` text NOT NULL,
  `promo_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `contact_phone`, `contact_whatsapp`, `contact_email`, `url_image_hero`, `public_id`, `promo_code`, `created_at`, `updated_at`) VALUES
(1, '21345656', '234546', 'oumhdiredouane9@gmail.com', 'https://res.cloudinary.com/dkiancbbn/image/upload/v1758116822/uv89ewxon1vb73cn5ani.jpg', 'uv89ewxon1vb73cn5ani', '0.7', NULL, '2025-09-17 20:50:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `numero_telephone` varchar(255) NOT NULL,
  `nomComplet` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `numero_telephone`, `nomComplet`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, '0649595827', 'oumhdi redouane', 'oumhdiredouane@gmail.com', '2025-09-15 21:30:10', '$2y$12$p4coc77iOFhRHmxtBcVAc.weyBxgwVqnZdzfd35DSCWbpo8Oj5Yuu', 'admin', 'kxx4SSz3J6', '2025-09-15 21:30:11', '2025-09-15 21:30:11'),
(6, '0664948283', 'packspace', 'Info@packspace.ma', '2025-09-17 19:05:09', '$2y$12$k6fTls3ZzCGvrjcKpoYceeevitLoQRFONFHGyI6GhGMbXHqsDZyyu', 'user', 'P0eYIfkJFzJOM5QYDJyDnPNIbdvBv7imBlEEPgg6N4sxCLFLAlDZsLbuzgOl', '2025-09-17 19:05:10', '2025-09-17 19:05:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `groups_categorie_id_foreign` (`categorie_id`);

--
-- Indexes for table `image_products`
--
ALTER TABLE `image_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id_option`),
  ADD KEY `options_proprieter_id_foreign` (`proprieter_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`id_orderProduct`),
  ADD UNIQUE KEY `order_products_uuid_unique` (`uuid`),
  ADD KEY `order_products_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product_product_options`
--
ALTER TABLE `order_product_product_options`
  ADD KEY `order_product_product_options_order_product_id_foreign` (`order_product_id`),
  ADD KEY `order_product_product_options_product_option_id_foreign` (`product_option_id`);

--
-- Indexes for table `paniers`
--
ALTER TABLE `paniers`
  ADD PRIMARY KEY (`id_panier`),
  ADD KEY `paniers_user_id_foreign` (`user_id`);

--
-- Indexes for table `panier_order_product`
--
ALTER TABLE `panier_order_product`
  ADD KEY `panier_order_product_panier_id_foreign` (`panier_id`),
  ADD KEY `panier_order_product_order_product_id_foreign` (`order_product_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `products_categorie_id_foreign` (`categorie_id`),
  ADD KEY `products_group_id_foreign` (`group_id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id_ProductOption`),
  ADD KEY `product_options_product_id_foreign` (`product_id`),
  ADD KEY `product_options_option_id_foreign` (`option_id`);

--
-- Indexes for table `proprieters`
--
ALTER TABLE `proprieters`
  ADD PRIMARY KEY (`id_proprieter`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_numero_telephone_unique` (`numero_telephone`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id_group` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `image_products`
--
ALTER TABLE `image_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id_option` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `id_orderProduct` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `paniers`
--
ALTER TABLE `paniers`
  MODIFY `id_panier` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id_ProductOption` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;

--
-- AUTO_INCREMENT for table `proprieters`
--
ALTER TABLE `proprieters`
  MODIFY `id_proprieter` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id_categorie`) ON DELETE CASCADE;

--
-- Constraints for table `image_products`
--
ALTER TABLE `image_products`
  ADD CONSTRAINT `image_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON DELETE CASCADE;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `options_proprieter_id_foreign` FOREIGN KEY (`proprieter_id`) REFERENCES `proprieters` (`id_proprieter`) ON DELETE CASCADE;

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `order_product_product_options`
--
ALTER TABLE `order_product_product_options`
  ADD CONSTRAINT `order_product_product_options_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id_orderProduct`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_product_product_options_product_option_id_foreign` FOREIGN KEY (`product_option_id`) REFERENCES `product_options` (`id_ProductOption`) ON DELETE CASCADE;

--
-- Constraints for table `paniers`
--
ALTER TABLE `paniers`
  ADD CONSTRAINT `paniers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `panier_order_product`
--
ALTER TABLE `panier_order_product`
  ADD CONSTRAINT `panier_order_product_order_product_id_foreign` FOREIGN KEY (`order_product_id`) REFERENCES `order_products` (`id_orderProduct`) ON DELETE CASCADE,
  ADD CONSTRAINT `panier_order_product_panier_id_foreign` FOREIGN KEY (`panier_id`) REFERENCES `paniers` (`id_panier`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id_categorie`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id_group`) ON DELETE CASCADE;

--
-- Constraints for table `product_options`
--
ALTER TABLE `product_options`
  ADD CONSTRAINT `product_options_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `options` (`id_option`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
