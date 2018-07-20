class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	if logged_in?
	  	@user = User.find(params[:id])
	  	respond_to do |format|
	  		format.html 
	  		format.json { render :json => @user}
      end
	   else
	 	redirect_to '/login'
	 	flash[:danger] = 'You are not logged in. Please do so'
  	end
  end

  def create 
    puts "HEY LOOK"
    puts params
    puts user_params
    puts user_params['gender']
  	@user = User.new(user_params.except(:weight, :height))
    puts "HERE ARE MY ERRORS"
    puts @user.errors
  	   if @user.save
  		  flash[:success] =  "Welcome to Kid's Health"
  		  puts "We are in the matrix"
        @user.weight.create(day: @user.created_at, weight: user_params["weight"])
        @user.height.create(day: @user.created_at, height: user_params["height"])
        log_in @user
  		  redirect_to @user
  	   else 
        display_error = "You made some mistakes: \n"
        @user.errors.messages.each do |key, array|
           array.each do |el| 
           display_error << "#{key} " + el + "\n"
          end
        end
  		  flash[:danger] = display_error
      #   puts @user.errors.messages
        redirect_to '/signup'
  	   end
  end

  def add_intake
    puts "PARAMS ID is"
    puts params["user_id"]
    @user = User.find_by(id: params["user_id"])
    if logged_in?
      if @user.daily_intake.create(calories:params["calories"], day:params["day"])
        respond_to do |format|
        format.html
        format.json 
      end
        # {render :json => DailyIntake.where("user_id=" + params['user_id'].to_s)}
     
      end
    else
      render text: 'There was an error'

    end
  end

  def add_comment
    puts "THE PARAMS ARE"
    puts params
    puts params["title"]
   puts  params["grade"]
    puts params["content"]
    @user = User.find_by(id: params["user_id"])
    if logged_in?
      if @user.comment.create(content:params["content"], title:params["title"], grade:params["grade"])
        respond_to do |format|
          format.html
          format.json

        end
      end
    else
      render text: "there was an error"
    end
end

  
  def add_height_weight
    @user = User.find_by(id: params["user_id"])
    if logged_in?
      if @user.height.create(height:params["height"], day:params["day"]) && @user.weight.create(weight:params["weight"], day:params["day"])
        respond_to do |format|
        format.html
        format.json 
      end
        # {render :json => DailyIntake.where("user_id=" + params['user_id'].to_s)}
     
      end
    else
      render text: 'There was an error'
  end
end

  def reveal_posts
    if logged_in?
      respond_to do |format|
        format.html
        format.json {render :json => Comment.where("user_id=" + params['user_id'].to_s)}
      end
    end
  end


  def reveal_intake
    if logged_in?
      respond_to do |format|
        format.html
        format.json {render :json => DailyIntake.where("user_id=" + params['user_id'].to_s).order(day: :asc)}
      end
    end
  end
  def reveal_height
    if logged_in?
      respond_to do |format|
        format.html
        format.json {render :json => Height.where("user_id=" + params['user_id'].to_s).order(day: :asc)}
      end
    end
  end
  def reveal_weight
    if logged_in?
      respond_to do |format|
        format.html
        format.json {render :json => Weight.where("user_id=" + params['user_id'].to_s).order(day: :asc)}
      end
    end
  end
  def destroy
  end

  private
  	def user_params
      params.except(:user, :format, :controller, :action).permit(:name, 
        :email, 
        :gender, 
        :password, 
        :password_confirmation, 
        :weight, 
        :height, 
        :diet_type, 
        :dob, 
        :blood_type)		
  	end
    def cal_params
      params.permit(:user_id, :calories, :day)
    end
end
