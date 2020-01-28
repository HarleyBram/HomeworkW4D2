require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')
also_reload('./models/*')

# this controller will get HTML that shows all pizza orders
get '/pizza-orders' do
  # first need to get all the pizza orders
  # then pass those orders into an @instance_variable
  #render the index route HTML
  @orders = PizzaOrder.all
  erb(:index)
end

get '/pizza-orders/new' do
  erb(:new)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza-orders/:id/update' do
  @order = PizzaOrder.update(params)
  @order.save()
  erb(:update)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.delete(params[:id])
  erb(:delete)
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end
