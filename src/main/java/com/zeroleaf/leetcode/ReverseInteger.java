package com.zeroleaf.leetcode;

/**
 * Created by zeroleaf on 16/1/24.
 */
public class ReverseInteger {

    public int reverse(int x) {

        int s = 0;

        while (x != 0) {
            int t = x % 10;
            int ns = s * 10 + t;
            if ((ns - t) / 10 != s) {
                return 0;
            }
            s = ns;

            x /= 10;
        }

        return s;
    }
}
