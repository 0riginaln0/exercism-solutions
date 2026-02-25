(ns isogram
  (:require [clojure.string :as str]))

(defn isogram?
  "Returns true if the given string is an isogram;
  otherwise, it returns false."
  [s]
  (let [letters (->> s
                     (str/lower-case)
                     (filter #(Character/isLetter %)))]
    (if (empty? letters)
      true
      (apply distinct? letters))))
