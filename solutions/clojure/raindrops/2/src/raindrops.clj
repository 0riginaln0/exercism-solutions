(ns raindrops)

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [sound (str (if (zero? (rem num 3)) "Pling" "")
                   (if (zero? (rem num 5)) "Plang" "")
                   (if (zero? (rem num 7)) "Plong" ""))]
    (if (empty? sound) (str num) sound)))
