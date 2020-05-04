SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `totCards`;
CREATE TABLE `totCards` (
  `cardId` mediumint(97) NOT NULL,
  `cardName` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `rarity` varchar(25)  COLLATE utf8_unicode_ci NOT NULL,
  `cost` mediumint(97) DEFAULT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `offense` mediumint(97) NOT NULL,
  `defense` mediumint(97) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `totCards` (`cardId`, `cardName`, `rarity`, `cost`, `category`, `image`, `description`, `offense`, `defense`) VALUES
(1, 'Mega Knight', 'Legendary', '7', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/0/0b/MegaKnightCard.png/revision/latest?cb=20171212204943', 'He lands with the force of 1,000 mustaches, then jumps from one foe to the next dealing huge area damage. Stand aside!', 4, 4),
(2, 'Golem', 'Epic', '8', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/d/d4/GolemCard.png/revision/latest?cb=20171212204759', 'Slow but durable, only attacks buildings. When destroyed, explosively splits into two Golemites and deals area damage!', 3, 4),
(3, 'Mini P.E.K.K.A.', 'Rare', '4', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/7/7b/MiniPEKKACard.png/revision/latest?cb=20171212204957', 'The Arena is a certified butterfly-free zone. No distractions for P.E.K.K.A., only destruction.', 4, 2),
(4, 'Zap', 'Common', '2', 'spell', 'https://vignette.wikia.nocookie.net/clashroyale/images/5/52/ZapCard.png/revision/latest?cb=20171212203728', 'Zaps enemies, briefly stunning them and dealing damage inside a small radius. Reducing damage to Crown Towers.', 2, 4),
(5, 'Royal Delivery', 'Common', '3', 'spell', 'https://vignette.wikia.nocookie.net/clashroyale/images/6/6c/RoyalDeliveryCard.png/revision/latest?cb=20200306025958', 'No need to sign for this package! Dropped from the sky, it damages and knocks back enemy Troops before delivering a Royal Recruit. The empty box is also handy for espionage.', 2, 4),
(6, 'Inferno Dragon', 'Legendary', '4', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/9/95/InfernoDragonCard.png/revision/latest?cb=20171212204926', 'Shoots a focused beam of fire that increases in damage over time. Wears a helmet because flying can be dangerous.', 2, 4),
(7, 'Clone', 'Epic', '3', 'spell', 'https://vignette.wikia.nocookie.net/clashroyale/images/4/48/CloneCard.png/revision/latest?cb=20171212210530', 'Duplicates all friendly troops in the target area. Cloned troops are fragile, but pack the same punch as the original! Does not affect buildings.', 3, 1),
(8, 'Inferno Tower', 'Rare', '5', 'building', 'https://vignette.wikia.nocookie.net/clashroyale/images/3/34/InfernoTowerCard.png/revision/latest?cb=20171212204928', 'Defensive building, roasts targets for damage that increases over time. Burns through even the biggest and toughest enemies!', 1, 4),
(9, 'Royal Giant', 'Common', '6', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/8/8b/RoyalGiantCard.png/revision/latest?cb=20171212203645', 'Destroying enemy buildings with his massive cannon is his job; making a raggedy blond beard look good is his passion.', 4, 1),
(10, 'The Log', 'Legendary', '2', 'spell', 'https://vignette.wikia.nocookie.net/clashroyale/images/4/4d/TheLogCard.png/revision/latest?cb=20171212203703', 'A spilt bottle of Rage turned an innocent tree trunk into "The Log". Now, it seeks revenge by crushing anything in its path!', 2, 4),
(11, 'Goblins', 'Common', '2', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/b/bd/GoblinsCard.png/revision/latest?cb=20171212204756', 'Three fast, unarmored melee attackers. Small, fast, green and mean!', 1, 1),
(12, 'Hog Rider', 'Rare', '4', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/3/30/HogRiderCard.png/revision/latest?cb=20171212204811', 'Fast melee troop that targets buildings and can jump over the river. He followed the echoing call of "Hog Riderrrrr" all the way through the Arena doors.', 4, 1),
(13, 'Knight', 'Common', '3', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/5/54/KnightCard.png/revision/latest?cb=20171212204932', 'A tough melee fighter. The Barbarians handsome, cultured cousin. Rumor has it that he was knighted based on the sheer awesomeness of his mustache alone.', 3, 3),
(14, 'Firecracker', 'Common', '3', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/2/29/FirecrackerCard.png/revision/latest?cb=20200113190910', 'Shoots a firework that explodes upon impact, damaging the target and showering anything directly behind it with sparks. This is what happens when Archers get bored!', 3, 3),
(15, 'Witch', 'Epic', '5', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/7/7f/WitchCard.png/revision/latest?cb=20171212203719', 'Summons Skeletons, shoots destructo beams, has glowing pink eyes that unfortunately dont shoot lasers.', 4, 3),
(16, 'P.E.K.K.A.', 'Epic', '7', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/f/fe/PEKKACard.png/revision/latest?cb=20171212203624', 'A heavily armored, slow melee fighter. Swings from the hip, but packs a huge punch.', 3, 4),
(17, 'Wizard', 'Epic', '5', 'troop', 'https://vignette.wikia.nocookie.net/clashroyale/images/4/49/WizardCard.png/revision/latest?cb=20171212203722', 'The most awesome man to ever set foot in the arena, the Wizard will blow you away with his handsomeness... and/or fireballs.', 4, 4),
(18, 'X-Bow', 'Epic', '6', 'building', 'https://vignette.wikia.nocookie.net/clashroyale/images/b/b5/X-BowCard.png/revision/latest?cb=20171212203726', 'Nice tower you got there. Would be a shame if this X-Bow whittled it down from this side of the Arena...', 4, 3),
(19, 'Mortar', 'Common', '4', 'building', 'https://vignette.wikia.nocookie.net/clashroyale/images/1/1e/MortarCard.png/revision/latest?cb=20191207191730', 'Defensive building with a long range. Shoots big boulders that deal area damage, but cannot hit targets that get very close!', 3, 3),
(20, 'Elixir Collecter', 'Rare', '6', 'building', 'https://vignette.wikia.nocookie.net/clashroyale/images/3/33/ElixirCollectorCard.png/revision/latest?cb=20171212204717', 'You gotta spend Elixir to make Elixir! This building makes 8 Elixir over its Lifetime. Does not appear in your starting hand.', 2, 1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`userId` tinyint(2) NOT NULL,
	`username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
	`password` varchar(72) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` (`userId`, `username`, `password`) VALUES
(1, 'roob', 'roob'),
(2, 'mytzy', 'mytzy'),
(3, 'miguel', 'mytzy'),
(4, 'gerard', 'mytzy'),
(5, 'kim', 'mytzy'),
(6, 'angel', 'mytzy'),
(7, 'yeesus', 'mytzy'),
(8, 'chuy', 'mytzy'),
(9, 'chu', 'mytzy'),
(10, 'caas', 'mytzy'),
(11, 'humphrey', 'mytzy'),
(12, 'jenjen', 'mytzy'),
(13, 'theobald', 'mytzy'),
(14, 'trinh', 'mytzy'),
(15, 'escobar', 'mytzy'),
(16, 'mizel', 'mytzy'),
(17, 'doug', 'mytzy'),
(18, 'dimma', 'mytzy'),
(19, 'dome', 'mytzy'),
(20, 'bruce', 'mytzy');

DROP TABLE IF EXISTS `createDeck`;
CREATE TABLE `createDeck` (
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `card1` mediumint(97) NOT NULL,
  `card2` mediumint(97) NOT NULL,
  `card3` mediumint(97) NOT NULL,
  `card4` mediumint(97) NOT NULL,
  `card5` mediumint(97) NOT NULL,
  `card6` mediumint(97) NOT NULL,
  `card7` mediumint(97) NOT NULL,
  `card8` mediumint(97) NOT NULL,
  `offenseRating` mediumint(97) NOT NULL,
  `defenseRating` mediumint(97) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `createDeck` (`username`, `card1`, `card2`, `card3`, `card4`, `card5`, `card6`, `card7`, `card8`, `offenseRating`, `defenseRating`) VALUES 
('roob', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('mytzy', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('miguel', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('gerard', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('kim', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('angel', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('yeesus', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('chuy', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('chu', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('caas', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('humphrey', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('jenjen', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('theobald', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('trinh', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('escobar', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('mizel', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('doug', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('dimma', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('dome', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1),
('bruce', 11, 11, 11, 11, 11, 11, 11, 11, 1, 1);

ALTER TABLE `totCards`
  ADD PRIMARY KEY (`cardId`);
  
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`);
  
-- ALTER TABLE `createDeck`
--   ADD PRIMARY KEY (`username`);
  

ALTER TABLE `totCards`
  MODIFY `cardId` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
ALTER TABLE `users`
  MODIFY `userId` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
ALTER TABLE `createDeck`
  MODIFY `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL;
  
COMMIT;