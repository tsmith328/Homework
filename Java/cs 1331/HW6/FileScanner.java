import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


/**
 * Acts as Scanner and allows easy file reading. Converts
 * FileNotFoundExceptions into RuntimeExceptions
 *
 * @author David
 * @version 1.0
 */
public class FileScanner  {

    private Scanner scan;

    /**
     * Constructs a FileScanner to read off a specific file.
     * @param fileName The file to read. Must be in the same folder.
     */
    public FileScanner(String fileName) {
        try {
            scan = new Scanner(new File(fileName));
        } catch (FileNotFoundException e) {
            throw new RuntimeException(
                    "File not found - make sure you put it in the right place!"
                    );
        }
    }

    /**
     * Returns the next line of the file, as Scanner.nextLine()
     * @return Next line of the file.
     */
    public String nextLine() {
        return scan.nextLine();
    }
}
