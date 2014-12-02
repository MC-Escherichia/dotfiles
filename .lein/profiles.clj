{:user {:plugins [;[mvxcvi/whidbey "0.3.2"]
                  [cider/cider-nrepl "0.8.0-SNAPSHOT"]
;;                  [lein-nevam "0.1.2"]
                  [lein-ubersource "0.1.1"]
                  [org.clojure/tools.namespace "0.2.4"]
                  [chestnut/lein-template "0.6.0"]
                  [lein-midje "3.1.3"]
                 ]

       :dependencies [  ;; [org.clojure/tools.nrepl "0.2.3"]

                         [im.chit/iroh "0.1.11"]
                        [spyscope "0.1.5"]
                         [org.clojure/tools.namespace "0.2.4"]
                         [leiningen #=(leiningen.core.main/leiningen-version)]
                         [im.chit/vinyasa "0.2.2"]
                         [slamhound "1.5.5"]
                         [com.taoensso/timbre "3.3.1"]
                      ] ;
        :injections [(require 'spyscope.core)


                     (require '[ vinyasa.inject :as inject])
                     (inject/in

                      [vinyasa.inject :refer [inject [in inject-in]]]
                      [vinyasa.pull :all]
                      [vinyasa.lein :exclude [*project*]]
                      [vinyasa.reimport :refer [reimport]]
                      [clojure.repl pst doc ]
                      [clojure.pprint pprint]
                      [clojure.java.shell sh]



                      clojure.core
                      [iroh.core .> .? .* .% .%>]

)]
        :aliases {"slamhound" ["run" "-m" "slam.hound"]}
        :profiles {:nodis {:plugins [ [lein-nodisassemble "0.1.3"]]}}

        :jvm-opts ["-XX:+CMSClassUnloadingEnabled"]}
 :dev {:plugins [ [s3-wagon-private "1.1.2"]]
               :repositories [["cris-private" {:url "s3p://criscolumbiarepos/releases/"
                                               :creds :gpg
                                               :sign-releases false}]]}
 }
