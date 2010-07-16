# 
# Author: Sean Seefried
# Description: A mixin for improved logging
# Date: 04 Mar 2009
# 

# This module makes the methods +log_error+ and +log_info+ available as
# instance methods *and* class methods.  It uses the clever idea of
# including +ClassMethods+ twice, once in the body and once in
# self.included

module Logging
  
  # include the methods as class methods
  def self.included(receiver)
    receiver.extend ClassMethods
  end

  module ClassMethods
    LOGGING_ERROR_PREFIX = "ERROR: "
    LOGGING_INFO_PREFIX  = "INFO: "

    @@logging_logger = Logger.new("#{RAILS_ROOT}/log/#{ENV['RAILS_ENV']}.log")

    def log_error(str)
      @@logging_logger.error(logging_add_prefix(LOGGING_ERROR_PREFIX,str))
    end
    
    def log_info(str)
      @@logging_logger.info(logging_add_prefix(LOGGING_INFO_PREFIX,str))
    end

    def logging_add_prefix(prefix, str)
      prefix + str.to_s.split(/\n/).join("\n#{prefix}")
    end

    def error_prefix
      LOGGING_ERROR_PREFIX
    end
    
    def info_prefix
      LOGGING_INFO_PREFIX
    end
    
  end

  # include the methods as instance methods
  include ClassMethods 

end
