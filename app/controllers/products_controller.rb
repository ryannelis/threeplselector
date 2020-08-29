class ProductsController < ApplicationController
  def index
    matching_products = Product.all

    @list_of_products = matching_products.order({ :created_at => :desc })

    render({ :template => "products/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_products = Product.where({ :id => the_id })

    @the_product = matching_products.at(0)

    render({ :template => "products/show.html.erb" })
  end

  def create
    the_product = Product.new
    the_product.length = params.fetch("query_length")
    the_product.width = params.fetch("query_width")
    the_product.height = params.fetch("query_height")
    the_product.weight = params.fetch("query_weight")
    the_product.name = params.fetch("query_name")
    the_product.user_id = params.fetch("query_user_id")
    the_product.units_shipped_per_month = params.fetch("query_units_shipped_per_month")

    if the_product.valid?
      the_product.save
      redirect_to("/products", { :notice => "Product created successfully." })
    else
      redirect_to("/products", { :notice => "Product failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_product = Product.where({ :id => the_id }).at(0)

    the_product.length = params.fetch("query_length")
    the_product.width = params.fetch("query_width")
    the_product.height = params.fetch("query_height")
    the_product.weight = params.fetch("query_weight")
    the_product.name = params.fetch("query_name")
    the_product.user_id = params.fetch("query_user_id")
    the_product.units_shipped_per_month = params.fetch("query_units_shipped_per_month")

    if the_product.valid?
      the_product.save
      redirect_to("/products/#{the_product.id}", { :notice => "Product updated successfully."} )
    else
      redirect_to("/products/#{the_product.id}", { :alert => "Product failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_product = Product.where({ :id => the_id }).at(0)

    the_product.destroy

    redirect_to("/products", { :notice => "Product deleted successfully."} )
  end
end
