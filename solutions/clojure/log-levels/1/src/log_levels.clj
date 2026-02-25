(ns log-levels
  (:require [clojure.string :as str]))

(defn- parse-log
  [log]
  (let [[level, message] (map str/trim (str/split log #":"))]
    {:level level
     :message message}))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (:message (parse-log s)))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case (str/replace (:level (parse-log s))
                               #"^\[|\]$"
                               "")))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (format "%s (%s)" (message s) (log-level s)))
