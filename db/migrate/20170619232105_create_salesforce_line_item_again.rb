class CreateSalesforceLineItemAgain < ActiveRecord::Migration
  def up
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      # create_table :lineitem__c do |t|
        # t.column :sfid, "varchar(18)", unique: true
        # t.column :name, "varchar(80)"
        add_column :lineitem__c, :price__c, :float
        add_column :lineitem__c, :product_id__c, "varchar(18)"
        add_column :lineitem__c, :product_id__r__spree_id__c, "varchar(14)"
        add_column :lineitem__c, :order_id__c, "varchar(18)"
        add_column :lineitem__c, :order_id__r__spree_id__c, "varchar(14)"
        # add_column :lineitem__c, :spree_id__c, "varchar(14)"
      # end
    end
  end

  def down
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      # execute "DROP TABLE lineitem__c"
      remove_column :lineitem__c, :price__c
      remove_column :lineitem__c, :product_id__c
      remove_column :lineitem__c, :product_id__r__spree_id__c
      remove_column :lineitem__c, :order_id__c
      remove_column :lineitem__c, :order_id__r__spree_id__c
    end
  end
end
