require File.dirname(__FILE__) + '/../../spec_helper'

not_supported_on :ironruby do
  with_tty do # needed for CI until we figure out a better way
  require 'readline'

  describe "Readline.emacs_editing_mode" do
    it "needs to be reviewed for spec completeness"
  end
  end
end
