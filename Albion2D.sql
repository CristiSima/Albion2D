
-- ABILITY/Passive SLOTS

CREATE TABLE _TAG_Ability_slots (
	ID	NUMBER	NOT NULL PRIMARY KEY
);

CREATE TABLE _TAG_Passive_slots (
	ID	NUMBER	NOT NULL PRIMARY KEY
);

-- SKill
-- 1.035 MULTIPLIER
CREATE TABLE _TAG_Skills (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(51)	NOT NULL,
	base_cost NUMBER	NOT NULL,
	max_lvl	NUMBER	NOT NULL,
	skill_ID NUMBER REFERENCES _TAG_Skills(ID)
);

--	ITEM

CREATE TABLE _TAG_categories (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL
);

CREATE TABLE _TAG_subcategories (
	category_ID	NUMBER		NOT NULL	REFERENCES _TAG_categories(ID),
	ID		NUMBER		NOT NULL,
	PRIMARY KEY (ID,category_ID),
	name		VARCHAR(31)	NOT NULL
);

CREATE TABLE _TAG_Items (
	category_ID 		NUMBER	NOT NULL,
	subcategory_ID		NUMBER	NOT NULL,
	ID			NUMBER	NOT NULL	PRIMARY KEY,
	FOREIGN KEY(subcategory_ID,category_ID)	REFERENCES _TAG_subcategories(ID,category_ID),
	name			VARCHAR(51)	NOT NULL,
	tier 			NUMBER	NOT NULL,
	enchant 		NUMBER	NOT NULL,
	item_value 		NUMBER	NOT NULL,
	weight 			NUMBER 	NOT NULL,
	skill_ID 		NUMBER	REFERENCES	_TAG_Skills(ID),
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
	ability_Q		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	ability_W		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	ability_E		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	ability_armour		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	ability_food		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	ability_potion		NUMBER	REFERENCES _TAG_Ability_slots(ID),
	Passive_weapon		NUMBER	REFERENCES _TAG_Passive_slots(ID),
	Passive_armour		NUMBER	REFERENCES _TAG_Passive_slots(ID),
	Passive_cape		NUMBER	REFERENCES _TAG_Passive_slots(ID)
	--Passive_tank		NUMBER	REFERENCES _TAG_Passive_slots(ID)
);

-- MARKET

CREATE TABLE _TAG_Markets (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL
);

CREATE TABLE _TAG_offers (
	Item_ID		NUMBER NOT NULL REFERENCES _TAG_Items(ID),
	Market_ID	NUMBER NOT NULL REFERENCES _TAG_Markets(ID),
	PRIMARY KEY(Item_ID,Market_ID),
	update_date DATE NOT NULL,
	price_buy NUMBER NOT NULL,
	price_sell NUMBER NOT NULL
);

-- Recipe

CREATE TABLE _TAG_Recipes (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	station	VARCHAR(31)	NOT NULL,
	skill_ID NUMBER REFERENCES _TAG_Skills(ID),
	skill_lvl	NUMBER
);

CREATE TABLE _TAG_Ingredients (
	recipe_ID	NUMBER	NOT NULL	REFERENCES _TAG_Recipes(ID),
	item_ID	NUMBER	NOT NULL	REFERENCES	_TAG_Items(ID),
	PRIMARY KEY(recipe_ID,item_ID),
	amount	NUMBER	NOT NULL
);

CREATE TABLE _TAG_Possible_outcomes (
	recipe_ID	NUMBER	NOT NULL	REFERENCES _TAG_Recipes(ID),
	item_ID	NUMBER	NOT NULL	REFERENCES	_TAG_Items(ID),
	PRIMARY KEY(recipe_ID,item_ID),
	chance	NUMBER	NOT NULL,
	amount	NUMBER	NOT NULL
);

-- Ability

CREATE TABLE _TAG_Abilities (
	ID	NUMBER		NOT NULL PRIMARY KEY,
	name	VARCHAR(31)	NOT NULL,
	cooldown NUMBER	NOT NULL,
	description VARCHAR(50),
	Cost	NUMBER,
	skill_ID NUMBER REFERENCES _TAG_Skills(ID),
	skill_lvl	NUMBER
);

CREATE TABLE _TAG_List_Actives (
	Slot_ID	NUMBER	NOT NULL	REFERENCES _TAG_Ability_slots(ID),
	Ability_ID	NUMBER	NOT NULL	REFERENCES _TAG_Abilities(ID),
	PRIMARY KEY(Ability_ID,Slot_ID)
);



CREATE TABLE _TAG_List_Passives (
	Slot_ID	NUMBER	NOT NULL	REFERENCES _TAG_Passive_slots(ID),
	Ability_ID	NUMBER	NOT NULL	REFERENCES _TAG_Abilities(ID),
	PRIMARY KEY(Ability_ID,Slot_ID)
);


-- Sqeuence

--CREATE SEQUENCE _TAG_SEQ_Ability_slots NOCACHE;
--CREATE SEQUENCE _TAG_SEQ_Passive_slots NOCACHE;
-- CREATE SEQUENCE _TAG_SEQ_Skills; manual
CREATE SEQUENCE _TAG_SEQ_categories NOCACHE;
CREATE SEQUENCE _TAG_SEQ_Items NOCACHE;
--CREATE SEQUENCE _TAG_SEQ_Markets;--
CREATE SEQUENCE _TAG_SEQ_Recipes NOCACHE;
--CREATE SEQUENCE _TAG_SEQ_Abilities NOCACHE;

-- View

-- ID,Name,Tier,enchant,item_value,weight,skill_ID,skill_lvl,description

CREATE VIEW _TAG_Item_Seeds AS
	SELECT ID,Name,Tier,enchant,item_value,weight,base_return,focus_return,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE base_return is not NULL and diet_type is NULL;


CREATE VIEW _TAG_Item_Ingredients AS
	SELECT ID,Name,Tier,enchant,item_value,weight,nutrition,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE nutrition is not NULL and ability_food is NULL;


CREATE VIEW _TAG_Item_Offsprings AS
	SELECT ID,Name,Tier,enchant,item_value,weight,base_return,focus_return,nutrition_required,diet_type,grow_time,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE diet_type is not NULL;

-- ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,weight,skill_ID,skill_lvl,description
CREATE VIEW _TAG_Item_Gear AS
	SELECT *
	FROM _TAG_Items
	WHERE slot is not NULL;

CREATE VIEW _TAG_Item_Gear_Bags AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,Additional_weight,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE SLOT='BAG';

CREATE VIEW _TAG_Item_Gear_Capes AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,bonus_energy,Passive_cape,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE SLOT='CAPE';

CREATE VIEW _TAG_Item_Gear_Weapons AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,damage,attack_speed,dmg_type,ability_Q,ability_W,ability_E,Passive_weapon,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE damage is not NULL;

CREATE VIEW _TAG_Item_Gear_Armours AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,Type,bonus_HP,bonus_energy,rezistance_physical,rezistance_magincal,rezistance_CC,ability_armour,Passive_armour,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE bonus_HP is not NULL;

CREATE VIEW _TAG_Item_Gear_Mounts AS
	SELECT ID,Name,Tier,enchant,Quality,durability,item_value,Item_Power,slot,HP,normal_speed,galop_speed,Additional_weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE Slot='MOUNT';

CREATE VIEW _TAG_Item_Potions AS
	SELECT ID,Name,Tier,enchant,item_value,Item_Power,slot,ability_potion,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE ability_potion is not NULL;

CREATE VIEW _TAG_Item_Food AS
	SELECT ID,Name,Tier,enchant,item_value,Item_Power,slot,ability_food,weight,skill_ID,skill_lvl,description
	FROM _TAG_Items
	WHERE ability_food is not NULL;

CREATE VIEW _TAG_Ability_Actives AS
	SELECT *
	FROM _TAG_Abilities
	WHERE cost is not NULL;

CREATE VIEW _TAG_Ability_Passives AS
	SELECT *
	FROM _TAG_Abilities
	WHERE cost is NULL;

CREATE VIEW _TAG_Recipes_Info AS
	SELECT ID as Recipe_ID,STATION as "Staion_name / Item_ID",skill_ID as "skill_ID / ammount" ,skill_lvl as "skill_lvl / chance" --,ORD
	  FROM
	    (SELECT ID,station,skill_ID,skill_lvl,1 as ORD FROM _TAG_Recipes
		UNION
	    SELECT recipe_ID as ID,TO_CHAR(item_ID,'99999'),amount,NULL,2 as ORD FROM _TAG_Ingredients
		UNION
	    SELECT recipe_ID as ID,TO_CHAR(item_ID,'99999'),amount,chance,3 as ORD FROM _TAG_Possible_outcomes
		UNION
			SELECT ID,NULL,NULL,NULL,4 FROM _TAG_Recipes)
	ORDER BY ID,ORD;

--SELECT * FROM Products p,categories c WHERE p.CategoryID=c.CategoryID Group BY p.CategoryID HAVING p.price=MIN(p.price)
CREATE VIEW _TAG_offers_Best_buy AS
	SELECT I.ID AS Item_ID,I.name AS Item_Name,I.tier AS Item_Tier,I.enchant AS Item_Enchant,I.Quality AS Item_Quality,O.price_buy AS Best_buy_price,O.update_date AS Update_date,M.ID AS Market_ID,M.name as Market_Name
	FROM _TAG_Items I, _TAG_Markets M, _TAG_offers O,
		(SELECT Item_ID AS Item_ID,MAX(price_buy) AS best_price
		 FROM _TAG_offers
		 Group BY ITEM_ID) B
	WHERE I.ID=O.Item_ID AND O.Market_ID=M.ID AND I.ID=B.ITEM_ID AND O.price_buy=B.best_PRICE;

CREATE VIEW _TAG_offers_Best_sell AS
	SELECT I.ID AS Item_ID,I.name AS Item_Name,I.tier AS Item_Tier,I.enchant AS Item_Enchant,I.Quality AS Item_Quality,O.price_sell AS Best_sell_price,O.update_date AS Update_date,M.ID AS Market_ID,M.name as Market_Name
	FROM _TAG_Items I, _TAG_Markets M, _TAG_offers O,
		(SELECT Item_ID AS Item_ID,MIN(price_sell) AS best_price
		 FROM _TAG_offers
		 Group BY ITEM_ID) B
	WHERE I.ID=O.Item_ID AND O.Market_ID=M.ID AND I.ID=B.ITEM_ID AND O.price_sell=B.best_PRICE;
