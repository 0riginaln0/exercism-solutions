(ns raindrops)

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [sound (str (when (zero? (rem num 3)) "Pling")
                   (when (zero? (rem num 5)) "Plang")
                   (when (zero? (rem num 7)) "Plong"))]
    (if (empty? sound) (str num) sound)))
