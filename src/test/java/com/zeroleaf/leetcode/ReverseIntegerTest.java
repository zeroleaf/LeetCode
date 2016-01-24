package com.zeroleaf.leetcode;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

/**
 * Created by zeroleaf on 16/1/24.
 */
public class ReverseIntegerTest {

    private ReverseInteger s;

    @Before
    public void setUp() {
        s = new ReverseInteger();
    }

    @Test
    public void test() {
        Assert.assertEquals(1, s.reverse(1));

        Assert.assertEquals(0, s.reverse(1534236469));
    }
}
