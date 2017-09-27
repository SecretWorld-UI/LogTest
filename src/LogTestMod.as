import com.GameInterface.Log;

import mx.utils.Delegate;
import com.Utils.Archive;
/**
 * LogTestMod provides a very simple implementation for drawing and dragging a coloured box about the screen.
 *
 * @author Icarus James
 */
class LogTestMod
{
	private var m_swfRoot: MovieClip; // Our root MovieClip

	private var TriggerLoad: LogTestButton;
	private var TriggerTest: LogTestButton;
	private var TriggerFWD: LogTestButton;
	
	public var logID:Number = 5;

    public function LogTestMod(swfRoot: MovieClip)
    {
		// Store a reference to the root MovieClip
		m_swfRoot = swfRoot;
    }

	public function OnLoad()
	{
	}

	public function OnUnload()
	{
	}
	
	private function GenerateErrors():Void 
	{
		Log.Error("LogTest", "Test Error");
		Log.Warning("LogTest", "Test Warning");
		
		/* The following will only log to the ClientLog.txt
		Log.Info2("LogTest", "Test Info2");
		Log.Info1("LogTest", "Test Info1");
		Log.Info0("LogTest", "Test Info0");
		Log.Print(0, "LogTest", "Test Print 0");
		Log.Print(1, "LogTest", "Test Print 1");
		Log.Print(2, "LogTest", "Test Print 2");
		Log.Print(3, "LogTest", "Test Print 3");
		Log.Print(4, "LogTest", "Test Print 4");
		*/
		
	}

	public function Activate(config: Archive)
	{
		TriggerTest = new LogTestButton(m_swfRoot, Delegate.create(this, GenerateErrors), "GenErr", 1);
	}
}
