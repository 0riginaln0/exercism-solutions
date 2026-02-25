(ns reverse-string
  (:import (java.text BreakIterator)))

(defn reverse-string
  "Returns the input string reversed by grapheme clusters (Unicode-aware)."
  [s]
  (let [iter (BreakIterator/getCharacterInstance)]
    (.setText iter s)
    (loop [starts [0]
           pos (.next iter)]
      (if (= pos BreakIterator/DONE)
        (let [starts (conj starts (count s))]
          (if (= (count starts) 2)
            s
            (let [sb (StringBuilder.)]
              (doseq [i (range (- (count starts) 2) -1 -1)]
                (let [start (nth starts i)
                      end   (nth starts (inc i))]
                  (.append sb (subs s start end))))
              (.toString sb))))
        (recur (conj starts pos) (.next iter))))))
