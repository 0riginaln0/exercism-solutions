(ns pangram
  (:require [clojure.string :as str]))

(defn pangram?
  "Returns true if the given string is a pangram;
  otherwise, it returns false."
  [s]
  (let [alphabet (set "abcdefghijklmnopqrstuvwxyz")
        lower-s  (str/lower-case s)
        used-letters (->> lower-s
                          (filter #(contains? alphabet %))
                          (into #{}))]
    (= (count alphabet) (count used-letters))))
