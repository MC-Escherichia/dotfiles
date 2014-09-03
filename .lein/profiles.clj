{:user {:plugins [;[mvxcvi/whidbey "0.3.2"]
                  [cider/cider-nrepl "0.7.0"]
;;                  [lein-nevam "0.1.2"]
                  [lein-ubersource "0.1.1"]
                  [org.clojure/tools.namespace "0.2.4"]
                 ]

       :dependencies [  ;; [org.clojure/tools.nrepl "0.2.3"]

                         [im.chit/iroh "0.1.11"]
                        [spyscope "0.1.4"]
                         [org.clojure/tools.namespace "0.2.4"]
                         [leiningen #=(leiningen.core.main/leiningen-version)]
                         [im.chit/vinyasa "0.2.2"]
                         [slamhound "1.5.5"]
                      ] ;
        :injections [(require 'spyscope.core)
                     (require '[ vinyasa.inject :as inject])
                     (inject/in

                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.pull :all]
                      [vinyasa.lein :exclude [*project*]]
                      [vinyasa.reimport :refer [reimport]]
                      [clojure.repl pst]
                      [clojure.pprint pprint]
                      [clojure.java.shell sh]

                      clojure.core
                      [iroh.core .> .? .* .% .%>]

)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :profiles {:nodis {:plugins [ [lein-nodisassemble "0.1.3"]]}}

        :jvm-opts ["-XX:+CMSClassUnloadingEnabled"]}}
