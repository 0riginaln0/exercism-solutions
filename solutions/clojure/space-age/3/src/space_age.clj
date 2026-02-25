(ns space-age)

(def orbital-period-in-earth-years-on
  {:mercury 0.2408467
   :venus   0.61519726
   :earth   1
   :mars    1.8808158
   :jupiter 11.862615
   :saturn  29.447498
   :uranus  84.016846
   :neptune 164.79132})

(defn age [planet seconds]
  (let [earth-years (/ seconds 31557600.0)]
    (/ earth-years (orbital-period-in-earth-years-on planet))))

(defn on-mercury
  "Returns someone's age on Mercury based on the given age in seconds."
  [seconds]
  (age :mercury seconds))

(defn on-venus
  "Returns someone's age on Venus based on the given age in seconds."
  [seconds]
  (age :venus seconds))

(defn on-earth
  "Returns someone's age on Earth based on the given age in seconds."
  [seconds]
  (age :earth seconds))

(defn on-mars
  "Returns someone's age on Mars based on the given age in seconds."
  [seconds]
  (age :mars seconds))

(defn on-jupiter
  "Returns someone's age on Jupiter based on the given age in seconds."
  [seconds]
  (age :jupiter seconds))

(defn on-saturn
  "Returns someone's age on Saturn based on the given age in seconds."
  [seconds]
  (age :saturn seconds))

(defn on-uranus
  "Returns someone's age on Uranus based on the given age in seconds."
  [seconds]
  (age :uranus seconds))

(defn on-neptune
  "Returns someone's age on Neptune based on the given age in seconds."
  [seconds]
  (age :neptune seconds))
