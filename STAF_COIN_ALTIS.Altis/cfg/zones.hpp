class CfgZones
{
	class ZoneDefault
	{
		active = 0;
		isRectangle = 0;
		size[] = {0,0};
		
		class Commander
		{
			classname = "O_Officer_F";
			groupInit = "";
			isMerc = 1;
			mode = "FORTIFY";
			rank = "LIEUTENANT";
			unitInit = "";
		};
		
		class Assets
		{
			class AssetsDefault 
			{
				active = 0;
				configPath[] = {"East","OPF_F","Infantry","OIA_InfSquad"};
				groupInit = "";
				isMerc = 1;
				mode = "NOFOLLOW"; // "MOVE", "NOFOLLOW", "FORTIFY"
				probability = 1;
				unitInit = "";
			};
		};	
	};
	
	class Zone0: ZoneDefault
	{
		active = 1;
		size[] = {1000,1000};
		
		class Assets: Assets
		{
			class Assets0: AssetsDefault
			{
				active = 1;
			};
		};
	};
};