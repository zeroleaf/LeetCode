package com.zeroleaf.leetcode.dp;

/**
 * Created by zeroleaf on 16/2/13.
 */
public class RangeSumQuery {

//    Timeout!!!
//    private int[][] sums;
//
//    public RangeSumQuery(int[] nums) {
//        final int n = nums.length;
//
//        sums = new int[n][n];
//        for (int i = 0; i < n; i++) {
//            sums[i][i] = nums[i];
//            for (int j = i + 1; j < n; j++) {
//                sums[i][j] = sums[i][j - 1] + nums[j];
//            }
//        }
//    }
//
//    public int sumRange(int i, int j) {
//        return sums[i][j];
//    }

//    Also Timeout!!!
//    private int[][] sums;
//
//    public RangeSumQuery(int[] nums) {
//        final int n = nums.length;
//
//        sums = new int[n][n];
//        for (int i = 0; i < n; i++) {
//            sums[i][i] = nums[i];
//        }
//        for (int offset = 1; offset < n; offset++) {
//            for (int i = 0; i + offset < n; i++) {
//                sums[i][i + offset] = sums[i][i + offset - 1] + nums[i + offset];
//            }
//        }
//    }
//
//    public int sumRange(int i, int j) {
//        return sums[i][j];
//    }


    // Inspired by https://leetcode.com/discuss/68696/java-simple-o-n-init-and-o-1-query-solution
    int[] nums;

    public RangeSumQuery(int[] nums) {
        for (int i = 1; i < nums.length; i++) {
            nums[i] += nums[i - 1];
        }

        this.nums = nums;
    }

    public int sumRange(int i, int j) {
        if (i == 0) {
            return nums[j];
        }
        return nums[j] - nums[i - 1];
    }
}
