class UsersController < ApplicationController

  def index
    all_users = User.all
    string_user = all_users.map do |user|
      "#{user.first_name} #{user.last_name}, #{user.age}"
    end
    render text: string_user.join(" | ")
  end

  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render text: "#{user.first_name} #{user.last_name}, #{user.age}"
    else
      render text: "User Not Found", status: 404
    end
  end

end

#   elsif params[:first_name]
#
#     starts_with = User.where("first_name LIKE ?", "#{params[:first_name]}%")
#     starts_with.each do |user|
#       render text: "#{user.first_name} #{user.last_name} | #{user.age}"
#     end
