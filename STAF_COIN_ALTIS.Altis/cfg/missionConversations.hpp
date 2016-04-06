class Conversations
{
	class exit
	{
		exit = 1;
		sentences[] = {"Good bye!"};
	};
	
	// M03
	class M03Opener
	{
		responses[] = {"M03Start", "exit"};
		sentences[] = {
			"TF COIN reporting in, Sir.",
			"Good to see you, we're about to commence the operation."
		};
	};
	
	class M03Start
	{
		exit = 1;
		expression = '["M03"] remoteExecCall ["IP_fnc_startMission", 2, false]';
		sentences[] = {
			"(Start mission.)"
		};
	};
};