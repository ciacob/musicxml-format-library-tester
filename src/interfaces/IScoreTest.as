package interfaces {
    import eu.claudius.iacob.music.wrappers.Score;

    public interface IScoreTest {
        function set testUid(value:String):void;
        function get testName():String;

        function get score():Score;
    }
}