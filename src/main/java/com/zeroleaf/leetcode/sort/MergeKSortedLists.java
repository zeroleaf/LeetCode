package com.zeroleaf.leetcode.sort;

import java.util.Random;

/**
 * Created by zeroleaf on 15/9/8.
 */
public class MergeKSortedLists {

    public static void main(String[] args) {
        ListNode[] lists = createRandomSortedLists();
        printLists(lists);

        MergeKSortedLists sort = new MergeKSortedLists();
        ListNode sorted = sort.mergeKLists3(lists);

        System.out.println("---");
        printLists(new ListNode[]{sorted});
    }

    public static ListNode[] createRandomSortedLists() {
        Random random = new Random();
        int listCount = random.nextInt(10);
        ListNode[] lists = new ListNode[listCount];

        for (int i = 0; i < listCount; i++) {
            lists[i] = createRandomSortedList();
        }

        return lists;
    }

    public static ListNode createRandomSortedList() {
        Random random = new Random();

        ListNode head = new ListNode(Integer.MIN_VALUE);
        ListNode p    = head;
        int eleCount = random.nextInt(10);
        int lastEle = 0;
        for (int i = 0; i < eleCount; i++) {
            p.next = new ListNode(lastEle + random.nextInt(7));
            lastEle = p.next.val;
            p = p.next;
        }

        return head.next;
    }

    public static void printLists(ListNode[] lists) {
        for (ListNode head : lists) {
            while (head != null) {
                System.out.printf("%d ", head.val);
                head = head.next;
            }
            System.out.println();
        }
    }

    // Solution 1 - Time Limit Exceeded
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) {
            return null;
        }

        if (lists.length == 1) {
            return lists[0];
        }

        ListNode merged = lists[0];
        for (int i = 1; i < lists.length; i++) {
            merged = mergeTwoLists(merged, lists[i]);
        }
        return merged;
    }

    // Another Solution to Question 21.
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode newHead = new ListNode(Integer.MIN_VALUE);

        newHead.next = l1;
        ListNode p1 = l1, p2 = l2, prev = newHead;

        while (p1 != null && p2 != null) {
            if (p1.val <= p2.val) {
                prev = p1;
                p1 = p1.next;
            } else {
                prev.next = p2;
                p2 = p2.next;
                prev = prev.next;
                prev.next = p1;
            }
        }
        if (p2 != null) {
            prev.next = p2;
        }

        return newHead.next;
    }

    // Solution 2 -
    public ListNode mergeKLists2(ListNode[] lists) {
        if (lists == null || lists.length == 0) {
            return null;
        }

        return recursionMergeKLists(lists, 0, lists.length);
    }

    private ListNode recursionMergeKLists(ListNode[] lists, int index, int len) {
        if (len == 1) {
            return lists[index];
        }

        if (len == 2) {
            return mergeTwoLists(lists[index], lists[index + 1]);
        }

        int m = len >> 1;
        ListNode l = recursionMergeKLists(lists, index, m);
        ListNode h = recursionMergeKLists(lists, index + m, len - m);

        return mergeTwoLists(l, h);
    }

    // Solution 3 - Using Iteration
    public ListNode mergeKLists3(ListNode[] lists) {
        if (lists == null || lists.length == 0) {
            return null;
        }

        for (int offset = lists.length; offset > 1; offset = (offset + 1) >> 1) {
            for (int i = 0; i < offset; i += 2) {
                int ni = i >> 1;
                if (i + 1 == offset) {
                    lists[ni] = lists[i];
                } else {
                    lists[ni] = mergeTwoLists(lists[i], lists[i + 1]);
                }
            }
        }

        return lists[0];
    }
}
