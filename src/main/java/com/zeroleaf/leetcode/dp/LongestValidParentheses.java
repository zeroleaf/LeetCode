package com.zeroleaf.leetcode.dp;

/**
 * Created by zeroleaf on 16/2/13.
 */
public class LongestValidParentheses {

    public int longestValidParentheses(String s) {
        s = ")" + s;
        int[] longest = new int[s.length()];
        int max = 0;

        for (int i = 1; i < s.length(); i++) {
            if (s.charAt(i) == ')' && s.charAt(i - longest[i - 1] - 1) == '(') {
                longest[i] = longest[i - 1] + 2 + longest[i - longest[i - 1] - 2];
                max = Math.max(max, longest[i]);
            }
        }

        return max;
    }
}
