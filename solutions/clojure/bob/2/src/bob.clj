(ns bob
  (:require [clojure.string :as str]))

(defn contains-letter? [s] (some? (some #(Character/isLetter %) s)))
(defn is-upper-cased? [s] (= (str/upper-case s) s))
(defn ends-with-qst? [s] (= \? (last s)))
(defn does [s, requirements] (every? #(% s) requirements))

(defn response-for [s]
  (let [sentence (str/trim s)]
    (cond
      (does sentence [contains-letter?
                      is-upper-cased?
                      ends-with-qst?])  "Calm down, I know what I'm doing!"
      
      (does sentence [contains-letter? 
                      is-upper-cased?]) "Whoa, chill out!"
      
      (does sentence [ends-with-qst?])  "Sure."
      
      (does sentence [str/blank?])      "Fine. Be that way!"
      
      :else                             "Whatever.")))
