class CreateSalesforcePricebookentryAgain < ActiveRecord::Migration
  def up
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      # create_table :pricebookentry do |t|
        # t.column :sfid, "varchar(18)", unique: true
        # t.column :pricebook2id, "varchar(18)"
        add_column :pricebookentry, :product2__spree_id__c, "varchar(14)"
        # t.column :name, "varchar(255)"
        # t.float :unitprice
      end
    end
  end

  def down
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      # execute "DROP TABLE pricebookentry"
      remove_column :pricebookentry, :product2__spree_id__c
    end
  end
end
