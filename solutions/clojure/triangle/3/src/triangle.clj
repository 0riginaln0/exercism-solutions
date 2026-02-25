(ns triangle)

(defn- valid? [a b c]
  (let [[short-side, medium-side, long-side] (sort [a b c])]
    (> (+ short-side medium-side) long-side)))

(defn equilateral?
  [a b c]
  (and (valid? a b c) (== a b c)))

(defn isosceles?
  [a b c]
  (and (valid? a b c) (not (distinct? a b c))))

(defn scalene?
  [a b c]
  (and (valid? a b c) (distinct? a b c)))
