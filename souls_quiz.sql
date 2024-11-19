-- MariaDB dump 10.19-11.4.0-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: souls_quiz
-- ------------------------------------------------------
-- Server version	11.4.0-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`answer_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES
(1,1,'Undead Settlement',0),
(2,1,'Anor Londo',1),
(3,1,'Undead Crypt',0),
(4,1,'Road Of Sacrifices',0),
(5,2,'Attunement',0),
(6,2,'Humanity',0),
(7,2,'Intelligence',1),
(8,2,'Faith',0),
(9,3,'Frost',0),
(10,3,'Lightning',1),
(11,3,'Dark',0),
(12,3,'Fire',0),
(13,4,'Drake Sword',0),
(14,4,'Moonlight Greatsword',1),
(15,4,'Fume Ultra Greatsword',0),
(16,4,'Zweihander',0),
(17,5,'Warriors Of Sunlight',0),
(18,5,'Way Of White',0),
(19,5,'Bell Keepers',1),
(20,5,'Way Of Blue',0),
(21,6,'The Primordial Crystal',1),
(22,6,'The Dark Soul',0),
(23,6,'The Moonlight Greatsword',0),
(24,6,'The First Flame',0),
(25,7,'Dark Souls',0),
(26,7,'Dark Souls II',0),
(27,7,'Dark Souls III',1),
(28,7,'All Of The Above',0),
(29,8,'768',0),
(30,8,'782',0),
(31,8,'798',0),
(32,8,'802',1),
(33,9,'Lothric',0),
(34,9,'Nito',0),
(35,9,'Wolnir',1),
(36,9,'Manus',0),
(37,10,'L1',0),
(38,10,'L2',1),
(39,10,'R1',0),
(40,10,'R2',0),
(41,11,'Things Betwixt',1),
(42,11,'Firelink Shrine',0),
(43,11,'Majula',0),
(44,11,'Northern Undead Asylum',0),
(45,12,'Dead',0),
(46,12,'Undying',0),
(47,12,'Undead',1),
(48,12,'Half-Dead',0),
(49,13,'It decreases vigor and stamina',0),
(50,13,'It halves vitality',0),
(51,13,'It decreases strength and dexterity',0),
(52,13,'It doesn\'t affect the player\'s stats',1),
(53,14,'Homeward Bone',0),
(54,14,'Binoculars',0),
(55,14,'Old Beggar\'s Ring',1),
(56,14,'Rusted Gold Coin',0),
(57,15,'Tarnished',1),
(58,15,'Undead',0),
(59,15,'Chosen one',0),
(60,15,'Bearer of Curse',0),
(61,16,'Brandon Sanderson',0),
(62,16,'George R. R. Martin',1),
(63,16,'Andrzej Sapkowski',0),
(64,16,'Seanan McGuire',0),
(65,17,'Agro',0),
(66,17,'Roach',0),
(67,17,'Torrent',1),
(68,17,'Epona',0),
(69,18,'2022',1),
(70,18,'2021',0),
(71,18,'2019',0),
(72,18,'2020',0),
(73,19,'Bloodborne',0),
(74,19,'Dark Souls',0),
(75,19,'Lunacid',1),
(76,19,'Shadow Tower',0),
(77,20,'Dung Eater',0),
(78,20,'Fia',1),
(79,20,'Knight Bernahl',0),
(80,20,'Sir Gideon Ofnir',0),
(81,21,'\"Firekeeper\"',0),
(82,21,'\"Dragon Slayer\"',0),
(83,21,'\"Light Souls\"',0),
(84,21,'\"Demons Souls\"',1),
(85,22,'Majula',0),
(86,22,'The Lost Bastille',0),
(87,22,'Cathedral of Blue',0),
(88,22,'Things Betwixt',1),
(89,23,'Time off',0),
(90,23,'His family',0),
(91,23,'His own personal sun',1),
(92,23,'A specific weapon',0),
(93,24,'Mohg',0),
(94,24,'Morgott',0),
(95,24,'Miquella',1),
(96,24,'Godwyn',0),
(97,25,'The antagonist of \"Dark Souls 2\"',0),
(98,25,'The protagonist of \"Bloodborne\"',0),
(99,25,'The protagonist of \"Dark Souls 1\"',1),
(100,25,'The protagonist of \"Elden Ring\"',0),
(101,26,'Pontiff Sulyvahn',0),
(102,26,'Crystal Sage',1),
(103,26,'Abyss Watchers',0),
(104,26,'Aldrich, Devourer of Gods',0),
(105,27,'Iudex Gundyr',0),
(106,27,'Curse-Rotted Greatwood',1),
(107,27,'Vordt of the Boreal Valley',0),
(108,27,'Wolnir',0),
(109,28,'Ancient Wyvern',1),
(110,28,'Dancer of the Boreal Valley',0),
(111,28,'Dragonslayer Armour',0),
(112,28,'Champion Gundyr',0),
(113,29,'Yhorm the Giant',1),
(114,29,'Abyss Watchers',0),
(115,29,'Nameless King',0),
(116,29,'Aldrich, Devourer of Gods',0),
(117,30,'Deacons of the Deep',1),
(118,30,'Pontiff Sulyvahn',0),
(119,30,'High Lord Wolnir',0),
(120,30,'Oceiros, the Consumed King',0),
(121,31,'The Pursuer',0),
(122,31,'The Last Giant',1),
(123,31,'The Rotten',0),
(124,31,'Executioner\'s Chariot',0),
(125,32,'Looking Glass Knight',1),
(126,32,'Old Iron King',0),
(127,32,'The Duke\'s Dear Freja',0),
(128,32,'Smelter Demon',0),
(129,33,'Giant Lord',1),
(130,33,'The Rotten',0),
(131,33,'Velstadt, The Royal Aegis',0),
(132,33,'Throne Defender',0),
(133,34,'Executioner\'s Chariot',1),
(134,34,'Covetous Demon',0),
(135,34,'Skeleton Lords',0),
(136,34,'Royal Rat Authority',0),
(137,35,'The Duke\'s Dear Freja',1),
(138,35,'Covetous Demon',0),
(139,35,'Old Iron King',0),
(140,35,'Lost Sinner',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES
(1,'Which Of The Following Locations Is In Multiple Dark Souls Games?'),
(2,'Which Stat Would A Sorcery User Typically Prioritise?'),
(3,'In Dark Souls Lore, What Is The Dragons\' Crucial Weakness?'),
(4,'Which Dark Souls Weapon Made An Appearance In Bloodborne?'),
(5,'Which Of The Following Is A Covenant That Only Appears In Dark Souls II?'),
(6,'What Did Seath The Scaleless Steal According To Dark Souls Lore?'),
(7,'\'Unbreakable Patches\' Is A Character In Which Dark Souls Game?'),
(8,'What Is The Maximum Soul Level In Dark Souls III?'),
(9,'Which Boss Is Named \'High Lord\'?'),
(10,'On PlayStation, What Button Is Parry?'),
(11,'What Is The Starting Location Of The Player In Dark Souls II?'),
(12,'The Player-Character Of Dark Souls Is Known As The \'Chosen\' What?'),
(13,'In Dark Souls III, How Does Hollowing Impact The Player\'s Stats?'),
(14,'Which Of The Following Is NOT A Starting Gift In Any Of The Three Games?'),
(15,'What name is the player character known by in Elden Ring?'),
(16,'Who helped write Elden Ring\'s story?'),
(17,'What is the name of your mount in the game?'),
(18,'In Which year did Elden Ring win Game of The Year award?'),
(19,'Which of these is not a VideoGame made by the Developers of Elden Ring?'),
(20,'Which Character in the Elden Ring grants the Mending Rune of the Death-Prince?'),
(21,'Released in 2009, what is the name of the video game from FromSoftware that was a precursor to the \"Dark Souls\" series?'),
(22,'What is the first location in \"Dark Souls 2\"?'),
(23,'What is Solaire looking for throughout the game?'),
(24,'Who is not a son of Godfrey in Elden Ring?'),
(25,'In \"Dark Souls 3\", who is one of the important characters that makes up the Soul of Cinder?'),
(26,'Which boss in Dark Souls 3 can be parried, but only early in the fight before they start using spells?'),
(27,'Which of the following bosses requires defeating in order to perform Soul Transposition with Ludleth of Courland?'),
(28,'Which boss in Dark Souls 3 becomes vulnerable to plunging attacks during the fight?'),
(29,'Which boss fight in Dark Souls 3 features an NPC summon if the player completes the related questline?'),
(30,'Which boss is encountered in the Cathedral of the Deep and is weak to Slash, Thrust, and Strike damage?'),
(31,'Which boss in Dark Souls 2 will detach its arm and use it as a weapon once it reaches about 50% health?'),
(32,'Which boss in Dark Souls 2 can summon NPCs or invaders during the fight using its mirror shield?'),
(33,'Which boss must be fought to access the Memory of Jeigh, and has a moveset similar to The Last Giant?'),
(34,'Which boss uses a chariot pulled by horses and requires the player to pull a lever to knock the charioteer off?'),
(35,'Which boss is vulnerable to lightning, magic, and dark attacks, and guards a Primal Bonfire in Brightstone Cove Tseldora?');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-06 23:01:54
