# == Schema Information
#
# Table name: products
#
#  id                      :integer          not null, primary key
#  height                  :float
#  length                  :float
#  name                    :string
#  units_shipped_per_month :integer
#  weight                  :float
#  width                   :float
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  user_id                 :integer
#
class Product < ApplicationRecord


  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  has_many(:threepl_recs, { :class_name => "ThreeplRec", :foreign_key => "product_id", :dependent => :destroy })

  
end
