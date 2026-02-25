(ns leap)

(defn- divisible-by
  [num div]
  (zero? (mod num div)))

(defn leap-year?
  "Returns true if the given year is a leap year;
  otherwise, it returns false."
  [year]
  (cond
    (divisible-by year 4) (cond
                            (divisible-by year 100) (cond
                                                      (divisible-by year 400) true
                                                      :else false)
                            :else true)
    :else false))