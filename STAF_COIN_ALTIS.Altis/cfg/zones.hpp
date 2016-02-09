class CfgZones
{
	class ZoneDefault
	{
		active = 0;
		isRectangle = 0;
		size[] = {0,0};
		
		class Commander
		{
			className = "O_Officer_F";
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
				classNames[] = {"O_G_Soldier_SL_F","O_G_Soldier_AR_F","O_G_Sharpshooter_F","O_G_medic_F","O_G_Soldier_GL_F"};
				configPath[] = {"East","OPF_F","Infantry","OIA_InfSquad"};
				groupInit = "";
				isMerc = 0;
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
			class Assets1: AssetsDefault
			{
				active = 1;
			};
			class Assets2: AssetsDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 0.9;
			};
		};
	};
	
	class Zone1: ZoneDefault
	{
		active = 1;
		size[] = {750,750};
		
		class Assets: Assets
		{
			class Assets0: AssetsDefault
			{
				active = 1;
			};
			class Assets1: AssetsDefault
			{
				active = 2;
				configPath[] = {"East","OPF_F","Infantry","OIA_InfTeam"};
				isMerc = 1;
				mode = "FORTIFY";
				probability = 0.66;
			};
		};
	};
	
	class Zone2: ZoneDefault
	{
		active = 1;
		size[] = {1000,1000};
		
		class Assets: Assets
		{
			class Assets0: AssetsDefault
			{
				active = 1;
			};
			class Assets1: AssetsDefault
			{
				active = 1;
				mode = "FORTIFY";
			};
			class Assets2: AssetsDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 0.5;
			};
		};
	};
	
	class Zone3: ZoneDefault
	{
		active = 1;
		size[] = {1000,1000};
		
		class Assets: Assets
		{
			class Assets0: AssetsDefault
			{
				active = 1;
			};
			class Assets1: AssetsDefault
			{
				active = 1;
			};
			class Assets2: AssetsDefault
			{
				active = 2;
				isMerc = 1;
				mode = "NOFOLLOW";
				probability = 0.75;
			};
			class Assets3: Assets2 
			{
				mode = "FORTIFY";
				probability = 0.5;
			};
		};
	};
	
	class Zone4: ZoneDefault
	{
		active = 1;
		size[] = {500,500};
		
		class Assets: Assets
		{
			class Assets0: AssetsDefault
			{
				active = 1;
				probability = 0.5;
			};
		};
	};
};