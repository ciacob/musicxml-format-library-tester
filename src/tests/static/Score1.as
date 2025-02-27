package tests.static {
    import interfaces.IScoreTest;
    import eu.claudius.iacob.music.wrappers.Score;
    import eu.claudius.iacob.music.wrappers.Attributes;
    import eu.claudius.iacob.music.wrappers.Direction;
    import eu.claudius.iacob.music.wrappers.Note;
    import eu.claudius.iacob.music.wrappers.Pitch;
    import eu.claudius.iacob.music.wrappers.Measure;
    import eu.claudius.iacob.music.wrappers.PartContent;
    import eu.claudius.iacob.music.wrappers.PartInfo;
    import eu.claudius.iacob.music.wrappers.Scaling;
    import eu.claudius.iacob.music.wrappers.PageMargins;
    import eu.claudius.iacob.music.wrappers.Misc;
    import eu.claudius.iacob.music.wrappers.Creator;
    import eu.claudius.iacob.music.wrappers.Identification;

    public class Score1 implements IScoreTest {
        private static const TEST_NAME:String = "Test Generated Score";
        private var _testUid:String;

        private function _buildScoreTitle():String {
            return TEST_NAME + (_testUid ? '\n' + _testUid : '');
        }

        public function set testUid(value:String):void {
            _testUid = (value || '');
        }

        public function get testName():String {
            return TEST_NAME;
        }

        public function get score():Score {
            return new Score(
                    _buildScoreTitle(),
                    new Identification(
                        Vector.<Creator>([
                                new Creator('composer', 'Claudius Iacob')
                            ]),
                        "Manual test encoding",
                        "2025-02-23",
                        Vector.<Misc>([
                                new Misc('test field name', 'test field value')
                            ])
                    ),
                    "1239.96",
                    "1753.66",
                    Vector.<PageMargins>([
                            new PageMargins("59.0458", "59.0458", "206.66", "59.0458", "both")
                        ]),
                    new Scaling("6.7744", "40"),
                    Vector.<PartInfo>([
                            new PartInfo(
                                "p-vn1",
                                "Violin 1",
                                "Vn 1",
                                null,
                                "1",
                                "41"
                            ),
                            new PartInfo(
                                "p-vn2",
                                "Violin 2",
                                "Vn 2",
                                null,
                                "2",
                                "41"
                            ),
                            new PartInfo(
                                "p-pno11",
                                "Piano",
                                "Pno",
                                null,
                                "3",
                                "1"
                            ),
                            new PartInfo(
                                "p-pno12",
                                "Piano",
                                "Pno",
                                null,
                                "4",
                                "1"
                            )
                        ]),
                    Vector.<PartContent>([
                            new PartContent(
                                "p-vn1",
                                Vector.<Measure>([
                                        new Measure(
                                            "1",
                                            Vector.<Note>([
                                                    new Note(
                                                        "30",
                                                        "16th",
                                                        "1",
                                                        new Pitch("C", "5", "0")
                                                    ),
                                                    new Note(
                                                        "90",
                                                        "eighth",
                                                        "1",
                                                        new Pitch("D", "5", "0"),
                                                        1
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("E", "5", "0")
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("G", "5", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("C", "6", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "120",
                                                        "quarter",
                                                        "1"
                                                    ),
                                                ]),
                                            new Attributes("120", "0", "major", "4", "4", "G", "2"),
                                            new Direction("above", Vector.<String>(["Lorem ipsum"]), "quarter", "60")
                                        )
                                    ])
                            ),
                            new PartContent(
                                "p-vn2",
                                Vector.<Measure>([
                                        new Measure(
                                            "1",
                                            Vector.<Note>([
                                                    new Note(
                                                        "30",
                                                        "16th",
                                                        "1",
                                                        new Pitch("C", "4", "0")
                                                    ),
                                                    new Note(
                                                        "90",
                                                        "eighth",
                                                        "1",
                                                        new Pitch("D", "4", "0"),
                                                        1
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("E", "4", "0")
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("G", "4", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("C", "5", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "120",
                                                        "quarter",
                                                        "1"
                                                    ),
                                                ]),
                                            new Attributes("120", "0", "major", "4", "4", "G", "2"),
                                            new Direction("above", Vector.<String>(["Lorem ipsum"]), "quarter", "60")
                                        )
                                    ])
                            ),
                            new PartContent(
                                "p-pno11",
                                Vector.<Measure>([
                                        new Measure(
                                            "1",
                                            Vector.<Note>([
                                                    new Note(
                                                        "30",
                                                        "16th",
                                                        "1",
                                                        new Pitch("C", "4", "0")
                                                    ),
                                                    new Note(
                                                        "90",
                                                        "eighth",
                                                        "1",
                                                        new Pitch("D", "4", "0"),
                                                        1
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("E", "4", "0")
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("G", "4", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("C", "5", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "120",
                                                        "quarter",
                                                        "1"
                                                    ),
                                                ]),
                                            new Attributes("120", "0", "major", "4", "4", "G", "2"),
                                            new Direction("above", Vector.<String>(["Lorem ipsum"]), "quarter", "60")
                                        )
                                    ])
                            ),
                            new PartContent(
                                "p-pno12",
                                Vector.<Measure>([
                                        new Measure(
                                            "1",
                                            Vector.<Note>([
                                                    new Note(
                                                        "30",
                                                        "16th",
                                                        "1",
                                                        new Pitch("C", "3", "0")
                                                    ),
                                                    new Note(
                                                        "90",
                                                        "eighth",
                                                        "1",
                                                        new Pitch("D", "3", "0"),
                                                        1
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("E", "3", "0")
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("G", "3", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "240",
                                                        "half",
                                                        "1",
                                                        new Pitch("C", "4", "0"),
                                                        0,
                                                        null,
                                                        true
                                                    ),
                                                    new Note(
                                                        "120",
                                                        "quarter",
                                                        "1"
                                                    ),
                                                ]),
                                            new Attributes("120", "0", "major", "4", "4", "F", "4"),
                                            new Direction("above", Vector.<String>(["Lorem ipsum"]), "quarter", "60")
                                        )
                                    ])
                            )
                        ])
                );
        }
    }
}