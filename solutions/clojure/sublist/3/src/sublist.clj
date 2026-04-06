(ns sublist)

(defn starts-with? [list prefix]
  (cond
    (empty? prefix) true
    (empty? list) false
    (= (first list) (first prefix)) (recur (rest list) (rest prefix))
    :else false))

(defn- sublist?
  "Whether the l1 is a sublist of l2"
  [l1, l2]
  (cond
    (empty? l2) false
    :else (if (starts-with? l2 l1)
            true
            (recur l1 (rest l2)))))

(defn classify
  "Returns:
  :equal if coll1 equals coll2,
  :superlist if coll1 is a superlist of coll2,
  :sublist if coll1 is a sublist of coll2,

  If none of these conditions is true, it returns :unequal."
  [coll1 coll2]
  (cond
    (= coll1 coll2) :equal
    (and (< (count coll1) (count coll2)) (sublist? coll1 coll2)) :sublist
    (and (> (count coll1) (count coll2)) (sublist? coll2 coll1)) :superlist
    :else :unequal))
