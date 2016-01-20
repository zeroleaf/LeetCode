package com.zeroleaf.leetcode.sort;

/**
 * Created by zeroleaf on 16/1/19.
 */
public class AddTwoNumbers {

    // Java version for test in leetcode.
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {

        ListNode dummy = new ListNode(0);

        ListNode n1 = l1;
        ListNode n2 = l2;
        ListNode d  = dummy;

        int sum = 0;
        while (n1 != null || n2 != null) {
            sum /= 10;
            if (n1 != null) {
                sum += n1.val;
                n1 = n1.next;
            }
            if (n2 != null) {
                sum += n2.val;
                n2 = n2.next;
            }

            d.next = new ListNode(sum % 10);
            d = d.next;
        }
        if (sum / 10 == 1) {
            d.next = new ListNode(1);
        }
        return dummy.next;
    }
}
