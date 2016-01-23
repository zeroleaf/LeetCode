package com.zeroleaf.leetcode;

/**
 * Created by zeroleaf on 16/1/23.
 */
public class LongestPalindromicSubstring {

//    public String longestPalindrome(String s) {
//        if (s.length() == 0) return "";
//        if (s.length() == 1) return s;
//
//        int start = 0, maxLen = 1;
//        for (int i = 0; i < s.length();) {
//            if (s.length() - i <= maxLen / 2) {
//                break;
//            }
//
//            int j = i, k = i;
//            while (k < s.length() - 1 && s.charAt(k + 1) == s.charAt(k))
//                k++;
//            i = k + 1;
//
//            while (j > 0 && k < s.length() - 1 && s.charAt(j - 1) == s.charAt(k + 1)) {
//                j--;
//                k++;
//            }
//
//            int newLen = k - j + 1;
//            if (newLen > maxLen) {
//                start = j;
//                maxLen = newLen;
//            }
//        }
//
//        return s.substring(start, start + maxLen);
//    }

    // DP solution based on http://articles.leetcode.com/2011/11/longest-palindromic-substring-part-i.html.
//    public String longestPalindrome(String s) {
//        int n = s.length();
//        int longestBegin = 0, maxLen = 1;
//        boolean[][] tables = new boolean[1000][1000];
//
//        for (int i = 0; i < n; i++) {
//            tables[i][i] = true;
//        }
//
//        for (int i = 0; i < n - 1; i++) {
//            if (s.charAt(i) == s.charAt(i + 1)) {
//                tables[i][i + 1] = true;
//                longestBegin = i;
//                maxLen = 2;
//            }
//        }
//
//        for (int len = 3; len <= n; len++) {
//            for (int i = 0; i < n - len + 1; i++) {
//                int j = i + len - 1;
//                if (s.charAt(i) == s.charAt(j) && tables[i + 1][j - 1]) {
//                    tables[i][j] = true;
//                    longestBegin = i;
//                    maxLen = len;
//                }
//            }
//        }
//
//        return s.substring(longestBegin, longestBegin + maxLen);
//    }

    public String longestPalindrome(String s) {

        String T = proPrecess(s);
        int n = T.length();
        int[] P = new int[n];
        int C = 0, R = 0;

        for (int i = 1; i < n - 1; i++) {
            int i_mirror = 2 * C - i;

            P[i] = (R > i) ? Math.min(R - i, P[i_mirror]) : 0;

            while (T.charAt(i + 1 + P[i]) == T.charAt(i - 1 - P[i]))
                P[i]++;

            if (i + P[i] > R) {
                C = i;
                R = i + P[i];
            }
        }

        int maxLen = 0, centerIndex = 0;
        for (int i = 1; i < n - 1; i++) {
            if (P[i] > maxLen) {
                maxLen = P[i];
                centerIndex = i;
            }
        }

        int index = (centerIndex - 1 - maxLen) / 2;
        return s.substring(index, index + maxLen);
    }

    private String proPrecess(String s) {
        int n = s.length();
        if (n == 0) return "^$";

        StringBuilder sb = new StringBuilder("^");
        for (int i = 0; i < n; i++) {
            sb.append("#").append(s.charAt(i));
        }
        sb.append("#$");
        return sb.toString();
    }
}
