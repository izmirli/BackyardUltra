import Toybox.Activity;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;
import Toybox.WatchUi;

class BackyardUltraView extends WatchUi.SimpleDataField {

    // Set the label of the data field here.
    function initialize() {
        SimpleDataField.initialize();
        label = "BU Timer"; // Change this to your desired label
    }

    // The given info object contains all the current workout
    // information. Calculate a value and return it in this method.
    // Note that compute() and onUpdate() are asynchronous, and there is no
    // guarantee that compute() will be called before onUpdate().
    function compute(info as Activity.Info) as Numeric or Duration or String or Null {
        // Get current time
        var now = System.getClockTime();
        var minutes = now.min.toNumber();
        var seconds = now.sec.toNumber();

        // Convert to timer and format as M:SS
        var minutesLeft = (59 - minutes).format("%d");
        var secondsLeft = (59 - seconds).format("%02d");
        var timeStr = Lang.format("$1$:$2$", [minutesLeft, secondsLeft]);
        return timeStr;
    }

}