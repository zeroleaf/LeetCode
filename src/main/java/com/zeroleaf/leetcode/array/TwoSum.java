package com.zeroleaf.leetcode.array;

import java.util.HashMap;

/**
 * Created by zeroleaf on 15/9/11.
 */
public class TwoSum {


    public static void main(String[] args) {
        TwoSum solution = new TwoSum();

        int[] nums = new int[]{2, 7, 11, 15};

        int[] indexs = solution.twoSum2(nums, 9);

        printTwoSum(indexs);
    }

    private static void printTwoSum(int[] indexs) {
        for (int i = 0; i < indexs.length; i++) {
            System.out.printf("Index %d is: %d, ", i + 1, indexs[i]);
        }
    }

    // Solution 1 - O(n^2)
    public int[] twoSum(int[] nums, int target) {
        for (int i1 = 0; i1 < nums.length - 1; i1++) {
            for (int i2 = i1 + 1; i2 < nums.length; i2++) {
                if (nums[i1] + nums[i2] == target) {
                    return new int[]{i1 + 1, i2 + 1};
                }
            }
        }

        throw new IllegalArgumentException("Input Should have exactly one solution.");
    }

    // Solution 2 - O(n)
    public int[] twoSum2(int[] nums, int target) {
        int[] result = new int[2];
        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();
        for (int i = 0; i < nums.length; i++) {
            if (map.get(nums[i]) == null) {
                map.put(target - nums[i], i);
            } else {
                result[0] = map.get(nums[i]) + 1;
                result[1] = i + 1;
                break;
            }
        }

        return result;
    }
}
