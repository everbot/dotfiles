if defined?(PryByebug)
  Pry.commands.alias_command 'ct', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
#  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'w', 'whereami'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

# for debug with pry in emacs {{{
# http://emacs.stackexchange.com/questions/3537/how-do-you-run-pry-from-emacs
# if ENV["INSIDE_EMACS"]
  # Pry.config.color = false # may not need to set this
  # Pry.config.correct_indent = false # may not need to set this
  Pry.config.pager = false # disable paging because it doesn't play well with comint
# end
# end emacs debug }}}

