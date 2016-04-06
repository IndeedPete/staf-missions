class CfgORBAT
{
	class EF_Default
	{
		// color[] = {1,1,1,1};
		colorInsignia = "ColorWest";
		commander = "NATOMen";
		side = "West";
	};
	
	class EF
	{
		color[] = {1,1,1,1};
		commander = "Stephen Hackett";
		commanderRank = "GENERAL";
		description = "The 5th EUROFORCE fleet under command of Admiral Stephen Hackett is deployed in the Mediterrainian in order to maintain peace in the wartorn regions on Altis and Stratis.";
		insignia = "\STAF_GEAR\img\EF_ORBAT.paa";
		side = "West";
		size = "Regiment";
		subordinates[] = {TF_COIN, GROUND_ALTIS, GROUND_STRATIS, AIR};
		text = "5th Fleet EUROFORCE";
		textShort = "5th Fleet";
		texture = "\STAF_GEAR\img\EF_ORBAT.paa";
		//texture = "pics\EF_ORBAT.paa";
		type = "HQ";
	};
	
	class GROUND_ALTIS: EF_Default
	{
		commanderRank = "COLONEL";
		size = "Regiment";
		// subordinates[] = {TF_COIN};
		text = "Ground Combat Element Altis";
		textShort = "GCE Altis";
		type = "MechanizedInfantry";
		
		class Regiment_HQ
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "COLONEL";
			side = "West";
			size = "FireTeam";
			text = "Ground Combat Element Altis Headquarters";
			textShort = "GCE Altis HQ";
			type = "HQ";
		};
		
		class Bat_West
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "MAJOR";
			side = "West";
			size = "Battalion";
			text = "First Battalion";
			textShort = "1st Battalion";
			type = "MechanizedInfantry";
			
			class Bat_West_HQ
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "MAJOR";
				side = "West";
				size = "FireTeam";
				text = "First Battalion Headquarters";
				textShort = "1st Battalion HQ";
				type = "HQ";
			};
			
			class Bat_West_Comp1
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "First %2 %3";
				textShort = "1st %3";
				type = "MechanizedInfantry";
				
				class Bat_West_Comp1_HQ
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "CAPTAIN";
					side = "West";
					size = "FireTeam";
					text = "First Company Headquarters";
					textShort = "1st Company HQ";
					type = "HQ";
				};
				
				class Bat_West_Comp1_Platoon1
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "LIEUTENANT";
					side = "West";
					size = "Platoon";
					text = "Third %2 %3";
					textShort = "3rd %3";
					type = "MechanizedInfantry";
				};
				
				class Bat_West_Comp1_Platoon3
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "LIEUTENANT";
					side = "West";
					size = "Platoon";
					text = "Third %2 %3";
					textShort = "3rd %3";
					type = "Infantry";
					
					class Bat_West_Comp1_Platoon3_Squad1
					{
						colorInsignia = "ColorWest";
						commander = "NATOMen";
						commanderRank = "SERGEANT";
						side = "West";
						size = "Squad";
						text = "First %2 %3";
						textShort = "1st %3";
						type = "Infantry";
					};
					
					class Bat_West_Comp1_Platoon3_Squad2
					{
						colorInsignia = "ColorWest";
						commander = "NATOMen";
						commanderRank = "SERGEANT";
						side = "West";
						size = "Squad";
						text = "Second %2 %3";
						textShort = "2nd %3";
						type = "Infantry";
					};
					
					class Bat_West_Comp1_Platoon3_Squad3
					{
						colorInsignia = "ColorWest";
						commander = "NATOMen";
						commanderRank = "SERGEANT";
						side = "West";
						size = "Squad";
						text = "Third %2 %3";
						textShort = "3rd %3";
						type = "Infantry";
					};
					
					class Bat_West_Comp1_Platoon3_Squad4
					{
						colorInsignia = "ColorWest";
						commander = "NATOMen";
						commanderRank = "SERGEANT";
						side = "West";
						size = "Squad";
						text = "Fourth %2 %3";
						textShort = "4th %3";
						type = "Infantry";
					};
				};
			};
			
			class Bat_West_Comp2
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "Second %2 %3";
				textShort = "2nd %3";
				type = "MechanizedInfantry";
			};
			
			class Bat_West_Comp3
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "Third %2 %3";
				textShort = "3rd %3";
				type = "MotorizedInfantry";
				
				class Bat_West_Comp3_Platoon1
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "LIEUTENANT";
					side = "West";
					size = "Platoon";
					text = "First %2 %3";
					textShort = "1st %3";
					type = "MotorizedInfantry";
					
					class Bat_West_Comp3_Platoon1_Squad1
					{
						colorInsignia = "ColorWest";
						commander = "NATOMen";
						commanderRank = "SERGEANT";
						side = "West";
						size = "Squad";
						text = "First %2 %3";
						textShort = "1st %3";
						type = "MotorizedInfantry";
						
						class Bat_West_Comp3_Platoon1_Squad1_FT1
						{
							colorInsignia = "ColorWest";
							commander = "NATOMen";
							commanderRank = "SERGEANT";
							side = "West";
							size = "FireTeam";
							text = "First %2 %3";
							textShort = "1st %3";
							type = "MotorizedInfantry";
						};
					};
				};
			};
			
			class Bat_West_Comp4
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "Fourth Armoured %3";
				textShort = "4th %3";
				type = "Armored";
				
				class Bat_West_Comp4_Platoon1
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "LIEUTENANT";
					side = "West";
					size = "Platoon";
					text = "First %2 %3";
					textShort = "1st %3";
					type = "Armored";
				};
				
				class Bat_West_Comp4_Platoon4
				{
					colorInsignia = "ColorWest";
					commander = "NATOMen";
					commanderRank = "LIEUTENANT";
					side = "West";
					size = "Platoon";
					text = "Fourth %2 %3";
					textShort = "4th %3";
					type = "Artillery";
				};
			};
			
			class Bat_West_Comp5
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "Fifth %2 %3";
				textShort = "5th %3";
				type = "Infantry";
			};
			
			class Bat_West_Comp6
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Company";
				text = "Sixth %2 %3";
				textShort = "6th %3";
				type = "Support";
			};
			
			class Bat_West_Squadron
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "CAPTAIN";
				side = "West";
				size = "Squadron";
				text = "%2 %3";
				textShort = "%3";
				type = "Helicopter";
			};
		};
		
		class Bat_East
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "MAJOR";
			side = "West";
			size = "Battalion";
			text = "Second Battalion";
			textShort = "2nd Battalion";
			type = "MechanizedInfantry";
		};
	};
	
	class TF_COIN: EF_Default
	{
		color[] = {1,1,1,1};
		commander = "NATOMen";
		commanderRank = "CAPTAIN";
		description = "Taskforce COIN is deployed at F.O.B. Moneypenny in order to take on a counter insurgency campaign against a criminal network of local insurgents and foreign mercenaries.";
		insignia = "\STAF_GEAR\img\COIN_ORBAT.paa";
		side = "West";
		size = "Company";
		text = "Task Force Counter Insurgency";
		textShort = "TF COIN";
		texture = "\STAF_GEAR\img\COIN_ORBAT.paa";
		//texture = "pics\COIN_ORBAT.paa";
		type = "HQ";
		
		class Company_HQ
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "CAPTAIN";
			side = "West";
			size = "FireTeam";
			text = "King Company Headquarters";
			textShort = "King";
			type = "HQ";
		};
		
		class Platoon_Mobile_Infantry
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "LIEUTENANT";
			side = "West";
			size = "Platoon";
			text = "Swordsman Mechanised Infantry Platoon";
			textShort = "Swordsman";
			type = "MechanizedInfantry";
			
			class Platoon_HQ
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "LIEUTENANT";
				side = "West";
				size = "FireTeam";
				text = "Swordsman Platoon Headquarters";
				textShort = "Swordsman";
				type = "HQ";
			};
			
			class MBT
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "LIEUTENANT";
				side = "West";
				size = "Squad";
				text = "Besieger Main Battle Tank";
				textShort = "Besieger";
				type = "Armored";
			};
			
			class APC
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "SERGEANT";
				side = "West";
				size = "FireTeam";
				text = "Cavalier Armoured Personnel Carrier";
				textShort = "Cavalier";
				type = "Armored";
			};
			
			class Squad1
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "SERGEANT";
				side = "West";
				size = "Squad";
				text = "Razor Mechanised Infantry Squad";
				textShort = "Razor";
				type = "MechanizedInfantry";
			};
			
			class Squad2
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "SERGEANT";
				side = "West";
				size = "Squad";
				text = "Sabre Motorised Infantry Squad";
				textShort = "Sabre";
				type = "MotorizedInfantry";
			};
			
			class EOD
			{
				colorInsignia = "ColorWest";
				commander = "NATOMen";
				commanderRank = "SERGEANT";
				side = "West";
				size = "FireTeam";
				text = "Paladin Motorised Explosive Ordnance Disposal";
				textShort = "Paladin";
				type = "Support";
			};
		};
		
		class SF1
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "LIEUTENANT";
			side = "West";
			size = "Squad";
			text = "Knight Assault Recon Squad";
			textShort = "Knight";
			type = "Recon";
		};
		
		class SF2
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "SERGEANT";
			side = "West";
			size = "FireTeam";
			text = "Scout Recon Team";
			textShort = "Scout";
			type = "Recon";
		};
		
		class Sniper
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "LIEUTENANT";
			side = "West";
			size = "FireTeam";
			text = "Rogue Sniper Team";
			textShort = "Rogue";
			type = "Recon";
		};
		
		class Covert
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "LIEUTENANT";
			side = "West";
			size = "FireTeam";
			text = "Joker Covert Recon Team";
			textShort = "Joker";
			type = "Recon";
		};
		
		class Air
		{
			colorInsignia = "ColorWest";
			commander = "NATOMen";
			commanderRank = "LIEUTENANT";
			side = "West";
			size = "FireTeam";
			text = "Falcon Helicopter Squadron";
			textShort = "Falcon";
			type = "Helicopter";
		};
	};
	
	class GROUND_STRATIS: EF_Default
	{
		commanderRank = "MAJOR";
		size = "Battalion";
		text = "Ground Combat Element Stratis";
		textShort = "GCE Stratis";
		type = "MechanizedInfantry";
	};
	
	class AIR: EF_Default
	{
		commanderRank = "MAJOR";
		size = "Squadron";
		text = "Aviation Combat Element";
		textShort = "Air Wing";
		type = "Fighter";
	};
};