(ns isogram
  (:require [clojure.string :as str]))

(defn isogram?
  "Returns true if the given string is an isogram;
  otherwise, it returns false."
  [s]
  (let [letters (-> s
                    (str/lower-case)
                    (str/replace #"[ -]" ""))
        unique-letters (set letters)]
    (= (count letters) (count unique-letters))))
