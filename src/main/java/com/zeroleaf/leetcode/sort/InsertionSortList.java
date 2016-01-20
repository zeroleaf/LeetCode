package com.zeroleaf.leetcode.sort;

import java.util.List;

/**
 * Created by zeroleaf on 2015/9/6.
 */
public class InsertionSortList {

    public static void main(String[] args) {
        InsertionSortList list = new InsertionSortList();

        ListNode n1 = new ListNode(1);
        ListNode n2 = new ListNode(3);
        ListNode n3 = new ListNode(2);
        ListNode n4 = new ListNode(4);
        ListNode n5 = new ListNode(5);
        n1.next = n2; n2.next = n3; n3.next = n4; n4.next = n5;

        n1 = list.insertionSortList2(n1);

        InsertionSortList.printListNode(n1);
    }

    public static void printListNode(ListNode head) {
        while (head != null) {
            System.out.format("%d ", head.val);
            head = head.next;
        }
    }

    public ListNode insertionSortList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }

        ListNode tail = head;
        while (tail.next != null) {
            ListNode ele = tail.next;
            if (ele.val >= tail.val) {
                tail = ele;
                continue;
            }

            tail.next = ele.next;
            if (ele.val <= head.val) {
                ele.next = head;
                head = ele;
                continue;
            }


            ListNode cmp = head;
            while (cmp != tail) {
                if (cmp.val <= ele.val && ele.val <= cmp.next.val) {
                    ele.next = cmp.next;
                    cmp.next = ele;
                    break;
                }

                cmp = cmp.next;
            }
        }

        return head;
    }

    public ListNode insertionSortList2(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }

        ListNode newHead = new ListNode(Integer.MIN_VALUE);
        while (head != null) {
            ListNode ele = head;
            head = head.next;

            ListNode tail = newHead;
            while (tail.next != null && tail.next.val < ele.val) {
                tail = tail.next;
            }

            ele.next = tail.next;
            tail.next = ele;
        }

        return newHead.next;
    }
}


