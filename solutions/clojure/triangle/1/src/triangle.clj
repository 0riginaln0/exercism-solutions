(ns triangle)

(defn- valid-triangle? [a b c]
  (let [sides (sort [a b c])
        [short, medium, long] sides]
    (< long (+ short medium))))

(defn equilateral?
  "Returns true if the triangle with sides a, b, and c is equilateral;
  otherwise, it returns false."
  [a b c]
  (and (valid-triangle? a b c) (== a b c)))

(defn isosceles?
  "Returns true if the triangle with sides a, b, and c is isosceles;
  otherwise, it returns false."
  [a b c]
  (and (valid-triangle? a b c) (or (== a b) (== b c) (== c a))))

(isosceles? 1 3 1)

(defn scalene?
  "Returns true if the triangle with sides a, b, and c is scalene;
  otherwise, it returns false."
  [a b c]
  (and (valid-triangle? a b c) (not (isosceles? a b c))))
