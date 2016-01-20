package com.zeroleaf.leetcode.array;

/**
 * Created by zeroleaf on 15/9/11.
 */
public class MedianOfTwoSortedArrays {

    public static void main(String[] args) {
        int[] nums1 = new int[]{};
        int[] nums2 = new int[]{1};

        MedianOfTwoSortedArrays finder = new MedianOfTwoSortedArrays();

        for (int i = 1; i <= nums1.length + nums2.length; i++) {
            int ne = finder.findNthElementOfSortedArrays(i, nums1, nums2);
            System.out.format("%dth Of Element is: %d%n", i, ne);
        }

        double median = finder.findMedianSortedArrays(nums1, nums2);
        System.out.format("Median is: %f %n", median);
    }

    public double findMedianSortedArrays(int[] nums1, int[] nums2) {
        if (nums1.length + nums2.length == 0) {
            return 0;
        }

        int firstMedianIndex = (nums1.length + nums2.length + 1) >> 1;
        int firstMedian = findNthElementOfSortedArrays(firstMedianIndex, nums1, nums2);
        if ((nums1.length + nums2.length) % 2 == 1) {
            return firstMedian;
        }

        int secondMedianIndex = firstMedianIndex + 1;
        int secondMedian = findNthElementOfSortedArrays(secondMedianIndex, nums1, nums2);
        return (firstMedian + secondMedian) / 2.0;
    }

    /**
     * Find nth element in the two sorted array.
     *
     * @param n nth element of two sorted array. start from 1 to nums1.length + nums2.length.
     * @param nums1 the first sorted array.
     * @param nums2 the second sorted array.
     * @return the value of nth element in the two sorted array.
     */
    private int findNthElementOfSortedArrays(int n, int[] nums1, int[] nums2) {
        int index = binarySearchNthIn(n, nums1, nums2);
        if (index != -1) {
            return nums1[index];
        }

        index = binarySearchNthIn(n, nums2, nums1);
        return nums2[index];
    }

    /**
     * Attempt to find the nth element of the two sorted array in the ins array.
     *
     * If find, then return the index of nth element in the array ins, otherwise not
     * find, that is to say the nth element is in array cmps, then return -1.
     *
     * @param n the nth element in the two sorted array. range are [1, ins.length + cmps.length].
     * @param ins the array attempt to find the nth element in.
     * @param cmps the other sorted array.
     * @return index of nth element of two sorted array in array ins, if not found, return -1.
     */
    private int binarySearchNthIn(int n, int[] ins, int[] cmps) {
        int high = Math.min(n, ins.length) - 1;
        int low  = Math.max(0, n - cmps.length - 1);

        while (low <= high) {
            int mid = (high + low) >> 1;
            int opposite = n - mid - 1;
            int cl = (opposite == 0) ? Integer.MIN_VALUE : cmps[opposite - 1];
            int ch = (opposite >= cmps.length) ? Integer.MAX_VALUE : cmps[opposite];
            if (cl <= ins[mid] && ins[mid] <= ch) {
                return mid;
            } else if (cl < ins[mid] && ch < ins[mid]) {
                high = mid - 1;
            } else if (cl > ins[mid] && ch > ins[mid]) {
                low = mid + 1;
            }
        }

        return -1;
    }
}
