// Created by AlexYeahNot, Binslev, and Meta

state("FarCry6")
{
	int loading : "FC_m64d3d12.dll", 0x6F6B1DC;
//    int menuState : "FC_m64d3d12.dll", 0x69F2B6C;
}

isLoading
{
	return current.loading != 0;
}

/*init
{
    vars.menuState = false;
}*/

startup
  {
        vars.TimerStart = (EventHandler) ((s, e) => timer.IsGameTimePaused = true);
        timer.OnStart += vars.TimerStart;
	  	refreshRate=30;
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Far Cry 6",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
  }

/*start
{
    return (current.menuState == 1 && current.loading != 0);
}*/