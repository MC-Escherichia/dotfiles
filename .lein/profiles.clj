{:user {:plugins [                      ;[mvxcvi/whidbey "0.3.2"]
                  [refactor-nrepl "1.2.0" ]
                  [cider/cider-nrepl "0.9.1"]
                  ;;                  [lein-nevam "0.1.2"]
                  [lein-ubersource "0.1.1"]

                  [org.clojure/tools.namespace "0.2.4"]
                  [chestnut/lein-template "0.6.0"]
                  [lein-midje "3.1.3"]]

       :dependencies [  ;; [org.clojure/tools.nrepl "0.2.3"]

                         [im.chit/iroh "0.1.11"]
                        [spyscope "0.1.5"]
                         [org.clojure/tools.namespace "0.2.4"]
                         [leiningen #=(leiningen.core.main/leiningen-version)]
                         [im.chit/vinyasa "0.3.4"]
                         [slamhound "1.5.5"]
                         [com.taoensso/timbre "3.3.1"]
                         [io.aviso/pretty "0.1.8"]] ;
        :injections [(require 'spyscope.core)
                     (require '[ vinyasa.inject :as inject])
                     (require 'io.aviso.repl)
                     (inject/in

                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.lein :exclude [*project*]]
                      [vinyasa.pull :all]
                      [cemerick.pomegranate add-classpath get-classpath resources]
                        ;; inject into clojure.core
                      clojure.core
                      [vinyasa.reflection .> .? .* .% .%> .& .>ns .>var]

                      ;; inject into clojure.core with prefix
                      clojure.core >
                      [clojure.pprint pprint]
                      [clojure.java.shell sh])]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :profiles {:nodis {:plugins [ [lein-nodisassemble "0.1.3"]]}}
        :jvm-opts ["-XX:+CMSClassUnloadingEnabled"]}
 :dev {:plugins [ [s3-wagon-private "1.1.2"]]}}
