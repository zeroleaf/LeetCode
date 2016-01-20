package com.zeroleaf.leetcode.array;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by zeroleaf on 16/1/21.
 */
public class LongestSubstringWithoutRepeatingCharactersTest {

    private LongestSubstringWithoutRepeatingCharacters solution;

    @Before
    public void setUp() {
        solution = new LongestSubstringWithoutRepeatingCharacters();
    }

    @Test
    public void test() {
        String case1 = "abcabcbb";
        Assert.assertEquals(3, solution.lengthOfLongestSubstring(case1));

        String case2 = "bbbbb";
        Assert.assertEquals(1, solution.lengthOfLongestSubstring(case2));

        String case3 = "c";
        Assert.assertEquals(1, solution.lengthOfLongestSubstring(case3));

        String case4 = "ab";
        Assert.assertEquals(2, solution.lengthOfLongestSubstring(case4));
    }
}
