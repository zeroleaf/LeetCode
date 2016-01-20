package com.zeroleaf.leetcode.bfs;

import java.util.*;

/**
 * Created by zeroleaf on 2015/4/19.
 *
 * 注意点:
 *
 * beginWord 与 endWord 包含在 wordDict 中.
 *
 */
public class WordLadder {

    public int ladderLength(String beginWord, String endWord, Set<String> wordDict) {

        Map<String, Integer> distances = new HashMap<String, Integer>();
        distances.put(beginWord, 1);

        Queue<String> queue = new LinkedList<String>();
        queue.add(beginWord);

        while (!queue.isEmpty()) {
            String word = queue.remove();
            if (word.equals(endWord)) {
                break;
            }

            Iterator<String> iterator = wordDict.iterator();
            while (iterator.hasNext()) {
                String str = iterator.next();
                if (isTransformable(word, str)) {
                    if (distances.get(str) == null) {
                        distances.put(str, distances.get(word) + 1);
                        queue.add(str);
                    }
                    iterator.remove();
                }
            }
        }

        return distances.get(endWord) == null ? 0 : distances.get(endWord);
    }

    private boolean isTransformable(String from, String to) {
        int diffCount = 0;
        for (int i = 0; i < from.length(); i++) {
            if (from.charAt(i) != to.charAt(i)) {
                diffCount++;
            }
        }
        return diffCount == 1;
    }
}
