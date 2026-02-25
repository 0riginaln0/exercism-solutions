(ns darts
  (:require [clojure.math :as math]))

(defn score
  "Calculates the score of a dart throw."
  [x y]
  (let [distance (math/sqrt (+ (* x x) (* y y)))]
    (cond
      (<= distance  1.0) 10
      (<= distance  5.0)  5
      (<= distance 10.0)  1
      :else               0)))
