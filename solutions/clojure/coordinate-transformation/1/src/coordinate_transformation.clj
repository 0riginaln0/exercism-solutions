(ns coordinate-transformation)

(defn translate2d
  "Returns a function making use of a closure to
   perform a repeatable 2d translation of a coordinate pair."
  [dx dy]
  (let [x (atom dx)
        y (atom dy)]
    (fn [dx, dy]
      (swap! x + dx)
      (swap! y + dy)
      [@x @y])))

(defn scale2d
  "Returns a function making use of a closure to
   perform a repeatable 2d scale of a coordinate pair."
  [sx sy]
  (let [x (atom sx)
        y (atom sy)]
    (fn [sx sy]
      (swap! x * sx)
      (swap! y * sy)
      [@x @y])))

(defn compose-transform
  "Create a composition function that returns a function that 
   combines two functions to perform a repeatable transformation."
  [f g]
  (fn [x y] (apply g (f x y))))

(defn memoize-transform
  "Returns a function that memoizes the last result.
   If the arguments are the same as the last call,
   the memoized result is returned."
  [f]
  (let [last-call (atom {:args [], :result []})]
    (fn [x y]
      (if (= (:args @last-call) [x y])
        (:result @last-call)
        (let [result (f x y)]
          (swap! last-call assoc :args [x y] :result result)
          result)))))