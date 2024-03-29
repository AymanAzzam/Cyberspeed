CREATE DATABASE IF NOT EXISTS `marvel` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `marvel`;

CREATE TABLE `superheroes` (
  `superhero_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `color` varchar(30) NOT NULL,
  `noOfMovies` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `superheroes`
  ADD PRIMARY KEY (`superhero_id`);

ALTER TABLE `superheroes`
  MODIFY `superhero_id` int(11) NOT NULL AUTO_INCREMENT;