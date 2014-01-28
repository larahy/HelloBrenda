class ChargesController < ApplicationController

  before_filter :authenticate_user!

  def new
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find params[:article_id]
    @amount = @article.price * 100

    customer = Stripe::Customer.create(
    :email => current_user.email,
    :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => '@article.title',
    :currency    => 'gbp'
    )

    @order = Order.create(user_id: current_user.id, amount: @amount, product: @article.title)

    flash[:notice] = "Je ne regrette rien"
    redirect_to '/articles'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

end
