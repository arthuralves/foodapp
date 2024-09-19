class CheckoutsController < ApplicationController
  def create
    Stripe.api_key = Rails.configuration.stripe[:secret_key]
    cart = params[:cart]
    line_items = cart.map do |item|
      product = Product.find(item["id"])
      product_stock = product.stocks.find{ |ps| ps.size == item["size"] }

      if product_stock.amount < item["quantity"].to_i
        render json: { error: "Not enough stock for #{product.name} in size #{item["size"]}. Only #{product_stock.amount} left." }, status: 400
        return
      end

      { 
        quantity: item["quantity"].to_i,
        price_data: { 
          product_data: {
            name: item["name"].force_encoding('UTF-8'),
            metadata: { 
              product_id: product.id, 
              size: item["size"].force_encoding('UTF-8'), 
              product_stock_id: product_stock.id }
          },
          currency: "BRL",
          unit_amount: item["price"].to_i * 100
        }
      } 
    end

    puts "line_items: #{line_items}"

    session = Stripe::Checkout::Session.create(
      mode: "payment",
      line_items: line_items,
      success_url: "http://localhost:3000/success",
      cancel_url: "http://localhost:3000/cancel",
      # shipping_address_collection: { 
      #   allowed_countries: ['US', 'CA']
      # }
    )

    render json: { url: session.url }

  rescue => e
    render json: { error: e.message }, status: :bad_request
    end

    def success
      render :success
    end

    def cancel
      render :cancel
    end
end