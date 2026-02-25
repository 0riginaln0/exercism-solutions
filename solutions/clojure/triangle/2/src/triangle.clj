(ns triangle)

(defn- valid? [a b c]
  (let [sides (sort [a b c])
        [short, medium, long] sides]
    (> (+ short medium) long)))

(defn equilateral?
  [a b c]
  (and (valid? a b c) (== a b c)))

(defn isosceles?
  [a b c]
  (and (valid? a b c) (not (distinct? a b c))))

(defn scalene?
  [a b c]
  (and (valid? a b c) (distinct? a b c)))
