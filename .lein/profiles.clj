{:user {:plugins [
                  [mvxcvi/whidbey "0.3.2"]



                 ]

       :dependencies [  ;; [org.clojure/tools.nrepl "0.2.3"]
                      [io.aviso/pretty "0.1.12"]
                         [im.chit/iroh "0.1.11"]
                        [spyscope "0.1.4"]
                         [org.clojure/tools.namespace "0.2.4"]
                         [leiningen #=(leiningen.core.main/leiningen-version)]
                         [im.chit/vinyasa "0.2.0"]
                      ] ;
         :injections [ (require 'vinyasa.inject)
                       (vinyasa.inject/inject 'clojure.core
                         '[[vinyasa.inject inject]
                           [vinyasa.pull pull]
                           [vinyasa.lein lein]
                           [vinyasa.reimport reimport]])
                      (vinyasa.inject/inject 'clojure.core '>
                        '[[cemerick.pomegranate add-classpath get-classpath resources]
                          [clojure.tools.namespace.repl refresh]
                          [clojure.repl apropos dir doc find-doc source pst
                                        [root-cause >cause]]
                          [clojure.pprint pprint]
                          [clojure.java.shell sh]
                          [iroh.core delegate >ns .> >var .? .* .% .%>]])

                      ]
          :repl-options {
    :nrepl-middleware [io.aviso.nrepl/pretty-middleware]
  }}
;; :user
  ;; {  :aliases {"slamhound" ["run" "-m" "slam.hound"]}
       ;;  :dependencies [[slamhound "1.5.1"]]
       ;;  :plugins [[lein-nodisassemble "0.1.3"]]
       ;;  }
 }
