class ThreeplsController < ApplicationController
  def index
    matching_threepls = Threepl.all

    @list_of_threepls = matching_threepls.order({ :created_at => :desc })

    render({ :template => "threepls/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_threepls = Threepl.where({ :id => the_id })

    @the_threepl = matching_threepls.at(0)

    render({ :template => "threepls/show.html.erb" })
  end

  def create
    the_threepl = Threepl.new
    the_threepl.storage_fees = params.fetch("query_storage_fees")
    the_threepl.pick_and_pack_fees = params.fetch("query_pick_and_pack_fees")
    the_threepl.number_of_products_can_handle = params.fetch("query_number_of_products_can_handle")
    the_threepl.monthly_volume = params.fetch("query_monthly_volume")
    the_threepl.api__edi_integration = params.fetch("query_api__edi_integration", false)

    if the_threepl.valid?
      the_threepl.save
      redirect_to("/threepls", { :notice => "Threepl created successfully." })
    else
      redirect_to("/threepls", { :notice => "Threepl failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_threepl = Threepl.where({ :id => the_id }).at(0)

    the_threepl.storage_fees = params.fetch("query_storage_fees")
    the_threepl.pick_and_pack_fees = params.fetch("query_pick_and_pack_fees")
    the_threepl.number_of_products_can_handle = params.fetch("query_number_of_products_can_handle")
    the_threepl.monthly_volume = params.fetch("query_monthly_volume")
    the_threepl.api__edi_integration = params.fetch("query_api__edi_integration", false)

    if the_threepl.valid?
      the_threepl.save
      redirect_to("/threepls/#{the_threepl.id}", { :notice => "Threepl updated successfully."} )
    else
      redirect_to("/threepls/#{the_threepl.id}", { :alert => "Threepl failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_threepl = Threepl.where({ :id => the_id }).at(0)

    the_threepl.destroy

    redirect_to("/threepls", { :notice => "Threepl deleted successfully."} )
  end
end
