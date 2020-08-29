class ThreeplRecsController < ApplicationController
  def index
    matching_threepl_recs = ThreeplRec.all

    @list_of_threepl_recs = matching_threepl_recs.order({ :created_at => :desc })

    render({ :template => "threepl_recs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_threepl_recs = ThreeplRec.where({ :id => the_id })

    @the_threepl_rec = matching_threepl_recs.at(0)

    render({ :template => "threepl_recs/show.html.erb" })
  end

  def create
    the_threepl_rec = ThreeplRec.new
    the_threepl_rec.product_id = params.fetch("query_product_id")
    the_threepl_rec.three_pl_id = params.fetch("query_three_pl_id")
    the_threepl_rec.selected = params.fetch("query_selected", false)

    if the_threepl_rec.valid?
      the_threepl_rec.save
      redirect_to("/threepl_recs", { :notice => "Threepl rec created successfully." })
    else
      redirect_to("/threepl_recs", { :notice => "Threepl rec failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_threepl_rec = ThreeplRec.where({ :id => the_id }).at(0)

    the_threepl_rec.product_id = params.fetch("query_product_id")
    the_threepl_rec.three_pl_id = params.fetch("query_three_pl_id")
    the_threepl_rec.selected = params.fetch("query_selected", false)

    if the_threepl_rec.valid?
      the_threepl_rec.save
      redirect_to("/threepl_recs/#{the_threepl_rec.id}", { :notice => "Threepl rec updated successfully."} )
    else
      redirect_to("/threepl_recs/#{the_threepl_rec.id}", { :alert => "Threepl rec failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_threepl_rec = ThreeplRec.where({ :id => the_id }).at(0)

    the_threepl_rec.destroy

    redirect_to("/threepl_recs", { :notice => "Threepl rec deleted successfully."} )
  end
end
