(ns space-age)

(defn age
  [planet, seconds]
  (let [earth-years (/ seconds 31557600)]
    (case planet
      :mercury (/ earth-years 0.2408467)
      :venus   (/ earth-years 0.61519726)
      :earth   (/ earth-years 1)
      :mars    (/ earth-years 1.8808158)
      :jupiter (/ earth-years 11.862615)
      :saturn  (/ earth-years 29.447498)
      :uranus  (/ earth-years 84.016846)
      :neptune (/ earth-years 164.79132))))

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
