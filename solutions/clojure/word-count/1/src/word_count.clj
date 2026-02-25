(ns word-count
  (:require [clojure.string :as str]))

(defn word-count
  "Counts how many times each word occurs in the given string."
  [subtitles]
  (->> subtitles 
       (str/lower-case)
       (re-seq #"\b[a-z0-9']+\b")
       (frequencies)))