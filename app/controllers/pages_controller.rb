class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @lists = policy_scope(List)
    @lists = List.all
    @list = List.new
  end
end
