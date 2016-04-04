class CfgZones
{
	class ZoneDefault
	{
		active = 0;
		displayName = "Zone Default";
		isRectangle = 0;
		size[] = {1000,1000};
		
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
			class AssetDefault 
			{
				active = 0;
				className = "O_G_Offroad_01_armed_F";
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
		displayName = "Zone Airfield";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 0.9;
			};
			class Asset3: AssetDefault
			{
				active = 3;
				isMerc = 1;
				mode = "NOFOLLOW";
				probability = 1;
			};
			class Asset4: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_hmg_F";
				isMerc = 1;
				mode = "MOVE";
				probability = 0.75;
			};
			class Asset5: AssetDefault
			{
				active = 3;
				className = "O_APC_Tracked_02_AA_F";
				isMerc = 1;
				mode = "FORTIFY";
				probability = 0.33;
			};
		};
	};
	
	class Zone1: ZoneDefault
	{
		active = 1;
		displayName = "Zone Abdera";
		size[] = {750,750};
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
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
		displayName = "Zone Galati";
		size[] = {250,250};
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
				mode = "FORTIFY";
				probability = 0.5;
			};
		};
	};
	
	class Zone3: ZoneDefault
	{
		active = 1;
		displayName = "Zone Syrta";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
			};
			class Asset3: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 1;
			};
			class Asset4: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "NOFOLLOW";
				probability = 0.75;
			};
			class Asset5: Asset2 
			{
				mode = "FORTIFY";
				probability = 0.5;
			};
			class Asset6: AssetDefault
			{
				active = 3;
			};
			class Asset7: Asset5
			{
				mode = "FORTIFY";
				probability = 0.75;
			};
			class Asset8: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_hmg_F";
				isMerc = 1;
			};
			class Asset9: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_gmg_F";
				mode = "FORTIFY";
				isMerc = 1;
				probability = 0.75;
			};
			class Asset10: AssetDefault
			{
				active = 3;
				className = "O_APC_Wheeled_02_rcws_F";
				isMerc = 1;
				probability = 0.9;
			};
			class Asset11: AssetDefault
			{
				active = 3;
				className = "O_MBT_02_cannon_F";
				mode = "MOVE";
				isMerc = 1;
				probability = 0.3;
			};
		};
	};
	
	class Zone4: ZoneDefault
	{
		active = 1;
		displayName = "Zone Orino";
		size[] = {500,500};
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
				probability = 0.5;
			};
		};
	};
	
	class Zone5: ZoneDefault
	{
		active = 1;
		displayName = "Zone Gori";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
				probability = 0.5;
			};
			class Asset3: AssetDefault
			{
				active = 3;
				probability = 0.8;
			};
		};
	};
	
	class Zone6: ZoneDefault
	{
		active = 1;
		displayName = "Zone Agios Konstantinos";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
			};
			class Asset3: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 1;
			};
			class Asset4: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "NOFOLLOW";
				probability = 0.75;
			};
			class Asset5: Asset2 
			{
				mode = "FORTIFY";
				probability = 0.5;
			};
			class Asset6: AssetDefault
			{
				active = 3;
			};
			class Asset7: Asset5
			{
				mode = "FORTIFY";
				probability = 0.75;
			};
			class Asset8: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_hmg_F";
				isMerc = 1;
			};
			class Asset9: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_gmg_F";
				mode = "FORTIFY";
				isMerc = 1;
				probability = 0.75;
			};
			class Asset10: AssetDefault
			{
				active = 3;
				className = "O_APC_Wheeled_02_rcws_F";
				isMerc = 1;
				probability = 0.9;
			};
			class Asset11: AssetDefault
			{
				active = 3;
				className = "O_MBT_02_cannon_F";
				mode = "MOVE";
				isMerc = 1;
				probability = 0.3;
			};
		};
	};
	
	class Zone7: ZoneDefault
	{
		active = 1;
		displayName = "Zone Dump";
		size[] = {500,500};
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 2;
				isMerc = 1;
			};
			class Asset1: AssetDefault
			{
				active = 2;
				isMerc = 1;
				probability = 0.3;
			};
			class Asset2: AssetDefault
			{
				active = 1;
				probability = 0.6;
			};
			class Asset3: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_hmg_F";
				isMerc = 1;
			};
			class Asset4: AssetDefault
			{
				active = 3;
				className = "O_MBT_02_cannon_F";
				mode = "FORTIFY";
				isMerc = 1;
				probability = 0.75;
			};
			class Asset5: AssetDefault
			{
				active = 3;
				className = "O_APC_Tracked_02_cannon_F";
				isMerc = 1;
				probability = 0.5;
			};
		};
	};
	
	class Zone8: ZoneDefault
	{
		active = 1;
		displayName = "Zone Oerokastro";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
			};
			class Asset3: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "MOVE";
				probability = 1;
			};
			class Asset4: AssetDefault
			{
				active = 2;
				isMerc = 1;
				mode = "NOFOLLOW";
				probability = 0.75;
			};
			class Asset5: Asset2 
			{
				mode = "FORTIFY";
				probability = 0.5;
			};
			class Asset6: AssetDefault
			{
				active = 3;
			};
			class Asset7: Asset5
			{
				mode = "FORTIFY";
				probability = 0.75;
			};
			class Asset8: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_hmg_F";
				isMerc = 1;
			};
			class Asset9: AssetDefault
			{
				active = 3;
				className = "O_MRAP_02_gmg_F";
				mode = "FORTIFY";
				isMerc = 1;
				probability = 0.75;
			};
			class Asset10: AssetDefault
			{
				active = 3;
				className = "O_APC_Wheeled_02_rcws_F";
				isMerc = 1;
				probability = 0.9;
			};
			class Asset11: AssetDefault
			{
				active = 3;
				className = "O_MBT_02_cannon_F";
				mode = "MOVE";
				isMerc = 1;
				probability = 0.3;
			};
		};
	};
	
	class Zone9: ZoneDefault
	{
		active = 1;
		displayName = "Zone North";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
				probability = 0.75;
			};
			class Asset2: AssetDefault
			{
				active = 3;
				probability = 0.8;
			};
		};
	};
	
	class Zone10: ZoneDefault
	{
		active = 1;
		displayName = "Zone Centre";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
				probability = 0.8;
			};
			class Asset3: AssetDefault
			{
				active = 1;
				probability = 0.3;
			};
		};
	};
	
	class Zone11: ZoneDefault
	{
		active = 1;
		displayName = "Zone South-West";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
				probability = 0.8;
			};
			class Asset3: AssetDefault
			{
				active = 1;
				probability = 0.3;
			};
		};
	};
	
	class Zone12: ZoneDefault
	{
		active = 1;
		displayName = "Zone West";
		
		class Assets: Assets
		{
			class Asset0: AssetDefault
			{
				active = 1;
			};
			class Asset1: AssetDefault
			{
				active = 1;
			};
			class Asset2: AssetDefault
			{
				active = 1;
				probability = 0.8;
			};
			class Asset3: AssetDefault
			{
				active = 1;
				probability = 0.3;
			};
		};
	};
};