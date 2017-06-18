# This deals with the environment dependent conditional
# in 20150909232103_add_state_to_sfdc_orders migration
# Not sure why it's there, but this effectively negates it
class AddStateToSfdcOrdersAgain < ActiveRecord::Migration
  def up
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      add_column :order__c, :state__c, "varchar(40)"
    end
  end

  def down
    return if ENV["DEPLOYMENT"] != "production"
    HerokuConnect.change_schema("salesforce") do
      remove_column :order__c, :state__c
    end
  end
end
