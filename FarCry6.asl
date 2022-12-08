// Created by Binslev, AlexYeahNot, and Meta
//game version 1.6.0
//created on 06-12-2022
//two pointers in the hopes that it works more better

state("FarCry6")
{
	int loading : 	"FC_m64d3d12.dll", 0x0717EE38, 0x28, 0xF0, 0x0, 0x68;
	int loading1 : 	"FC_m64d3d12.dll", 0x06B4FB98, 0x20, 0x0, 0x68;
}

startup
  {
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

isLoading
{
	return (current.loading == 2 || current.loading1 == 2);
}
