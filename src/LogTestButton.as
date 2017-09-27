import mx.utils.Delegate;

/**
 * ...
 * @author Sinthe
 */
class LogTestButton
{
	private var m_AlertText: TextField; // A text field to be placed upon our icon
	private var m_Clip: MovieClip;
	private var m_iconClip: MovieClip;

	private var m_testFunc:Function;
	static private var isMoving:Boolean = false;

	public function LogTestButton(swfRoot: MovieClip, testFunc:Function, buttonName:String, offset:Number)
	{
		m_testFunc = testFunc;
		m_Clip = swfRoot.createEmptyMovieClip(buttonName + "Clip", swfRoot.getNextHighestDepth());
		m_iconClip = m_Clip.attachMovie("src.assets.icons.LogIcon.png", buttonName + "Icon", m_Clip.getNextHighestDepth());
		m_Clip.onPress = Delegate.create(this, OnPress);
		m_Clip.onRelease = Delegate.create(this, OnRelease);
		m_Clip._y = 25;
		m_Clip._x = offset * 125;


		var format: TextFormat = new TextFormat("src.assets.fonts.FuturaMDBk.ttf", 20, 0xFF0000, true, false, false);
		format.align = "center";

		m_AlertText = m_iconClip.createTextField(buttonName + "Text", m_iconClip.getNextHighestDepth(), 0, 3, 125, 30);
		m_AlertText.embedFonts = true; // we're using an embedded font from src/assets/fonts/
		m_AlertText.selectable = false; // we don't want to be able to select this text
		m_AlertText.setNewTextFormat(format);	// Apply this style to all new text
		m_AlertText.setTextFormat(format); // Apply this style to all existing text
		m_AlertText.text = buttonName;
	}

	private function OnPress():Void
	{
		if (!isMoving) {
			m_testFunc();
		} else {
			m_Clip.startDrag();
		}
	}

	private function OnRelease():Void
	{
		if (isMoving) {
			m_Clip.stopDrag();
		}
	}

	public function ToggleMove(newState:Boolean):Void
	{
		if (arguments.length == 0) {
			newState = !isMoving;
		}
		isMoving = newState;
	}

	// Get/Set X/Y Methods for the draggable clip
	public function get _x():Number { return m_Clip._x;	}
	public function set _x(newX:Number):Void { m_Clip._x = newX; }
	public function get _y():Number	{ return m_Clip._y; }
	public function set _y(newY:Number):Void { m_Clip._y = newY; }

	public function get _visible():Boolean { return m_Clip._visible; }
	public function set _visible(newVisibility:Boolean):Void { m_Clip._visible = newVisibility; }

	// Method to allow setting both X and Y at the same time
	public function SetCoords(newX:Number, newY:Number):Void
	{
		m_Clip._x = newX;
		m_Clip._y = newY;
	}

}
