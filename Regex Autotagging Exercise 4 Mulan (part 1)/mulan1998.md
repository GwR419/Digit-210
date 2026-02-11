#--I found all lines with (^.+?(?:\n(?!\n).+)*)  and replaced it with
# <sp>
# \1
# </sp>
#wrapped it with an XML Root and validated it.
I follwed along in class and fixed it bc i didnt like the how it was formatted before using what you did (.+?)(\n\n) to find and <sp>\1</sp>$2 to replace. .  