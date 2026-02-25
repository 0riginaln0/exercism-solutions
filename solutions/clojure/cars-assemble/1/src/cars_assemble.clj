(ns cars-assemble)

(defn speed-to-success-rate [speed]
  (case speed
    (0) 0
    (1 2 3 4) 1
    (5 6 7 8) 0.9
    9 0.8
    10 0.77
    0))

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (let [success-rate (speed-to-success-rate speed)]
    (-> speed
        (* 221)
        (* success-rate))))

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (-> speed
      (production-rate)
      (/ 60)
      (int)))
