package chrome;

import js.html.LocalMediaStream;
import chrome.Events;

/*
typedef CaptureInfo = {
	var tabId : Int;
	var status : CaptureStatus;
	var fullscreen : Bool;
}

*/

typedef MediaStreamConstraint = {
	var mandatory : Dynamic;
	@:optional var optional : Dynamic;
}

private typedef CaptureOptions = {
	@:optional var audio : Bool;
	@:optional var video : Bool;
	@:optional var audioConstraints : MediaStreamConstraint;
	@:optional var videoConstraints : MediaStreamConstraint;
}

@:enum abstract CaptureInfo(String) from String to String {
	var pending = "pending";
	var active = "active";
	var stopped = "stopped";
	var error = "error";
}

@:require(chrome_ext)
@:native("chrome.tabCapture")
extern class TabCapture {
	static function capture( options : {?audio:Bool,?video:Bool,?audioConstraints:MediaStreamConstraint,?videoConstraints:MediaStreamConstraint}, callback : LocalMediaStream->Void ) : Void;
	static function getCapturedTabs( callback : Array<CaptureInfo>->Void ) : Void;
	static var onStatusChanged(default,never) : Event<CaptureInfo->Void>;
}
