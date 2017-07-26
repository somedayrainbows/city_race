require 'rails_helper'

RSpec.describe Hunt, type: :model do
  describe "validations" do
    context "hunt is valid with all attributes" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:status) }
    end
  end
end
