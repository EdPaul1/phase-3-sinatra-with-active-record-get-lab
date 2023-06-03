class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  # add routes
  get '/bakeries' do
    #get all the bakeries from the database
    #send them back in a JSON array
    bakeries = Bakery.all

    bakeries.to_json

  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)

  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order(price: :desc).all

    baked_goods.to_json

  end

  get '/baked_goods/most_expensive' do
    most_expensive_good = BakedGood.order(price: :desc).first
    most_expensive_good.to_json
  end
end
