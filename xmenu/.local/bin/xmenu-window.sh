#!/bin/sh
echo 'Root'
xmenu-root.sh | sed 's/^/\t/'

current=$(
python3 << EOF
from i3ipc import Connection, Event
i3 = Connection()
print(i3.get_tree().find_focused().workspace().name)
EOF
)
workspaces=$(
python3 << EOF
from i3ipc import Connection, Event
i3 = Connection()
for workspace in i3.get_workspaces(): print(workspace.name)
EOF
)
echo "Switch to"
for i in $(seq 1 6)
do
	echo "$workspaces" | tr ' ' '\n' | grep -q "$i" && a='-' || a=' '
	[ "$i" = "$current" ] && a='+'
	echo "\t$a Workspace ${i}\ti3-msg workspace $i"
done
python3 << EOF
from i3ipc import Connection, Event
i3 = Connection()
focused = i3.get_tree().find_focused()
if focused.type == "workspace": exit(0)
else: exit(1)
EOF
[ "$?" = "0" ] && exit

echo '\nSend to'
for i in $(seq 1 6)
do
	echo "$workspaces" | tr ' ' '\n' | grep -q "$i" && a='-' || a=' '
	[ "$i" = "$current" ] && a='+'
	echo "\t$a Workspace ${i}\ti3-msg move container to workspace $i"
done

echo 'Promote	i3-promote-window.py'
echo 'Swap	i3-msg mark swap && i3-swap.sh drop'
echo 'Fullscreen	i3-msg fullscreen'
echo 'Float	i3-msg floating toggle'
echo
echo 'Close	i3-msg kill'
