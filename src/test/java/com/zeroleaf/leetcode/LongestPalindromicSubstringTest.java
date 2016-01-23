package com.zeroleaf.leetcode;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by zeroleaf on 16/1/23.
 */
public class LongestPalindromicSubstringTest {

    private LongestPalindromicSubstring solution;

    @Before
    public void setUp() {
        solution = new LongestPalindromicSubstring();
    }

    @Test
    public void test() {
        String s = "aaaa";
        Assert.assertEquals("aaaa", solution.longestPalindrome(s));
    }
}
