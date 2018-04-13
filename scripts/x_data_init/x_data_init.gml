//@description initialize the data object

/// Init Vars
randomize();



/* ---- STRUCT NAMES ---- */
// Declare the names of the various structs as global variables.
// All non-global variables can be called by accessing DATA (ie: DATA.ShipNames);

	globalvar META;
	globalvar ITEMS;
	globalvar FLAVORTEXT;
	globalvar SYSTEMS;
	globalvar CREW;
	globalvar SYSNAMES; SYSNAMES = ["Medbay","Engines","Communications","Systems"];
	globalvar SHIP; 
	globalvar STATIONS;
	globalvar ITEMNAMES; ITEMNAMES = ["rations", "medkits", "parts", "clothing", "money"];
	globalvar PERKS;
	globalvar FAULTS;
	
	globalvar DATE; DATE = 1;
	globalvar TIME; TIME = ["Morning","Afternoon","Evening"];
	globalvar PAUSED; PAUSED = false;

/* ---- END STRUCT NAMES ---- */



/* ---- 

  __  __ ______ _______         _____       _______       
 |  \/  |  ____|__   __|/\     |  __ \   /\|__   __|/\    
 | \  / | |__     | |  /  \    | |  | | /  \  | |  /  \   
 | |\/| |  __|    | | / /\ \   | |  | |/ /\ \ | | / /\ \  
 | |  | | |____   | |/ ____ \  | |__| / ____ \| |/ ____ \ 
 |_|  |_|______|  |_/_/    \_\ |_____/_/    \_\_/_/    \_\

                                                    
---- */
//Inits the metadata the game will track/use

	META = ds_map_create();
	META[? "room"] = room_init;
	META[? "roomStart"] = room_init;
	META[? "TD_posX"] = "None";
	META[? "TD_posY"] = "None";
	META[? "day"] = 0;
	META[? "attn"] = false;
	META[? "eve"] = "None";
	META[? "stationCurrent"] = 0;

/* ---- END META DATA ---- */



/* ---- 

  _____ _______ ______ __  __  _____ 
 |_   _|__   __|  ____|  \/  |/ ____|
   | |    | |  | |__  | \  / | (___  
   | |    | |  |  __| | |\/| |\___ \ 
  _| |_   | |  | |____| |  | |____) |
 |_____|  |_|  |______|_|  |_|_____/ 
                                     
                                                    
---- */

//Inits the following values in the ITEMS map: ["rations", "medkits", "parts", "clothing", "money"]

	ITEMS = ds_map_create()
	for (i=0;i<array_length_1d(ITEMNAMES); i++) {
		ITEMS[? ITEMNAMES[i]] = 0;
	}

/* ---- END ITEMS ---- */



/* ---- 

  ______ _          __      ______  _____    _______ ________   _________ 
 |  ____| |        /\ \    / / __ \|  __ \  |__   __|  ____\ \ / /__   __|
 | |__  | |       /  \ \  / / |  | | |__) |    | |  | |__   \ V /   | |   
 |  __| | |      / /\ \ \/ /| |  | |  _  /     | |  |  __|   > <    | |   
 | |    | |____ / ____ \  / | |__| | | \ \     | |  | |____ / . \   | |   
 |_|    |______/_/    \_\/   \____/|_|  \_\    |_|  |______/_/ \_\  |_|   
                                                                                                                              
                                                    
---- */

//Inits and stores the flavor text for various objects

	FLAVORTEXT = ds_map_create();

	/* ITEMS */
	FLAVORTEXT[? "rations"] = "Not the tastiest thing ever, but they're packed full of nutrients.";
	FLAVORTEXT[? "medkits"] = "Everything you need to treat a space cold.";
	FLAVORTEXT[? "parts"] = "Spare parts for those couple of things that duct tape can't quite fix.";
	FLAVORTEXT[? "clothing"] = "Not very stylish, but they at least look warm... Space is cold, after all.";
	FLAVORTEXT[? "money"] = "Can't buy you love, but love won't get you to Mars.";

	/* SHIPS */
	FLAVORTEXT[? "spooner"] = "Small, quick, and reliable. An Arcadian staple of spacetravel.";
	FLAVORTEXT[? "frigate"] = "While slightly slower, a frigate is better armored and all-around more powerful than a spooner.";
	FLAVORTEXT[? "dreadnought"] = "Bulky, powerful, and plenty of elbow room. What dreadnoughts lack in speed they make up for in physical prowress.";
	
	/* PACKAGES */
	FLAVORTEXT[? "basic_pkg"] = "This is a basic package. It comes well equiped with all the necessities one could need for a happy, healthy CREW. Recommended for first-time space travelers.";
	FLAVORTEXT[? "medium_pkg"] = "This is a medium package. It comes moderately equipped with space travel necessities, with more focus put into hull strength and combat. Recommended for more advanced captains.";
	FLAVORTEXT[? "advanced_pkg"] = "This is an advanced package. It comes equiped with minimal supplies, with a large focus on hull strength and combat capabilites. Recommended for the most experienced and space-savvy captains only.";
	
/* ---- END FLAVOR TEXT ---- */



/* ---- 

   _____ _____  ________          __
  / ____|  __ \|  ____\ \        / /
 | |    | |__) | |__   \ \  /\  / / 
 | |    |  _  /|  __|   \ \/  \/ /  
 | |____| | \ \| |____   \  /\  /   
  \_____|_|  \_\______|   \/  \/    
                                    
                                    
---- */

//Inits the CREW struct and populates it with the "character" (char) attributes

	CREW = ds_map_create();
	for (var i=0; i<4; i++) {
		char = ds_map_create()
		char[? "hp"] = 100;
		char[? "hpMax"] = 100;
		char[? "morale"] = 100;
		char[? "portrait"] = spr_empty;
		char[? "img_index"] = 0;
		char[? "assigned"] = SYSNAMES[i];
		char[? "name"] = "None";
		char[? "perk"] = "None";
		char[? "fault"] = "None";
		CREW[? i] = char;
}

/* ---- END CREW ---- */



/* ---- 

   _______     _______ _______ ______ __  __  _____ 
  / ____\ \   / / ____|__   __|  ____|  \/  |/ ____|
 | (___  \ \_/ / (___    | |  | |__  | \  / | (___  
  \___ \  \   / \___ \   | |  |  __| | |\/| |\___ \ 
  ____) |  | |  ____) |  | |  | |____| |  | |____) |
 |_____/   |_| |_____/   |_|  |______|_|  |_|_____/ 
                                                    
                                                    
---- */

//Inits the base properties for each system in the SHIP
	sysBackgrounds = [spr_empty, spr_empty, spr_empty, spr_empty]
	SYSTEMS = ds_map_create();
	for (var i=0; i<array_length_1d(SYSNAMES); i++) {
		system = ds_map_create();
		system[? "name"] = SYSNAMES[i];
		system[? "hp"] = 5;
		system[? "bg"] = sysBackgrounds[i];
		SYSTEMS[? i] = system;
	}

/* ---- END SYSTEMS ---- */



/* ---- 

   _____ _    _ _____ _____  
  / ____| |  | |_   _|  __ \ 
 | (___ | |__| | | | | |__) |
  \___ \|  __  | | | |  ___/ 
  ____) | |  | |_| |_| |     
 |_____/|_|  |_|_____|_|     
                             
                                                            
---- */

	SHIP = ds_map_create();
	SHIP[? "name"] = "None";
	SHIP[? "spr"] = spr_empty;
	SHIP[? "speed"] = 100;

/* ---- END SHIP ---- */



/* ---- 

   _____ _______    _______ _____ ____  _   _  _____ 
  / ____|__   __|/\|__   __|_   _/ __ \| \ | |/ ____|
 | (___    | |  /  \  | |    | || |  | |  \| | (___  
  \___ \   | | / /\ \ | |    | || |  | | . ` |\___ \ 
  ____) |  | |/ ____ \| |   _| || |__| | |\  |____) |
 |_____/   |_/_/    \_\_|  |_____\____/|_| \_|_____/ 
                                                    
                                                    
---- */

//

	STATIONS = ds_map_create();
	stationNames = ["Mother Station", "Bravo Station", "Charlie Station", "Delta Station"];

	for (var i=0; i<array_length_1d(stationNames); i++) {
		station = ds_map_create();
		station[? "name"] = stationNames[i];
		for (var j=0; j < array_length_1d(ITEMNAMES)-1; j++) {
			
			if i==0 {
				var MotherPrices = [10,20,25,30];
				station[? ITEMNAMES[j]+"_price"] = ds_map_create();
				station[? ITEMNAMES[j]+"_price"] = MotherPrices[j]
				
			} else {
			
				station[? ITEMNAMES[j]+"_price"] = ds_map_create();
				station[? ITEMNAMES[j]+"_price"] = irandom_range(10*(j+1),20*(j+1))  //, irandom_range(20,30),irandom_range(30,40),irandom_range(40,50)]
			
			}
		}
		STATIONS[? i] = station;
	}
	

/* ---- END STATIONS ---- */



/* ----

  _____  ______ _____  _  __ _____ 
 |  __ \|  ____|  __ \| |/ // ____|
 | |__) | |__  | |__) | " /| (___  
 |  ___/|  __| |  _  /|  <  \___ \ 
 | |    | |____| | \ \| . \ ____) |
 |_|    |______|_|  \_\_|\_\_____/ 
                                   

---- */


PERKS = ds_map_create();
perkNames = [
	"None",
	"System Specialist",
	"Med Bay Specialist",
	"Comms Specialist",
	"Engineering Specialist",
	"Optimistic",
	"Low Metabolism",
	"Healthy Minded",
	"Fast Learner",
	"Devoted Co-pilot",
	"Social",
	"Diplomat",
	"Strong Willed",
	"Lucky",
	"Organized",
	"Smuggler",
	"Botanist",
	"Unpredictable",
	"Charming",
	"Artist",
	"Crafty"
];

perkDescs = [
	"No perks",
	"30% less chance of crew getting radiation sickness. 20% additional chance of deflecting damage in combat when stationed in Systems",
	"Boosts recovery time by 10% for all crew when stationed in the Med Bay",
	"Able to identify culture of space stations and some space ships on the minimap when stationed in Comms",
	"Allows for high-speed flight when low on power and reduces coolant usage by 5% when stationed in Engineering",
	"Less likely to be affected by morale drops",
	"Consumes half as much food as normal",
	"10% less chance of getting sick",
	"Gains +1 skill point in whatever system they’re stationed in. Loses it when they leave.",
	"Gains +3 Finesse when the captain is in the med bay",
	"+1 skill point for each crew member in the same room",
	"5% increase to barter prices regardless of other party’s background",
	"Marked for Death takes twice as long",
	"5% increase in good event outcomes",
	"Lose less goods whenever goods are lost",
	"Hides the ship’s culture when taken along. (no cultural advantages or disadvantages when bartering)",
	"Increases food supply by 1% each day (rounding down)",
	"Random, unknown perk",
	"Increases chance of attracting new crew by 5%",
	"Reduces moral drops globally by 5%",
	"Any time supplies are lost, 5% chance of creating a random, new item"
];

for (var i=0; i<array_length_1d(perkNames); i++) {
	
	var perk = ds_map_create();
	perk[? "name"] = perkNames[i];
	perk[? "desc"] = perkDescs[i];
	
	PERKS[? perkNames[i]] = perk;
}



/* ----

  ______     _    _ _   _______ _____ 
 |  ____/\  | |  | | | |__   __/ ____|
 | |__ /  \ | |  | | |    | | | (___  
 |  __/ /\ \| |  | | |    | |  \___ \ 
 | | / ____ \ |__| | |____| |  ____) |
 |_|/_/    \_\____/|______|_| |_____/ 
        
		
---- */
                                      
FAULTS = ds_map_create();

faultNames = [
	"Anti-Social",
	"Untrusting",
	"High Metabolism",
	"Slow Learner",
	"Nervous",
	"Weak Willed",
	"Poor Immune System",
	"Criminal",
	"Unlucky",
	"Clumsy",
	"Unpredictable",
	"Offensive"
];

faultDescs = [
	"-1 MECS point for each person in the same room",
	"More likely to be affected by morale drops",
	"Consumes twice as many rations per day",
	"-1 MECS point for whatever room they’re stationed in",
	"-1 to all MECS points for each crew member in the med bay",
	"Loses morale every day one or more crew members are marked for death",
	"10% more likely to get sick",
	"5% decrease to barter prices",
	"5% increase in bad outcomes",
	"5% more items lost whenever items are lost",
	"Random, unknown fault",
	"Decreases chance of finding new crew members by 5%",
];

for (var i=0; i<array_length_1d(faultNames); i++) {
	
	var fault = ds_map_create();
	fault[? "name"] = faultNames[i];
	fault[? "desc"] = faultDescs[i];
	
	FAULTS[? faultNames[i]] = perk;
}

























