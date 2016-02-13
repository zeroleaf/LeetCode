package com.zeroleaf.leetcode.dp;

import org.junit.Assert;
import org.junit.Test;

/**
 * Created by zeroleaf on 16/2/13.
 */
public class RangeSumQueryTest {

    @Test
    public void testCase() {
        int[] nums = new int[]{-2, 0, 3, -5, 2, -1};
        RangeSumQuery solution = new RangeSumQuery(nums);

        Assert.assertEquals(1, solution.sumRange(0, 2));
        Assert.assertEquals(-1, solution.sumRange(2, 5));
        Assert.assertEquals(-3, solution.sumRange(0, 5));

    }
}
