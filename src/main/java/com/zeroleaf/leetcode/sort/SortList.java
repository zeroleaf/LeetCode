package com.zeroleaf.leetcode.sort;

import java.util.Random;

/**
 * Created by zeroleaf on 15/9/8.
 */
public class SortList {

    public static void main(String[] args) {

        SortList sortList = new SortList();

        for (int i = 0; i < 3; i++) {
            ListNode head = randomList();
            printList(head);
            System.out.println();
            head = sortList.sortList(head);
            printList(head);

            System.out.println("\n----------------\n");
        }
    }

    public static ListNode randomList() {
        Random random = new Random();

        int listCount = random.nextInt(10) + 5;
        ListNode head = new ListNode(Integer.MIN_VALUE);
        ListNode p = head;
        while (listCount-- > 0) {
            p.next = new ListNode(random.nextInt(20));
            p = p.next;
        }
        return head.next;
    }

    public static void printList(ListNode head) {
        while (head != null) {
            System.out.printf("%d ", head.val);
            head = head.next;
        }
    }

    // Solution
    public ListNode sortList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }

        // find middle element in the list
        ListNode p1 = head;
        ListNode p2 = head.next;

        while (p2 != null && p2.next != null) {
            p1 = p1.next;
            p2 = p2.next.next;
        }

        p2 = p1.next;
        p1.next = null;

        return mergeTwoLists(sortList(head), sortList(p2));
    }

    // Solution of Question 21 - Merge Two Sorted Lists
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode merged = new ListNode(Integer.MIN_VALUE);

        ListNode p = merged, p1 = l1, p2 = l2;
        while (p1 != null && p2 != null) {
            if (p1.val <= p2.val) {
                p.next = p1;
                p1 = p1.next;
            } else {
                p.next = p2;
                p2 = p2.next;
            }
            p = p.next;
        }
        while (p1 != null) {
            p = p.next = p1;
            p1 = p1.next;
        }
        while (p2 != null) {
            p = p.next = p2;
            p2 = p2.next;
        }

        return merged.next;
    }
}