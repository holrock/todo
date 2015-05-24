class StaticPagesController < ApplicationController
  skip_before_filter :require_login
  def top
  end
end
