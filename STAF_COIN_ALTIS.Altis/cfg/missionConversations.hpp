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
		responses[] = {"M03Plan", "M03Us", "M03Enemy", "M03Start", "exit"};
		sentences[] = {
			"TF COIN reporting in, Sir.",
			"Good to see you, we're about to commence the operation."
		};
	};
	
	class M03Plan
	{
		responses[] = {"M03Us", "M03Enemy", "M03Start", "exit"};
		sentences[] = {
			"What's the plan?",
			"Check your map, soldier. We have five infantry squads, accompanied by two armoured vehicles, an APC and an MBT, plus two MLRS artillery systems behind the hill. Once you're all set, I will call in the arty, that's 24 rockets on Syrta. My men will then start moving in. One squad across that hill over OP Walnut, the MBT on the main road, three squads through the flat in front of us, and the APC plus the last squad on the dirt road right of us. We will lock the enemy in from two sides and try to push them north until the city is clear."
		};
	};
	
	class M03Us
	{
		responses[] = {"M03Plan", "M03Enemy", "M03Start", "exit"};
		sentences[] = {
			"Where do you want us?",
			"That depends on your setup. You can move alongside of my men with your vehicles or on foot, you can prepare at one of the three OPs I've marked on the map and provide cover fire, or you might be able to sneak up on the enemy from the north. In any case, make sure you're not in Syrta when the artillery hits. And avoid killing my men, will you?"
		};
	};
	
	class M03Enemy
	{
		responses[] = {"M03Plan", "M03Us", "M03Start", "exit"};
		sentences[] = {
			"Any intel about the enemy?",
			"Yes, we have confirmed an armoured vehicle at the military outpost in Sryta. It's static and covered with sandbags. They also got some machineguns and launchers on the roads leading to the village. Apart from that, I'd say we have one or two platoons of infantry and light vehicles in that area. Let's hope the arty can clear some of them but be prepared for a lot of fortified enemies inside those houses."
		};
	};
	
	class M03Start
	{
		exit = 1;
		expression = "['M03'] remoteExecCall ['IP_fnc_startMission', 2, false]";
		sentences[] = {
			"Understood, Sir. (Start mission.)"
		};
	};
};