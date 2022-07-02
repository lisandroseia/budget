# frozen_string_literal: true

class PaymentsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @transactions = @category.payments.order(created_at: :desc)
  end

  def new
    @transaction = Payment.new
    @category = Category.find(params[:category_id])
    @categories = current_user.categories.includes(:payments)
  end

  def create
    @category = Category.find(params[:category_id])
    @transaction = Payment.new(name: transactions_params[:name], amount: transactions_params[:amount])
    @transaction.author = current_user
    @selecteds = transactions_params[:category_ids]

    if @selecteds
      respond_to do |format|
        format.html do
          if @transaction.save
            create_op(@selecteds, @transaction.id)
            flash[:success] = 'Transaction added'
            redirect_to action: :index
          else
            flash[:error] = 'something went wrong'
            render :new
          end
        end
      end
    else
      flash[:error] = 'Must select at least 1 category'
      redirect_to action: :new
    end
  end

  def create_op(categories, payment_id)
    categories.each do |cat|
      @operation = Operation.new(category_id: cat.to_i, payment_id:)
      @operation.save
    end
  end

  def transactions_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end
end
