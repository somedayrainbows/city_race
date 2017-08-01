require 'rails_helper'

RSpec.describe Clue, type: :model do
  describe "validations" do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:task_type) }
      it { should validate_presence_of(:order) }
    end
end
