package {
    import flash.display.Sprite;
    import eu.claudius.iacob.music.builders.MusicXMLBuilder;
    import eu.claudius.iacob.music.wrappers.Score;
    import tests.static.Score1;
    import flash.filesystem.File;
    import ro.ciacob.utils.Time;
    import ro.ciacob.desktop.io.TextDiskWritter;
    import interfaces.IScoreTest;
    import flash.utils.ByteArray;
    import ro.ciacob.desktop.io.AbstractDiskReader;
    import ro.ciacob.desktop.io.RawDiskReader;
    import flash.events.ErrorEvent;
    import ro.ciacob.maidens.legacy.ProjectData;
    import ro.ciacob.desktop.data.DataElement;
    import flash.utils.getQualifiedClassName;
    import ro.ciacob.maidens.legacy.exporters.MusicXMLExporter;
    import ro.ciacob.maidens.legacy.constants.DataFields;

    public class Main extends Sprite {
        public static const BASE_PATH:File = (new File (File.applicationDirectory.nativePath)).parent;

        public static const OUTPUT_DIR:String = "builder-tests";
        public static const OUTPUT_SOURCE_DIR:String = "exporter-sources";
        public static const EXPORTER_OUTPUT_DIR:String = "exporter-tests";



        public function Main() {
            // _testBuilderCapabilities(new Score1);

            var sourcesDir:File = BASE_PATH.resolvePath(OUTPUT_SOURCE_DIR);
            _testExporterCapabilities(sourcesDir, true);
        }

        /**
         * Tests the capabilities of the MusicXML builder by creating a score from scratch and exporting it to MusicXML.
         *
         * @param   test
         *          The test to run.
         *
         * @param   openResultingFile
         *          Optional, default `false`. Whether to open the resulting MusicXML file in the default application
         *          associated with its type.
         */
        private function _testBuilderCapabilities(test:IScoreTest, openResultingFile:Boolean = false):void {
            var uid:String = Time.toFormat(Time.now, Time.TIMESTAMP_FILENAME);
            test.testUid = uid;

            var score:Score = test.score;
            var xmlOutput:XML = MusicXMLBuilder.buildScore(score);

            // Write output to a file
            var currDirectory:File = BASE_PATH.resolvePath(OUTPUT_DIR + File.separator + test.testName);
            if (!currDirectory.exists) {
                currDirectory.createDirectory();
            }
            var fileName:String = Time.toFormat(Time.now, Time.TIMESTAMP_FILENAME) + ".xml";
            var file:File = currDirectory.resolvePath(fileName);
            var writer:TextDiskWritter = new TextDiskWritter();
            writer.write(xmlOutput, file);

            // Open the file in the default application associated with its type
            if (openResultingFile) {
                file.openWithDefaultApplication();
            }

            // Also output XML to console
            trace(xmlOutput.toXMLString());
        }

        /**
         * Tests the capabilities of the MusicXML exporter by loading a project from a MAID file and exporting it to MusicXML.
         *
         * @param   testHomeDir
         *          The directory containing the MAID file to load and export.
         *
         * @param   openResultingFile
         *          Optional, default `false`. Whether to open the resulting MusicXML file in the default application
         *          associated with its type.
         */
        private function _testExporterCapabilities(testHomeDir:File, openResultingFile:Boolean = false):void {
            if (!testHomeDir || !testHomeDir.exists || !testHomeDir.isDirectory) {
                trace('CANNOT RUN EXPORT TEST: Provided [' + testHomeDir + '] does not resolve to an existing folder.');
                return;
            }

            // Locate a *.maid file within the `testHomeDir`
            var maidFiles:Array = testHomeDir.getDirectoryListing().filter(function (file:File, index:int, array:Array):Boolean {
                    return file.extension == 'maid';
                });
            if (maidFiles.length == 0) {
                trace('CANNOT RUN EXPORT TEST: No *.maid file found in [' + testHomeDir.nativePath + '].');
                return;
            }

            // Load the project from the first found *.maid file
            var maidFile:File = maidFiles[0];
            var project:ProjectData = _loadProjectFromFile(maidFiles[0]) as ProjectData;
            if (!project) {
                trace('CANNOT RUN EXPORT TEST: Could not load project from file [' + maidFile.nativePath + '].');
                return;
            }

            // Export the project to MusicXML
            var exporter:MusicXMLExporter = new MusicXMLExporter;
            var xmlOutput:XML = exporter.export(project);
            if (!xmlOutput) {
                trace('CANNOT RUN EXPORT TEST: Could not export project to MusicXML.');
                return;
            }

            // Write output to a file
            var testName:String = project.getContent(DataFields.PROJECT_NAME) as String;
            if (!testName || testName === DataFields.VALUE_NOT_SET) {
                testName = maidFile.name;
            }
            var currDirectory:File = BASE_PATH.resolvePath(EXPORTER_OUTPUT_DIR + File.separator + testName);
            if (!currDirectory.exists) {
                currDirectory.createDirectory();
            }

            var fileName:String = Time.toFormat(Time.now, Time.TIMESTAMP_FILENAME) + ".xml";
            var file:File = currDirectory.resolvePath(fileName);
            var writer:TextDiskWritter = new TextDiskWritter();
            writer.write(xmlOutput, file);
            if (!file.exists) {
                trace('CANNOT RUN EXPORT TEST: Could not write output to file [' + file.nativePath + '].');
                return;
            }

            // Open the file in the default application associated with its type
            if (openResultingFile) {
                file.openWithDefaultApplication();
            }
        }

        /**
         * Performs the actual work of reading a MAID file from disk and loading it as a project.
         * @param    file
         *           The MAID file to load.
         *
         * @return    The loaded project, or `null` if the file could not be read or the project could not be loaded.
         */
        private function _loadProjectFromFile(file:File):DataElement {

            // Attempt to read the file
            var byteArray:ByteArray = null;
            var errors:Array = [];
            var reader:AbstractDiskReader = new RawDiskReader;
            reader.addEventListener(ErrorEvent.ERROR, function (event:ErrorEvent):void {
                    errors.push(event.text);
                });

            try {
                byteArray = (reader.readContent(file) as ByteArray);
            }
            catch (e:Error) {
                errors.push(e.message);
            }
            if (!byteArray) {
                errors.push('Error reading file.');
            }
            if (errors.length > 0) {
                trace('`_loadProjectFromFile`:: could not read file "' + file.nativePath + '": ' + errors.join('\n'));
                return null;
            }

            // Attempt to load and return the project
            var proj:ProjectData = ProjectData(
                    DataElement.fromSerialized(byteArray, ProjectData,
                        getQualifiedClassName(ProjectData))
                );

            if (!proj) {
                trace('`_loadProjectFromFile`:: could not load project from file "' + file.nativePath + '".');
                return null;
            }
            return proj;
        }

    }
}
