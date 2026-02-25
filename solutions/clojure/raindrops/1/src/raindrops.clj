(ns raindrops)

(defn convert
  "Converts a number to its corresponding string of raindrop sounds."
  [num]
  (let [divisible-by-3 (= (mod num 3) 0)
        divisible-by-5 (= (mod num 5) 0)
        divisible-by-7 (= (mod num 7) 0)
        pairs [[divisible-by-3 "Pling"]
               [divisible-by-5 "Plang"]
               [divisible-by-7 "Plong"]]
        sounds (for [[divisible? sound] pairs :when divisible?] sound)]
    (if (empty? sounds)
      (str num)
      (apply str sounds))))

(convert 28)

