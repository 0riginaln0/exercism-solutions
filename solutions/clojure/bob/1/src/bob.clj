(ns bob
  (:require [clojure.string :as str]))

(def silence? str/blank?)
(def shouting? #(re-matches #"(?=.*[\p{Lu}])[^\p{Ll}]+" %))
(def question? #(re-find #"\?\s*$" %))
(def shouting-question? (every-pred shouting? question?))

(defn response-for [s]
  (cond (silence?           s) "Fine. Be that way!"
        (shouting-question? s) "Calm down, I know what I'm doing!"
        (shouting?          s) "Whoa, chill out!"
        (question?          s) "Sure."
        :else                  "Whatever."))
