(ns squeaky-clean
  (:require [clojure.string :as str]))

(defn clean
  "Applies four sequential string sanitizations:
   
   1. Replace whitespace with underscore: `#\"\\s\"`.

   2. Replace control characters with \"CTRL\": `#\"[\\p{Cc}]\"`.
  
   3. Convert hyphen‑connected words to camelCase:
      regex `#\"-(\\p{L})\"`, replacement `#(str/upper-case (%1 1))`.
   
   4. Remove all characters except letters and underscore,
      but also explicitly remove Greek lowercase letters (α‑ω): `#\"[^\\p{L}_]|[α-ω]\"`.
  
   Examples:

     (clean \"my   Id\")        ;; => \"my___Id\"
     (clean \"my\\u007FId\")    ;; => \"myCTRLId\"
     (clean \"à-ḃç\")           ;; => \"àḂç\"
     (clean \"1😀2😀3😀\")     ;; => \"\"
     (clean \"MyΟβιεγτFinder\") ;; => \"MyΟFinder\""
  [s]
  (-> s
      (str/replace #"\s"  "_")
      (str/replace #"[\p{Cc}]" "CTRL")
      (str/replace #"-(\p{L})" #(str/upper-case (%1 1)))
      (str/replace #"[^\p{L}_]|[\α-\ω]" "")))
