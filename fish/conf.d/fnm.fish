# fnm
# set PATH "/home/edjubert/.local/share/fnm" $PATH
# fnm env --use-on-cd | source

# fnm
set FNM_PATH "/home/edjubert/.local/share/fnm"
if [ -d "$FNM_PATH" ]
  set PATH "$FNM_PATH" $PATH
  fnm env | source
end
