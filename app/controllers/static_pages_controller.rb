class StaticPagesController < ApplicationController
  def home
    if logged_in?
      id = '/users/' + current_user.id.to_s
      redirect_to (id)
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def test
    @users_arr = []
    User.find_each do |user|
      @users_arr.push(user)
    end
  end
end
