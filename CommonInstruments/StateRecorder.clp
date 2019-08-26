;  StateRecorder.clp
;  CommonInstruments
;
;  Created by Brandon Titus on 7/30/19.
;  Copyright © 2019 Titus. All rights reserved.

(defrule MODELER::found-invalid
    (os-log (subsystem ?subsystem) (category ?category))
    (test (and (eq ?category "StateMachine") (eq ?subsystem "io.titus.wireguard")))
    =>
    (assert (items category))
)

; NOT SURE WHAT THE POINT OF THIS IS
;(deftemplate items
;    (slot category (type STRING))
;    (slot subsystem (type STRING))
;    (slot time (type INTEGER))
;    (slot message (type STRING))
;)

; A Basic rule that records based on a few parameters.
(defrule RECORDER::state-change "A rule to record state changes"
    (os-log (subsystem "io.titus.wireguard") (category "StateMachine") (time ?time) (message$ "Changed state: " ?value))
    (table (table-id ?t) (side append))
    =>
    (create-new-row ?t)
    (set-column category "StateMachine")
    (set-column subsystem "io.titus.wireguard")
    (set-column value ?value)
    (set-column time ?time)
)

;(defrule RECORDER::track-change "A rule to track state changes"
;    (os-log (subsystem "io.titus.wireguard") (category "StateMachine") (time ?time) (message$ "Changed state: " ?value))
;    (table (table-id ?t) (side append))
;    =>
;    (create-new-row ?t)
;    (set-column category "StateMachine")
;    (set-column subsystem "io.titus.wireguard")
;    (set-column value ?value)
;    (set-column time ?time)
;)

