(ns isogram
  (:require [clojure.string :as str]))

(defn isogram?
  "Returns true if the given string is an isogram;
  otherwise, it returns false."
  [s]
  (let [letters (str/replace (str/lower-case s) #"[ -]" "" )
        unique (set letters)]
    (= (count letters) (count unique))))