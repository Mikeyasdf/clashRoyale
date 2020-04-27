SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `totCards`;
CREATE TABLE `totCards` (
  `cardID` mediumint(97) NOT NULL,
  `cardName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `rarity` date NOT NULL,
  `cost` date DEFAULT NULL,
  `category` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `totCards` (`cardID`, `cardName`, `rarity`, `cost`, `category`, `image`, `description`) VALUES
(1, 'Mega Knight', 'Legendary', '7', 'troop', '', 'He lands with the force of 1,000 mustaches, then jumps from one foe to the next dealing huge area damage. Stand aside!'),
(2, 'Golem', 'Epic', '8', 'troop', '', 'Slow but durable, only attacks buildings. When destroyed, explosively splits into two Golemites and deals area damage!'),
(3, 'Mini PEKKA', 'Rare', '4', 'troop', '', 'The Arena is a certified butterfly-free zone. No distractions for PEKKA, only destruction.'),
(4, 'Zap', 'Common', '2', 'spell', '', 'Zaps enemies, briefly stunning them and dealing damage inside a small radius. Reducing damage to Crown Towers.'),
(5, 'Royal Delivery', 'Common', '3', 'spell', '', 'No need to sign for this package! Dropped from the sky, it damages and knocks back enemy Troops before delivering a Royal Recruit. The empty box is also handy for espionage.'),
(6, 'Inferno Dragon', 'Legendary', '4', 'air troop', '', 'Shoots a focused beam of fire that increases in damage over time. Wears a helmet because flying can be dangerous.'),
(7, 'Clone', 'Epic', '3', 'spell', '', 'Duplicates all friendly troops in the target area. Cloned troops are fragile, but pack the same punch as the original! Does not affect buildings.'),
(8, 'Inferno Tower', 'Rare', '5', 'building', '', 'Defensive building, roasts targets for damage that increases over time. Burns through even the biggest and toughest enemies!');

ALTER TABLE `totCards`
  ADD PRIMARY KEY (`cardID`);
  
ALTER TABLE `totCards`
  MODIFY `cardID` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;
