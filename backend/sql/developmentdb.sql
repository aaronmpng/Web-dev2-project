-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Gegenereerd op: 15 dec 2024 om 11:26
-- Serverversie: 11.2.2-MariaDB-1:11.2.2+maria~ubu2204
-- PHP-versie: 8.2.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `developmentdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `stock`, `category`, `image`) VALUES
(1, 'Salmon nigiri', 'Fresh salmon over seasoned rice.', 9.00, 15, 'sushi', 'https://images.pexels.com/photos/28559528/pexels-photo-28559528/free-photo-of-close-up-van-sushi-nigiri-op-een-houten-schaal.jpeg?auto=compress&cs=tinysrgb&w=600'),
(2, 'Tuna roll', 'Classic tuna roll with seaweed wrap.', 9.99, 15, 'sushi', 'https://images.pexels.com/photos/6249505/pexels-photo-6249505.jpeg?auto=compress&cs=tinysrgb&w=600'),
(3, 'Unagi Roll', 'Grilled eel with sweet sauce.', 14.99, 15, 'sushi', 'https://images.pexels.com/photos/17894209/pexels-photo-17894209/free-photo-of-voedsel-eten-restaurant-eetgelegenheid.jpeg?auto=compress&cs=tinysrgb&w=600'),
(4, 'Salmon Roll', 'Grilled salmon with sweet sauce.', 14.99, 15, 'sushi', 'https://images.pexels.com/photos/11661142/pexels-photo-11661142.jpeg?auto=compress&cs=tinysrgb&w=600'),
(5, 'Ebi Roll', 'Grilled ebi with sweet sauce.', 14.99, 15, 'sushi', 'https://images.pexels.com/photos/17312774/pexels-photo-17312774/free-photo-of-voedsel-eten-voedselfotografie-voeding-fotografie.jpeg?auto=compress&cs=tinysrgb&w=600'),
(6, 'Hotate Roll', 'Grilled Hotate with sweet sauce.', 14.99, 15, 'sushi', 'https://media.istockphoto.com/id/1154908169/nl/foto/japans-traditioneel-eten-heerlijke-nigiri-sushi-top-met-verse-zeevruchten-otoro-tonijn-hotate.jpg?b=1&s=612x612&w=0&k=20&c=Bv4mtlmo6X5pHKQeNAb3VI74FsPeyTC5Id_pt8RqYxY='),
(7, 'Mackerel Roll', 'Grilled Mackerel with sweet sauce.', 14.99, 15, 'sushi', 'https://media.istockphoto.com/id/846573426/nl/foto/sushi-in-stokjes-met-japanse-restaurant-interieur.jpg?b=1&s=612x612&w=0&k=20&c=164U-WFE6LnJYk6Ab84bljERmKnVdCogYoR4vogNSuk='),
(8, 'Shoyu Ramen', 'Soy sauce-based ramen.', 10.99, 15, 'ramen', 'https://images.pexels.com/photos/16068671/pexels-photo-16068671/free-photo-of-voedsel-eten-diner-avondeten.jpeg?auto=compress&cs=tinysrgb&w=600'),
(9, 'Miso Ramen', 'Miso sauce-based ramen.', 9.99, 15, 'ramen', 'https://images.pexels.com/photos/18565074/pexels-photo-18565074/free-photo-of-restaurant-eetgelegenheid-eetcafe-diner.jpeg?auto=compress&cs=tinysrgb&w=600'),
(10, 'Ebi Ramen', 'Ebi based ramen.', 14.99, 15, 'ramen', 'https://media.istockphoto.com/id/2167997784/nl/foto/a-bowl-of-ebi-japanese-ramen-noodles.jpg?b=1&s=612x612&w=0&k=20&c=3vLQJ1PYS8gGrfBUp-wTgDRc26AU6CZKnJq0sFeASKo='),
(11, 'Karaage Ramen', 'Karaage based ramen.', 14.99, 15, 'ramen', 'https://media.istockphoto.com/id/2155094585/nl/foto/chicken-karaage-ramen-in-the-traditional-japanese-ramen-restaurant-with-a-ramen-bowl-on-a.jpg?b=1&s=612x612&w=0&k=20&c=LYnqjCIskjGilIO2zbMFo-yU8qTSqyVtSvlT7wxeRnY='),
(12, 'Tonkatsu Ramen', 'Tonkatsu based ramen.', 14.99, 15, 'ramen', 'https://media.istockphoto.com/id/1488695941/nl/foto/directly-above-photo-of-delicious-tonkotsu-ramen-in-a-ceramic-bowl.jpg?b=1&s=612x612&w=0&k=20&c=d-kPL5rd2kH3NfLkmfCt28utQK2IjPsW2Qi4MxskG04='),
(13, 'Curry Ramen', 'Curry based ramen.', 14.99, 15, 'ramen', 'https://media.istockphoto.com/id/1474136372/nl/foto/spicy-curry-ramen.jpg?b=1&s=612x612&w=0&k=20&c=w1xRaDwX4rDn4mTOTaFrpOY8uYKz-Lm_YzUpRVaAMJc='),
(14, 'Yasai Ramen', 'Veggie based ramen.', 14.99, 15, 'ramen', 'https://images.pexels.com/photos/5339078/pexels-photo-5339078.jpeg?auto=compress&cs=tinysrgb&w=600'),
(15, 'Chicken Curry', 'Mild chicken curry with vegetables.', 12.99, 15, 'curry', 'https://images.pexels.com/photos/20127885/pexels-photo-20127885/free-photo-of-maaltijd-kip-vlees-kom.jpeg?auto=compress&cs=tinysrgb&w=600'),
(16, 'Tonkatsu Curry', 'Tonkatsu curry with vegetables', 9.99, 15, 'curry', 'https://images.pexels.com/photos/5305438/pexels-photo-5305438.jpeg?auto=compress&cs=tinysrgb&w=600'),
(17, 'Ebi cury', 'Ebi curry with vegetables.', 14.99, 15, 'curry', 'https://images.pexels.com/photos/15985541/pexels-photo-15985541/free-photo-of-ebi-tempura-with-rice-and-sauce.jpeg?auto=compress&cs=tinysrgb&w=600');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`) VALUES
(1, 'username', '$2y$10$DQlV0u9mFmtOWsOdxXX9H.4kgzEB3E8o97s.S.Pdy4klUAdBvtVh.', 'username@password.com', 'admin'),
(33, 'test', '$2y$12$kOmg9Bm3I/0IhZ4F2yGcxO1GDYHaidlrCQfCtzZaKuxSZJ4OjJ8qi', 'test@hotmail.com', 'user');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
