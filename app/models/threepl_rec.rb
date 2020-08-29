# == Schema Information
#
# Table name: threepl_recs
#
#  id          :integer          not null, primary key
#  selected    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#  three_pl_id :integer
#
class ThreeplRec < ApplicationRecord

  belongs_to(:product, { :required => false, :class_name => "Product", :foreign_key => "product_id" })

  belongs_to(:three_pl, { :required => false, :class_name => "Threepl", :foreign_key => "three_pl_id" })
end
