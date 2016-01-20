package com.zeroleaf.leetcode.array;

import java.util.Arrays;

/**
 * Created by zeroleaf on 16/1/21.
 */
public class LongestSubstringWithoutRepeatingCharacters {

    // Inspired by https://leetcode.com/discuss/13336/shortest-o-n-dp-solution-with-explanations.
    public int lengthOfLongestSubstring(String s) {

        int[] charIndex = new int[256];
        Arrays.fill(charIndex, -1);

        int longest = 0, m = 0;

        for (int i = 0; i < s.length(); i++) {
            m = Math.max(charIndex[s.charAt(i)] + 1, m);
            charIndex[s.charAt(i)] =  i;
            longest = Math.max(longest, i - m + 1);
        }
        return longest;
    }
}
