#!/usr/bin/env python3
import os
from i3ipc import Connection, Event

i3 = Connection()

def on_workspace_focus(self, e):
    if e.current:
        os.system("dunstify -r 10551 workspace " + e.current.name)

i3.on(Event.WORKSPACE_FOCUS, on_workspace_focus)
i3.main()

