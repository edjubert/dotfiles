function fish_prompt
  # Cache exit status
  set -l last_status $status

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (uname -n|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char (set_color red)'λ '(set_color normal)
      case '*'
        set -g __fish_prompt_char 'λ'
    end
  end

  # Setup colors
  # set -l hostcolor (set_color (uname -n | md5sum | cut -f1 -d' ' | tr -d '\n' | tail -c6))
  set -l hostcolor (set_color green)
  set -l normal (set_color normal)
  set -l white (set_color FFFFFF)
  set -l turquoise (set_color 5fdfff)
  set -l green (set_color green)
  set -l orange (set_color df5f00)
  set -l hotpink (set_color df005f)
  set -l blue (set_color blue)
  set -l limegreen (set_color 87ff00)
  set -l purple (set_color af5fff)
  set -l red (set_color red)

  # Configure __fish_git_prompt
  set -g __fish_git_prompt_char_stateseparator '|'
  set -g __fish_git_prompt_color 5fdfff
  set -g __fish_git_prompt_color_flags df5f00
  set -g __fish_git_prompt_color_prefix white
  set -g __fish_git_prompt_color_suffix white
  set -g __fish_git_prompt_showdirtystate false

  set -g __fish_git_prompt_showuntrackedfiles false
  set -g __fish_git_prompt_showstashstate false
  set -g __fish_git_prompt_show_informative_status false
  set -g __fish_git_prompt_use_informative_chars false
  set -g __fish_git_prompt_char_cleanstate '✔ '
  set -g __fish_git_prompt_char_dirtystate '✚ '
  set -g __fish_git_prompt_color_dirtystate df5f00
  set -g __fish_git_prompt_char_invalidstate '✖ '
  set -g __fish_git_prompt_color_invalidstate red
  set -g __fish_git_prompt_char_stagedstate '● '
  set -g __fish_git_prompt_color_stagedstate ffff00
  set -g __fish_git_prompt_char_stashstate '⚑ '
  set -g __fish_git_prompt_color_stashstate 8FC9A3
  set -g __fish_git_prompt_char_untrackedfiles '… '
  set -g __fish_git_prompt_color_untrackedfiles red
  set -g __fish_git_prompt_char_upstream_ahead '↑ '
  set -g __fish_git_prompt_char_upstream_behind '↓ '
  set -g __fish_git_prompt_char_upstream_diverged '<>'
  set -g __fish_git_prompt_char_upstream_equal '='
  set -g __fish_git_prompt_color_upstream green

  set -l current_user (whoami)

  ##
  ## Line 1
  ##
  echo -n $hostcolor'╭─'$hostcolor $current_user$white' in '$limegreen(pwd|sed "s=$HOME=⌁=")$turquoise
  __fish_git_prompt " (%s)"
  echo

  ##
  ## Line 2
  ##
  echo -n $hostcolor'╰'


  # Disable virtualenv's default prompt
  set -g VIRTUAL_ENV_DISABLE_PROMPT true

  # support for virtual env name
  if set -q VIRTUAL_ENV
    echo -n "($turquoise"(basename "$VIRTUAL_ENV")"$white)"
  end

  ##
  ## Support for vi mode
  ##
  set -l lambdaViMode "$THEME_LAMBDA_VI_MODE"

  # Do nothing if not in vi mode
  if test "$fish_key_bindings" = fish_vi_key_bindings
      or test "$fish_key_bindings" = fish_hybrid_key_bindings
    if test -z (string match -ri '^no|false|0$' $lambdaViMode)
      set_color --bold
      echo -n $hostcolor'─ '
      switch $fish_bind_mode
        case default
          echo -n $red'λ '
        case insert
          echo -n $green'λ '
        case replace_one
          echo -n $turquoise'λ '
        case replace
          echo -n $blue'λ '
        case visual
          echo -n $purple'λ '
      end
      echo -n $normal
    end
  end
end


