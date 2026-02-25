(ns matching-brackets)

(def ^:private matching {\{ \}, \[ \], \( \)})
(def ^:private opening? (set (keys matching)))
(def ^:private bracket? (into opening? (vals matching)))

(defn valid? [s]
  (let [update-stack
        (fn [stk c]
          (cond (opening? c) (conj stk c)
                (= (matching (peek stk)) c) (pop stk)
                :else (reduced [:closing-does-not-match-opening])))]
    (->> (filter bracket? s)
         (reduce update-stack [])
         (empty?))))
