# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.paths
# Also including a locals file.
for file in ~/.{bash_prompt,exports,aliases,functions,paths,bash_profile_locals,profile}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh
