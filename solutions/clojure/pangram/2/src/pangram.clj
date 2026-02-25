(ns pangram
  (:require [clojure.string :as str]))

(def alphabet (set "abcdefghijklmnopqrstuvwxyz"))

(defn pangram?
  "Returns true if the given string is a pangram;
  otherwise, it returns false."
  [s]
  (let [used-letters (->> (str/lower-case s)
                          (filter #(contains? alphabet %))
                          (into #{}))]
    (= (count alphabet) (count used-letters))))
