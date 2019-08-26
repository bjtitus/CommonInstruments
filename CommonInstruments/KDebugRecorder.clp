;  KDebugRecorder.clp
;  CommonInstruments
;
;  Created by Brandon Titus on 7/30/19.
;  Copyright © 2019 Titus. All rights reserved.

(defrule RECORDER::kdebug "kdebug recorder"
    (kdebug (class ?class) (subclass ?subclass) (time ?time) (code ?code) (function ?function))
    (table (table-id ?t) (side append))
    =>
    (create-new-row ?t)
    (set-column class ?class)
    (set-column subclass ?subclass)
    (set-column code ?code)
    (set-column function ?function)
    (set-column time ?time)
)
