require File.dirname(__FILE__) + '/../../spec_helper'
require 'syslog'

describe "Syslog.options" do
  not_supported_on :windows do

    before :each do
      Syslog.opened?.should be_false
    end

    after :each do
      Syslog.opened?.should be_false
    end

    it "returns the logging options" do
      Syslog.open("rubyspec", Syslog::LOG_PID)
      Syslog.options.should == Syslog::LOG_PID
      Syslog.close
    end

    it "returns nil when the log is closed" do
      Syslog.opened?.should be_false
      Syslog.options.should == nil
    end

    it "defaults to LOG_PID | LOG_CONS" do
      Syslog.open
      Syslog.options.should == Syslog::LOG_PID | Syslog::LOG_CONS
      Syslog.close
    end

    it "resets after each open call" do
      Syslog.open
      Syslog.options.should == Syslog::LOG_PID | Syslog::LOG_CONS
      
      Syslog.open!("rubyspec", Syslog::LOG_PID)
      Syslog.options.should == Syslog::LOG_PID 
      Syslog.close

      Syslog.open
      Syslog.options.should == Syslog::LOG_PID | Syslog::LOG_CONS
      Syslog.close
    end
  end
end
