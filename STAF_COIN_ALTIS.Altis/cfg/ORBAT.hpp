class CfgORBAT
{
	class EF
	{
		color[] = {1,1,1,1};
		commander = "Stephen Hackett";
		commanderRank = "GENERAL";
		description = "The 5th EUROFORCE fleet under command of Admiral Stephen Hackett is deployed in the Mediterrainian in order to maintain peace in the wartorn regions on Altis and Stratis.";
		insignia = "pics\EF_ORBAT.paa";
		side = "West";
		size = "Regiment";
		subordinates[] = {TF_COIN};
		text = "5th Fleet EUROFORCE";
		textShort = "5th Fleet";
		texture = "Campaigns\IP_CMP_ICE\img\ORBAT\EF_ORBAT.paa";
		//texture = "pics\EF_ORBAT.paa";
		type = "HQ";
	};
	
	class TF_COIN
	{
		color[] = {1,1,1,1};
		commander = "NATOMen";
		commanderRank = "CAPTAIN";
		description = "Taskforce COIN is deployed at F.O.B. Moneypenny in order to take on a counter insurgency campaign against a criminal network of local insurgents and foreign mercenaries.";
		insignia = "pics\COIN_ORBAT.paa";
		side = "West";
		size = "Company";
		text = "Task Force Counter Insurgency";
		textShort = "TF COIN";
		texture = "Campaigns\IP_CMP_ICE\img\ORBAT\COIN_ORBAT.paa";
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
};