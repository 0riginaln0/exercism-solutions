(ns darts
  (:require [clojure.math :as math]))

(defn distance->score
  [distance]
  (cond
    (<= distance  1.0) :bullseye
    (<= distance  5.0) :outer-bull
    (<= distance 10.0) :outer-ring
    :else              :miss))

(defn score
  "Calculates the score of a dart throw."
  [x y]
  (case (distance->score (math/hypot x y))
    :bullseye   10
    :outer-bull  5
    :outer-ring  1
    :miss        0))
