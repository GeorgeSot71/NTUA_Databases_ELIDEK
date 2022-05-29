#
# TABLE STRUCTURE FOR: company
#

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `private_funding` decimal(13,2) NOT NULL CHECK (`private_funding` > 0),
  PRIMARY KEY (`abbreviation`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('AaS', '4571087.26');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('ARC', '921571.05');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('BKM', '2765387.32');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('BG', '4801208.14');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('BHK', '4306250.11');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('CaMo', '3572986.77');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('CaHe', '644154.71');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('CGr', '1308446.70');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('CrInc', '1920260.87');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('CrDu', '284248.29');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('DaLtd', '3392232.82');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('EmInc', '1062191.66');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('FCM', '423891.70');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('FaS', '4067612.53');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('GTM', '2919231.21');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('GrEr', '4536009.61');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('GrInc', '3359083.05');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('HTP', '516644.11');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('HaHe', '3742370.49');
INSERT INTO `company` (`abbreviation`, `private_funding`) VALUES ('HeRa', '3631175.45');


#
# TABLE STRUCTURE FOR: delivered
#

DROP TABLE IF EXISTS `delivered`;

CREATE TABLE `delivered` (
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_date` date NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`title`,`project_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `delivered_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Adonis Terry', 'Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be the right words,\' said poor Alice, \'it would have called him Tortoise because he was gone, and, by the way out of.', '2016-04-24', 23);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Anabelle Williamson', 'Never heard of uglifying!\' it exclaimed. \'You know what to beautify is, I suppose?\' said Alice. \'That\'s very curious.\' \'It\'s all his fancy, that: he hasn\'t got no business of MINE.\' The Queen turned.', '2003-09-25', 35);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Andre Legros', 'She said the Hatter. \'Does YOUR watch tell you more than Alice could see it trying in a tone of this pool? I am now? That\'ll be a letter, written by the Queen said severely \'Who is this?\' She said.', '2015-02-17', 50);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Araceli Witting', 'And the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is only a mouse that had slipped in like herself. \'Would it be of any that do,\' Alice hastily replied; \'at least--at least I mean.', '1996-02-13', 17);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Bradford Kulas', 'England the nearer is to do this, so that her shoulders were nowhere to be no doubt that it was the first minute or two the Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember things as I.', '1978-06-24', 7);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Bria Daugherty Sr.', 'Hatter. \'Nor I,\' said the Queen. \'Well, I should think you\'ll feel it a very truthful child; \'but little girls of her ever getting out of the Mock Turtle. \'She can\'t explain it,\' said the Gryphon:.', '1995-05-24', 21);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Damion Bednar', 'Hatter began, in a very pretty dance,\' said Alice indignantly. \'Ah! then yours wasn\'t a bit hurt, and she thought it would be grand, certainly,\' said Alice as she swam about, trying to put his shoes.', '2013-10-10', 24);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Delfina Gaylord', 'I needn\'t be afraid of them!\' \'And who are THESE?\' said the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a rather offended tone, \'was, that the Queen in front of them,.', '1988-07-17', 36);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Dr. Sanford Sipes', 'COULD! I\'m sure I have to go from here?\' \'That depends a good deal to ME,\' said the Caterpillar. \'Well, perhaps you were never even introduced to a mouse: she had not gone much farther before she.', '1982-02-02', 37);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Dr. Yasmine Bahringer IV', 'Duchess: \'what a clear way you have of putting things!\' \'It\'s a friend of mine--a Cheshire Cat,\' said Alice: \'allow me to introduce some other subject of conversation. \'Are you--are you fond--of--of.', '2012-05-22', 20);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Ebony McClure', 'He looked at poor Alice, and her eyes to see that the reason of that?\' \'In my youth,\' said his father, \'I took to the other: the Duchess said after a minute or two the Caterpillar called after it;.', '1994-01-03', 16);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Favian Kirlin', 'Alice could speak again. In a minute or two the Caterpillar sternly. \'Explain yourself!\' \'I can\'t remember half of fright and half of them--and it belongs to a lobster--\' (Alice began to repeat it,.', '1994-06-08', 38);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Finn Lemke', 'IS it to speak with. Alice waited a little, and then added them up, and began by producing from under his arm a great hurry. An enormous puppy was looking about for some way of escape, and wondering.', '2017-01-20', 49);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Genesis Crist', 'Dormouse, who seemed to be seen: she found to be full of tears, but said nothing. \'This here young lady,\' said the Cat. \'Do you know what a Gryphon is, look at the stick, running a very good advice,.', '1988-02-23', 27);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Janie Koelpin', 'It did so indeed, and much sooner than she had sat down at them, and just as well. The twelve jurors were writing down \'stupid things!\' on their slates, when the race was over. Alice was rather glad.', '2009-09-14', 6);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Jayme Kutch', 'I don\'t understand. Where did they draw?\' said Alice, very loudly and decidedly, and he went on \'And how did you call him Tortoise, if he would not open any of them. However, on the twelfth?\' Alice.', '1994-09-19', 22);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Jerald Waters', 'I\'m Mabel, I\'ll stay down here with me! There are no mice in the kitchen that did not much surprised at her side. She was a dispute going on within--a constant howling and sneezing, and every now.', '2012-03-08', 29);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Kaleigh Conn', 'Alice ventured to taste it, and found that it had lost something; and she felt that it was sneezing and howling alternately without a great hurry; \'and their names were Elsie, Lacie, and Tillie; and.', '2018-02-04', 13);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Katharina Bruen V', 'Alice said nothing; she had forgotten the words.\' So they couldn\'t see it?\' So she swallowed one of these cakes,\' she thought, \'and hand round the rosetree; for, you see, as well go in at the top of.', '1971-02-22', 11);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Kristin Purdy', 'Time as well as she went to school in the lock, and to wonder what Latitude was, or Longitude I\'ve got to?\' (Alice had been running half an hour or so there were a Duck and a Canary called out \'The.', '1975-06-03', 26);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Krystal Johns DDS', 'I grow up, I\'ll write one--but I\'m grown up now,\' she said, as politely as she could not answer without a moment\'s pause. The only things in the lap of her voice, and see what would happen next..', '2005-02-12', 10);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Lambert Hyatt', 'Duchess began in a long, low hall, which was the Hatter. He had been wandering, when a cry of \'The trial\'s beginning!\' was heard in the middle of the Rabbit\'s voice; and the whole cause, and condemn.', '1991-06-06', 8);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Maci Brekke', 'For instance, if you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied: \'but I know I have done just as she could, and soon found an opportunity of showing off a little.', '2000-12-27', 45);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Marcella Rowe', 'There was a general clapping of hands at this: it was all about, and crept a little door about fifteen inches high: she tried to curtsey as she left her, leaning her head made her next remark. \'Then.', '2012-02-13', 9);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mr. Cooper Pouros', 'Dormouse,\' thought Alice; but she could not think of anything to say, she simply bowed, and took the hookah out of a well?\' \'Take some more tea,\' the March Hare. The Hatter opened his eyes. He.', '2018-08-20', 5);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mr. Orland Wintheiser', 'Gryphon. \'I\'ve forgotten the little crocodile Improve his shining tail, And pour the waters of the gloves, and was going off into a graceful zigzag, and was surprised to find her in such a dear.', '2000-08-10', 46);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mr. Tom Carter', 'I\'m afraid, but you might catch a bat, and that\'s all the rest, Between yourself and me.\' \'That\'s the judge,\' she said to the shore. CHAPTER III. A Caucus-Race and a fan! Quick, now!\' And Alice was.', '1975-03-27', 41);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mrs. Gerda Fadel DDS', 'The Dormouse slowly opened his eyes. He looked at her hands, and was suppressed. \'Come, that finished the first verse,\' said the youth, \'one would hardly suppose That your eye was as much use in.', '2010-12-20', 25);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mrs. Hulda Boehm II', 'Duchess asked, with another dig of her hedgehog. The hedgehog was engaged in a great hurry, muttering to himself in an undertone to the Cheshire Cat sitting on the top with its eyelids, so he with.', '1995-08-23', 43);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mrs. Marjory Cartwright', 'Hatter. \'Nor I,\' said the King. \'Shan\'t,\' said the King: \'however, it may kiss my hand if it likes.\' \'I\'d rather not,\' the Cat in a sorrowful tone, \'I\'m afraid I don\'t understand. Where did they.', '1996-07-28', 15);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Mrs. Yvette Rodriguez II', 'The pepper when he finds out who I am! But I\'d better take him his fan and a crash of broken glass. \'What a curious dream!\' said Alice, rather alarmed at the top of his pocket, and pulled out a box.', '1990-10-10', 40);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Ms. Cydney Howe DDS', 'I BEG your pardon!\' cried Alice (she was so full of tears, but said nothing. \'Perhaps it hasn\'t one,\' Alice ventured to ask. \'Suppose we change the subject. \'Go on with the Mouse heard this, it.', '1972-09-16', 33);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Ms. Thora McClure', 'Presently she began shrinking directly. As soon as it turned a back-somersault in at once.\' However, she soon made out the words: \'Where\'s the other side of the fact. \'I keep them to be ashamed of.', '2001-01-14', 1);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Nelda Hilpert IV', 'When she got to go among mad people,\' Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can you learn lessons in here? Why, there\'s hardly enough of it in a great hurry. An.', '1995-08-26', 19);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Obie Bednar', 'Alice looked very anxiously into its mouth and yawned once or twice she had tired herself out with trying, the poor little thing was snorting like a sky-rocket!\' \'So you did, old fellow!\' said the.', '2012-04-02', 44);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Pierre Lueilwitz', 'The moment Alice appeared, she was going to say,\' said the Cat, \'if you don\'t know what a wonderful dream it had fallen into it: there were no tears. \'If you\'re going to be, from one end of his.', '1986-07-15', 14);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Prof. Angelo Parisian', 'I did: there\'s no harm in trying.\' So she stood looking at the window.\' \'THAT you won\'t\' thought Alice, and, after glaring at her for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for.', '2013-10-04', 31);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Prof. Garth Watsica II', 'She said this last remark that had slipped in like herself. \'Would it be of any good reason, and as it didn\'t sound at all for any lesson-books!\' And so she went back to the dance. Would not, could.', '2021-08-11', 42);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Prof. Holden Rosenbaum PhD', 'Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took her choice, and was going on, as she could, for the hedgehogs; and in THAT direction,\' the Cat went on, \'What\'s your.', '2012-08-28', 4);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Prof. Myra McGlynn Sr.', 'Mock Turtle went on. \'I do,\' Alice said to the seaside once in the distance, screaming with passion. She had just begun to repeat it, but her head through the door, and knocked. \'There\'s no such.', '1998-06-07', 32);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Prof. Victor Marquardt Sr.', 'Alice called out to sea as you are; secondly, because she was about a foot high: then she walked down the middle, being held up by wild beasts and other unpleasant things, all because they WOULD go.', '1987-04-26', 30);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Reyna Lehner', 'Which way?\', holding her hand on the ground near the door, and the roof off.\' After a while she was to get very tired of swimming about here, O Mouse!\' (Alice thought this a very short time the.', '1984-09-18', 28);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Reynold Wisozk', 'I am now? That\'ll be a lesson to you never to lose YOUR temper!\' \'Hold your tongue!\' said the Mock Turtle persisted. \'How COULD he turn them out with trying, the poor little feet, I wonder what.', '2010-07-07', 39);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Sylvan Swaniawski', 'Alice put down the chimney as she went slowly after it: \'I never thought about it,\' said Alice. \'Why, there they are!\' said the Caterpillar; and it was looking up into the sea, though you mayn\'t.', '2008-05-30', 2);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Trace Steuber DDS', 'Hatter. \'I deny it!\' said the King. (The jury all brightened up again.) \'Please your Majesty,\' said the Duchess; \'and that\'s why. Pig!\' She said this last remark, \'it\'s a vegetable. It doesn\'t look.', '1976-04-02', 18);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Tyrel Lubowitz', 'The March Hare meekly replied. \'Yes, but I can\'t quite follow it as to prevent its undoing itself,) she carried it off. * * * * * * * * * * * * * * * * \'Come, my head\'s free at last!\' said Alice.', '1971-06-04', 34);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Vernie Orn', 'AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice, \'it\'s very rude.\' The Hatter was out of their hearing her; and the cool fountains. CHAPTER VIII. The Queen\'s Croquet-Ground A.', '1985-11-08', 48);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Vernon Green PhD', 'Alice went on in the distance, sitting sad and lonely on a branch of a water-well,\' said the Cat. \'I don\'t see how he can thoroughly enjoy The pepper when he finds out who I WAS when I breathe\"!\'.', '2016-08-17', 47);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Yvonne Nikolaus', 'Quick, now!\' And Alice was too dark to see a little of the singers in the wood,\' continued the King. Here one of these cakes,\' she thought, and looked anxiously round, to make it stop. \'Well, I\'d.', '2008-02-26', 3);
INSERT INTO `delivered` (`title`, `summary`, `delivery_date`, `project_id`) VALUES ('Zora Torp', 'White Rabbit blew three blasts on the hearth and grinning from ear to ear. \'Please would you like to see the earth takes twenty-four hours to turn into a large arm-chair at one end of the evening,.', '1998-08-30', 12);


#
# TABLE STRUCTURE FOR: employee_relation
#

DROP TABLE IF EXISTS `employee_relation`;

CREATE TABLE `employee_relation` (
  `researcher_id` int(11) NOT NULL,
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_working_date` date NOT NULL,
  PRIMARY KEY (`researcher_id`,`abbreviation`),
  KEY `abbreviation` (`abbreviation`),
  CONSTRAINT `employee_relation_ibfk_1` FOREIGN KEY (`researcher_id`) REFERENCES `researcher` (`researcher_id`),
  CONSTRAINT `employee_relation_ibfk_2` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (1, 'Adams and Sons', '2000-03-29');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (2, 'Ankunding, Rutherford and Coll', '1970-01-10');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (3, 'Block, Mraz and Kuphal', '2001-05-03');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (4, 'Boehm Group', '2016-12-27');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (5, 'Brown, Herzog and Kihn', '2017-04-19');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (6, 'Carroll-Moore', '1981-08-24');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (7, 'Casper-Herman', '1980-11-20');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (8, 'Corkery Group', '1977-04-17');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (9, 'Cronin Inc', '2005-12-16');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (10, 'Cronin-Durgan', '2005-11-10');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (11, 'Daniel Ltd', '2000-11-02');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (12, 'Emmerich Inc', '1975-11-09');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (13, 'Fahey, Connelly and McLaughlin', '1976-10-15');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (14, 'Fisher and Sons', '1980-06-02');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (15, 'Gorczany, Torp and Mraz', '1996-04-08');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (16, 'Grady-Ernser', '1972-09-14');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (17, 'Greenholt Inc', '1978-08-13');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (18, 'Haley, Turner and Pollich', '1991-04-12');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (19, 'Hane-Heidenreich', '1976-06-21');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (20, 'Hegmann-Rath', '2007-07-17');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (21, 'Heidenreich Ltd', '1976-08-29');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (22, 'Hickle, Shanahan and Johnson', '2020-07-16');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (23, 'Johnson, Shanahan and Parisian', '1976-08-27');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (24, 'Johnston Group', '1992-01-17');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (25, 'Kertzmann Inc', '2002-09-06');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (26, 'Kertzmann, Hudson and Hodkiewi', '1976-10-11');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (27, 'Kohler-Bruen', '2021-11-15');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (28, 'Kohler, Ritchie and DuBuque', '2007-06-17');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (29, 'Labadie, Cronin and Koch', '1992-04-12');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (30, 'Leffler Ltd', '1989-05-11');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (31, 'Littel, Mertz and Haley', '2000-04-10');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (32, 'Lowe-Swaniawski', '2011-08-08');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (33, 'Marvin-Stoltenberg', '1984-06-04');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (34, 'Murazik-Willms', '2020-01-03');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (35, 'Murray Ltd', '1988-02-29');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (36, 'O\'Connell-Gleason', '1987-03-02');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (37, 'Okuneva, Collins and O\'Kon', '2012-11-28');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (38, 'Olson, Jacobson and White', '2003-06-18');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (39, 'Ortiz-Fadel', '1976-05-02');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (40, 'Pacocha-Glover', '1973-01-15');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (41, 'Pfeffer, Stamm and Monahan', '2006-01-09');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (42, 'Ruecker Inc', '2001-04-13');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (43, 'Runolfsson-Bashirian', '1976-06-08');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (44, 'Rutherford LLC', '1977-09-13');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (45, 'Ryan Group', '2010-02-12');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (46, 'Senger, Gislason and Kuvalis', '1980-01-03');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (47, 'Stehr-Kovacek', '2012-12-03');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (48, 'Stehr, Lemke and Bayer', '1981-11-14');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (49, 'Stokes-Maggio', '1984-01-30');
INSERT INTO `employee_relation` (`researcher_id`, `abbreviation`, `start_working_date`) VALUES (50, 'Yost, Mueller and Purdy', '2008-10-01');


#
# TABLE STRUCTURE FOR: evaluate_project
#

DROP TABLE IF EXISTS `evaluate_project`;

CREATE TABLE `evaluate_project` (
  `project_id` int(11) NOT NULL,
  `researcher_id` int(11) NOT NULL,
  `grade` decimal(2,2) NOT NULL CHECK (`grade` >= 0 and `grade` <= 10),
  `evaluation_date` date NOT NULL,
  PRIMARY KEY (`project_id`,`researcher_id`),
  KEY `researcher_id` (`researcher_id`),
  CONSTRAINT `evaluate_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `evaluate_project_ibfk_2` FOREIGN KEY (`researcher_id`) REFERENCES `researcher` (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (1, 1, '0.99', '2012-05-03');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (2, 2, '0.99', '1992-12-21');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (3, 3, '0.99', '2019-10-02');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (4, 4, '0.99', '1995-09-26');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (5, 5, '0.99', '1971-05-06');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (6, 6, '0.99', '2019-06-06');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (7, 7, '0.99', '2019-06-14');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (8, 8, '0.99', '1976-01-28');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (9, 9, '0.99', '1977-11-03');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (10, 10, '0.99', '1981-04-11');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (11, 11, '0.99', '1982-01-11');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (12, 12, '0.99', '1997-03-31');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (13, 13, '0.99', '1983-12-16');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (14, 14, '0.99', '1995-05-30');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (15, 15, '0.00', '1988-09-29');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (16, 16, '0.99', '1975-10-09');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (17, 17, '0.99', '1988-10-18');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (18, 18, '0.99', '2012-01-08');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (19, 19, '0.99', '1984-06-08');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (20, 20, '0.99', '1993-02-12');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (21, 21, '0.99', '2001-08-15');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (22, 22, '0.99', '2005-01-22');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (23, 23, '0.99', '2017-10-09');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (24, 24, '0.99', '2018-06-12');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (25, 25, '0.99', '1983-10-15');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (26, 26, '0.99', '1987-09-23');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (27, 27, '0.99', '1972-06-03');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (28, 28, '0.99', '2002-10-22');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (29, 29, '0.99', '2017-10-30');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (30, 30, '0.99', '2012-06-05');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (31, 31, '0.99', '1970-06-13');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (32, 32, '0.99', '1978-11-15');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (33, 33, '0.99', '1985-03-25');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (34, 34, '0.99', '2009-06-16');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (35, 35, '0.99', '1984-09-24');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (36, 36, '0.99', '1976-10-28');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (37, 37, '0.99', '2012-07-22');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (38, 38, '0.99', '1998-10-28');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (39, 39, '0.99', '1989-09-11');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (40, 40, '0.99', '2006-08-08');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (41, 41, '0.00', '2018-07-16');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (42, 42, '0.99', '2009-08-06');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (43, 43, '0.99', '2009-08-31');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (44, 44, '0.99', '1985-09-23');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (45, 45, '0.99', '2017-01-25');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (46, 46, '0.00', '2021-12-02');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (47, 47, '0.99', '2015-02-23');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (48, 48, '0.99', '2008-08-13');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (49, 49, '0.99', '2011-04-26');
INSERT INTO `evaluate_project` (`project_id`, `researcher_id`, `grade`, `evaluation_date`) VALUES (50, 50, '0.99', '1996-01-15');


#
# TABLE STRUCTURE FOR: executive
#

DROP TABLE IF EXISTS `executive`;

CREATE TABLE `executive` (
  `executive_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`executive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (1, 'Tito', 'Ward', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (2, 'Johathan', 'Wiegand', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (3, 'Enrique', 'Gutkowski', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (4, 'Kendra', 'Howell', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (5, 'Earl', 'Brekke', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (6, 'Ola', 'Flatley', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (7, 'Santina', 'Mills', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (8, 'Layla', 'Becker', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (9, 'Imogene', 'Lindgren', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (10, 'Eliseo', 'Heathcote', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (11, 'Nicholas', 'Kemmer', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (12, 'Ignatius', 'Gibson', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (13, 'Dessie', 'Rempel', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (14, 'Rosetta', 'Kuhn', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (15, 'Kane', 'Koepp', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (16, 'Shad', 'Daniel', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (17, 'Ressie', 'Bahringer', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (18, 'Daniella', 'Turcotte', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (19, 'Bailey', 'Kerluke', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (20, 'Mustafa', 'Jaskolski', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (21, 'Alicia', 'Skiles', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (22, 'Ettie', 'Zieme', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (23, 'Hank', 'Mante', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (24, 'Jazmyn', 'Senger', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (25, 'Zane', 'Kiehn', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (26, 'Iva', 'Pacocha', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (27, 'Jerome', 'Hoeger', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (28, 'Eulah', 'Rutherford', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (29, 'Holden', 'Stoltenberg', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (30, 'Thelma', 'Fay', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (31, 'Mellie', 'Stamm', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (32, 'Jordon', 'Shields', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (33, 'Dorcas', 'Hamill', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (34, 'Tyrese', 'Reynolds', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (35, 'Verda', 'Murphy', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (36, 'Layla', 'Zemlak', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (37, 'Laron', 'Buckridge', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (38, 'Brionna', 'Streich', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (39, 'Alexandra', 'Gusikowski', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (40, 'Afton', 'Bahringer', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (41, 'Darrion', 'Kiehn', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (42, 'Conrad', 'Bradtke', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (43, 'Arden', 'Murray', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (44, 'Emie', 'Mosciski', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (45, 'Kaylin', 'Luettgen', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (46, 'Susanna', 'Daugherty', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (47, 'Bo', 'Conroy', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (48, 'Reta', 'Emard', '1970-01-01', '1');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (49, 'Douglas', 'Runolfsdottir', '1970-01-01', '');
INSERT INTO `executive` (`executive_id`, `name`, `surname`, `birthday`, `sex`) VALUES (50, 'Brendan', 'Willms', '1970-01-01', '1');


#
# TABLE STRUCTURE FOR: organization
#

DROP TABLE IF EXISTS `organization`;

CREATE TABLE `organization` (
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` int(11) NOT NULL,
  `road` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `town` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('AaS', 'Adams and Sons', 81479, '122 Schultz Spurs', 'South Dudley');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('ARC', 'Ankunding, Rutherford and Coll', 35855, '430 Bessie Landing', 'Josianeport');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('BKM','Block, Mraz and Kuphal', 15821, '636 Cayla Court Apt. 754', 'Allytown');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('BG', 'Boehm Group', 56609, '910 Prohaska Plains', 'Port Lillytown');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('BHK', 'Brown, Herzog and Kihn', 21159, '62561 Nikolaus Extension Apt. ', 'Port Vidafort');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CaMo', 'Carroll-Moore', 81665, '006 Micah Pass', 'Arvillahaven');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CaHe', 'Casper-Herman', 97258, '871 Trycia Forge', 'Lonieshire');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CGr', 'Corkery Group', 26441, '1841 Kiana Harbor Suite 863', 'North Jettland');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CrInc', 'Cronin Inc', 61337, '85588 Samantha Inlet Suite 954', 'Celineside');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CrDu', 'Cronin-Durgan', 53338, '50614 Gislason Manors Apt. 725', 'O\'Reillymouth');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('DaLtd', 'Daniel Ltd', 43539, '099 Kohler Divide', 'Alfview');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('EmInc', 'Emmerich Inc', 98553, '90954 Ruecker Walks Suite 854', 'Port Savannahhaven');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('FCM', 'Fahey, Connelly and McLaughlin', 20565, '08116 Jed Crossroad', 'North Cydneyborough');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('FaS', 'Fisher and Sons', 76821, '2680 Harmony Viaduct', 'Olsontown');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('GTM', 'Gorczany, Torp and Mraz', 76197, '53238 Collins Turnpike Suite 6', 'New Nedra');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('GrEr', 'Grady-Ernser', 24030, '845 Ansley Tunnel', 'Boscostad');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('GrInc', 'Greenholt Inc', 75910, '82351 Runolfsdottir Corners Ap', 'South Maya');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('HTP', 'Haley, Turner and Pollich', 43100, '5425 Dorcas Skyway', 'West Trinityview');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('HaHe', 'Hane-Heidenreich', 18416, '5297 Sigurd Ridge Suite 877', 'Port Calechester');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('HeRa', 'Hegmann-Rath', 62456, '851 Kessler Fork Apt. 772', 'West Robbieberg');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('HeLtd', 'Heidenreich Ltd', 41064, '812 Wolff Oval Apt. 864', 'Harberfort');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('HSJ', 'Hickle, Shanahan and Johnson', 60837, '54490 Rosenbaum Summit', 'Yadiramouth');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('JSP', 'Johnson, Shanahan and Parisian',, 51436, '8391 Dickinson Fort', 'North Lydia');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('JohnGr', 'Johnston Group', 62517, '9147 Noemi Mountains', 'Bogisichberg');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('KeInc', 'Kertzmann Inc', 49864, '23386 Gerald Knoll Suite 430', 'South Sadie');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('KHH', 'Kertzmann, Hudson and Hodkiewi', 22060, '92693 Mueller Square', 'Lake Hildegardmouth');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('KoBr', 'Kohler-Bruen', 44404, '609 Frami Port Apt. 173', 'Port Stevestad');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('KRD', 'Kohler, Ritchie and DuBuque', 68597, '4996 Ed Crescent', 'South Katheryn');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('LCK', 'Labadie, Cronin and Koch', 78102, '19799 Mckenna Rue Suite 381', 'Lemkestad');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('LeLtd', 'Leffler Ltd', 93979, '58346 Gilbert Track Suite 805', 'Dorotheaport');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('LMH', 'Littel, Mertz and Haley', 36211, '3938 Schulist Road Apt. 843', 'South Jordanburgh');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('LoSw', 'Lowe-Swaniawski', 59749, '102 Maxime Roads', 'North Soledadborough');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('MaSt', 'Marvin-Stoltenberg', 72939, '83328 Schiller Common', 'Lake Christinabury');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('MuWi', 'Murazik-Willms', 89380, '76036 Adams Plain', 'New Jonathon');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('MuLtd', 'Murray Ltd', 55741, '0518 Murphy Isle Suite 182', 'Port Candacefort');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CoGl', 'Connell-Gleason', 37447, '261 Paucek Glen Apt. 601', 'Port Gustaveside');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('CoKo', 'Collins and Kon', 24272, '61414 Sipes Inlet Suite 242', 'Vedachester');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('WJ', 'Jacobson and White', 31193, '2658 Kuhic Brook', 'Kassulkebury');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('OFad','Ortiz-Fadel', 78191, '7520 Collins Gardens Apt. 251', 'North Laverne');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('PacoG','Pacocha-Glover', 17529, '450 Wilhelmine Points Apt. 038', 'Manteland');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('StM', 'Stamm and Monahan', 75111, '4518 Johnnie Ford Apt. 650', 'Framitown');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('RuInc','Ruecker Inc', 10182, '79613 Ryan Expressway Suite 44', 'Judgechester');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('RunBa','Runolfsson-Bashirian', 17109, '47716 Hamill Shores', 'Port Bobbieton');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('RLLC','Rutherford LLC', 34309, '146 Padberg Inlet Apt. 593', 'Andersonmouth');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('RyanG','Ryan Group', 52717, '21210 Kozey Light Suite 294', 'New Alexanne');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('GK', 'Gislason and Kuvalis', 88070, '3196 Edwardo Cape', 'Lake Mariettaview');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('SteKo','Stehr-Kovacek', 39307, '86517 Turcotte Isle', 'Schummport');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('LeBa', 'Lemke and Bayer', 52663, '137 Feeney Track Apt. 128', 'Lake Alisonside');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('St.M', 'Stokes-Maggio', 72789, '640 Deckow Bypass', 'Port Maximus');
INSERT INTO `organization` (`abbreviation`, `name`, `post_code`, `road`, `town`) VALUES ('MuPu', 'Mueller and Purdy', 49742, '1074 Jamey Plains Apt. 260', 'Pagacville');



#
# TABLE STRUCTURE FOR: phone
#


DROP TABLE IF EXISTS `phone`;

CREATE TABLE `phone` (
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` bigint(20) NOT NULL,
  PRIMARY KEY (`abbreviation`,`phone_number`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('Aas', '6929726700');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('Aas', '6925345808');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('ARC', '694339253');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BKM', '6962827015');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BKM', '6932123455');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BG', '6958028761');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BHK', '6910765806');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BHK', '2105676674');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('BHK', '2105545324');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CaMo', '6941574592');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CaHe', '6970587334');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CaHe', '2104565788');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CGr', '6980618836');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CGr', '6954329324');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CrInc', '6928255520');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CrInc', '6924341420');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CrDu', '6994337609 ');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('DaLtd', '6971627285');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('EmInc', '6945363200');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('FCM', '6977587521');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('FCM', '6987893210');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('FaS', '6977587521');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('GTM', '6977587521');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('GrEr', '6950316387');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('GrEr', '6942566563');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('GrInc', '6955583121');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HTP', '6976748429');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HTP', '2105335533');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HaHe', '6938252868');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HeRa', '6994117265');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HeLtd', '6965511603');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HSJ', '6974301055');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('HSJ', '6975474363');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('JSP', '6916140285');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('JohnGr', '6948433933');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('KeInc', '6957299780');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('KHH', '6997738314');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('KoBr', '6991096946');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('KoBr', '2105456765');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('KRD', '6985583889');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LCK', '6940016569');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LeLtd', '6911582664');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LeLtd', '6954564324');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LMH', '6951026428');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LoSw', '6907712409');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MaSt', '6975821190');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MuWi', '6985163967');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MuLtd', '6925863976');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CoGl', '6917027491');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('CoKo', '6923307476');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('WJ', '6912624139');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('OFad', '6961097574');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('OFad', '6964424234');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('PacoG', '6956515646');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('StM', '6962619219');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RuInc', '6971394008');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RuInc', '6946646433');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RunBa', '6944883635');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RLLC', '6945771431');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RLLC', '2103454322');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RyanG', '6933579805');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('RyanG', '2105456543');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('GK', '6965817628');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('SteKo', '6989826369');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LeBa', '6938416022');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('LeBa', '6946645574');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('St.M', '6931965897');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('St.M', '2104577424');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MuPu', '6907881919');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MuPu', '6978643574');
INSERT INTO `phone` (`abbreviation`, `phone_number`) VALUES ('MuPu', '6969050440');


#
# TABLE STRUCTURE FOR: program
#

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `program_id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (1, '1st Call for Action "200 Years since the Greek Revolution"', '180 Kilback Villages');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (2, '1st Call for Action “Science and Society” “Research, Innovation and Dissemination Hubs', '46966 Ferry Overpass');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (3, '1st Call for Action "Always Strive for Excellence" , Theodore Papazoglou', '4085 Jermain Prairie Suite 154');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (4, '1st Call for Action  "Interventions to address the economic and social effects of the COVID-19 pandemic"', '3716 Rutherford Road Suite 473');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (5, 'The emerging landscape of digital work in Humanities ', '16873 Hahn Garden Suite 534');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (6, '1st Call for Research Projects to Support Faculty Members & Researchers', '1203 Tristian Coves');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (7, '1st supply of high value research equipment', '0374 Juanita Harbor');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (8, '1st Call for H.F.R.I. Scholarships to PhD Candidates', '20049 Frami Lights Suite 605');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (9, '2nd Call for Action “Research, Innovation and Dissemination Hubs', '91813 Eldon Passage Apt. 069');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (10, 'Fieldwork for data in Greece in the context of the “Wave 10” of the European Social Survey', '070 Corbin Garden Apt. 471');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (11, '1st Call for H.F.R.I. research projects to support Postdoctoral Researchers', '6694 Bashirian Mews Apt. 964');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (12, 'Promote Research and Innovation', '42629 Ardella Mews Suite 325');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (13, '2nd Call for Research Projects to Support Faculty Members & Researchers', '412 Colin Fall');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (14, '2nd Call for Action "200 Years since the Greek Revolution"', '8665 Schneider Ramp Suite 130');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (15, '2nd Call for Action "Always Strive for Excellence" , Theodore Papazoglou', '9303 Angelina Shoal');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (16, '2nd Call for Action "Interventions to address the economic and social effects of the COVID-19 pandemic"', '6415 Javier Junction');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (17, '2nd Call for the supply of high value research equipment', '1755 Laila Underpass Suite 167');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (18, '2nd Call for H.F.R.I. Scholarships to PhD Candidates', '169 Hessel Locks');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (19, '1st Call for H.F.R.I Scholarships to Undergraduate Students', '36077 Heidenreich Village');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (20, '3rd Call for Action "Interventions to address the economic and social effects of the COVID-19 pandemic"', '249 Dare Falls Suite 253');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (21, '3rd Call for Research Projects to Support Faculty Members & Researchers', '719 Dwight Stream');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (22, '3rd Call for Action "Always Strive for Excellence" , Theodore Papazoglou', '372 Schaden Circles');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (23, '2nd Call for H.F.R.I. research projects to support Postdoctoral Researchers', '769 Lesch Squares Suite 975');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (24, '2nd Call for H.F.R.I Scholarships to Undergraduate Students', '540 Kirsten Walks Apt. 666');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (25, '3rd Call for H.F.R.I. Scholarships to PhD Candidates', '12464 Purdy Meadow Apt. 017');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (26, '4th Call for Action "Interventions to address the economic and social effects of the COVID-19 pandemic"', '278 Andre Inlet Suite 089');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (27, '4th Call for H.F.R.I. Scholarships to PhD Candidates', '352 Felipa Freeway');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (28, '4th Call for Action "Always Strive for Excellence" , Theodore Papazoglou', '381 Althea Knoll Apt. 363');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (29, '3rd Call for Action "200 Years since the Greek Revolution"', '674 Jacobson Springs');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (30, '3rd Call for the supply of high value research equipment', '8246 Virginia Roads Suite 249');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (31, '3rd Call for H.F.R.I. research projects to support Postdoctoral Researchers', '813 Effertz Shore');
INSERT INTO `program` (`program_id`, `program_name`, `adress`) VALUES (32, '5th Call for H.F.R.I. Scholarships to PhD Candidates', '22365 Tate Heights');
#
# TABLE STRUCTURE FOR: project
#

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `funding` decimal(7,2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executive_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `scientific_inspector_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`),
  KEY `abbreviation` (`abbreviation`),
  KEY `executive_id` (`executive_id`),
  KEY `program_id` (`program_id`),
  KEY `scientific_inspector_id` (`scientific_inspector_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`),
  CONSTRAINT `project_ibfk_2` FOREIGN KEY (`executive_id`) REFERENCES `executive` (`executive_id`),
  CONSTRAINT `project_ibfk_3` FOREIGN KEY (`program_id`) REFERENCES `program` (`program_id`),
  CONSTRAINT `project_ibfk_4` FOREIGN KEY (`scientific_inspector_id`) REFERENCES `researcher` (`researcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (1, 'Modernization of the hellenic gravity network', 'Oh, my dear Dinah! I wonder who will put on one knee as he spoke. \'UNimportant, of course, I meant,\' the King and the three were all crowded together at one and then I\'ll tell you my history, and.', '99999.99', '1971-10-02', '2014-03-19', 'Adams and Sons', 1, 1, 1);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (2, 'Modeling water loss in water network', 'Alice hastily replied; \'only one doesn\'t like changing so often, of course had to leave off being arches to do so. \'Shall we try another figure of the accident, all except the King, going up to the.', '99999.99', '1979-11-20', '2004-05-08', 'Ankunding, Rutherford and Coll', 2, 2, 2);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (3, 'Sign language recognition in education', 'Cat\'s head with great curiosity, and this was of very little use, as it spoke (it was Bill, I fancy--Who\'s to go after that into a sort of chance of getting up and down looking for it, while the.', '11527.88', '2001-06-18', '2017-04-23', 'Block, Mraz and Kuphal', 3, 3, 3);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (4, 'Machine Learning in 2022', 'Alice in a tone of this sort of chance of getting her hands up to the law, And argued each case with my wife; And the Eaglet bent down its head impatiently, and walked a little door was shut again,.', '99999.99', '2018-04-12', '1993-02-11', 'Boehm Group', 4, 4, 4);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (5, 'Exploring new processes for use of CO2', 'In a minute or two, she made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be quite as much as she could see, as they came nearer, Alice could see it trot away.', '51440.43', '2012-04-28', '2015-06-24', 'Brown, Herzog and Kihn', 5, 5, 5);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (6, 'Reducing obesity in young children', 'I hadn\'t drunk quite so much!\' Alas! it was neither more nor less than no time to avoid shrinking away altogether. \'That WAS a narrow escape!\' said Alice, \'and those twelve creatures,\' (she was so.', '99999.99', '1978-12-28', '1972-03-20', 'Carroll-Moore', 6, 6, 6);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (7, 'Advanced photocatalytic photon nanostructures', 'Cat, and vanished. Alice was more hopeless than ever: she sat on, with closed eyes, and feebly stretching out one paw, trying to box her own ears for having cheated herself in a hurry. \'No, I\'ll.', '45053.31', '2004-03-24', '1990-04-17', 'Casper-Herman', 7, 7, 7);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (8, 'Review of Resource Allocation in interdependent wireless networks', 'Cat went on, \'you throw the--\' \'The lobsters!\' shouted the Queen, and Alice, were in custody and under sentence of execution. Then the Queen jumped up and to wonder what they\'ll do next! If they had.', '99999.99', '1979-06-05', '1970-04-20', 'Corkery Group', 8, 8, 8);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (9, 'Innovative cognitive learning for cyberphysical systems', 'Caterpillar. \'I\'m afraid I\'ve offended it again!\' For the Mouse replied rather crossly: \'of course you know what \"it\" means well enough, when I sleep\" is the same thing,\' said the Queen, turning.', '99999.99', '1970-03-07', '1994-11-16', 'Cronin Inc', 9, 9, 9);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (10, 'Development of a natural threat management system in the urban water cycle', 'I don\'t understand. Where did they live on?\' said the King added in a great thistle, to keep herself from being run over; and the executioner ran wildly up and down looking for them, and the little.', '99999.99', '1979-01-20', '2016-09-26', 'Cronin-Durgan', 10, 10, 10);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (11, 'Low Cost Photodetectors based on Carbon Nanotubes', 'CURTSEYING as you\'re falling through the neighbouring pool--she could hear the words:-- \'I speak severely to my right size again; and the March Hare,) \'--it was at the stick, and tumbled head over.', '25763.36', '2000-12-15', '1995-05-26', 'Daniel Ltd', 11, 11, 11);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (12, 'Integrating Theoretical with Experimental and Applied Linguistics', 'I should think it so yet,\' said Alice; \'I might as well as she could, and waited to see the Queen. \'You make me larger, it must be off, and Alice looked all round her head. \'If I eat one of the.', '99999.99', '1990-03-13', '2000-02-05', 'Emmerich Inc', 12, 12, 12);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (13, 'Structural and Functional Studies of Nicotine Acetylcholine Receptors', 'This seemed to be ashamed of yourself,\' said Alice, \'it\'s very easy to know what they\'re about!\' \'Read them,\' said the Mock Turtle in a low, weak voice. \'Now, I give you fair warning,\' shouted the.', '99999.99', '1981-12-10', '2010-01-21', 'Fahey, Connelly and McLaughlin', 13, 13, 13);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (14, 'Can massive winds from black holes affect galaxies?', 'I mentioned before, And have grown most uncommonly fat; Yet you finished the guinea-pigs!\' thought Alice. \'I\'ve tried every way, and nothing seems to suit them!\' \'I haven\'t the slightest idea,\' said.', '99999.99', '2017-09-09', '2009-02-27', 'Fisher and Sons', 14, 14, 14);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (15, 'Regulation of mitochondrial function in stomach cancer', 'EVEN finish, if he doesn\'t begin.\' But she went on, \'I must be a Caucus-race.\' \'What IS the same as they came nearer, Alice could bear: she got used to come upon them THIS size: why, I should.', '99999.99', '1980-02-04', '2014-11-01', 'Gorczany, Torp and Mraz', 15, 15, 15);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (16, 'Improved nanoparticle oil extraction', 'She hastily put down her flamingo, and began to get her head to hide a smile: some of the tale was something like this:-- \'Fury said to herself as she spoke. (The unfortunate little Bill had left.', '99999.99', '1984-07-12', '2000-11-17', 'Grady-Ernser', 16, 16, 16);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (17, 'Agroforestry in Thessaly', 'Mouse, who seemed ready to play with, and oh! ever so many different sizes in a helpless sort of knot, and then dipped suddenly down, so suddenly that Alice said; but was dreadfully puzzled by the.', '99999.99', '2015-06-18', '1981-01-13', 'Greenholt Inc', 17, 17, 17);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (18, 'Efficient network analysis algorithms', 'M--\' \'Why with an air of great dismay, and began smoking again. This time there were TWO little shrieks, and more puzzled, but she gained courage as she fell very slowly, for she was coming to, but.', '99999.99', '1987-07-05', '1992-05-13', 'Haley, Turner and Pollich', 18, 18, 18);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (19, 'Geometric Functional Analysis and Applications', 'Queen put on one knee. \'I\'m a poor man, your Majesty,\' said the Hatter. \'He won\'t stand beating. Now, if you like!\' the Duchess said after a minute or two she stood watching them, and was just.', '99999.99', '2008-08-18', '2010-10-29', 'Hane-Heidenreich', 19, 19, 19);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (20, 'Data Science for All', 'But, now that I\'m doubtful about the right word) \'--but I shall remember it in time,\' said the Dormouse: \'not in that ridiculous fashion.\' And he got up this morning, but I THINK I can go back by.', '99999.99', '2019-01-07', '1998-01-17', 'Hegmann-Rath', 20, 20, 20);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (21, 'Beyond Worst Case Analysis in Approach Algorithms', 'I can go back by railway,\' she said to one of the conversation. Alice felt a violent shake at the cook till his eyes were nearly out of sight; and an Eaglet, and several other curious creatures..', '30806.91', '2001-09-04', '2006-02-14', 'Heidenreich Ltd', 21, 21, 21);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (22, 'Optimization of drug development with modeling', 'Just then she remembered that she never knew whether it was out of a feather flock together.\"\' \'Only mustard isn\'t a bird,\' Alice remarked. \'Oh, you can\'t take LESS,\' said the Dodo, \'the best way.', '39302.55', '2018-04-10', '1982-10-23', 'Hickle, Shanahan and Johnson', 22, 22, 22);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (23, 'Enzybiotics', 'March Hare: she thought it over afterwards, it occurred to her daughter \'Ah, my dear! Let this be a LITTLE larger, sir, if you want to see if she did not like to see it quite plainly through the.', '99999.99', '2016-06-17', '1985-12-07', 'Johnson, Shanahan and Parisian', 23, 23, 23);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (24, 'The Pharmacogenetics of Familiarity', 'The Footman seemed to Alice with one of them.\' In another minute there was generally a ridge or furrow in the distance, sitting sad and lonely on a branch of a good deal frightened by this very.', '99999.99', '2018-10-27', '1999-12-13', 'Johnston Group', 24, 24, 24);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (25, 'Lon protease in aging and cancer', 'Alice called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Dodo, \'the best way to change them--\'.', '14254.36', '1992-08-06', '1978-07-09', 'Kertzmann Inc', 25, 25, 25);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (26, 'Archaeological and geophysical research in the coast of Samothrace', 'I\'ve been changed for Mabel! I\'ll try and repeat something now. Tell her to begin.\' He looked at them with the glass table and the party went back to the jury. They were indeed a queer-looking party.', '99999.99', '2015-03-26', '1976-09-10', 'Kertzmann, Hudson and Hodkiewi', 26, 26, 26);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (27, 'Linguistic  strategies for intervention in language disorders', 'King replied. Here the Queen put on one side, to look about her repeating \'YOU ARE OLD, FATHER WILLIAM,\' to the part about her other little children, and make out who was sitting next to no toys to.', '8878.74', '1995-08-01', '1973-03-22', 'Kohler-Bruen', 27, 27, 27);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (28, 'Genetic research & digital visualization in the performing arts', 'Off--\' \'Nonsense!\' said Alice, \'a great girl like you,\' (she might well say that \"I see what was the fan and gloves. \'How queer it seems,\' Alice said to herself how this same little sister of hers.', '99999.99', '2002-08-20', '2010-12-19', 'Kohler, Ritchie and DuBuque', 28, 28, 28);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (29, 'Mapping patterns, impacts and threats to functional diversity', 'Gryphon went on, \'you throw the--\' \'The lobsters!\' shouted the Queen. \'Sentence first--verdict afterwards.\' \'Stuff and nonsense!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she tried to.', '99999.99', '2013-09-29', '2010-12-09', 'Labadie, Cronin and Koch', 29, 29, 29);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (30, 'Design of artificial wetlands for the treatment of gray water in urban areas of the Mediterranean', 'Alice did not like to drop the jar for fear of their hearing her; and the King had said that day. \'That PROVES his guilt,\' said the Caterpillar took the hookah into its mouth and began an account of.', '88507.80', '1976-11-13', '2001-06-02', 'Leffler Ltd', 30, 30, 30);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (31, 'Human Resources Management in Small and Medium Enterprises', 'Queen. An invitation from the trees had a head could be beheaded, and that he shook his grey locks, \'I kept all my life!\' Just as she picked up a little now and then; such as, \'Sure, I don\'t think,\'.', '53299.97', '1974-08-31', '1990-10-26', 'Littel, Mertz and Haley', 31, 31, 31);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (32, 'Exploring the quality characteristics of profits', 'Duchess\'s knee, while plates and dishes crashed around it--once more the pig-baby was sneezing on the bank--the birds with draggled feathers, the animals with their heads down and looked at Alice..', '99999.99', '2004-08-09', '2010-06-07', 'Lowe-Swaniawski', 32, 32, 32);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (33, 'Configuring the environment and nutrition', 'Hatter went on, \'What HAVE you been doing here?\' \'May it please your Majesty!\' the soldiers did. After these came the royal children; there were three little sisters--they were learning to draw, you.', '99999.99', '1989-08-30', '2000-02-20', 'Marvin-Stoltenberg', 33, 33, 33);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (34, 'Alt-Right Social Networks: Investigating Political & Cultural Activism', 'Footman remarked, \'till tomorrow--\' At this moment the door of which was lit up by two guinea-pigs, who were all crowded together at one corner of it: for she was quite pale (with passion, Alice.', '99999.99', '1986-01-18', '1973-12-25', 'Murazik-Willms', 34, 34, 34);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (35, 'Populist Constitutionalism', 'As they walked off together. Alice was not quite sure whether it was indeed: she was dozing off, and she grew no larger: still it was looking at them with one finger, as he said in a tone of the.', '99999.99', '1976-09-12', '1981-08-19', 'Murray Ltd', 35, 35, 35);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (36, 'Biological Metaphysics: Understanding Development Mechanisms', 'Queen put on his spectacles and looked along the passage into the garden with one finger pressed upon its nose. The Dormouse again took a great deal to ME,\' said Alice very meekly: \'I\'m growing.\'.', '99999.99', '2004-07-21', '1971-08-26', 'O\'Connell-Gleason', 36, 36, 36);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (37, 'Transitions, Immigration and Politics: Understanding Youth in Crisis', 'The jury all brightened up again.) \'Please your Majesty,\' he began, \'for bringing these in: but I shall have somebody to talk nonsense. The Queen\'s Croquet-Ground A large rose-tree stood near the.', '99999.99', '2021-04-19', '1990-07-24', 'Okuneva, Collins and O\'Kon', 37, 37, 37);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (38, 'Species on the brink of extinction', 'Alice could not think of nothing better to say a word, but slowly followed her back to the seaside once in the sea, though you mayn\'t believe it--\' \'I never thought about it,\' added the Queen..', '99999.99', '2010-01-06', '1990-04-22', 'Olson, Jacobson and White', 38, 38, 38);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (39, 'Consumerism in a time of economic crisis', 'Queen, pointing to the baby, and not to her, And mentioned me to sell you a couple?\' \'You are old,\' said the Lory, as soon as there was no one else seemed inclined to say it over) \'--yes, that\'s.', '99999.99', '1985-07-17', '1991-01-02', 'Ortiz-Fadel', 39, 39, 39);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (40, 'Processors based on Optical Artificial Neurons', 'Alice to herself. \'I dare say there may be ONE.\' \'One, indeed!\' said the Rabbit say to itself, half to Alice. \'What IS the fun?\' said Alice. \'Oh, don\'t bother ME,\' said the Mock Turtle went on.', '20187.25', '2017-05-28', '2006-03-02', 'Pacocha-Glover', 40, 40, 40);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (41, 'Assigning Meaning to the Actions of Other Subjects: Neural Correlates', 'Gryphon, before Alice could see, as well say,\' added the Gryphon; and then they both bowed low, and their curls got entangled together. Alice laughed so much into the court, \'Bring me the truth: did.', '86465.86', '2014-03-16', '2019-07-18', 'Pfeffer, Stamm and Monahan', 41, 41, 41);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (42, 'Modeling of Electromagnetic Emissions of Space Equipment', 'Bill\'s got to grow to my jaw, Has lasted the rest of it in a game of croquet she was dozing off, and found quite a long argument with the Lory, with a growl, And concluded the banquet--] \'What IS a.', '99999.99', '1984-12-19', '2004-10-06', 'Ruecker Inc', 42, 42, 42);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (43, 'Sociology of Foreign Direct Investment in Greece', 'Let me see--how IS it to annoy, Because he knows it teases.\' CHORUS. (In which the words \'DRINK ME,\' but nevertheless she uncorked it and put it in asking riddles that have no answers.\' \'If you.', '99999.99', '2006-10-20', '1971-09-30', 'Runolfsson-Bashirian', 43, 43, 43);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (44, 'Quantum Integrated Photon Circuits', 'Alice: \'allow me to introduce it.\' \'I don\'t even know what they\'re like.\' \'I believe so,\' Alice replied very readily: \'but that\'s because it stays the same as the doubled-up soldiers were silent,.', '46349.92', '1988-12-08', '1998-11-15', 'Rutherford LLC', 44, 44, 44);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (45, 'Inclined Cosmology', 'Said his father; \'don\'t give yourself airs! Do you think I may as well say this), \'to go on with the other side will make you grow taller, and the happy summer days. THE.', '99999.99', '2017-08-01', '1979-06-12', 'Ryan Group', 45, 45, 45);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (46, 'Responsible by Design Entity Resolution', 'Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Gryphon. Alice did not look at it!\' This speech caused a remarkable sensation among the branches, and every now and then sat upon it.) \'I\'m.', '99999.99', '2004-11-19', '2014-11-02', 'Senger, Gislason and Kuvalis', 46, 46, 46);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (47, 'Lifting Algorithms for Evolutionary Dynamics in Networks (LIFT)', 'And she thought at first she thought it over here,\' said the March Hare interrupted, yawning. \'I\'m getting tired of this. I vote the young lady to see if he wasn\'t one?\' Alice asked. \'We called him.', '70772.84', '1996-11-14', '2021-01-23', 'Stehr-Kovacek', 47, 47, 47);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (48, 'Censorship in Cinema and Visual Arts', 'Gryphon, the squeaking of the tea--\' \'The twinkling of the other players, and shouting \'Off with his head!\' or \'Off with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'And where HAVE my.', '42118.67', '2014-03-04', '1982-10-24', 'Stehr, Lemke and Bayer', 48, 48, 48);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (49, 'Corruption and state-corporate crime', 'Alice remarked. \'Right, as usual,\' said the Caterpillar; and it sat for a long time together.\' \'Which is just the case with my wife; And the moral of that dark hall, and wander about among those.', '42893.38', '1989-08-03', '1986-05-23', 'Stokes-Maggio', 49, 49, 49);
INSERT INTO `project` (`project_id`, `title`, `summary`, `funding`, `start_date`, `end_date`, `abbreviation`, `executive_id`, `program_id`, `scientific_inspector_id`) VALUES (50, 'Interactions of Veterinary antibiotics with soil microorganisms', 'Who for such dainties would not open any of them. However, on the floor, and a scroll of parchment in the air. She did not like to try the experiment?\' \'HE might bite,\' Alice cautiously replied:.', '1056.52', '2017-08-27', '1992-08-22', 'Yost, Mueller and Purdy', 50, 50, 50);


#
# TABLE STRUCTURE FOR: researcher
#

DROP TABLE IF EXISTS `researcher`;

CREATE TABLE `researcher` (
  `researcher_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) DEFAULT NULL CHECK (`age` >= 0),
  `birthday` date NOT NULL,
  `sex` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`researcher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (1, 'Elton', 'Padberg', '1970-01-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (2, 'Anibal', 'Rodriguez', '1972-05-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (3, 'Vivian', 'Hilpert', '1976-04-02', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (4, 'Lea', 'Metz', '1993-07-03', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (5, 'Kelton', 'Shanahan', '1978-06-04', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (6, 'Tyrel', 'Tremblay', '1986-03-06', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (7, 'Reba', 'Littel', '1992-07-05', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (8, 'Eldora', 'Fritsch', '1988-04-05', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (9, 'Thelma', 'Dach', '1989-07-02', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (10, 'Rashawn', 'Windler', '1991-11-16', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (11, 'Newton', 'Altenwerth', '1983-12-13', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (12, 'Nestor', 'Kihn', '1970-05-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (13, 'Jarvis', 'Fadel', '1972-04-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (14, 'Burdette', 'Bailey', '1979-03-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (15, 'Myrtie', 'Schowalter', '1972-04-06', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (16, 'Terrell', 'Green', '1983-05-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (17, 'Rachel', 'Stokes', '1990-09-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (18, 'Colby', 'Cremin', '1974-02-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (19, 'Marcos', 'Rosenbaum', '1966-06-17', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (20, 'Brody', 'Feil', '1973-04-11', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (21, 'Lilly', 'Williamson', '1978-11-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (22, 'Grayce', 'Johns', '1981-01-01', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (23, 'Andreane', 'Amore', '1993-02-15', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (24, 'Luther', 'Lubowitz', '1971-04-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (25, 'Emmie', 'Hyatt', '1969-12-24', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (26, 'Alphonso', 'Bernhard', '1968-04-22', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (27, 'Jaydon', 'Nikolaus', '1982-03-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (28, 'Ernestina', 'Schoen', '1984-01-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (29, 'Yazmin', 'Block', '1980-06-26', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (30, 'Angelica', 'Hane', '1990-03-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (31, 'Britney', 'Marvin', '1984-04-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (32, 'Austin', 'Kreiger', '1977-06-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (33, 'Keshawn', 'Conn', '1990-05-18', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (34, 'Lonnie', 'Schroeder', '1988-03-23', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (35, 'Dejon', 'Langosh', '1986-11-29', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (36, 'Leone', 'Christiansen', '1991-03-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (37, 'Isidro', 'Stamm', '1996-07-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (38, 'Otto', 'Bins', '1982-03-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (39, 'Tyrese', 'Wolff', '1978-04-13', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (40, 'Bobby', 'Brakus', '1986-03-11', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (41, 'Estrella', 'Eichmann', '1992-12-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (42, 'Johathan', 'Emard', '1973-11-06', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (43, 'Vella', 'Breitenberg', '1978-10-04', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (44, 'Gwen', 'Upton', '1986-05-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (45, 'Darrion', 'Stehr', '1986-03-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (46, 'Aron', 'Gorczany', '1974-05-13', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (47, 'Sharon', 'Wilkinson', '1972-04-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (48, 'Ellis', 'White', '1992-08-05', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (49, 'Savannah', 'Kreiger', '1985-06-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (50, 'Bryan', 'Adams', '1993-05-27', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (51, 'Elton', 'John', '1970-01-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (52, 'Robert', 'Plant', '1972-05-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (53, 'Jimmy', 'Page', '1976-04-02', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (54, 'Christina', 'Adamopoulou', '1993-07-03', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (55, 'Bill', 'Johnson', '1978-06-04', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (56, 'Tylel', 'McGregor', '1986-03-06', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (57, 'Elsa', 'Sotiropoulou', '1992-07-05', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (58, 'Mary', 'Frizer', '1988-04-05', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (59, 'Maria', 'Adamou', '1989-07-02', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (60, 'Olivia', 'Johnson', '1991-11-16', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (61, 'George', 'Giannidis', '1983-12-13', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (62, 'Sokratis', 'Stathakos', '1970-05-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (63, 'Yannis', 'Xatzimichalis', '1972-04-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (64, 'Isabella', 'Motelica', '1979-03-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (65, 'Ava', 'Harper', '1972-04-06', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (66, 'Johnny', 'Green', '1983-05-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (67, 'Phoebe', 'Wilson', '1990-09-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (68, 'Mark', 'Burton', '1974-02-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (69, 'Marcos', 'Xaikalis', '1966-06-17', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (70, 'Travis', 'Stevens', '1973-04-11', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (71, 'Sophia', 'Harris', '1978-11-15', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (72, 'Mary', 'Robinson', '1981-01-01', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (73, 'Panagiotis', 'Papadopoulos', '1993-02-15', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (74, 'Paul', 'Walker', '1971-04-03', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (75, 'Emmily', 'Payne', '1969-12-24', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (76, 'Lex', 'Baker', '1968-04-22', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (77, 'Ted', 'Owen', '1982-03-24', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (78, 'Joahna', 'Holmes', '1984-01-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (79, 'Jasmin', 'Chapman', '1980-06-26', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (80, 'Donna', 'Lewis', '1990-03-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (81, 'Silia', 'Webb', '1984-04-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (82, 'Maycroft', 'Allen', '1977-06-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (83, 'Jessica', 'Chapman', '1990-05-18', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (84, 'Emily', 'Jones', '1988-03-23', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (85, 'Jack', 'Davies', '1986-11-29', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (86, 'Gordon', 'Ryan', '1991-03-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (87, 'Keenan', 'Cornelius', '1996-07-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (88, 'Marcus', 'Buchecha', '1982-03-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (89, 'Antonia', 'Markou', '1978-04-13', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (90, 'Dimitris', 'Pezas', '1986-03-11', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (91, 'Elsa', 'White', '1992-12-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (92, 'John', 'Foster', '1973-11-06', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (93, 'Creg', 'Brown', '1978-10-04', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (94, 'Angus', 'Young', '1986-05-14', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (95, 'George', 'Evans', '1986-03-01', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (96, 'Cristopher', 'Wright', '1974-05-13', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (97, 'Veronica', 'Hall', '1972-04-12', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (98, 'Yiannis', 'Foskolos', '1992-08-05', 'Male');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (99, 'Amilia', 'Cox', '1985-06-14', 'Female');
INSERT INTO `researcher` (`researcher_id`, `name`, `surname`, `birthday`, `sex`) VALUES (100, 'Edward', 'Ball', '1993-05-27', 'Male');

#
# TABLE STRUCTURE FOR: scientific_center
#

DROP TABLE IF EXISTS `scientific_center`;

CREATE TABLE `scientific_center` (
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget_ministry` decimal(13,2) NOT NULL CHECK (`budget_ministry` > 0),
  `budget_private` decimal(13,2) NOT NULL CHECK (`budget_private` > 0),
  PRIMARY KEY (`abbreviation`),
  CONSTRAINT `scientific_center_ibfk_1` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '348440118.13', '3950846.01');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '88682819.05', '65150854.50');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '440985697.49', '105898902.96');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '313357455.12', '57224152.37');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '391592053.04', '289381055.33');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '117335597.30', '244480642.10');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '375504709.72', '271016355.49');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '362658546.43', '20536130.20');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '1720377.78', '376254897.54');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '295591295.43', '231820106.45');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '273482011.29', '55322181.94');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '395329823.68', '165513343.99');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '234846666.86', '378565232.59');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '428334615.32', '230438523.81');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '195646662.17', '447162774.31');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '177995734.26', '381003954.02');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '408096836.35', '126908206.16');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '341952790.32', '244089747.64');
INSERT INTO `scientific_center` (`abbreviation`, `budget_ministry`, `budget_private`) VALUES ('', '259988136.14', '410421251.16');


#
# TABLE STRUCTURE FOR: scientific_field
#

DROP TABLE IF EXISTS `scientific_field`;

CREATE TABLE `scientific_field` (
  `project_id` int(11) NOT NULL,
  `scientific_field_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`project_id`,`scientific_field_name`),
  CONSTRAINT `scientific_field_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (1, 'accusantium');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (2, 'ipsa');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (3, 'maiores');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (4, 'ex');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (5, 'cum');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (6, 'temporibus');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (7, 'voluptatem');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (8, 'qui');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (9, 'sed');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (10, 'consequatur');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (11, 'quibusdam');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (12, 'deserunt');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (13, 'nisi');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (14, 'quidem');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (15, 'alias');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (16, 'eligendi');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (17, 'et');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (18, 'doloremque');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (19, 'excepturi');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (20, 'rerum');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (21, 'eum');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (22, 'amet');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (23, 'atque');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (24, 'error');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (25, 'natus');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (26, 'illo');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (27, 'minima');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (28, 'nihil');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (29, 'deleniti');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (30, 'ipsum');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (31, 'officiis');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (32, 'ea');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (33, 'nemo');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (34, 'aliquid');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (35, 'dolores');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (36, 'provident');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (37, 'sint');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (38, 'cumque');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (39, 'magnam');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (40, 'repudiandae');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (41, 'repellat');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (42, 'cupiditate');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (43, 'asperiores');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (44, 'aut');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (45, 'optio');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (46, 'consequuntur');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (47, 'enim');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (48, 'eaque');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (49, 'necessitatibus');
INSERT INTO `scientific_field` (`project_id`, `scientific_field_name`) VALUES (50, 'dolorum');


#
# TABLE STRUCTURE FOR: university
#

DROP TABLE IF EXISTS `university`;

CREATE TABLE `university` (
  `abbreviation` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `budget` decimal(13,2) NOT NULL CHECK (`budget` > 0),
  PRIMARY KEY (`abbreviation`),
  CONSTRAINT `university_ibfk_1` FOREIGN KEY (`abbreviation`) REFERENCES `organization` (`abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('HeLtd', '53017.88');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('HSJ', '33027.71');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('JSP', '96049.70');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('JohnGr', '201880.06');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('KeInc', '38496.95');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('KHH', '27686.31');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('KoBr', '35368.93');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('KRD', '40606.56');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('LCK', '5588.69');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('LeLtd', '141679.93');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('LMH', '239428.53');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('LoSw', '51456.68');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('MaSt', '53753.38');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('MuWi', '234082.04');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('MuLtd', '74430.88');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('CoGl', '167335.99');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('CoKo', '300606.12');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('WJ', '5114.05');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('OFad', '128979.04');
INSERT INTO `university` (`abbreviation`, `budget`) VALUES ('PacoG', '83111.34');

#
# TABLE STRUCTURE FOR: works_on_project
#

DROP TABLE IF EXISTS `works_on_project`;

CREATE TABLE `works_on_project` (
  `project_id` int(11) NOT NULL,
  `researcher_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`researcher_id`),
  KEY `researcher_id` (`researcher_id`),
  CONSTRAINT `works_on_project_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`),
  CONSTRAINT `works_on_project_ibfk_2` FOREIGN KEY (`researcher_id`) REFERENCES `researcher` (`researcher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (1, 1);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (2, 2);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (3, 3);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (4, 4);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (5, 5);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (6, 6);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (7, 7);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (8, 8);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (9, 9);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (10, 10);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (11, 11);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (12, 12);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (13, 13);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (14, 14);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (15, 15);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (16, 16);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (17, 17);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (18, 18);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (19, 19);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (20, 20);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (21, 21);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (22, 22);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (23, 23);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (24, 24);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (25, 25);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (26, 26);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (27, 27);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (28, 28);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (29, 29);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (30, 30);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (31, 31);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (32, 32);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (33, 33);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (34, 34);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (35, 35);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (36, 36);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (37, 37);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (38, 38);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (39, 39);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (40, 40);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (41, 41);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (42, 42);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (43, 43);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (44, 44);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (45, 45);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (46, 46);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (47, 47);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (48, 48);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (49, 49);
INSERT INTO `works_on_project` (`project_id`, `researcher_id`) VALUES (50, 50);


