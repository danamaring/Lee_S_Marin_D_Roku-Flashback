-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql
-- Tiempo de generación: 12-04-2020 a las 00:41:01
-- Versión del servidor: 10.3.21-MariaDB-1:10.3.21+maria~bionic
-- Versión de PHP: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_roku`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_arating`
--

CREATE TABLE `tbl_arating` (
  `arating_id` smallint(5) UNSIGNED NOT NULL,
  `arating_name` varchar(125) NOT NULL,
  `arating_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_arating`
--

INSERT INTO `tbl_arating` (`arating_id`, `arating_name`, `arating_desc`) VALUES
(1, 'G', 'G – General Audiences\r\nAll ages admitted. Nothing that would offend parents for viewing by children. '),
(2, 'PG', 'PG – Parental Guidance Suggested\r\nSome material may not be suitable for children. Parents urged to give  	&ldquo;parental guidance&rdquo;. '),
(3, 'PG-13', 'PG-13 – Parents Strongly Cautioned\r\nSome material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.'),
(4, 'R', 'R – Restricted\r\nUnder 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them. '),
(5, 'NC-17', 'NC-17 – Adults Only\r\nNo One 17 and Under Admitted. Clearly adult. Children are not admitted. ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_artist`
--

CREATE TABLE `tbl_artist` (
  `artist_id` smallint(5) UNSIGNED NOT NULL,
  `artist_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_artist`
--

INSERT INTO `tbl_artist` (`artist_id`, `artist_name`) VALUES
(1, 'The Beatles'),
(2, 'Guns N\' Roses'),
(3, 'Wham!'),
(4, 'Spice Girls'),
(5, 'The Rolling Stones'),
(6, 'a-ha'),
(7, 'Smash Mouth'),
(8, 'Britney Spears');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comments_id` mediumint(8) UNSIGNED NOT NULL,
  `comments_auth` varchar(125) NOT NULL,
  `comments_copy` text NOT NULL,
  `comments_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_director`
--

CREATE TABLE `tbl_director` (
  `director_id` smallint(5) UNSIGNED NOT NULL,
  `director_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_director`
--

INSERT INTO `tbl_director` (`director_id`, `director_name`) VALUES
(1, 'Alfred Hitchcock'),
(2, 'Tim Burton'),
(3, 'Steven Spielberg'),
(4, 'Roberto Benigni'),
(5, 'Roger Michell'),
(6, 'Stanley Kubrick'),
(7, 'James Cameron'),
(8, 'Jerry Zucker'),
(9, 'William Wyler'),
(10, 'Clyde Geronimi, Wilfred Jackson, Hamilton Luske'),
(11, 'Robert Stevenson'),
(12, 'Mel Stuart'),
(13, 'John Lasseter');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_genre`
--

CREATE TABLE `tbl_genre` (
  `genre_id` tinyint(3) UNSIGNED NOT NULL,
  `genre_name` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_genre`
--

INSERT INTO `tbl_genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Comedy'),
(4, 'Drama'),
(5, 'Horror'),
(6, 'Science Ficition'),
(7, 'Animation'),
(8, 'Family'),
(9, 'Fantasy'),
(10, 'Romance'),
(11, 'Pop'),
(12, 'Dance'),
(13, 'Rock'),
(14, 'Folk'),
(15, 'Music'),
(16, 'Cartoon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_cover` varchar(75) NOT NULL,
  `movies_title` varchar(125) NOT NULL,
  `movies_year` varchar(5) NOT NULL,
  `movies_runtime` varchar(25) NOT NULL,
  `movies_storyline` text NOT NULL,
  `movies_trailer` varchar(75) NOT NULL,
  `movies_release` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_cover`, `movies_title`, `movies_year`, `movies_runtime`, `movies_storyline`, `movies_trailer`, `movies_release`) VALUES
(1, 'psycho.jpg', 'Psycho', '1960', '1h 49m', 'Marion disappears after stealing money from her employer. Her lover and sister try to find her and end up reaching the infamous Bates Motel, where they meet Norman Bates.', 'psycho.mp4', 'June 16, 1960'),
(2, 'scissorhands.jpg', 'Edward Scissorhands', '1990', '2h 5m', 'Edward, a synthetic man with scissor hands, is taken in by Peg, a kindly Avon lady, after the passing of his inventor. Things take a turn for the worse when he is blamed for a crime he did not commit.', 'scissorhands.mp4', 'December 6, 1990'),
(3, 'et.jpg', 'E.T. the Extra-Terrestrial', '1982', '2h 1m', 'An alien is left behind on Earth and is saved by young Elliot who decides to keep him hidden. While the task force hunts for it, Elliot and his siblings form an emotional bond with their new friend.', 'et.mp4', 'June 10, 1982'),
(4, 'life.jpg', 'Life Is Beautiful', '1997', '2h 2m', 'A Jewish father and his family are surrounded by Nazi death camps. Living in a hostile environment, he uses humor to shield his young son from the grim realities of war.', 'life.mp4', 'November 6, 1998'),
(5, 'notting.jpg', 'Notting Hill', '1999', '2h 4m', 'William, a British bookseller, meets and falls in love with Anna, a high-profile American actress. However, their relationship goes through many problems due to their different social statuses.', 'notting.mp4', 'May 13, 1999'),
(6, 'shining.jpg', 'The Shining', '1980', '2h 26m', 'Jack and his family move into an isolated hotel with a violent past. Living in isolation, Jack begins to lose his sanity, which affects his family members.', 'shining.mp4', 'May 23, 1980'),
(7, 'titanic.jpg', 'Titanic', '1997', '3h 15m', 'Seventeen-year-old Rose hails from an aristocratic family and is set to be married. When she boards the Titanic, she meets Jack Dawson, an artist, and falls in love with him.', 'titanic.mp4', 'November 18, 1997'),
(8, 'ghost.jpg', 'Ghost', '1990', '2h 9m', 'Sam and Molly love each other, but their romance is short-lived when Sam is killed by a thug. Unable to tell Molly that her life is in danger, Sam\'s spirit takes help of a psychic.', 'ghost.mp4', 'July 13, 1990'),
(9, 'romanholiday.jpg', 'Roman Holiday', '1953', '1h 58m', 'Stuck with boredom in her luxurious confinement, a princess escapes from her guardians and falls in love with an American news reporter in Rome.', 'romanholiday.mp4', 'August 20, 1953'),
(10, 'jaws.jpg', 'Jaws', '1975', '2h 10m', 'A police chief, a marine scientist and a fisherman spring into action after a white shark terrorises the inhabitants of Amity, a quiet island.', 'jaws.mp4', 'July 31, 1975');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_movies_kids`
--

CREATE TABLE `tbl_movies_kids` (
  `movies_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_cover` varchar(75) NOT NULL,
  `movies_title` varchar(125) NOT NULL,
  `movies_year` varchar(5) NOT NULL,
  `movies_runtime` varchar(25) NOT NULL,
  `movies_storyline` text NOT NULL,
  `movies_trailer` varchar(75) NOT NULL,
  `movies_release` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_movies_kids`
--

INSERT INTO `tbl_movies_kids` (`movies_id`, `movies_cover`, `movies_title`, `movies_year`, `movies_runtime`, `movies_storyline`, `movies_trailer`, `movies_release`) VALUES
(11, 'cinderella.jpg', 'Cinderella', '1950', '1h 16m', 'When Cinderella\'s dream of attending the Royal Ball and meeting the Grand Duke is hindered by her cruel stepmother, she gets some astounding help from her Fairy Godmother.', 'cinderella.mp4', 'February 22, 1950'),
(12, 'marypoppins.jpg', 'Mary Poppins', '1964', '2h 19m', 'Mr Banks is looking for a nanny for his two mischievous children and comes across Mary Poppins, an angelic nanny. She not only brings a change in their lives but also spreads happiness.', 'marypoppins.mp4', 'August 27, 1964'),
(13, 'chocolate.jpg', 'Willy Wonka & the Chocolate Factory', '1971', '1h 29m', 'A factory owner gives 5 children a chance to win a lifetime supply of sweets. Charlie, along with four odious children enter the factory. Disasters befall each of the children. Will Charlie survive?', 'chocolate.mp4', 'June 30, 1971'),
(14, 'toystory.jpg', 'Toy Story', '1995', '1h 21m', 'Andy\'s favourite toy, Woody, is worried that after Andy receives his birthday gift, a new toy called Buzz Lightyear, his importance may get reduced. He thus hatches a plan to eliminate Buzz.', 'toystory.mp4', 'November 22, 1995');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mov_director`
--

CREATE TABLE `tbl_mov_director` (
  `mov_director_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(9) NOT NULL,
  `director_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_mov_director`
--

INSERT INTO `tbl_mov_director` (`mov_director_id`, `movies_id`, `director_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 3),
(11, 11, 10),
(12, 12, 11),
(13, 13, 12),
(14, 14, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mov_genre`
--

CREATE TABLE `tbl_mov_genre` (
  `mov_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `movies_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_mov_genre`
--

INSERT INTO `tbl_mov_genre` (`mov_genre_id`, `movies_id`, `genre_id`) VALUES
(1, 1, 5),
(2, 2, 9),
(3, 2, 10),
(4, 3, 6),
(5, 3, 8),
(6, 4, 3),
(7, 5, 3),
(8, 5, 10),
(9, 6, 5),
(10, 7, 4),
(11, 7, 10),
(12, 8, 9),
(13, 8, 10),
(14, 9, 10),
(15, 10, 5),
(16, 11, 7),
(17, 11, 9),
(18, 12, 8),
(19, 12, 15),
(20, 13, 8),
(21, 13, 15),
(22, 14, 7),
(23, 14, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_music`
--

CREATE TABLE `tbl_music` (
  `music_id` mediumint(8) UNSIGNED NOT NULL,
  `music_cover` varchar(75) NOT NULL,
  `music_title` varchar(125) NOT NULL,
  `music_year` varchar(5) NOT NULL,
  `music_lyrics` text NOT NULL,
  `music_audio` varchar(125) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_music`
--

INSERT INTO `tbl_music` (`music_id`, `music_cover`, `music_title`, `music_year`, `music_lyrics`, `music_audio`) VALUES
(1, 'wakeme.jpg', 'Wake Me Up Before You Go Go', '1984', 'Jitterbug\r\nJitterbug\r\nJitterbug\r\nJitterbug\r\nYou put the boom boom into my heart (hoo, hoo)\r\nYou send my soul sky high when your lovin\' starts\r\nJitterbug into my brain (yeah, yeah)\r\nGoes a bang-bang-bang \'til my feet do the same\r\nBut something\'s bugging you (ha-ha, ha-ha)\r\nSomething ain\'t right (ha-ha, ha-ha)\r\nMy best friend told me what you did last night (ha-ha, ha-ha)\r\nLeft me sleepin\' in my bed (ha-ha, ha-ha)\r\nI was dreaming, but I should have been with you instead (ha-ha)\r\nWake me up before you go-go\r\nDon\'t leave me hanging on like a yo-yo\r\nWake me up before you go-go\r\nI don\'t want to miss it when you hit that high\r\nWake me up before you go-go\r\n\'Cause I\'m not plannin\' on going solo\r\nWake me up before you go-go\r\nTake me dancing tonight\r\nI wanna hit that high (yeah, yeah)\r\nYou take the grey skies out of my way (hoo, hoo)\r\nYou make the sun shine brighter than Doris Day\r\nTurned a bright spark into a flame (yeah, yeah)\r\nMy beats per minute never been the same\r\n\'Cause you\'re my lady, I\'m your fool (ha-ha, ha-ha)\r\nIt makes me crazy when you act so cruel (ha-ha, ha-ha)\r\nCome on, baby, let\'s not fight (ha-ha, ha-ha)\r\nWe\'ll go dancing, everything will be all right (ha-ha)\r\nWake me up before you go-go\r\nDon\'t leave me hanging on like a yo-yo\r\nWake me up before you go-go\r\nI don\'t want to miss it when you hit that high\r\nWake me up before you go-go\r\n\'Cause I\'m not plannin\' on going solo\r\nWake me up before you go-go\r\nTake me dancing tonight\r\nI wanna hit that high (yeah, yeah, yeah)\r\nJitterbug (baby)\r\nJitterbug (woo)\r\nCuddle up, baby, move in tight\r\nWe\'ll go dancing tomorrow night\r\nIt\'s cold out there, but it\'s warm in bed\r\nThey can dance, we\'ll stay home instead\r\nJitterbug\r\nWake me up before you go-go\r\nDon\'t leave me hanging on like a yo-yo\r\nWake me up before you go-go\r\nI don\'t want to miss it when you hit that high\r\nWake me up before you go-go\r\n\'Cause I\'m not plannin\' on going solo\r\nWake me up before you go-go\r\nTake me dancing tonight\r\nWake me up before you go-go (don\'t you dare)\r\nDon\'t leave me hanging on like a yo-yo\r\n(Leave me hanging on like a yo-yo, yo-yo, yo)\r\nWake me up before you go-go\r\nI don\'t want to miss it when you hit that high\r\n(Take me dancing)\r\n(A boom-boom-boom-boom, oh)\r\nWake me up before you go-go\r\n\'Cause I\'m not plannin\' on going solo\r\n(A boom-boom-boom-boom)\r\nWake me up before you go-go (ah)\r\n(Yeah, yeah, yeah)\r\nTake me dancing tonight\r\nOoh ah\r\nYeah', 'wakeme.mp3'),
(2, 'heyjude.jpg', 'Hey Jude', '1968', 'Hey Jude, don\'t make it bad\r\nTake a sad song and make it better\r\nRemember to let her into your heart\r\nThen you can start to make it better\r\nHey Jude, don\'t be afraid\r\nYou were made to go out and get her\r\nThe minute you let her under your skin\r\nThen you begin to make it better\r\nAnd anytime you feel the pain\r\nHey Jude, refrain\r\nDon\'t carry the world upon your shoulders\r\nFor well you know that it\'s a fool\r\nWho plays it cool\r\nBy making his world a little colder\r\nNa-na-na, na, na\r\nNa-na-na, na\r\nHey Jude, don\'t let me down\r\nYou have found her, now go and get her (let it out and let it in)\r\nRemember to let her into your heart (hey Jude)\r\nThen you can start to make it better\r\nSo let it out and let it in\r\nHey Jude, begin\r\nYou\'re waiting for someone to perform with\r\nAnd don\'t you know that it\'s just you\r\nHey Jude, you\'ll do\r\nThe movement you need is on your shoulder\r\nNa-na-na, na, na\r\nNa-na-na, na, yeah\r\nHey Jude, don\'t make it bad\r\nTake a sad song and make it better\r\nRemember to let her under your skin\r\nThen you\'ll begin to make it better\r\nBetter better better better better, ah!\r\nNa, na, na, na-na-na na (yeah! Yeah, yeah, yeah, yeah, yeah, yeah)\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude (Jude Jude, Judy Judy Judy Judy, ow wow!)\r\nNa, na, na, na-na-na na (my, my, my)\r\nNa-na-na na, hey Jude (Jude, Jude, Jude, Jude, Jude)\r\nNa, na, na, na-na-na na (yeah, yeah, yeah)\r\nNa-na-na na, hey Jude (yeah, you know you can make it, Jude, Jude, you\'re not gonna break it)\r\nNa, na, na, na-na-na na (don\'t make it bad, Jude, take a sad song and make it better)\r\nNa-na-na na, hey Jude (oh Jude, Jude, hey Jude, wa!)\r\nNa, na, na, na-na-na na (oh Jude)\r\nNa-na-na na, hey Jude (hey, hey, hey, hey)\r\nNa, na, na, na-na-na na (hey, hey)\r\nNa-na-na na, hey Jude (now, Jude, Jude, Jude, Jude, Jude)\r\nNa, na, na, na-na-na na (Jude, yeah, yeah, yeah, yeah)\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude (na-na-na-na-na-na-na-na-na)\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na (yeah, make it, Jude)\r\nNa-na-na na, hey Jude (yeah yeah yeah yeah yeah! Yeah! Yeah! Yeah! Yeah!)\r\nNa, na, na, na-na-na na (yeah, yeah yeah, yeah! Yeah! Yeah!)\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude\r\nNa, na, na, na-na-na na\r\nNa-na-na na, hey Jude', 'heyjude.mp3'),
(3, 'angie.jpg', 'Angie', '1973', 'Angie, Angie\r\nWhen will those dark clouds all disappear\r\nAngie, Angie\r\nWhere will it lead us from here\r\nWith no lovin\' in our souls\r\nAnd no money in our coats\r\nYou can\'t say we\'re satisfied\r\nAngie, Angie\r\nYou can\'t say we never tried\r\nAngie, you\'re beautiful\r\nBut ain\'t it time we say goodbye\r\nAngie, I still love you\r\nRemember all those nights we cried\r\nAll the dreams were held so close\r\nSeemed to all go up in smoke\r\nLet me whisper in your ear\r\nAngie, Angie\r\nWhere will it lead us from here\r\nOh, Angie, don\'t you wish\r\nOh your kisses still taste sweet\r\nI hate that sadness in your eyes\r\nBut Angie\r\nAngie\r\nAin\'t it time we said goodbye\r\nWith no lovin\' in our souls\r\nAnd no money in our coats\r\nYou can\'t say we\'re satisfied\r\nAngie, I still love you baby\r\nEverywhere I look I see your eyes\r\nThere ain\'t a woman that comes close to you\r\nCome on baby dry your eyes\r\nAngie, Angie ain\'t good to be alive\r\nAngie, Angie, we can\'t say we never tried', 'angie.mp3'),
(4, 'baby.jpg', '...Baby One More Time', '1998', 'Oh baby, baby\r\nOh baby, baby\r\nOh baby, baby, how was I supposed to know\r\nThat something wasn\'t right here?\r\nOh baby, baby, I shouldn\'t have let you go\r\nAnd now you\'re out of sight, yeah\r\nShow me how want it to be\r\nTell me, baby, \'cause I need to know now, oh because\r\nMy loneliness is killing me (and I)\r\nI must confess I still believe (still believe)\r\nWhen I\'m not with you I lose my mind\r\nGive me a sign\r\nHit me, baby, one more time\r\nOh baby, baby\r\nThe reason I breathe is you\r\nBoy, you got me blinded\r\nOh, pretty baby\r\nThere\'s nothing that I wouldn\'t do\r\nIt\'s not the way I planned it\r\nShow me how you want it to be\r\nTell me, baby, \'cause I need to know now, oh because\r\nMy loneliness is killing me (and I)\r\nI must confess I still believe (still believe)\r\nWhen I\'m not with you I lose my mind\r\nGive me a sign\r\nHit me, baby, one more time\r\nOh baby, baby (oh oh)\r\nOh baby, baby (yeah)\r\nOh baby, baby, how was I supposed to know?\r\nOh pretty baby, I shouldn\'t have let you go\r\nI must confess, that my loneliness is killing me now\r\nDon\'t you know I still believe\r\nThat you will be here\r\nAnd give me a sign\r\nHit me, baby, one more time\r\nMy loneliness is killing me (and I)\r\nI must confess I still believe (still believe)\r\nWhen I\'m not with you I lose my mind\r\nGive me a sign\r\nHit me, baby\r\nI must confess, that my loneliness is killing me now\r\nDon\'t you know I still believe\r\nThat you will be here\r\nAnd give me a sign\r\nHit me, baby, one more time', 'baby.mp3'),
(5, 'sweet.jpg', 'Sweet Child O\' Mine', '1987', 'She\'s got a smile that it seems to me\r\nReminds me of childhood memories\r\nWhere everything was as fresh as the bright blue sky\r\nNow and then when I see her face\r\nShe takes me away to that special place\r\nAnd if I stare too long, I\'d probably break down and cry\r\nWhoa, oh, oh\r\nSweet child o\' mine\r\nWhoa, oh, oh, oh\r\nSweet love of mine\r\nShe\'s got eyes of the bluest skies\r\nAs if they thought of rain\r\nI\'d hate to look into those eyes and see an ounce of pain\r\nHer hair reminds me of a warm safe place\r\nWhere as a child I\'d hide\r\nAnd pray for the thunder and the rain to quietly pass me by\r\nWhoa, oh, oh\r\nSweet child o\' mine\r\nWhoa whoa, oh, oh, oh\r\nSweet love of mine\r\nWhoa, yeah\r\nWhoa, oh, oh, oh\r\nSweet child o\' mine\r\nWhoa, oh, whoa, oh\r\nSweet love of mine\r\nWhoa, oh, oh, oh\r\nSweet child o\' mine\r\nOoh, yeah\r\nOoh, sweet love of mine\r\nWhere do we go?\r\nWhere do we go now?\r\nWhere do we go?\r\nOoh, oh, where do we go?\r\nWhere do we go now?\r\nOh, where do we go now?\r\nWhere do we go? (Sweet child)\r\nWhere do we go now?\r\nAy, ay, ay, ay, ay, ay, ay, ay\r\nWhere do we go now?\r\nAh-ah\r\nWhere do we go?\r\nOh, where do we go now?\r\nOh, where do we go?\r\nOh, where do we go now?\r\nWhere do we go?\r\nOh, where do we go now?\r\nNow, now, now, now, now, now, now\r\nSweet child\r\nSweet child of mine', 'sweet.mp3'),
(6, 'wannabe.jpg', 'Wannabe', '1996', 'Ha ha ha ha ha\r\nYo, I\'ll tell you what I want, what I really, really want\r\nSo tell me what you want, what you really, really want\r\nI\'ll tell you what I want, what I really, really want\r\nSo tell me what you want, what you really, really want\r\nI wanna, (ha) I wanna, (ha) I wanna, (ha) I wanna, (ha)\r\nI wanna really, really, really wanna zigazig ah\r\nIf you want my future, forget my past\r\nIf you wanna get with me, better make it fast\r\nNow don\'t go wasting my precious time\r\nGet your act together we could be just fine\r\nI\'ll tell you what I want, what I really, really want\r\nSo tell me what you want, what you really, really want\r\nI wanna, (ha) I wanna, (ha) I wanna, (ha) I wanna, (ha)\r\nI wanna really, really, really wanna zigazig ah\r\nIf you wanna be my lover, you gotta get with my friends\r\n(Gotta get with my friends)\r\nMake it last forever, friendship never ends\r\nIf you wanna be my lover, you have got to give\r\nTaking is too easy, but that\'s the way it is\r\nOh, what do you think about that\r\nNow you know how I feel\r\nSay, you can handle my love, are you for real\r\n(Are you for real)\r\nI won\'t be hasty, I\'ll give you a try\r\nIf you really bug me then I\'ll say goodbye\r\nYo I\'ll tell you what I want, what I really, really want\r\nSo tell me what you want, what you really, really want\r\nI wanna, (ha) I wanna, (ha) I wanna, (ha) I wanna, (ha)\r\nI wanna really, really, really wanna zigazig ah\r\nIf you wanna be my lover, you gotta get with my friends\r\n(Gotta get with my friends)\r\nMake it last forever, friendship never ends\r\nIf you wanna be my lover, you have got to give\r\n(You\'ve got to give)\r\nTaking is too easy, but that\'s the way it is\r\nSo, here\'s a story from A to Z\r\nYou wanna get with me, you gotta listen carefully\r\nWe got Em in the place who likes it in your face\r\nYou got G like MC who likes it on a\r\nEasy V doesn\'t come for free, she\'s a real lady\r\nAnd as for me, ha you\'ll see\r\nSlam your body down and wind it all around\r\nSlam your body down and wind it all around\r\nIf you wanna be my lover, you gotta get with my friends\r\n(Gotta get with my friends)\r\nMake it last forever, friendship never ends\r\nIf you wanna be my lover, you have got to give\r\n(You\'ve got to give)\r\nTaking is too easy, but that\'s the way it is\r\nIf you wanna be my lover\r\nYou gotta, you gotta, you gotta, you gotta, you gotta\r\nSlam, slam, slam, slam (make it last forever)\r\nSlam your body down and wind it all around\r\nSlam your body down and wind it all around\r\nHa, ha, ha, ha, ha\r\nSlam your body down and wind it all around\r\nSlam your body down and zigazig ah\r\nIf you wanna be my lover', 'wannabe.mp3'),
(7, 'takeonme.jpg', 'Take On Me', '1985', 'We\'re talking away\r\nI don\'t know what\r\nI\'m to say I\'ll say it anyway\r\nToday\'s another day to find you\r\nShying away\r\nI\'ll be coming for your love, okay?\r\nTake on me (take on me)\r\nTake me on (take on me)\r\nI\'ll be gone\r\nIn a day or two\r\nSo needless to say\r\nI\'m odds and ends\r\nBut I\'ll be stumbling away\r\nSlowly learning that life is okay\r\nSay after me\r\nIt\'s no better to be safe than sorry\r\nTake on me (take on me)\r\nTake me on (take on me)\r\nI\'ll be gone\r\nIn a day or two', 'takeonme.mp3'),
(8, 'allstars.jpg', 'All Stars', '1999', 'Somebody once told me the world is gonna roll me\r\nI ain\'t the sharpest tool in the shed\r\nShe was looking kind of dumb with her finger and her thumb\r\nIn the shape of an \"L\" on her forehead\r\nWell the years start coming and they don\'t stop coming\r\nFed to the rules and I hit the ground running\r\nDidn\'t make sense not to live for fun\r\nYour brain gets smart but your head gets dumb\r\nSo much to do, so much to see\r\nSo what\'s wrong with taking the back streets?\r\nYou\'ll never know if you don\'t go\r\nYou\'ll never shine if you don\'t glow\r\nHey now, you\'re an all-star, get your game on, go play\r\nHey now, you\'re a rock star, get the show on, get paid\r\nAnd all that glitters is gold\r\nOnly shooting stars break the mold\r\nIt\'s a cool place and they say it gets colder\r\nYou\'re bundled up now, wait till you get older\r\nBut the meteor men beg to differ\r\nJudging by the hole in the satellite picture\r\nThe ice we skate is getting pretty thin\r\nThe water\'s getting warm so you might as well swim\r\nMy world\'s on fire, how about yours?\r\nThat\'s the way I like it and I never get bored\r\nHey now, you\'re an all-star, get your game on, go play\r\nHey now, you\'re a rock star, get the show on, get paid\r\nAll that glitters is gold\r\nOnly shooting stars break the mold\r\nHey now, you\'re an all-star, get your game on, go play\r\nHey now, you\'re a rock star, get the show, on get paid\r\nAnd all that glitters is gold\r\nOnly shooting stars\r\nSomebody once asked could I spare some change for gas?\r\nI need to get myself away from this place\r\nI said yep what a concept\r\nI could use a little fuel myself\r\nAnd we could all use a little change\r\nWell, the years start coming and they don\'t stop coming\r\nFed to the rules and I hit the ground running\r\nDidn\'t make sense not to live for fun\r\nYour brain gets smart but your head gets dumb\r\nSo much to do, so much to see\r\nSo what\'s wrong with taking the back streets?\r\nYou\'ll never know if you don\'t go (go!)\r\nYou\'ll never shine if you don\'t glow\r\nHey now, you\'re an all-star, get your game on, go play\r\nHey now, you\'re a rock star, get the show on, get paid\r\nAnd all that glitters is gold\r\nOnly shooting stars break the mold\r\nAnd all that glitters is gold\r\nOnly shooting stars break the mold', 'allstars.mp3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mu_artist`
--

CREATE TABLE `tbl_mu_artist` (
  `mu_artist_id` mediumint(8) UNSIGNED NOT NULL,
  `music_id` mediumint(9) NOT NULL,
  `artist_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_mu_artist`
--

INSERT INTO `tbl_mu_artist` (`mu_artist_id`, `music_id`, `artist_id`) VALUES
(1, 1, 3),
(2, 2, 1),
(3, 3, 5),
(4, 4, 8),
(5, 5, 2),
(6, 6, 4),
(7, 7, 6),
(8, 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_mu_genre`
--

CREATE TABLE `tbl_mu_genre` (
  `mu_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `music_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_mu_genre`
--

INSERT INTO `tbl_mu_genre` (`mu_genre_id`, `music_id`, `genre_id`) VALUES
(1, 1, 11),
(2, 2, 13),
(3, 2, 14),
(4, 3, 13),
(5, 4, 11),
(6, 4, 12),
(7, 5, 13),
(8, 6, 11),
(9, 6, 12),
(10, 7, 11),
(11, 8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tv`
--

CREATE TABLE `tbl_tv` (
  `tv_id` mediumint(8) UNSIGNED NOT NULL,
  `tv_cover` varchar(75) NOT NULL,
  `tv_title` varchar(125) NOT NULL,
  `tv_year` varchar(5) NOT NULL,
  `tv_storyline` text NOT NULL,
  `tv_trailer` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tv`
--

INSERT INTO `tbl_tv` (`tv_id`, `tv_cover`, `tv_title`, `tv_year`, `tv_storyline`, `tv_trailer`) VALUES
(2, 'fullhouse.jpg', 'Full House', '1987', 'Danny is a widower who is raising his three little girls after the death of his wife. But he has help from his musician brother-in-law, Jesse Katsopolis, and his best friend, comedian Joey Gladstone.', 'fullhouse.mp4'),
(3, 'simpsons.jpg', 'The Simpsons', '1989', 'Working-class father Homer Simpson and his dysfunctional family deal with comical situations and the ups-and-downs of life in the town of Springfield.', 'simpsons.mp4'),
(4, 'bugsbunnyshow.jpg', 'The Bugs Bunny Show', '1960', 'Frenzied, frantic fun with the cheeky, crafty, carrot-chomping, wise-cracking Bugs Bunny.', 'bugsbunnyshow.mp4'),
(5, 'friends.jpg', 'Friends', '1994', 'Follow the lives of six reckless adults living in Manhattan, as they indulge in adventures which make their lives both troublesome and happening.', 'friends.mp4'),
(6, 'startrek.jpg', 'Star Trek: The Original Series', '1966', 'James T Kirk, who is the captain of the Starship Enterprise, explores the whole galaxy with his crew and goes on several adventures as they fight evil forces together.', 'startrek.mp4'),
(7, 'happydays.jpg', 'Happy Days', '1974', 'Set in 1950s and 1960s Milwaukee, this series tells the story of the Cunningham family -- father Howard, mother Marion, son Richie and daughter Joanie. Howard owns a hardware store, while Marion stays at home. Richie\'s best friends are Potsie and Ralph. Arthur \"Fonzie\" Fonzarelli is the local bad boy, riding a motorcycle and filling his days with fixing cars and dating girls. During the show\'s run, Richie leaves home to join the U.S. Army.', 'happydays.mp4'),
(8, 'tyler.jpg', 'The Mary Tyler Moore Show', '1970', 'Mary Richards, a single career-oriented woman, moves to Minneapolis after she separates from her partner. She gets a new job but continues to struggle with romance.', 'tyler.mp4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tv_genre`
--

CREATE TABLE `tbl_tv_genre` (
  `tv_genre_id` mediumint(8) UNSIGNED NOT NULL,
  `tv_id` mediumint(9) NOT NULL,
  `genre_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tv_genre`
--

INSERT INTO `tbl_tv_genre` (`tv_genre_id`, `tv_id`, `genre_id`) VALUES
(1, 1, 3),
(2, 2, 4),
(3, 3, 15),
(4, 4, 3),
(5, 5, 10),
(6, 6, 4),
(7, 7, 3),
(8, 8, 3),
(9, 9, 16),
(10, 10, 3),
(11, 11, 3),
(12, 12, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tv_kids`
--

CREATE TABLE `tbl_tv_kids` (
  `tv_id` mediumint(8) UNSIGNED NOT NULL,
  `tv_cover` varchar(75) NOT NULL,
  `tv_title` varchar(125) NOT NULL,
  `tv_year` varchar(5) NOT NULL,
  `tv_storyline` text NOT NULL,
  `tv_trailer` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_tv_kids`
--

INSERT INTO `tbl_tv_kids` (`tv_id`, `tv_cover`, `tv_title`, `tv_year`, `tv_storyline`, `tv_trailer`) VALUES
(9, 'pink.jpg', 'The Pink Panther Show', '1969', 'The Pink Panther Show is a showcase of animated shorts produced by David H. DePatie and Friz Freleng between 1969 and 1978, starring the animated Pink Panther character from the opening credits of the live-action films.', 'pink.mp4'),
(10, 'chipmunks.jpg', 'Alvin and the Chipmunks', '1983', 'Three chipmunk brothers, Alvin, Simon and Theodore drive their manager crazy.', 'chipmunks.mp4'),
(11, 'snoopy.jpg', 'The Charlie Brown and Snoopy Show', '1983', 'The animated adventures of Charlie Brown, Snoopy and the rest of the Peanuts gang.', 'snoopy.mp4'),
(12, 'bus.jpg', 'The Magic School Bus', '1994', 'Scholastic\'s \"The Magic School Bus\" follows Ms. Frizzle and her class as they set off on field trips. Based on the best-selling book series of the same name, \"The Magic School Bus\" takes kids on a virtual bus ride. Magically transforming into a plane, submarine, spaceship or surfboard, this bus carries Ms. Frizzle and her students on super adventures and teaches them about science.', 'bus.mp4'),
(13, 'flintstones.jpg', 'The Flintstones', '1960', 'The Flintstones were the modern Stone Age family. Residing in Bedrock, Fred Flintstone worked an unsatisfying quarry job, but returned home to lovely wife Wilma and eventually daughter Pebbles. Fred, a big fan of golf and bowling, also enjoyed bullying neighbor Barney Rubble, while Barney\'s saucy wife Betty was best friends with Wilma. During the show\'s run, Barney and Betty would adopt an unnaturally strong son, Bamm-Bamm, who would become friends with little Pebbles. \"The Flintstones,\" heavily inspired by \"The Honeymooners,\" convinced a generation of children that dinosaurs and humans occupied the planet at the same time.', 'flintstones.mp4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_urating`
--

CREATE TABLE `tbl_urating` (
  `rating_id` tinyint(3) UNSIGNED NOT NULL,
  `rating_number` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `user_fname` varchar(250) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_pass` varchar(250) NOT NULL,
  `user_email` varchar(250) NOT NULL,
  `user_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_ip` varchar(50) NOT NULL,
  `user_avatar` varchar(20) DEFAULT NULL,
  `user_permission` int(11) NOT NULL,
  `user_admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fname`, `user_name`, `user_pass`, `user_email`, `user_date`, `user_ip`, `user_avatar`, `user_permission`, `user_admin`) VALUES
(1, 'Dana', 'danamaring', 'password', 'dana@email.com', '2020-04-09 22:59:25', '172.28.0.1', 'dana', 1, 1),
(2, 'Sujin', 'sujinlee', 'password', 'sujin@email.com', '2020-04-09 22:59:25', '', 'sujin', 1, 1),
(3, 'Trevor', 'trevorvanrys', 'password', 'trevor@email.com', '2020-04-09 23:01:35', '', 'trevor', 1, 1),
(4, 'Madelaine', 'user4', 'password', 'madelaine@email.com', '2020-04-09 23:01:35', '', NULL, 0, 0),
(5, 'Isabelle', 'user5', 'password', 'isabelle@email.com', '2020-04-09 23:02:32', '', NULL, 0, 0),
(6, 'Serena', 'user6', 'password', 'serena@email.com', '2020-04-09 23:02:32', '', NULL, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_arating`
--
ALTER TABLE `tbl_arating`
  ADD PRIMARY KEY (`arating_id`);

--
-- Indices de la tabla `tbl_artist`
--
ALTER TABLE `tbl_artist`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indices de la tabla `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comments_id`);

--
-- Indices de la tabla `tbl_director`
--
ALTER TABLE `tbl_director`
  ADD PRIMARY KEY (`director_id`);

--
-- Indices de la tabla `tbl_genre`
--
ALTER TABLE `tbl_genre`
  ADD PRIMARY KEY (`genre_id`);

--
-- Indices de la tabla `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indices de la tabla `tbl_movies_kids`
--
ALTER TABLE `tbl_movies_kids`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indices de la tabla `tbl_mov_director`
--
ALTER TABLE `tbl_mov_director`
  ADD PRIMARY KEY (`mov_director_id`);

--
-- Indices de la tabla `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  ADD PRIMARY KEY (`mov_genre_id`);

--
-- Indices de la tabla `tbl_music`
--
ALTER TABLE `tbl_music`
  ADD PRIMARY KEY (`music_id`);

--
-- Indices de la tabla `tbl_mu_artist`
--
ALTER TABLE `tbl_mu_artist`
  ADD KEY `mu_artist_id` (`mu_artist_id`);

--
-- Indices de la tabla `tbl_mu_genre`
--
ALTER TABLE `tbl_mu_genre`
  ADD KEY `mu_genre_id` (`mu_genre_id`);

--
-- Indices de la tabla `tbl_tv`
--
ALTER TABLE `tbl_tv`
  ADD PRIMARY KEY (`tv_id`);

--
-- Indices de la tabla `tbl_tv_genre`
--
ALTER TABLE `tbl_tv_genre`
  ADD PRIMARY KEY (`tv_genre_id`);

--
-- Indices de la tabla `tbl_tv_kids`
--
ALTER TABLE `tbl_tv_kids`
  ADD PRIMARY KEY (`tv_id`);

--
-- Indices de la tabla `tbl_urating`
--
ALTER TABLE `tbl_urating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Indices de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_artist`
--
ALTER TABLE `tbl_artist`
  MODIFY `artist_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tbl_director`
--
ALTER TABLE `tbl_director`
  MODIFY `director_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_genre`
--
ALTER TABLE `tbl_genre`
  MODIFY `genre_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_movies_kids`
--
ALTER TABLE `tbl_movies_kids`
  MODIFY `movies_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_mov_director`
--
ALTER TABLE `tbl_mov_director`
  MODIFY `mov_director_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_mov_genre`
--
ALTER TABLE `tbl_mov_genre`
  MODIFY `mov_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tbl_tv_genre`
--
ALTER TABLE `tbl_tv_genre`
  MODIFY `tv_genre_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_urating`
--
ALTER TABLE `tbl_urating`
  MODIFY `rating_id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
