# == Schema Information
#
# Table name: threepls
#
#  id                            :integer          not null, primary key
#  api__edi_integration          :boolean
#  monthly_volume                :float
#  number_of_products_can_handle :integer
#  pick_and_pack_fees            :float
#  storage_fees                  :float
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class Threepl < ApplicationRecord

  has_many(:threepl_recs, { :class_name => "ThreeplRec", :foreign_key => "three_pl_id", :dependent => :destroy })

  
end
