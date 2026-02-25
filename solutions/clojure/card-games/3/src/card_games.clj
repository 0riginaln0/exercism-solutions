(ns card-games)

(defn rounds
  "Takes the current round number and returns 
   a `list` with that round and the _next two_."
  [n]
  (list n (inc n) (+ n 2)))

(defn concat-rounds
  "Takes two lists and returns a single `list` 
   consisting of all the rounds in the first `list`, 
   followed by all the rounds in the second `list`"
  [l1 l2]
  (concat l1 l2))

(defn contains-round?
  "Takes a list of rounds played and a round number.
   Returns `true` if the round is in the list, `false` if not."
  [l n]
  (boolean (some #{n} l)))

(defn card-average
  "Returns the average value of a hand"
  [hand]
  (let [{:keys [sum length]}
        (reduce (fn [acc, card]
                  (assoc acc
                         :sum (+ card (:sum acc))
                         :length (inc (:length acc))))
                {:sum 0 :length 0}
                hand)]
    (float (/ sum length))))

(defn- last-element-and-length [coll]
  (loop [remaining coll
         length 0
         last-element nil]
    (if (empty? remaining)
      {:last-element last-element
       :length length}
      (recur (rest remaining)
             (inc length)
             (first remaining)))))

(defn- first-middle-last-element [coll]
  (let [first-element (first coll)
        {:keys [last-element length]} (last-element-and-length coll)
        middle-element (nth coll (quot length 2))]
    [first-element middle-element last-element]))

(defn approx-average?
  "Returns `true` if average is equal to either one of:
  - Take the average of the _first_ and _last_ number in the hand.
  - Using the median (middle card) of the hand."
  [hand]
  (let [average (card-average hand)
        [first middle last] (first-middle-last-element hand)]
    (or
     (= average (float (/ (+ first last) 2)))
     (= average (float middle)))))

(defn- split-odd-even [coll]
  (loop [remaining coll
         index 1
         odd []
         even []]
    (if (empty? remaining)
      [odd even]
      (if (odd? index)
        (recur (rest remaining)
               (inc index)
               (conj odd (first remaining))
               even)
        (recur (rest remaining)
               (inc index)
               odd
               (conj even (first remaining)))))))

(defn average-even-odd?
  "Returns true if the average of the cards at even indexes 
   is the same as the average of the cards at odd indexes."
  [hand]
  (let [[odd even] (split-odd-even hand)]
    (= (card-average odd) (card-average even))))

(defn- replace-last
  [lst new-val]
  (let [v (into [] lst)]
    (seq (assoc v (dec (count v)) new-val))))

(defn maybe-double-last
  "If the last card is a Jack (11), doubles its value
   before returning the hand."
  [hand]
  (let [last (last hand)]
    (if (= last 11)
      (replace-last hand (* last 2))
      hand)))
