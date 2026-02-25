(ns darts
  (:require [clojure.math :as math]))

(defn score
  "Calculates the score of a dart throw."
  [x y]
  (let [distance (math/hypot x y)]
    (cond
      (<= distance  1) 10
      (<= distance  5)  5
      (<= distance 10)  1
      :else             0)))