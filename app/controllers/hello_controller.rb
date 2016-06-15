class HelloController < ApplicationController
  def index
    @uname = `uname -a`.chomp
    @env_var = ENV['DISPLAY_ENV']
    @name = 'World'
  end
end
