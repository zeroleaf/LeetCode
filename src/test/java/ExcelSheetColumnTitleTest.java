import com.zeroleaf.leetcode.ExcelSheetColumnTitle;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

/**
 * Created by zeroleaf on 2015/4/18.
 */
public class ExcelSheetColumnTitleTest {

    private ExcelSheetColumnTitle t;

    @Before
    public void setUp() {
        t = new ExcelSheetColumnTitle();
    }

    @Test
    public void testBoundaries() {

        int[] boundaries = new int[] {26, 702, 18278, 475254, 12356630, 321272406};

        for (int i = 0 ; i < boundaries.length; i++) {
            assertEquals(repeat('Z', i + 1), t.convertToTitle(boundaries[i]));
            assertEquals(repeat('A', i + 2), t.convertToTitle(boundaries[i] + 1));
        }
    }

    private static String repeat(char c, int n) {
        String s = "";
        for (int i = 0; i < n; i++) {
            s += c;
        }
        return s;
    }
}
