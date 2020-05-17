
-- ABILITY/Passive SLOTS

CREATE TABLE Ability_slots (
	ID	NUMBER	NOT NULL PRIMARY KEY
);

CREATE TABLE Passive_slots (
	ID	NUMBER	NOT NULL PRIMARY KEY
);

-- SKill
-- 1.035 MULTIPLIER
CREATE TABLE Skills (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(51)	NOT NULL,
	base_cost NUMBER	NOT NULL,
	max_lvl	NUMBER	NOT NULL,
	skill_ID NUMBER REFERENCES Skills(ID)
);

--	ITEM

CREATE TABLE categories (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL
);

CREATE TABLE subcategories (
	category_ID	NUMBER		NOT NULL	REFERENCES categories(ID),
	ID		NUMBER		NOT NULL,
	PRIMARY KEY (ID,category_ID),
	name		VARCHAR(31)	NOT NULL
);

CREATE TABLE Items (
	category_ID 		NUMBER	NOT NULL,
	subcategory_ID		NUMBER	NOT NULL,
	ID			NUMBER	NOT NULL	PRIMARY KEY,
	FOREIGN KEY(subcategory_ID,category_ID)	REFERENCES subcategories(ID,category_ID),
	name			VARCHAR(51)	NOT NULL,
	tier 			NUMBER	NOT NULL,
	enchant 		NUMBER	NOT NULL,
	item_value 		NUMBER	NOT NULL,
	weight 			NUMBER 	NOT NULL,
	skill_ID 		NUMBER	REFERENCES	Skills(ID),
	skill_lvl		NUMBER,
	description		VARCHAR(101),
	focus_return		NUMBER,
	base_return		NUMBER,
	nutrition		NUMBER,
	diet_type		VARCHAR(10),
	grow_time 		VARCHAR(10),
	nutrition_required	NUMBER,
	slot			VARCHAR(11),
	durability		NUMBER,
	Item_Power		NUMBER,
	Quality		NUMBER,
	Additional_weight	NUMBER,
	bonus_energy		NUMBER,
	energy_regen	NUMBER,
	damage			NUMBER,
	dmg_type		VARCHAR(10),
	attack_speed		NUMBER,
	Type 		VARCHAR(10),
	bonus_HP    		NUMBER,
	armour_type		VARCHAR(10),
	rezistance_magincal    		NUMBER,
	rezistance_physical    		NUMBER,
	rezistance_CC    		NUMBER,
	HP			NUMBER,
	normal_speed		NUMBER,
	galop_speed		NUMBER,
	ability_Q		NUMBER	REFERENCES Ability_slots(ID),
	ability_W		NUMBER	REFERENCES Ability_slots(ID),
	ability_E		NUMBER	REFERENCES Ability_slots(ID),
	ability_armour		NUMBER	REFERENCES Ability_slots(ID),
	ability_food		NUMBER	REFERENCES Ability_slots(ID),
	ability_potion		NUMBER	REFERENCES Ability_slots(ID),
	Passive_weapon		NUMBER	REFERENCES Passive_slots(ID),
	Passive_armour		NUMBER	REFERENCES Passive_slots(ID),
	Passive_cape		NUMBER	REFERENCES Passive_slots(ID)
	--Passive_tank		NUMBER	REFERENCES Passive_slots(ID)
);

-- MARKET

CREATE TABLE Markets (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL
);

CREATE TABLE offers (
	Item_ID		NUMBER NOT NULL REFERENCES Items(ID),
	Market_ID	NUMBER NOT NULL REFERENCES Markets(ID),
	PRIMARY KEY(Item_ID,Market_ID),
	update_date DATE NOT NULL,
	price_buy NUMBER NOT NULL,
	price_sell NUMBER NOT NULL
);

-- Recipe

CREATE TABLE Recipes (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	station	VARCHAR(31)	NOT NULL,
	skill_ID NUMBER REFERENCES Skills(ID),
	skill_lvl	NUMBER
);

CREATE TABLE Ingredients (
	recipe_ID	NUMBER	NOT NULL	REFERENCES Recipes(ID),
	item_ID	NUMBER	NOT NULL	REFERENCES	Items(ID),
	PRIMARY KEY(recipe_ID,item_ID),
	amount	NUMBER	NOT NULL
);

CREATE TABLE Possible_outcomes (
	recipe_ID	NUMBER	NOT NULL	REFERENCES Recipes(ID),
	item_ID	NUMBER	NOT NULL	REFERENCES	Items(ID),
	PRIMARY KEY(recipe_ID,item_ID),
	chance	NUMBER	NOT NULL,
	amount	NUMBER	NOT NULL
);

-- Ability

CREATE TABLE Abilities (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL,
	cooldown NUMBER	NOT NULL,
	description VARCHAR(50),
	Cost	NUMBER,
	skill_ID NUMBER REFERENCES Skills(ID),
	skill_lvl	NUMBER
);

CREATE TABLE List_Actives (
	Slot_ID	NUMBER	NOT NULL	REFERENCES Ability_slots(ID),
	Ability_ID	NUMBER	NOT NULL	REFERENCES Abilities(ID),
	PRIMARY KEY(Ability_ID,Slot_ID)
);



CREATE TABLE List_Passives (
	Slot_ID	NUMBER	NOT NULL	REFERENCES Passive_slots(ID),
	Ability_ID	NUMBER	NOT NULL	REFERENCES Abilities(ID),
	PRIMARY KEY(Ability_ID,Slot_ID)
);


-- Sqeuence

--CREATE SEQUENCE SEQ_Ability_slots NOCACHE;
--CREATE SEQUENCE SEQ_Passive_slots NOCACHE;
-- CREATE SEQUENCE SEQ_Skills; manual
CREATE SEQUENCE SEQ_categories NOCACHE;
CREATE SEQUENCE SEQ_Items NOCACHE;
--CREATE SEQUENCE SEQ_Markets;--
CREATE SEQUENCE SEQ_Recipes NOCACHE;
--CREATE SEQUENCE SEQ_Abilities NOCACHE;

-- View

-- ID,Name,Tier,enchant,item_value,weight,skill_ID,skill_lvl,description

CREATE VIEW Item_Seeds AS
	SELECT ID,Name,Tier,enchant,item_value,weight,base_return,focus_return,skill_ID,skill_lvl,description
	FROM Items
	WHERE base_return is not NULL and diet_type is NULL;


CREATE VIEW Item_Ingredients AS
	SELECT ID,Name,Tier,enchant,item_value,weight,nutrition,skill_ID,skill_lvl,description
	FROM Items
	WHERE nutrition is not NULL and ability_food is NULL;


CREATE VIEW Item_Offsprings AS
	SELECT ID,Name,Tier,enchant,item_value,weight,base_return,focus_return,nutrition_required,diet_type,grow_time,skill_ID,skill_lvl,description
	FROM Items
	WHERE diet_type is not NULL;

-- ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,weight,skill_ID,skill_lvl,description
CREATE VIEW Item_Gear AS
	SELECT *
	FROM Items
	WHERE slot is not NULL;

CREATE VIEW Item_Gear_Bags AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,Additional_weight,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE SLOT='BAG';

CREATE VIEW Item_Gear_Capes AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,bonus_energy,Passive_cape,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE SLOT='CAPE';

CREATE VIEW Item_Gear_Weapons AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,damage,attack_speed,dmg_type,ability_Q,ability_W,ability_E,Passive_weapon,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE damage is not NULL;

CREATE VIEW Item_Gear_Armours AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,Type,bonus_HP,bonus_energy,rezistance_physical,rezistance_magincal,rezistance_CC,ability_armour,Passive_armour,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE bonus_HP is not NULL;

CREATE VIEW Item_Gear_Mounts AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE Slot='MOUNT';

CREATE VIEW Item_Potions AS
	SELECT ID,Name,Tier,enchant,item_value,Item_Power,slot,ability_potion,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE ability_potion is not NULL;

CREATE VIEW Item_Food AS
	SELECT ID,Name,Tier,enchant,item_value,Item_Power,slot,ability_food,weight,skill_ID,skill_lvl,description
	FROM Items
	WHERE ability_food is not NULL;

CREATE VIEW Ability_Actives AS
	SELECT *
	FROM Abilities
	WHERE cost is not NULL;

CREATE VIEW Ability_Passives AS
	SELECT *
	FROM Abilities
	WHERE cost is NULL;

CREATE VIEW Recipes_Info AS
	SELECT ID as Recipe_ID,STATION as "Staion_name / Item_ID",skill_ID as "skill_ID / ammount" ,skill_lvl as "skill_lvl / chance" --,ORD
	  FROM
	    (SELECT ID,station,skill_ID,skill_lvl,1 as ORD FROM Recipes
		UNION
	    SELECT recipe_ID as ID,TO_CHAR(item_ID,'99999'),amount,NULL,2 as ORD FROM Ingredients
		UNION
	    SELECT recipe_ID as ID,TO_CHAR(item_ID,'99999'),amount,chance,3 as ORD FROM Possible_outcomes
		UNION
			SELECT ID,NULL,NULL,NULL,4 FROM Recipes)
	ORDER BY ID,ORD;

--SELECT * FROM Products p,categories c WHERE p.CategoryID=c.CategoryID Group BY p.CategoryID HAVING p.price=MIN(p.price)
CREATE VIEW offers_Best_buy AS
	SELECT I.ID AS Item_ID,I.name AS Item_Name,I.tier AS Item_Tier,I.enchant AS Item_Enchant,I.Quality AS Item_Quality,O.price_buy AS Best_buy_price,O.update_date AS Update_date,M.ID AS Market_ID,M.name as Market_Name
	FROM Items I, Markets M, offers O,
		(SELECT Item_ID AS Item_ID,MAX(price_buy) AS best_price
		 FROM offers
		 Group BY ITEM_ID) B
	WHERE I.ID=O.Item_ID AND O.Market_ID=M.ID AND I.ID=B.ITEM_ID AND O.price_buy=B.best_PRICE;

CREATE VIEW offers_Best_sell AS
	SELECT I.ID AS Item_ID,I.name AS Item_Name,I.tier AS Item_Tier,I.enchant AS Item_Enchant,I.Quality AS Item_Quality,O.price_sell AS Best_sell_price,O.update_date AS Update_date,M.ID AS Market_ID,M.name as Market_Name
	FROM Items I, Markets M, offers O,
		(SELECT Item_ID AS Item_ID,MIN(price_sell) AS best_price
		 FROM offers
		 Group BY ITEM_ID) B
	WHERE I.ID=O.Item_ID AND O.Market_ID=M.ID AND I.ID=B.ITEM_ID AND O.price_sell=B.best_PRICE;

-- Skills

INSERT INTO Skills VALUES  (0,'Novice Adventurer',999,1,NULL);
 INSERT INTO Skills VALUES  (1,'Journeyman Adventurer',999,1,0);
  INSERT INTO Skills VALUES  (2,'Adept Adventurer',999,100,1);
   INSERT INTO Skills VALUES  (3,'Expert Adventurer',999,100,2);
    INSERT INTO Skills VALUES  (4,'Master Adventurer',999,100,3);
     INSERT INTO Skills VALUES  (5,'Grandmaster Adventurer',999,100,4);
      INSERT INTO Skills VALUES  (6,'Elder Adventurer',999,100,5);
 INSERT INTO Skills VALUES  (7,'Trainee Craftsman',999,1,0);
  INSERT INTO Skills VALUES  (8,'Journeyman Refiner',999,1,7);
   INSERT INTO Skills VALUES  (9,'Adept Hide Tanner',999,100,8);
    INSERT INTO Skills VALUES  (10,'Expert Hide Tanner',999,100,9);
     INSERT INTO Skills VALUES  (11,'Master Hide Tanner',999,100,10);
      INSERT INTO Skills VALUES  (12,'Grandmaster Hide Tanner',999,100,11);
       INSERT INTO Skills VALUES  (13,'Elder Hide Tanner',999,100,12);
   INSERT INTO Skills VALUES  (14,'Adept Stone Cutter',999,100,8);
    INSERT INTO Skills VALUES  (15,'Expert Stone Cutter',999,100,14);
     INSERT INTO Skills VALUES  (16,'Master Stone Cutter',999,100,15);
      INSERT INTO Skills VALUES  (17,'Grandmaster Stone Cutter',999,100,16);
       INSERT INTO Skills VALUES  (18,'Elder Stone Cutter',999,100,17);
   INSERT INTO Skills VALUES  (19,'Adept Wood Planer',999,100,8);
    INSERT INTO Skills VALUES  (20,'Expert Wood Planer',999,100,19);
     INSERT INTO Skills VALUES  (21,'Master Wood Planer',999,100,20);
      INSERT INTO Skills VALUES  (22,'Grandmaster Wood Planer',999,100,21);
       INSERT INTO Skills VALUES  (23,'Elder Wood Planer',999,100,22);
   INSERT INTO Skills VALUES  (24,'Adept Fiber Weaver',999,100,8);
    INSERT INTO Skills VALUES  (25,'Expert Fiber Weaver',999,100,24);
     INSERT INTO Skills VALUES  (26,'Master Fiber Weaver',999,100,25);
      INSERT INTO Skills VALUES  (27,'Grandmaster Fiber Weaver',999,100,26);
       INSERT INTO Skills VALUES  (28,'Elder Fiber Weaver',999,100,27);
   INSERT INTO Skills VALUES  (29,'Adept Ore Smelter',999,100,8);
    INSERT INTO Skills VALUES  (30,'Expert Ore Smelter',999,100,29);
     INSERT INTO Skills VALUES  (31,'Master Ore Smelter',999,100,30);
      INSERT INTO Skills VALUES  (32,'Grandmaster Ore Smelter',999,100,31);
       INSERT INTO Skills VALUES  (33,'Elder Ore Smelter',999,100,32);
  INSERT INTO Skills VALUES  (34,'Journeyman Toolmaker',999,1,7);
   INSERT INTO Skills VALUES  (35,'Cape Tailor',999,100,34);
    INSERT INTO Skills VALUES  (36,'Cape Tailoring Specialist',999,100,35);
   INSERT INTO Skills VALUES  (37,'Harvester Crafter',999,100,34);
    INSERT INTO Skills VALUES  (38,'Harvester Workboots Crafter',999,100,37);
    INSERT INTO Skills VALUES  (39,'Harvester Garb Crafter',999,100,37);
    INSERT INTO Skills VALUES  (40,'Harvester Cap Crafter',999,100,37);
   INSERT INTO Skills VALUES  (41,'Skinner Crafter',999,100,34);
    INSERT INTO Skills VALUES  (42,'Skinner Workboots Crafter',999,100,41);
    INSERT INTO Skills VALUES  (43,'Skinner Cap Crafter',999,100,41);
    INSERT INTO Skills VALUES  (44,'Skinner Garb Crafter',999,100,41);
   INSERT INTO Skills VALUES  (45,'Miner Crafter',999,100,34);
    INSERT INTO Skills VALUES  (46,'Miner Garb Crafter',999,100,45);
    INSERT INTO Skills VALUES  (47,'Miner Workboots Crafter',999,100,45);
    INSERT INTO Skills VALUES  (48,'Miner Cap Crafter',999,100,45);
   INSERT INTO Skills VALUES  (49,'Bag Tailor',999,100,34);
    INSERT INTO Skills VALUES  (50,'Bag Tailoring Specialist',999,100,49);
   INSERT INTO Skills VALUES  (51,'Fisherman Crafter',999,100,34);
    INSERT INTO Skills VALUES  (52,'Fishing Jerkin Crafter',999,100,51);
    INSERT INTO Skills VALUES  (53,'Fishing Hat Crafter',999,100,51);
    INSERT INTO Skills VALUES  (54,'Fishing Boots Crafter',999,100,51);
   INSERT INTO Skills VALUES  (55,'Demolition Hammer Crafter',999,100,34);
    INSERT INTO Skills VALUES  (56,'Demolition Hammer Crafting Specialist',999,100,55);
   INSERT INTO Skills VALUES  (57,'Quarrier Crafter',999,100,34);
    INSERT INTO Skills VALUES  (58,'Quarrier Garb Crafter',999,100,57);
    INSERT INTO Skills VALUES  (59,'Quarrier Workboots Crafter',999,100,57);
    INSERT INTO Skills VALUES  (60,'Quarrier Cap Crafter',999,100,57);
   INSERT INTO Skills VALUES  (61,'Lumberjack Crafter',999,100,34);
    INSERT INTO Skills VALUES  (62,'Lumberjack Workboots Crafter',999,100,61);
    INSERT INTO Skills VALUES  (63,'Lumberjack Garb Crafter',999,100,61);
    INSERT INTO Skills VALUES  (64,'Lumberjack Cap Crafter',999,100,61);
  INSERT INTO Skills VALUES  (65,'Journeyman Warrior''s Forge Crafter',999,1,7);
   INSERT INTO Skills VALUES  (66,'Hammer Crafter',999,100,65);
    INSERT INTO Skills VALUES  (67,'Artifact Hammer Crafting Specialist',999,100,66);
    INSERT INTO Skills VALUES  (68,'Polehammer Crafting Specialist',999,100,66);
    INSERT INTO Skills VALUES  (69,'Hammer Crafting Specialist',999,100,66);
    INSERT INTO Skills VALUES  (70,'Great Hammer Crafting Specialist',999,100,66);
   INSERT INTO Skills VALUES  (71,'Battleaxe Crafter',999,100,65);
    INSERT INTO Skills VALUES  (72,'Artifact Axe Crafting Specialist',999,100,71);
    INSERT INTO Skills VALUES  (73,'Axe Crafting Specialist',999,100,71);
    INSERT INTO Skills VALUES  (74,'Greataxe Crafting Specialist',999,100,71);
    INSERT INTO Skills VALUES  (75,'Halberd Crafting Specialist',999,100,71);
   INSERT INTO Skills VALUES  (76,'Sword Crafter',999,100,65);
    INSERT INTO Skills VALUES  (77,'Dual Swords Crafting Specialist',999,100,76);
    INSERT INTO Skills VALUES  (78,'Artifact Sword Crafting Specialist',999,100,76);
    INSERT INTO Skills VALUES  (79,'Claymore Crafting Specialist',999,100,76);
    INSERT INTO Skills VALUES  (80,'Sword Crafting Specialist',999,100,76);
   INSERT INTO Skills VALUES  (81,'Plate Helmet Crafter',999,100,65);
    INSERT INTO Skills VALUES  (82,'Artifact Helmet Crafting Specialist',999,100,81);
    INSERT INTO Skills VALUES  (83,'Guardian Helmet Crafting Specialist',999,100,81);
    INSERT INTO Skills VALUES  (84,'Soldier Helmet Crafting Specialist',999,100,81);
    INSERT INTO Skills VALUES  (85,'Knight Helmet Crafting Specialist',999,100,81);
   INSERT INTO Skills VALUES  (86,'Plate Boots Crafter',999,100,65);
    INSERT INTO Skills VALUES  (87,'Soldier Boots Crafting Specialist',999,100,86);
    INSERT INTO Skills VALUES  (88,'Guardian Boots Crafting Specialist',999,100,86);
    INSERT INTO Skills VALUES  (89,'Knight Boots Crafting Specialist',999,100,86);
    INSERT INTO Skills VALUES  (90,'Artifact Boots Crafting Specialist',999,100,86);
   INSERT INTO Skills VALUES  (91,'Mace Crafter',999,100,65);
    INSERT INTO Skills VALUES  (92,'Heavy Mace Crafting Specialist',999,100,91);
    INSERT INTO Skills VALUES  (93,'Mace Crafting Specialist',999,100,91);
    INSERT INTO Skills VALUES  (94,'Morning Star Crafting Specialist',999,100,91);
    INSERT INTO Skills VALUES  (95,'Artifact Mace Crafting Specialist',999,100,91);
   INSERT INTO Skills VALUES  (96,'Shield Crafter',999,100,65);
    INSERT INTO Skills VALUES  (97,'Artifact Shield Crafting Specialist',999,100,96);
    INSERT INTO Skills VALUES  (98,'Shield Crafting Specialist',999,100,96);
   INSERT INTO Skills VALUES  (99,'Plate Armor Crafter',999,100,65);
    INSERT INTO Skills VALUES  (100,'Knight Armor Crafting Specialist',999,100,99);
    INSERT INTO Skills VALUES  (101,'Guardian Armor Crafting Specialist',999,100,99);
    INSERT INTO Skills VALUES  (102,'Artifact Armor Crafting Specialist',999,100,99);
    INSERT INTO Skills VALUES  (103,'Soldier Armor Crafting Specialist',999,100,99);
   INSERT INTO Skills VALUES  (104,'Crossbow Crafter',999,100,65);
    INSERT INTO Skills VALUES  (105,'One-Handed Crossbow Crafting Specialist',999,100,104);
    INSERT INTO Skills VALUES  (106,'Artifact Crossbow Crafting Specialist',999,100,104);
    INSERT INTO Skills VALUES  (107,'Crossbow Crafting Specialist',999,100,104);
    INSERT INTO Skills VALUES  (108,'Heavy Crossbow Crafting Specialist',999,100,104);
  INSERT INTO Skills VALUES  (109,'Journeyman Hunter''s Lodge Crafter',999,1,7);
   INSERT INTO Skills VALUES  (110,'Dagger Crafter',999,100,109);
    INSERT INTO Skills VALUES  (111,'Dagger Crafting Specialist',999,100,110);
    INSERT INTO Skills VALUES  (112,'Dagger Pair Crafting Specialist',999,100,110);
    INSERT INTO Skills VALUES  (113,'Claw Pair Crafting Specialist',999,100,110);
    INSERT INTO Skills VALUES  (114,'Artifact Dagger Crafting Specialist',999,100,110);
   INSERT INTO Skills VALUES  (115,'Leather Hood Crafter',999,100,109);
    INSERT INTO Skills VALUES  (116,'Assassin Hood Crafting Specialist',999,100,115);
    INSERT INTO Skills VALUES  (117,'Mercenary Hood Crafting Specialist',999,100,115);
    INSERT INTO Skills VALUES  (118,'Artifact Hood Crafting Specialist',999,100,115);
    INSERT INTO Skills VALUES  (119,'Hunter Hood Crafting Specialist',999,100,115);
   INSERT INTO Skills VALUES  (120,'Leather Shoes Crafter',999,100,109);
    INSERT INTO Skills VALUES  (121,'Artifact Shoes Crafting Specialist',999,100,120);
    INSERT INTO Skills VALUES  (122,'Hunter Shoes Crafting Specialist',999,100,120);
    INSERT INTO Skills VALUES  (123,'Assassin Shoes Crafting Specialist',999,100,120);
    INSERT INTO Skills VALUES  (124,'Mercenary Shoes Crafting Specialist',999,100,120);
   INSERT INTO Skills VALUES  (125,'Nature Staff Crafter',999,100,109);
    INSERT INTO Skills VALUES  (126,'Wild Staff Crafting Specialist',999,100,125);
    INSERT INTO Skills VALUES  (127,'Great Nature Staff Crafting Specialist',999,100,125);
    INSERT INTO Skills VALUES  (128,'Nature Staff Crafting Specialist',999,100,125);
    INSERT INTO Skills VALUES  (129,'Artifact Nature Staff Crafting Specialist',999,100,125);
   INSERT INTO Skills VALUES  (130,'Torch Crafter',999,100,109);
    INSERT INTO Skills VALUES  (131,'Artifact Torch Crafting Specialist',999,100,130);
    INSERT INTO Skills VALUES  (132,'Torch Crafting Specialist',999,100,130);
   INSERT INTO Skills VALUES  (133,'Bow Crafter',999,100,109);
    INSERT INTO Skills VALUES  (134,'Warbow Crafting Specialist',999,100,133);
    INSERT INTO Skills VALUES  (135,'Artifact Bow Crafting Specialist',999,100,133);
    INSERT INTO Skills VALUES  (136,'Bow Crafting Specialist',999,100,133);
    INSERT INTO Skills VALUES  (137,'Longbow Crafting Specialist',999,100,133);
   INSERT INTO Skills VALUES  (138,'Spear Crafter',999,100,109);
    INSERT INTO Skills VALUES  (139,'Spear Crafting Specialist',999,100,138);
    INSERT INTO Skills VALUES  (140,'Glaive Crafting Specialist',999,100,138);
    INSERT INTO Skills VALUES  (141,'Pike Crafting Specialist',999,100,138);
    INSERT INTO Skills VALUES  (142,'Artifact Spear Crafting Specialist',999,100,138);
   INSERT INTO Skills VALUES  (143,'Leather Jacket Crafter',999,100,109);
    INSERT INTO Skills VALUES  (144,'Assassin Jacket Crafting Specialist',999,100,143);
    INSERT INTO Skills VALUES  (145,'Hunter Jacket Crafting Specialist',999,100,143);
    INSERT INTO Skills VALUES  (146,'Artifact Jacket Crafting Specialist',999,100,143);
    INSERT INTO Skills VALUES  (147,'Mercenary Jacket Crafting Specialist',999,100,143);
   INSERT INTO Skills VALUES  (148,'Quarterstaff Crafter',999,100,109);
    INSERT INTO Skills VALUES  (149,'Artifact Quarterstaff Crafting Specialist',999,100,148);
    INSERT INTO Skills VALUES  (150,'Double-Bladed Staff Crafting Specialist',999,100,148);
    INSERT INTO Skills VALUES  (151,'Quarterstaff Crafting Specialist',999,100,148);
    INSERT INTO Skills VALUES  (152,'Ironclad Staff Crafting Specialist',999,100,148);
  INSERT INTO Skills VALUES  (153,'Journeyman Mage''s Tower Crafter',999,1,7);
   INSERT INTO Skills VALUES  (154,'Frost Staff Crafter',999,100,153);
    INSERT INTO Skills VALUES  (155,'Frost Staff Crafting Specialist',999,100,154);
    INSERT INTO Skills VALUES  (156,'Glacial Staff Crafting Specialist',999,100,154);
    INSERT INTO Skills VALUES  (157,'Great Frost Staff Crafting Specialist',999,100,154);
    INSERT INTO Skills VALUES  (158,'Artifact Frost Staff Crafting Specialist',999,100,154);
   INSERT INTO Skills VALUES  (159,'Cloth Robe Crafter',999,100,153);
    INSERT INTO Skills VALUES  (160,'Mage Robe Crafting Specialist',999,100,159);
    INSERT INTO Skills VALUES  (161,'Artifact Robe Crafting Specialist',999,100,159);
    INSERT INTO Skills VALUES  (162,'Cleric Robe Crafting Specialist',999,100,159);
    INSERT INTO Skills VALUES  (163,'Scholar Robe Crafting Specialist',999,100,159);
   INSERT INTO Skills VALUES  (164,'Fire Staff Crafter',999,100,153);
    INSERT INTO Skills VALUES  (165,'Fire Staff Crafting Specialist',999,100,164);
    INSERT INTO Skills VALUES  (166,'Artifact Fire Staff Crafting Specialist',999,100,164);
    INSERT INTO Skills VALUES  (167,'Great Fire Staff Crafting Specialist',999,100,164);
    INSERT INTO Skills VALUES  (168,'Infernal Staff Crafting Specialist',999,100,164);
   INSERT INTO Skills VALUES  (169,'Cloth Sandals Crafter',999,100,153);
    INSERT INTO Skills VALUES  (170,'Cleric Sandals Crafting Specialist',999,100,169);
    INSERT INTO Skills VALUES  (171,'Scholar Sandals Crafting Specialist',999,100,169);
    INSERT INTO Skills VALUES  (172,'Mage Sandals Crafting Specialist',999,100,169);
    INSERT INTO Skills VALUES  (173,'Artifact Sandals Crafting Specialist',999,100,169);
   INSERT INTO Skills VALUES  (174,'Arcane Staff Crafter',999,100,153);
    INSERT INTO Skills VALUES  (175,'Artifact Arcane Staff Crafting Specialist',999,100,174);
    INSERT INTO Skills VALUES  (176,'Enigmatic Staff Crafting Specialist',999,100,174);
    INSERT INTO Skills VALUES  (177,'Arcane Staff Crafting Specialist',999,100,174);
    INSERT INTO Skills VALUES  (178,'Great Arcane Staff Crafting Specialist',999,100,174);
   INSERT INTO Skills VALUES  (179,'Cursed Staff Crafter',999,100,153);
    INSERT INTO Skills VALUES  (180,'Great Cursed Staff Crafting Specialist',999,100,179);
    INSERT INTO Skills VALUES  (181,'Artifact Cursed Staff Crafting Specialist',999,100,179);
    INSERT INTO Skills VALUES  (182,'Cursed Staff Crafting Specialist',999,100,179);
    INSERT INTO Skills VALUES  (183,'Demonic Staff Crafting Specialist',999,100,179);
   INSERT INTO Skills VALUES  (184,'Cloth Cowl Crafter',999,100,153);
    INSERT INTO Skills VALUES  (185,'Cleric Cowl Crafting Specialist',999,100,184);
    INSERT INTO Skills VALUES  (186,'Artifact Cowl Crafting Specialist',999,100,184);
    INSERT INTO Skills VALUES  (187,'Mage Cowl Crafting Specialist',999,100,184);
    INSERT INTO Skills VALUES  (188,'Scholar Cowl Crafting Specialist',999,100,184);
   INSERT INTO Skills VALUES  (189,'Tome Crafter',999,100,153);
    INSERT INTO Skills VALUES  (190,'Artifact Book Crafting Specialist',999,100,189);
    INSERT INTO Skills VALUES  (191,'Book Crafting Specialist',999,100,189);
   INSERT INTO Skills VALUES  (192,'Holy Staff Crafter',999,100,153);
    INSERT INTO Skills VALUES  (193,'Artifact Holy Staff Crafting Specialist',999,100,192);
    INSERT INTO Skills VALUES  (194,'Great Holy Staff Crafting Specialist',999,100,192);
    INSERT INTO Skills VALUES  (195,'Holy Staff Crafting Specialist',999,100,192);
    INSERT INTO Skills VALUES  (196,'Divine Staff Crafting Specialist',999,100,192);
 INSERT INTO Skills VALUES  (197,'Trainee Farmer',999,1,0);
  INSERT INTO Skills VALUES  (198,'Sous Chef',999,100,197);
   INSERT INTO Skills VALUES  (199,'Alchemist',999,100,198);
    INSERT INTO Skills VALUES  (200,'Heal Brewer',999,100,199);
    INSERT INTO Skills VALUES  (201,'Gigantify Brewer',999,100,199);
    INSERT INTO Skills VALUES  (202,'Sticky Brewer',999,100,199);
    INSERT INTO Skills VALUES  (203,'Invisibility Brewer',999,100,199);
    INSERT INTO Skills VALUES  (204,'Resistance Brewer',999,100,199);
    INSERT INTO Skills VALUES  (205,'Energy Brewer',999,100,199);
    INSERT INTO Skills VALUES  (206,'Bootlegger',999,100,199);
    INSERT INTO Skills VALUES  (207,'Poison Brewer',999,100,199);
   INSERT INTO Skills VALUES  (208,'Chef',999,100,198);
    INSERT INTO Skills VALUES  (209,'Butcher',999,100,208);
    INSERT INTO Skills VALUES  (210,'Omelette Chef',999,100,208);
    INSERT INTO Skills VALUES  (211,'Salad Chef',999,100,208);
    INSERT INTO Skills VALUES  (212,'Stew Chef',999,100,208);
    INSERT INTO Skills VALUES  (213,'Ingredient Chef',999,100,208);
    INSERT INTO Skills VALUES  (214,'Sandwich Chef',999,100,208);
    INSERT INTO Skills VALUES  (215,'Pie Chef',999,100,208);
    INSERT INTO Skills VALUES  (216,'Soup Chef',999,100,208);
  INSERT INTO Skills VALUES  (217,'Harvester',999,100,197);
   INSERT INTO Skills VALUES  (218,'Crop Farmer',999,100,217);
    INSERT INTO Skills VALUES  (219,'Turnip Farmer',999,100,218);
    INSERT INTO Skills VALUES  (220,'Pumpkin Farmer',999,100,218);
    INSERT INTO Skills VALUES  (221,'Wheat Farmer',999,100,218);
    INSERT INTO Skills VALUES  (222,'Potato Farmer',999,100,218);
    INSERT INTO Skills VALUES  (223,'Carrot Farmer',999,100,218);
    INSERT INTO Skills VALUES  (224,'Cabbage Farmer',999,100,218);
    INSERT INTO Skills VALUES  (225,'Corn Farmer',999,100,218);
    INSERT INTO Skills VALUES  (226,'Bean Farmer',999,100,218);
   INSERT INTO Skills VALUES  (227,'Herbalist',999,100,217);
    INSERT INTO Skills VALUES  (228,'Foxglove Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (229,'Comfrey Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (230,'Agaric Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (231,'Teasel Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (232,'Burdock Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (233,'Yarrow Cultivator',999,100,227);
    INSERT INTO Skills VALUES  (234,'Mullein Cultivator',999,100,227);
   INSERT INTO Skills VALUES  (235,'Animal Breeder',999,100,217);
    INSERT INTO Skills VALUES  (236,'Ox Breeder',999,100,235);
    INSERT INTO Skills VALUES  (237,'Cow Breeder',999,100,235);
    INSERT INTO Skills VALUES  (238,'Chicken Breeder',999,100,235);
    INSERT INTO Skills VALUES  (239,'Rare Animal Breeder',999,100,235);
    INSERT INTO Skills VALUES  (240,'Pig Breeder',999,100,235);
    INSERT INTO Skills VALUES  (241,'Horse Breeder',999,100,235);
    INSERT INTO Skills VALUES  (242,'Sheep Breeder',999,100,235);
    INSERT INTO Skills VALUES  (243,'Goat Breeder',999,100,235);
    INSERT INTO Skills VALUES  (244,'Goose Breeder',999,100,235);
 INSERT INTO Skills VALUES  (245,'Trainee Fighter',999,1,0);
  INSERT INTO Skills VALUES  (246,'Journeyman Leather Armor Fighter',999,1,245);
   INSERT INTO Skills VALUES  (247,'Leather Shoes Fighter',999,100,246);
    INSERT INTO Skills VALUES  (248,'Hunter Shoes Combat Specialist',999,100,247);
    INSERT INTO Skills VALUES  (249,'Artifact Shoes Combat Specialist',999,100,247);
    INSERT INTO Skills VALUES  (250,'Assassin Shoes Combat Specialist',999,100,247);
    INSERT INTO Skills VALUES  (251,'Mercenary Shoes Combat Specialist',999,100,247);
   INSERT INTO Skills VALUES  (252,'Leather Hood Fighter',999,100,246);
    INSERT INTO Skills VALUES  (253,'Mercenary Hood Combat Specialist',999,100,252);
    INSERT INTO Skills VALUES  (254,'Artifact Hood Combat Specialist',999,100,252);
    INSERT INTO Skills VALUES  (255,'Assassin Hood Combat Specialist',999,100,252);
    INSERT INTO Skills VALUES  (256,'Hunter Hood Combat Specialist',999,100,252);
   INSERT INTO Skills VALUES  (257,'Leather Jacket Fighter',999,100,246);
    INSERT INTO Skills VALUES  (258,'Assassin Jacket Combat Specialist',999,100,257);
    INSERT INTO Skills VALUES  (259,'Mercenary Jacket Combat Specialist',999,100,257);
    INSERT INTO Skills VALUES  (260,'Hunter Jacket Combat Specialist',999,100,257);
    INSERT INTO Skills VALUES  (261,'Artifact Jacket Combat Specialist',999,100,257);
  INSERT INTO Skills VALUES  (262,'Journeyman Warrior',999,1,245);
   INSERT INTO Skills VALUES  (263,'Crossbow Fighter',999,100,262);
    INSERT INTO Skills VALUES  (264,'Heavy Crossbow Combat Specialist',999,100,263);
    INSERT INTO Skills VALUES  (265,'Artifact Crossbow Combat Specialist',999,100,263);
    INSERT INTO Skills VALUES  (266,'One-Handed Crossbow Combat Specialist',999,100,263);
    INSERT INTO Skills VALUES  (267,'Crossbow Combat Specialist',999,100,263);
   INSERT INTO Skills VALUES  (268,'Axe Fighter',999,100,262);
    INSERT INTO Skills VALUES  (269,'Halberd Combat Specialist',999,100,268);
    INSERT INTO Skills VALUES  (270,'Battleaxe Combat Specialist',999,100,268);
    INSERT INTO Skills VALUES  (271,'Artifact Axe Combat Specialist',999,100,268);
    INSERT INTO Skills VALUES  (272,'Greataxe Combat Specialist',999,100,268);
   INSERT INTO Skills VALUES  (273,'Sword Fighter',999,100,262);
    INSERT INTO Skills VALUES  (274,'Artifact Sword Combat Specialist',999,100,273);
    INSERT INTO Skills VALUES  (275,'Broadsword Combat Specialist',999,100,273);
    INSERT INTO Skills VALUES  (276,'Dual Swords Combat Specialist',999,100,273);
    INSERT INTO Skills VALUES  (277,'Claymore Combat Specialist',999,100,273);
   INSERT INTO Skills VALUES  (278,'Shield Fighter',999,100,262);
    INSERT INTO Skills VALUES  (279,'Artifact Shield Combat Specialist',999,100,278);
    INSERT INTO Skills VALUES  (280,'Shield Combat Specialist',999,100,278);
   INSERT INTO Skills VALUES  (281,'Mace Fighter',999,100,262);
    INSERT INTO Skills VALUES  (282,'Heavy Mace Combat Specialist',999,100,281);
    INSERT INTO Skills VALUES  (283,'Mace Combat Specialist',999,100,281);
    INSERT INTO Skills VALUES  (284,'Morning Star Combat Specialist',999,100,281);
    INSERT INTO Skills VALUES  (285,'Artifact Mace Combat Specialist',999,100,281);
   INSERT INTO Skills VALUES  (286,'Hammer Fighter',999,100,262);
  INSERT INTO Skills VALUES  (287,'Journeyman Plate Armor Fighter',999,1,245);
   INSERT INTO Skills VALUES  (288,'Plate Armor Fighter',999,100,287);
    INSERT INTO Skills VALUES  (289,'Artifact Armor Combat Specialist',999,100,288);
    INSERT INTO Skills VALUES  (290,'Soldier Armor Combat Specialist',999,100,288);
    INSERT INTO Skills VALUES  (291,'Knight Armor Combat Specialist',999,100,288);
    INSERT INTO Skills VALUES  (292,'Guardian Armor Combat Specialist',999,100,288);
   INSERT INTO Skills VALUES  (293,'Plate Helmet Fighter',999,100,287);
    INSERT INTO Skills VALUES  (294,'Soldier Helmet Combat Specialist',999,100,293);
    INSERT INTO Skills VALUES  (295,'Artifact Helmet Combat Specialist',999,100,293);
    INSERT INTO Skills VALUES  (296,'Knight Helmet Combat Specialist',999,100,293);
    INSERT INTO Skills VALUES  (297,'Guardian Helmet Combat Specialist',999,100,293);
   INSERT INTO Skills VALUES  (298,'Plate Boots Fighter',999,100,287);
    INSERT INTO Skills VALUES  (299,'Guardian Boots Combat Specialist',999,100,298);
    INSERT INTO Skills VALUES  (300,'Knight Boots Combat Specialist',999,100,298);
    INSERT INTO Skills VALUES  (301,'Artifact Boots Combat Specialist',999,100,298);
    INSERT INTO Skills VALUES  (302,'Soldier Boots Combat Specialist',999,100,298);
  INSERT INTO Skills VALUES  (303,'Journeyman Mage',999,1,245);
   INSERT INTO Skills VALUES  (304,'Arcanist',999,100,303);
    INSERT INTO Skills VALUES  (305,'Great Arcane Staff Combat Specialist',999,100,304);
    INSERT INTO Skills VALUES  (306,'Artifact Arcane Staff Combat Specialist',999,100,304);
    INSERT INTO Skills VALUES  (307,'Arcane Staff Combat Specialist',999,100,304);
    INSERT INTO Skills VALUES  (308,'Enigmatic Staff Combat Specialist',999,100,304);
   INSERT INTO Skills VALUES  (309,'Tome Fighter',999,100,303);
    INSERT INTO Skills VALUES  (310,'Artifact Book Combat Specialist',999,100,309);
    INSERT INTO Skills VALUES  (311,'Book Combat Specialist',999,100,309);
   INSERT INTO Skills VALUES  (312,'Warlock',999,100,303);
    INSERT INTO Skills VALUES  (313,'Artifact Cursed Staff Combat Specialist',999,100,312);
    INSERT INTO Skills VALUES  (314,'Cursed Staff Combat Specialist',999,100,312);
    INSERT INTO Skills VALUES  (315,'Demonic Staff Combat Specialist',999,100,312);
    INSERT INTO Skills VALUES  (316,'Great Cursed Staff Combat Specialist',999,100,312);
   INSERT INTO Skills VALUES  (317,'Pyromancer',999,100,303);
    INSERT INTO Skills VALUES  (318,'Artifact Fire Staff Combat Specialist',999,100,317);
    INSERT INTO Skills VALUES  (319,'Great Fire Staff Combat Specialist',999,100,317);
    INSERT INTO Skills VALUES  (320,'Infernal Staff Combat Specialist',999,100,317);
    INSERT INTO Skills VALUES  (321,'Fire Staff Combat Specialist',999,100,317);
   INSERT INTO Skills VALUES  (322,'Priest',999,100,303);
    INSERT INTO Skills VALUES  (323,'Divine Staff Combat Specialist',999,100,322);
    INSERT INTO Skills VALUES  (324,'Great Holy Staff Combat Specialist',999,100,322);
    INSERT INTO Skills VALUES  (325,'Artifact Holy Staff Combat Specialist',999,100,322);
    INSERT INTO Skills VALUES  (326,'Holy Staff Combat Specialist',999,100,322);
   INSERT INTO Skills VALUES  (327,'Frost Mage',999,100,303);
    INSERT INTO Skills VALUES  (328,'Frost Staff Combat Specialist',999,100,327);
    INSERT INTO Skills VALUES  (329,'Artifact Frost Staff Combat Specialist',999,100,327);
    INSERT INTO Skills VALUES  (330,'Great Frost Staff Combat Specialist',999,100,327);
    INSERT INTO Skills VALUES  (331,'Glacial Staff Combat Specialist',999,100,327);
  INSERT INTO Skills VALUES  (332,'Journeyman Cloth Armor Fighter',999,1,245);
   INSERT INTO Skills VALUES  (333,'Cloth Cowl Fighter',999,100,332);
    INSERT INTO Skills VALUES  (334,'Scholar Cowl Combat Specialist',999,100,333);
    INSERT INTO Skills VALUES  (335,'Mage Cowl Combat Specialist',999,100,333);
    INSERT INTO Skills VALUES  (336,'Artifact Cowl Combat Specialist',999,100,333);
    INSERT INTO Skills VALUES  (337,'Cleric Cowl Combat Specialist',999,100,333);
   INSERT INTO Skills VALUES  (338,'Cloth Sandals Fighter',999,100,332);
    INSERT INTO Skills VALUES  (339,'Artifact Sandals Combat Specialist',999,100,338);
    INSERT INTO Skills VALUES  (340,'Cleric Sandals Combat Specialist',999,100,338);
    INSERT INTO Skills VALUES  (341,'Scholar Sandals Combat Specialist',999,100,338);
    INSERT INTO Skills VALUES  (342,'Mage Sandals Combat Specialist',999,100,338);
   INSERT INTO Skills VALUES  (343,'Cloth Robe Fighter',999,100,332);
    INSERT INTO Skills VALUES  (344,'Mage Robe Combat Specialist',999,100,343);
    INSERT INTO Skills VALUES  (345,'Scholar Robe Combat Specialist',999,100,343);
    INSERT INTO Skills VALUES  (346,'Artifact Robe Combat Specialist',999,100,343);
    INSERT INTO Skills VALUES  (347,'Cleric Robe Combat Specialist',999,100,343);
  INSERT INTO Skills VALUES  (348,'Journeyman Reaver',999,1,245);
   INSERT INTO Skills VALUES  (349,'Adept Reaver',999,100,348);
    INSERT INTO Skills VALUES  (350,'Expert Reaver',999,100,349);
     INSERT INTO Skills VALUES  (351,'Master Reaver',999,100,350);
      INSERT INTO Skills VALUES  (352,'Grandmaster Reaver',999,100,351);
       INSERT INTO Skills VALUES  (353,'Elder Reaver',999,100,352);
  INSERT INTO Skills VALUES  (354,'Journeyman Hunter',999,1,245);
   INSERT INTO Skills VALUES  (355,'Spear Fighter',999,100,354);
    INSERT INTO Skills VALUES  (356,'Spear Combat Specialist',999,100,355);
    INSERT INTO Skills VALUES  (357,'Glaive Combat Specialist',999,100,355);
    INSERT INTO Skills VALUES  (358,'Artifact Spear Combat Specialist',999,100,355);
    INSERT INTO Skills VALUES  (359,'Pike Combat Specialist',999,100,355);
   INSERT INTO Skills VALUES  (360,'Bow Fighter',999,100,354);
    INSERT INTO Skills VALUES  (361,'Artifact Bow Combat Specialist',999,100,360);
    INSERT INTO Skills VALUES  (362,'Bow Combat Specialist',999,100,360);
    INSERT INTO Skills VALUES  (363,'Longbow Combat Specialist',999,100,360);
    INSERT INTO Skills VALUES  (364,'Warbow Combat Specialist',999,100,360);
   INSERT INTO Skills VALUES  (365,'Dagger Fighter',999,100,354);
    INSERT INTO Skills VALUES  (366,'Dagger Pair Combat Specialist',999,100,365);
    INSERT INTO Skills VALUES  (367,'Dagger Combat Specialist',999,100,365);
    INSERT INTO Skills VALUES  (368,'Artifact Dagger Combat Specialist',999,100,365);
    INSERT INTO Skills VALUES  (369,'Claw Pair Combat Specialist',999,100,365);
   INSERT INTO Skills VALUES  (370,'Torch Fighter',999,100,354);
    INSERT INTO Skills VALUES  (371,'Torch Combat Specialist',999,100,370);
    INSERT INTO Skills VALUES  (372,'Artifact Torch Combat Specialist',999,100,370);
   INSERT INTO Skills VALUES  (373,'Nature Staff Fighter',999,100,354);
    INSERT INTO Skills VALUES  (374,'Artifact Nature Staff Combat Specialist',999,100,373);
    INSERT INTO Skills VALUES  (375,'Wild Staff Combat Specialist',999,100,373);
    INSERT INTO Skills VALUES  (376,'Great Nature Staff Combat Specialist',999,100,373);
    INSERT INTO Skills VALUES  (377,'Nature Staff Combat Specialist',999,100,373);
   INSERT INTO Skills VALUES  (378,'Quarterstaff Fighter',999,100,354);
    INSERT INTO Skills VALUES  (379,'Quarterstaff Combat Specialist',999,100,378);
    INSERT INTO Skills VALUES  (380,'Ironclad Staff Combat Specialist',999,100,378);
    INSERT INTO Skills VALUES  (381,'Double-Bladed Staff Combat Specialist',999,100,378);
    INSERT INTO Skills VALUES  (382,'Artifact Quarterstaff Combat Specialist',999,100,378);
 INSERT INTO Skills VALUES  (383,'Trainee Gatherer',999,1,0);
  INSERT INTO Skills VALUES  (384,'Journeyman Lumberjack',999,1,383);
   INSERT INTO Skills VALUES  (385,'Adept Lumberjack',999,100,384);
    INSERT INTO Skills VALUES  (386,'Expert Lumberjack',999,100,385);
     INSERT INTO Skills VALUES  (387,'Master Lumberjack',999,100,386);
      INSERT INTO Skills VALUES  (388,'Grandmaster Lumberjack',999,100,387);
       INSERT INTO Skills VALUES  (389,'Elder Lumberjack',999,100,388);
  INSERT INTO Skills VALUES  (390,'Journeyman Quarrier',999,1,383);
   INSERT INTO Skills VALUES  (391,'Adept Quarrier',999,100,390);
    INSERT INTO Skills VALUES  (392,'Expert Quarrier',999,100,391);
     INSERT INTO Skills VALUES  (393,'Master Quarrier',999,100,392);
      INSERT INTO Skills VALUES  (394,'Grandmaster Quarrier',999,100,393);
       INSERT INTO Skills VALUES  (395,'Elder Quarrier',999,100,394);
  INSERT INTO Skills VALUES  (396,'Fisherman',999,100,383);
   INSERT INTO Skills VALUES  (397,'Fishing Specialist',999,100,396);
  INSERT INTO Skills VALUES  (398,'Journeyman Fiber Harvester',999,1,383);
   INSERT INTO Skills VALUES  (399,'Adept Fiber Harvester',999,100,398);
    INSERT INTO Skills VALUES  (400,'Expert Fiber Harvester',999,100,399);
     INSERT INTO Skills VALUES  (401,'Master Fiber Harvester',999,100,400);
      INSERT INTO Skills VALUES  (402,'Grandmaster Fiber Harvester',999,100,401);
       INSERT INTO Skills VALUES  (403,'Elder Fiber Harvester',999,100,402);
  INSERT INTO Skills VALUES  (404,'Journeyman Animal Skinner',999,1,383);
   INSERT INTO Skills VALUES  (405,'Adept Animal Skinner',999,100,404);
    INSERT INTO Skills VALUES  (406,'Expert Animal Skinner',999,100,405);
     INSERT INTO Skills VALUES  (407,'Master Animal Skinner',999,100,406);
      INSERT INTO Skills VALUES  (408,'Grandmaster Animal Skinner',999,100,407);
       INSERT INTO Skills VALUES  (409,'Elder Animal Skinner',999,100,408);
  INSERT INTO Skills VALUES  (410,'Journeyman Ore Miner',999,1,383);
   INSERT INTO Skills VALUES  (411,'Adept Ore Miner',999,100,410);
    INSERT INTO Skills VALUES  (412,'Expert Ore Miner',999,100,411);
     INSERT INTO Skills VALUES  (413,'Master Ore Miner',999,100,412);
      INSERT INTO Skills VALUES  (414,'Grandmaster Ore Miner',999,100,413);
       INSERT INTO Skills VALUES  (415,'Elder Ore Miner',999,100,414);

-- categories

INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Accessories');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Armor');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Artifact');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'City Resources');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Consumable');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Farmable');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Furniture');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Gathering Gear');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Luxury Goods');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Magic');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Materials');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Melee');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Mount');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Off-Hand');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Other');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Product');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Ranged');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Resource');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Token');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Tool');
INSERT INTO categories VALUES  (SEQ_categories.NEXTVAL,'Trophies');

-- subcategories

INSERT INTO subcategories VALUES  (1,1,'Bag');
INSERT INTO subcategories VALUES  (1,2,'Cape');

INSERT INTO subcategories VALUES  (2,1,'Cloth Armor');
INSERT INTO subcategories VALUES  (2,2,'Cloth Helmet');
INSERT INTO subcategories VALUES  (2,3,'Cloth Shoes');
INSERT INTO subcategories VALUES  (2,4,'Leather Armor');
INSERT INTO subcategories VALUES  (2,5,'Leather Helmet');
INSERT INTO subcategories VALUES  (2,6,'Leather Shoes');
INSERT INTO subcategories VALUES  (2,7,'Plate Armor');
INSERT INTO subcategories VALUES  (2,8,'Plate Helmet');
INSERT INTO subcategories VALUES  (2,9,'Plate Shoes');
INSERT INTO subcategories VALUES  (2,10,'Unique Armor');
INSERT INTO subcategories VALUES  (2,11,'Unique Helmet');
INSERT INTO subcategories VALUES  (2,12,'Unique Shoes');

INSERT INTO subcategories VALUES  (3,1,'Armor');
INSERT INTO subcategories VALUES  (3,2,'Magic');
INSERT INTO subcategories VALUES  (3,3,'Melee');
INSERT INTO subcategories VALUES  (3,4,'Offhand');
INSERT INTO subcategories VALUES  (3,5,'Ranged');

INSERT INTO subcategories VALUES  (4,1,'Beastheart');
INSERT INTO subcategories VALUES  (4,2,'Mountainheart');
INSERT INTO subcategories VALUES  (4,3,'Rockheart');
INSERT INTO subcategories VALUES  (4,4,'Treeheart');
INSERT INTO subcategories VALUES  (4,5,'Vineheart');

INSERT INTO subcategories VALUES  (5,1,'Cooked');
INSERT INTO subcategories VALUES  (5,2,'Fish');
INSERT INTO subcategories VALUES  (5,3,'Fishing Bait');
INSERT INTO subcategories VALUES  (5,4,'Map');
INSERT INTO subcategories VALUES  (5,5,'Other');
INSERT INTO subcategories VALUES  (5,6,'Potion');
INSERT INTO subcategories VALUES  (5,7,'Tome of Insight');
INSERT INTO subcategories VALUES  (5,8,'Vanity');

INSERT INTO subcategories VALUES  (6,1,'Animal');
INSERT INTO subcategories VALUES  (6,2,'Seed');

INSERT INTO subcategories VALUES  (7,1,'Banner');
INSERT INTO subcategories VALUES  (7,2,'Bed');
INSERT INTO subcategories VALUES  (7,3,'Chest');
INSERT INTO subcategories VALUES  (7,4,'Decoration');
INSERT INTO subcategories VALUES  (7,5,'Flag');
INSERT INTO subcategories VALUES  (7,6,'Heretic');
INSERT INTO subcategories VALUES  (7,7,'Keeper');
INSERT INTO subcategories VALUES  (7,8,'Morgana');
INSERT INTO subcategories VALUES  (7,9,'Repair Kit');
INSERT INTO subcategories VALUES  (7,10,'Table');
INSERT INTO subcategories VALUES  (7,11,'Unique');

INSERT INTO subcategories VALUES  (8,1,'Harvester Garb');
INSERT INTO subcategories VALUES  (8,2,'Harvester Backpack');
INSERT INTO subcategories VALUES  (8,3,'Harvester Cap');
INSERT INTO subcategories VALUES  (8,4,'Harvester Workboots');
INSERT INTO subcategories VALUES  (8,5,'Fisherman Garb');
INSERT INTO subcategories VALUES  (8,6,'Fisherman Backpack');
INSERT INTO subcategories VALUES  (8,7,'Fisherman Cap');
INSERT INTO subcategories VALUES  (8,8,'Fisherman Boots');
INSERT INTO subcategories VALUES  (8,9,'Skinner Garb');
INSERT INTO subcategories VALUES  (8,10,'Skinner Backpack');
INSERT INTO subcategories VALUES  (8,11,'Skinner Cap');
INSERT INTO subcategories VALUES  (8,12,'Skinner Workboots');
INSERT INTO subcategories VALUES  (8,13,'Miner Garb');
INSERT INTO subcategories VALUES  (8,14,'Miner Backpack');
INSERT INTO subcategories VALUES  (8,15,'Miner Cap');
INSERT INTO subcategories VALUES  (8,16,'Miner Workboots');
INSERT INTO subcategories VALUES  (8,17,'Quarrier Garb');
INSERT INTO subcategories VALUES  (8,18,'Quarrier Backpack');
INSERT INTO subcategories VALUES  (8,19,'Quarrier Cap');
INSERT INTO subcategories VALUES  (8,20,'Quarrier Workboots');
INSERT INTO subcategories VALUES  (8,21,'Lumberjack Garb');
INSERT INTO subcategories VALUES  (8,22,'Lumberjack Backpack');
INSERT INTO subcategories VALUES  (8,23,'Lumberjack Cap');
INSERT INTO subcategories VALUES  (8,24,'Lumberjack Workboots');

INSERT INTO subcategories VALUES  (9,1,'Bridgewatch');
INSERT INTO subcategories VALUES  (9,2,'Caerleon');
INSERT INTO subcategories VALUES  (9,3,'Fort Sterling');
INSERT INTO subcategories VALUES  (9,4,'Lymhurst');
INSERT INTO subcategories VALUES  (9,5,'Martlock');
INSERT INTO subcategories VALUES  (9,6,'Thetford');

INSERT INTO subcategories VALUES  (10,1,'Arcane Staff');
INSERT INTO subcategories VALUES  (10,2,'Cursed Staff');
INSERT INTO subcategories VALUES  (10,3,'Fire Staff');
INSERT INTO subcategories VALUES  (10,4,'Frost Staff');
INSERT INTO subcategories VALUES  (10,5,'Holy Staff');
INSERT INTO subcategories VALUES  (10,6,'Nature Staff');

INSERT INTO subcategories VALUES  (11,1,'Essence');
INSERT INTO subcategories VALUES  (11,2,'Other');
INSERT INTO subcategories VALUES  (11,3,'Relic');
INSERT INTO subcategories VALUES  (11,4,'Rune');
INSERT INTO subcategories VALUES  (11,5,'Soul');

INSERT INTO subcategories VALUES  (12,1,'Axe');
INSERT INTO subcategories VALUES  (12,2,'Dagger');
INSERT INTO subcategories VALUES  (12,3,'Hammer');
INSERT INTO subcategories VALUES  (12,4,'Mace');
INSERT INTO subcategories VALUES  (12,5,'Quarterstaff');
INSERT INTO subcategories VALUES  (12,6,'Spear');
INSERT INTO subcategories VALUES  (12,7,'Sword');

INSERT INTO subcategories VALUES  (13,1,'Armored Horse');
INSERT INTO subcategories VALUES  (13,2,'Ox');
INSERT INTO subcategories VALUES  (13,3,'Rare Mount');
INSERT INTO subcategories VALUES  (13,4,'Riding Horse');

INSERT INTO subcategories VALUES  (14,1,'Book');
INSERT INTO subcategories VALUES  (14,2,'Horn');
INSERT INTO subcategories VALUES  (14,3,'Orb');
INSERT INTO subcategories VALUES  (14,4,'Shield');
INSERT INTO subcategories VALUES  (14,5,'Torch');
INSERT INTO subcategories VALUES  (14,6,'Totem');

INSERT INTO subcategories VALUES  (15,1,'Mission Item');
INSERT INTO subcategories VALUES  (15,2,'Trash');

INSERT INTO subcategories VALUES  (16,1,'Animal');
INSERT INTO subcategories VALUES  (16,2,'Cooked');
INSERT INTO subcategories VALUES  (16,3,'Farming');
INSERT INTO subcategories VALUES  (16,4,'Journals');

INSERT INTO subcategories VALUES  (17,1,'Bow');
INSERT INTO subcategories VALUES  (17,2,'Crossbow');

INSERT INTO subcategories VALUES  (18,1,'Cloth');
INSERT INTO subcategories VALUES  (18,2,'Fiber');
INSERT INTO subcategories VALUES  (18,3,'Hide');
INSERT INTO subcategories VALUES  (18,4,'Leather');
INSERT INTO subcategories VALUES  (18,5,'Metal Bar');
INSERT INTO subcategories VALUES  (18,6,'Ore');
INSERT INTO subcategories VALUES  (18,7,'Other');
INSERT INTO subcategories VALUES  (18,8,'Planks');
INSERT INTO subcategories VALUES  (18,9,'Rock');
INSERT INTO subcategories VALUES  (18,10,'Stone Block');
INSERT INTO subcategories VALUES  (18,11,'Wood');

INSERT INTO subcategories VALUES  (19,1,'Arena Sigil');
INSERT INTO subcategories VALUES  (19,2,'Event');
INSERT INTO subcategories VALUES  (19,3,'Map');
INSERT INTO subcategories VALUES  (19,4,'Other');
INSERT INTO subcategories VALUES  (19,5,'Royal Sigil');

INSERT INTO subcategories VALUES  (20,1,'Demolition Hammer');
INSERT INTO subcategories VALUES  (20,2,'Fishing Rod');
INSERT INTO subcategories VALUES  (20,3,'Pickaxe');
INSERT INTO subcategories VALUES  (20,4,'Sickle');
INSERT INTO subcategories VALUES  (20,5,'Skinning Knife');
INSERT INTO subcategories VALUES  (20,6,'Stone Hammer');
INSERT INTO subcategories VALUES  (20,7,'Wood Axe');

INSERT INTO subcategories VALUES  (21,1,'Fiber Trophy');
INSERT INTO subcategories VALUES  (21,2,'Fishing Trophy');
INSERT INTO subcategories VALUES  (21,3,'General Trophy');
INSERT INTO subcategories VALUES  (21,4,'Hide Trophy');
INSERT INTO subcategories VALUES  (21,5,'Mercenary Trophy');
INSERT INTO subcategories VALUES  (21,6,'Ore Trophy');
INSERT INTO subcategories VALUES  (21,7,'Stone Trophy');
INSERT INTO subcategories VALUES  (21,8,'Wood Trophy');

-- Markaet

INSERT INTO Markets VALUES  (1,'Bridgewatch');
INSERT INTO Markets VALUES  (2,'Caerleon');
INSERT INTO Markets VALUES  (3,'Forest Cross');
INSERT INTO Markets VALUES  (4,'Fort Sterling');
INSERT INTO Markets VALUES  (5,'Lymhurst');
INSERT INTO Markets VALUES  (6,'Martlock');
INSERT INTO Markets VALUES  (7,'Morganas Rest');
INSERT INTO Markets VALUES  (8,'Mountain Cross');
INSERT INTO Markets VALUES  (9,'Steppe Cross');
INSERT INTO Markets VALUES  (10,'Swamp Cross');
INSERT INTO Markets VALUES  (11,'Thetford');
INSERT INTO Markets VALUES  (12,'Black Market');

--
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,1,'Iron Ore',4,0,0,0.5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,2,'Uncommon Iron Ore',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,2,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,3,'Rare Iron Ore',4,2,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,2,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,3,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,4,'Rare Titanium Ore',5,2,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,3,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,4,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,5,'Tin Ore',3,0,0,0.3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,6,'Copper Ore',2,0,0,0.2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,7,'Copper Bar',2,0,0,0.2);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,6,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,7,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,8,'Bronze Bar',3,0,0,0.3);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',8,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,5,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,7,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,8,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,9,'Rare Steel Bar',4,2,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,3,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,9,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,10,'Rare Titanium Steel Bar',5,2,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,4,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,9,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,10,100,1);

INSERT INTO Abilities VALUES (1,'Energy Regain',30,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (2,'Stone Skin',45,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (3,'Block',30,'Descriere',0,NULL,NULL);
INSERT INTO Ability_slots VALUES (1);
  INSERT INTO List_Actives VALUES (1,1);
  INSERT INTO List_Actives VALUES (1,2);
  INSERT INTO List_Actives VALUES (1,3);
INSERT INTO Abilities VALUES (4,'Toughness',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (5,'Authority',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (6,'Tenacity',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (1);
INSERT INTO List_Passives VALUES (1,4);
INSERT INTO List_Passives VALUES (1,5);
INSERT INTO List_Passives VALUES (1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,11,'Expert''s Soldier Helmet',5,0,0,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,12,'Expert''s Soldier Helmet',5,0,1,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,13,'Expert''s Soldier Helmet',5,0,2,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,14,'Expert''s Soldier Helmet',5,0,3,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,8,15,'Expert''s Soldier Helmet',5,0,4,0,2.5,'HEAD',800,99999,0,0,0,0,0,'plate',81,10,1,1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Warrior''s Forge',81,10);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,10,8);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,11,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,12,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,13,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,14,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,15,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,16,'Titanium Ore',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,16,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,17,'Runite Ore',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,16,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,17,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,18,'Steel Bar',4,0,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,1,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,18,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,19,'Titanium Steel Bar',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,16,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,18,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,19,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,20,'Runite Steel Bar',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',31,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,17,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,19,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,20,100,1);

INSERT INTO Abilities VALUES (7,'Mend Wounds',30,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (8,'Taunt',10,'Descriere',9,NULL,NULL);
INSERT INTO Abilities VALUES (9,'Fury',40,'Descriere',11,NULL,NULL);
INSERT INTO Ability_slots VALUES (2);
  INSERT INTO List_Actives VALUES (2,7);
  INSERT INTO List_Actives VALUES (2,8);
  INSERT INTO List_Actives VALUES (2,9);
INSERT INTO Abilities VALUES (10,'Toughness',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (11,'Authority',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (12,'Tenacity',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (2);
INSERT INTO List_Passives VALUES (2,10);
INSERT INTO List_Passives VALUES (2,11);
INSERT INTO List_Passives VALUES (2,12);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,21,'Master''s Soldier Armor',6,0,0,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,22,'Master''s Soldier Armor',6,0,1,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,23,'Master''s Soldier Armor',6,0,2,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,24,'Master''s Soldier Armor',6,0,3,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,7,25,'Master''s Soldier Armor',6,0,4,0,7.6,'ARMOR',900,99999,0,0,112,143,0,'plate',99,30,2,2);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Warrior''s Forge',99,30);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,20,16);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,21,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,22,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,23,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,24,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,25,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,26,'Exceptional Iron Ore',4,3,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,3,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,26,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,27,'Exceptional Steel Bar',4,3,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',29,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,26,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,27,100,1);

INSERT INTO Abilities VALUES (13,'Run',30,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (14,'Rejuvenating Sprint',30,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (15,'Shield Charge',25,'Descriere',0,NULL,NULL);
INSERT INTO Ability_slots VALUES (3);
  INSERT INTO List_Actives VALUES (3,13);
  INSERT INTO List_Actives VALUES (3,14);
  INSERT INTO List_Actives VALUES (3,15);
INSERT INTO Abilities VALUES (16,'Courier',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (3);
INSERT INTO List_Passives VALUES (3,16);
INSERT INTO List_Passives VALUES (3,4);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,28,'Adept''s Knight Boots',4,0,0,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,29,'Adept''s Knight Boots',4,0,1,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,30,'Adept''s Knight Boots',4,0,2,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,31,'Adept''s Knight Boots',4,0,3,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_HP,bonus_energy,rezistance_magincal,rezistance_physical,rezistance_CC,type,skill_ID,skill_lvl,ability_armour,Passive_armour) VALUES (2,9,32,'Adept''s Knight Boots',4,0,4,0,1.7,'SHOES',700,99999,0,0,0,0,0,'plate',86,1,3,3);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Warrior''s Forge',86,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,27,8);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,28,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,29,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,30,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,31,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,32,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,33,'Hemp',4,0,0,0.5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,34,'Uncommon Hemp',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,33,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,34,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,35,'Uncommon Skyflower',5,1,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,34,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,35,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,36,'Uncommon Redleaf Cotton',6,1,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,35,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,36,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,37,'Uncommon Sunflax',7,1,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,36,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,37,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,38,'Flax',3,0,0,0.3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,2,39,'Cotton',2,0,0,0.2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,40,'Simple Cloth',2,0,0,0.2);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,39,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,40,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,41,'Neat Cloth',3,0,0,0.3);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',8,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,38,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,40,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,41,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,42,'Uncommon Fine Cloth',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',24,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,34,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,41,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,42,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,43,'Uncommon Ornate Cloth',5,1,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',25,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,35,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,42,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,43,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,44,'Uncommon Lavish Cloth',6,1,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',26,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,36,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,43,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,44,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,45,'Uncommon Opulent Cloth',7,1,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',27,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,37,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,44,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,45,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,46,'Medium Hide',4,0,0,0.5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,47,'Uncommon Medium Hide',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,46,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,47,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,48,'Uncommon Heavy Hide',5,1,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,47,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,48,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,49,'Uncommon Robust Hide',6,1,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,48,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,49,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,50,'Uncommon Thick Hide',7,1,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,49,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,50,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,51,'Thin Hide',3,0,0,0.3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,52,'Rugged Hide',2,0,0,0.2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,53,'Stiff Leather',2,0,0,0.2);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,52,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,53,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,54,'Thick Leather',3,0,0,0.3);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',8,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,51,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,53,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,54,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,55,'Uncommon Worked Leather',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',9,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,47,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,54,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,55,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,56,'Uncommon Cured Leather',5,1,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',10,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,48,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,55,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,56,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,57,'Uncommon Hardened Leather',6,1,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',11,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,49,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,56,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,57,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,58,'Uncommon Reinforced Leather',7,1,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',12,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,50,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,57,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,58,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,59,'Grandmaster''s Tome of Spells',7,0,0,0,5.7,'OFF',1000,999,189,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,60,'Grandmaster''s Tome of Spells',7,0,1,0,5.7,'OFF',1000,999,189,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,61,'Grandmaster''s Tome of Spells',7,0,2,0,5.7,'OFF',1000,999,189,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,62,'Grandmaster''s Tome of Spells',7,0,3,0,5.7,'OFF',1000,999,189,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,skill_ID,skill_lvl) VALUES (14,1,63,'Grandmaster''s Tome of Spells',7,0,4,0,5.7,'OFF',1000,999,189,60);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Mage''s Tower',189,60);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,45,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,58,4);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,59,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,60,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,61,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,62,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,63,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,64,'Meteorite Ore',7,0,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,17,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,64,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,65,'Adamantium Ore',8,0,0,2.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,64,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,65,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,66,'Meteorite Steel Bar',7,0,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',32,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,64,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,20,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,66,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,67,'Adamantium Steel Bar',8,0,0,2.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',33,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,65,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,66,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,67,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,68,'Heavy Hide',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,46,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,68,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,69,'Robust Hide',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,68,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,69,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,70,'Thick Hide',7,0,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,69,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,70,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,3,71,'Resilient Hide',8,0,0,2.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,70,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,71,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,72,'Worked Leather',4,0,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',9,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,46,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,54,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,72,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,73,'Cured Leather',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',10,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,68,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,72,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,73,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,74,'Hardened Leather',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',11,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,69,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,73,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,74,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,75,'Reinforced Leather',7,0,0,1.7);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',12,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,70,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,74,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,75,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,4,76,'Fortified Leather',8,0,0,2.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Tanner',13,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,71,5);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,75,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,76,100,1);

INSERT INTO Abilities VALUES (17,'Heroic Strike',3,'Descriere',2,NULL,NULL);
INSERT INTO Abilities VALUES (18,'Heroic Cleave',3,'Descriere',3,NULL,NULL);
INSERT INTO Ability_slots VALUES (4);
  INSERT INTO List_Actives VALUES (4,17);
  INSERT INTO List_Actives VALUES (4,18);
INSERT INTO Abilities VALUES (19,'Interrupt',10,'Descriere',10,NULL,NULL);
INSERT INTO Abilities VALUES (20,'Iron Will',20,'Descriere',9,NULL,NULL);
INSERT INTO Abilities VALUES (21,'Hamstring',10,'Descriere',10,NULL,NULL);
INSERT INTO Abilities VALUES (22,'Splitting Slash',15,'Descriere',12,NULL,NULL);
INSERT INTO Abilities VALUES (23,'Parry Strike',15,'Descriere',0,NULL,NULL);
INSERT INTO Ability_slots VALUES (5);
  INSERT INTO List_Actives VALUES (5,19);
  INSERT INTO List_Actives VALUES (5,20);
  INSERT INTO List_Actives VALUES (5,21);
  INSERT INTO List_Actives VALUES (5,22);
  INSERT INTO List_Actives VALUES (5,23);
INSERT INTO Abilities VALUES (24,'Mighty Blow',10,'Descriere',11,NULL,NULL);
INSERT INTO Ability_slots VALUES (6);
  INSERT INTO List_Actives VALUES (6,24);
INSERT INTO Abilities VALUES (25,'Deep Cuts',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (26,'Weakening',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (27,'Heroic Fighting',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (28,'Increased Defence',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (4);
INSERT INTO List_Passives VALUES (4,25);
INSERT INTO List_Passives VALUES (4,26);
INSERT INTO List_Passives VALUES (4,27);
INSERT INTO List_Passives VALUES (4,28);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,77,'Elder''s Broadsword',8,0,0,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,78,'Elder''s Broadsword',8,0,1,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,79,'Elder''s Broadsword',8,0,2,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,80,'Elder''s Broadsword',8,0,3,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (12,7,81,'Elder''s Broadsword',8,0,4,0,25.6,'MAIN',1100,68344,45,'physical',1.0,76,100,4,5,6,4);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Warrior''s Forge',76,100);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,67,16);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,76,8);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,77,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,78,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,79,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,80,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,81,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,82,'Pine Logs',4,0,0,0.5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,83,'Uncommon Pine Logs',4,1,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,82,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,83,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,84,'Rare Pine Logs',4,2,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,83,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,84,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,85,'Exceptional Pine Logs',4,3,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,84,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,85,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,86,'Exceptional Cedar Logs',5,3,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,85,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,86,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,87,'Chestnut Logs',3,0,0,0.3);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,88,'Birch Logs',2,0,0,0.2);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,89,'Birch Planks',2,0,0,0.2);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,88,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,89,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,90,'Chestnut Planks',3,0,0,0.3);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',8,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,87,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,89,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,90,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,91,'Exceptional Pine Planks',4,3,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',19,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,85,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,90,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,91,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,92,'Exceptional Cedar Planks',5,3,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',20,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,86,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,91,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,92,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,6,93,'Exceptional Titanium Ore',5,3,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,26,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,93,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,5,94,'Exceptional Titanium Steel Bar',5,3,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Smelter',30,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,93,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,27,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,94,100,1);

INSERT INTO Abilities VALUES (29,'Fire Bolt',0,'Descriere',4,NULL,NULL);
INSERT INTO Abilities VALUES (30,'Burning Field',4,'Descriere',6,NULL,NULL);
INSERT INTO Ability_slots VALUES (7);
  INSERT INTO List_Actives VALUES (7,29);
  INSERT INTO List_Actives VALUES (7,30);
INSERT INTO Abilities VALUES (31,'Ignite',10,'Descriere',13,NULL,NULL);
INSERT INTO Abilities VALUES (32,'Wall of Flames',15,'Descriere',15,NULL,NULL);
INSERT INTO Abilities VALUES (33,'Fire Wave',15,'Descriere',12,NULL,NULL);
INSERT INTO Abilities VALUES (34,'Fire Ball',10,'Descriere',9,NULL,NULL);
INSERT INTO Ability_slots VALUES (8);
  INSERT INTO List_Actives VALUES (8,31);
  INSERT INTO List_Actives VALUES (8,32);
  INSERT INTO List_Actives VALUES (8,33);
  INSERT INTO List_Actives VALUES (8,34);
INSERT INTO Abilities VALUES (35,'Pyroblast',15,'Descriere',15,NULL,NULL);
INSERT INTO Ability_slots VALUES (9);
  INSERT INTO List_Actives VALUES (9,35);
INSERT INTO Abilities VALUES (36,'Burn',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (37,'Energetic',0,'Descriere',0,NULL,NULL);
INSERT INTO Abilities VALUES (38,'Aggressive Caster',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (5);
INSERT INTO List_Passives VALUES (5,36);
INSERT INTO List_Passives VALUES (5,37);
INSERT INTO List_Passives VALUES (5,38);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,95,'Expert''s Fire Staff',5,0,0,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,96,'Expert''s Fire Staff',5,0,1,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,97,'Expert''s Fire Staff',5,0,2,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,98,'Expert''s Fire Staff',5,0,3,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,damage,dmg_type,attack_speed,skill_ID,skill_lvl,ability_Q,ability_W,ability_E,Passive_weapon) VALUES (10,3,99,'Expert''s Fire Staff',5,0,4,0,7.6,'MAIN',800,20250,23,'magical',1.3,164,10,7,8,9,5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Mage''s Tower',164,10);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,92,16);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,94,8);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,95,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,96,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,97,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,98,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,99,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,1,100,'Master''s Ox',6,0,0,15);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,101,'Cedar Logs',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,82,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,101,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,11,102,'Bloodoak Logs',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',NULL,NULL);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,101,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,102,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,103,'Pine Planks',4,0,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',19,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,82,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,90,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,103,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,104,'Cedar Planks',5,0,0,0.8);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',20,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,101,3);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,103,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,104,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,8,105,'Bloodoak Planks',6,0,0,1.1);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Lumbermill',21,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,102,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,104,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,105,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,106,'Master''s Transport Ox',6,0,0,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,107,'Master''s Transport Ox',6,0,1,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,108,'Master''s Transport Ox',6,0,2,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,109,'Master''s Transport Ox',6,0,3,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl) VALUES (13,2,110,'Master''s Transport Ox',6,0,4,0,53.2,'MOUNT',900,9999,9999,0,0,99999,235,30);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Saddler',235,30);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,100,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,105,30);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,106,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,107,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,108,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,109,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,110,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,111,'Grandmaster''s Bag',7,0,0,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,112,'Grandmaster''s Bag',7,0,1,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,113,'Grandmaster''s Bag',7,0,2,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,114,'Grandmaster''s Bag',7,0,3,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,Additional_weight,skill_ID,skill_lvl) VALUES (1,1,115,'Grandmaster''s Bag',7,0,4,0,11.4,'BAG',1000,9999,999,49,60);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Toolmaker',49,60);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,45,8);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,58,8);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,111,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,112,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,113,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,114,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,115,0.1,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (18,1,116,'Fine Cloth',4,0,0,0.5);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Weaver',24,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,33,2);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,41,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,116,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,117,'Adept''s Cape',4,0,0,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,118,'Adept''s Cape',4,0,1,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,119,'Adept''s Cape',4,0,2,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,120,'Adept''s Cape',4,0,3,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,121,'Adept''s Cape',4,0,4,0,1.7,'CAPE',700,999,0,0,35,1,NULL);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Toolmaker',35,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,116,4);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,72,4);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,117,68.8,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,118,25,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,119,5,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,120,1.1,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,121,0.1,1);

INSERT INTO Abilities VALUES (39,'Sandstorm',0,'Descriere',0,NULL,NULL);
INSERT INTO Passive_slots VALUES (6);
INSERT INTO List_Passives VALUES (6,39);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,122,'Adept''s Bridgewatch Cape',4,0,0,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,123,'Adept''s Bridgewatch Cape',4,0,1,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,124,'Adept''s Bridgewatch Cape',4,0,2,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,125,'Adept''s Bridgewatch Cape',4,0,3,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,Quality,item_value,weight,Slot,Item_Power,durability,bonus_energy,energy_regen,skill_ID,skill_lvl,Passive_cape) VALUES (1,2,126,'Adept''s Bridgewatch Cape',4,0,4,0,0.5,'CAPE',700,999,0,0,35,1,6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,127,'Potatoes',6,0,0,0.6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,128,'Sheaf of Wheat',3,0,0,0.6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,2,129,'Flour',3,0,0,0.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Cook',208,0);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,128,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,129,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,2,130,'Bread',4,0,0,0.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Cook',208,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,129,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,130,100,1);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,1,131,'Sheep',6,0,0,15);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,132,'Raw Mutton',6,0,0,0.6);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Butcher',208,30);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,131,1);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,132,100,20);

INSERT INTO Abilities VALUES (40,'Mutton Stew',0,'Descriere',0,NULL,NULL);
INSERT INTO Ability_slots VALUES (10);
  INSERT INTO List_Actives VALUES (10,40);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight,nutrition,ability_food) VALUES (5,1,133,'Mutton Stew',6,0,0,3.97,999,10);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Cook',208,30);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,127,12);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,130,12);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,132,24);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,133,100,10);

INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,134,'Crenellated Burdock',4,0,0,0.6);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight) VALUES (16,3,135,'Brightleaf Comfrey',3,0,0,0.6);
INSERT INTO Abilities VALUES (41,'Minor Poison Potion',60,'Descriere',0,NULL,NULL);
INSERT INTO Ability_slots VALUES (11);
  INSERT INTO List_Actives VALUES (11,41);
INSERT INTO Items (category_ID,subcategory_ID,ID,name,tier,enchant,item_value,weight,ability_potion) VALUES (5,6,136,'Minor Poison Potion',4,0,0,0.17,11);
INSERT INTO Recipes VALUES (SEQ_Recipes.NEXTVAL,'Alchemist''s Lab',199,1);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,134,8);
   INSERT INTO Ingredients VALUES (SEQ_Recipes.currval,135,4);
   INSERT INTO Possible_outcomes VALUES (SEQ_Recipes.currval,136,100,5);

--SELECT * FROM S28_Items where ID in (116,117,118,122,134,136,1,5,4,15,38,70,100) ORDER BY ID

INSERT INTO offers VALUES (1,1,'05/15/2020',110,100);
INSERT INTO offers VALUES (1,2,'05/15/2020',100,90);
INSERT INTO offers VALUES (2,2,'05/15/2020',100,50);
INSERT INTO offers VALUES (1,3,'05/15/2020',100,100);
INSERT INTO offers VALUES (5,3,'05/15/2020',151,150);
INSERT INTO offers VALUES (7,3,'05/15/2020',104,40);
INSERT INTO offers VALUES (3,3,'05/15/2020',111,60);
INSERT INTO offers VALUES (8,3,'05/15/2020',71,52);
INSERT INTO offers VALUES (2,3,'05/15/2020',81,60);
INSERT INTO offers VALUES (100,3,'05/15/2020',90,43);
INSERT INTO offers VALUES (97,3,'05/16/2020',60,53);
INSERT INTO offers VALUES (100,8,'05/16/2020',93,53);
