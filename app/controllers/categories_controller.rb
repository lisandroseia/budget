# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  # def show
  #   @category = Category.find(params[:id])
  #   @transactions = @category.transactions.order(created_at: :desc)
  #   @total = @category.transactions.where(category_id: @category.id).sum(:amount)
  # end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: categories_params[:name], user_id: current_user.id)
    @category.icon.attach(categories_params[:icon])
    respond_to do |format|
      format.html do
        if @category.save
          flash[:success] = 'Category added'
          redirect_to action: :index
        else
          render :new
          flash[:error] = 'Something went wrong'
        end
      end
    end
  end

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end
