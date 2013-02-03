(defn is [i]
  (let [[x & xs] (clojure.string/split-lines (slurp i))]
    (partition (/ (count xs) (read-string x)) xs)))

(defn out [o rs]
  (let [rs-indexed (map-indexed (fn [x y] [(inc x) y]) rs)
        rs-string (clojure.string/join "\n" (map (fn [[i r]] (str "Case #" i ": " r)) rs-indexed))]
    (spit o rs-string)
    rs-string))

;(defn solve [i]
;  (let [sum (read-string (first i))
;        choices (map read-string (clojure.string/split (last i) #" "))
;        matching1 (map #(.indexOf choices %) (map #(- sum %) choices))
;        matching2 (map #(.lastIndexOf choices %) (map #(- sum %) choices))
;        result (sort (map inc (remove neg? (distinct (concat matching1 matching2)))))]
;    result))
(defn solve [i]
  (let [sum (read-string (first i))
        choices (map read-string (clojure.string/split (last i) #" "))]
    (loop [dup choices ci 0]
      (let [c (first dup)
            dec-dup (rest dup)
            match (.indexOf dec-dup (- sum c))]
        (if (not (neg? match))
          (str (inc ci) " " (+ ci 1 match 1))
          (recur dec-dup (inc ci)))))))

(defn execute [i o] (out o (map solve (is i))))

(execute "src/code-jam-2010-q-a-large.in" "src/code-jam-2010-q-a-large.out")


