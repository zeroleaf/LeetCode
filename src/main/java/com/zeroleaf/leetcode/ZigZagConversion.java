package com.zeroleaf.leetcode;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by zeroleaf on 2015/4/10.
 */
public class ZigZagConversion {

    public String convert(String s, int nRows) {

        if (nRows == 1) {
            return s;
        }

        final int groupCount = 2 * nRows - 2;

        StringBuilder sb = new StringBuilder();
        for (int row = 0, len = s.length(); row < nRows; row++) {
            int idx = row;
            if (row == 0 || row == nRows - 1) {
                while (idx < len) {
                    sb.append(s.charAt(idx));
                    idx += groupCount;
                }
            } else {
                int nextOffset = groupCount - row - row;
                while (idx < len) {
                    sb.append(s.charAt(idx));
                    idx += nextOffset;
                    nextOffset = groupCount - nextOffset;
                }
            }
        }
        return sb.toString();
    }


//    public String convert(String s, int nRows) {
//        if (nRows == 1 || s.length() < nRows) {
//            return s;
//        }
//
//        ArrayList<StringBuilder> builders = new ArrayList<StringBuilder>(nRows);
//        for (int i = 0; i < nRows; i++) {
//            builders.add(new StringBuilder());
//        }
//        for (int idx = 0, row = 0, step = 1; idx < s.length(); idx++) {
//            if (row == 0) step = 1;
//            if (row == nRows - 1) step = -1;
//            builders.get(row).append(s.charAt(idx));
//            row += step;
//        }
//
//        String zigzag = "";
//        for (StringBuilder sb : builders) {
//            zigzag = zigzag + sb.toString();
//        }
//        return zigzag;
//    }
}
