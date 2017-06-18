class RemovePriceFromLineItem < ActiveRecord::Migration
  def up
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      remove_column :lineitem__c, :price__c
    end
  end

  def down
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      add_column :lineitem__c, :price__c, :float
    end
  end
end
