require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  def open_asset(file_name)
    File.open(Rails.root.join('db', 'seed_assets', file_name))
  end


end
