(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn- kebab->camel
  "Convert kebab-case string into camelCase"
  [s]
  (->> (str/split s #"-")
       (map-indexed (fn [i part] (if (zero? i)
                                   part
                                   (str/capitalize part))))
       (str/join "")))

(defn inspect [any]
  (println any )
  any)

(defn clean
  "TODO: add docstring"
  [s]
  (-> s
      (str/replace  #"[\α-\ω]" "")
      (str/replace #"\s"  "_")
      (str/replace #"[\u0000-\u001F\u007F-\u009F]" "CTRL") 
      (str/replace  #"[^\p{L}_]" "")
      (kebab->camel)
      ))

(squeaky-clean/clean "9 -abcĐ😀ω\0") ; _AbcĐCTRL