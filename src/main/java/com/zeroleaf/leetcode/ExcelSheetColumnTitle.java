package com.zeroleaf.leetcode;

/**
 * Created by zeroleaf on 2015/4/14.
 */
public class ExcelSheetColumnTitle {

    public String convertToTitle(int n) {

        int[] boundaries = new int[] {0, 26, 702, 18278, 475254, 12356630, 321272406, Integer.MAX_VALUE};

        for (int i = 1; i < boundaries.length; i++) {
            if (n <= boundaries[i]) {
                int rv = n - boundaries[i - 1];
                String title = "";
                for (int j = 0; j < i; j++) {
                    int mod = rv % 26;
                    if (j == 0) {
                        title += (char) ('A' + (mod == 0 ? 26 : mod) - 1);
                        if (mod == 0) {
                            rv -= 1;
                        }
                    } else {
                        title = (char) ('A' + mod) + title;
                    }
                    rv /= 26;
                }
                return title;
            }
        }

        throw new IllegalStateException("Should Not Reach Here!");
    }

//    public String convertToTitle(int n) {
//        StringBuilder sb = new StringBuilder();
//        while (n > 0) {
//            char ch = (char) ('A' + (n - 1) % 26);
//            sb.insert(0, ch);
//            n -= (n - 1) % 26;
//            n /= 26;
//        }
//        return sb.toString();
//    }
}
