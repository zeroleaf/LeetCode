package com.zeroleaf.leetcode.dp;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by zeroleaf on 16/2/13.
 */
public class LongestValidParenthesesTest {

    private LongestValidParentheses solution;

    @Before
    public void setup() {
        solution = new LongestValidParentheses();
    }

    @Test
    public void test() {
        Assert.assertEquals(2, solution.longestValidParentheses("(()"));
        Assert.assertEquals(4, solution.longestValidParentheses(")()()"));
    }
}
