class ChargesController < ApplicationController

  def new
    @article = Article.find(params[:article_id])
  end

  def create
    @article = Article.find params[:article_id]
    @amount = @article.price * 100

    customer = Stripe::Customer.create(
    :email => 'larahy@gmail.com',
    :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => '@article.title',
    :currency    => 'gbp'
  )
    flash[:notice] = "Je ne regrette rien"
    redirect_to '/articles'

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to charges_path
end
end
